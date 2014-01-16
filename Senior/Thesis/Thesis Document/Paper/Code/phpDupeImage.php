<?php
// Code based off of works by pawz, 2010.
// www.catpa.ws/php-duplicate-image-finder/

/*******************************
 *                             *
 *          Debugging          *
 *                             *
 *******************************/
// Uncomment to turn on debugging.
//error_reporting(E_ALL & ~E_NOTICE);
//ini_set('display_errors', 'On');

class phpDupeImage {
                                 
    // Sets how much deviation is tolerated between two images when doing an thorough comparison.
    public $deviation = 10;                                                       
    // Sets the path to where the files are stored on the server. Needed to perform deep deep analysis.
    public $completed_files_path = '';                      
    // Sets the width and height of the thumbnail sized image we use for deep comparison.
    public $small_size = 16;                                

   /**********************************************************
    *   Function isUnique(params)                            *
    *                                                        *
    *   Description: Checks fingerprint against DB and       *
    *                 determines uniqueness.                 *
    *                                                        *
    *   filePathAndName - File path and name of the image    *
    *                     to check for uniqueness            *
    *   fingerprint - MD5 fingerprint of color profile       *
    *                                                        *
    *   Returns: Null for no match found                     *
    *            ImageName of the match if one is found      *
    *   Calls:   If no exact match, calls deepDupCheck(*)    *
    **********************************************************/
    function is_unique($filePathAndName, $fingerprint) {

		// Select any images in database with a matching fingerprint.
		try {
			$stmt= $GLOBALS["conn"]->prepare('SELECT * FROM `share_tracker` WHERE `fingerprint` = :fingerprint');
			$stmt->execute(array(':fingerprint'=>$fingerprint));
			$matches = $stmt->fetchAll();
		} catch(PDOException $e) {
			echo 'ERROR: ' . $e->getMessage();
		}
		
        if (!count($matches)) {
            // No matching fingerprints found so return null.
            return null;
        } else {
            // Matching fingerprint located, run deep check on each possible match.
            $match_found = null;
            foreach($matches as $match) {
                if ($this->are_duplicates($filePathAndName, $this->completed_files_path.$match['IName'])) {
                    // We found a match, die and return the file name of the duplicate found.
                    return $match['IName'];
                }
            }
            
            // Fingerprint was a match but deep check determined it wasn't the same image.
            return null;
        }

    }

   /**********************************************************
    *   Function are_duplicates(params)                      *
    *                                                        *
    *   Description: Compares two images by analyzing the    *
    *                colors of each pixel difference of      *
    *                each corresponding pixel in the images  *
    *                                                        *
    *   file1 - The first of the files to compare            *
    *   file2 - File to compare to the first file (file1)    *
    *                                                        *
    *   Returns: 1 (True) for a match found.                 *
    *            0 (False) for no match found.               *
    *   Calls:   N/A                                         *
    **********************************************************/
    function are_duplicates($file1, $file2) {

        // Load in both images and resize them to small_size x small_size.
        $image1_src = @imagecreatefromjpeg($file1);
        $image2_src = @imagecreatefromjpeg($file2);
        list($image1_width, $image1_height) = getimagesize($file1);
        list($image2_width, $image2_height) = getimagesize($file2);
        $image1_small = imagecreatetruecolor($this->small_size, $this->small_size);
        $image2_small = imagecreatetruecolor($this->small_size, $this->small_size);
        imagecopyresampled($image1_small, $image1_src, 0, 0, 0, 0, $this->small_size, $this->small_size, $image1_width, $image1_height);
        imagecopyresampled($image2_small, $image2_src, 0, 0, 0, 0, $this->small_size, $this->small_size, $image2_width, $image2_height);

        // Compare the pixels of each image and figure out the colour difference between them.
        for ($x = 0; $x < $this->small_size; $x++) {
            for ($y = 0; $y < $this->small_size; $y++) {
                $image1_color = imagecolorsforindex($image1_small, imagecolorat($image1_small, $x, $y));
                $image2_color = imagecolorsforindex($image2_small, imagecolorat($image2_small, $x, $y));
                $difference +=  abs($image1_color['red'] - $image2_color['red']) + 
                                abs($image1_color['green'] - $image2_color['green']) +
                                abs($image1_color['blue'] - $image2_color['blue']);
            }
        }
        
        // Normalize the image by diving it by the number of pixeles in the resized image.
        $difference = $difference / pow($this->small_size, 2);
        
        if ($difference <= $this->deviation) {
        	// The images match!
            return 1;
        } else {
        	// The images don't match.
            return 0;
        }
    }
}
?>