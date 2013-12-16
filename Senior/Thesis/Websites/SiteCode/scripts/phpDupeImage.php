<?

/*******************************
 *                             *
 *          Debugging          *
 *                             *
 *******************************/

// Uncomment to turn on debugging
//error_reporting(E_ALL & ~E_NOTICE);
//ini_set('display_errors', 'On');


class phpDupeImage {
	
    // Copyright pawz, 2010.
    // Free for any profit or non-profit use.
    // You may freely distribute or modify this code.
                             
    // Sets how much deviation is tolerated between two images when doing an thorough comparison.
    public $deviation = 10;                                                       
    // Sets the path to where completed files are stored for checking against.
    public $completed_files_path = '';                      
    // Sets the width and height of the thumbnail sized image we use for deep comparison.
    public $small_size = 16;                                


    /* *******************************************************
    *   Is Unique
    *
    *   This function checks whether the file is unique
    *   (ie, the checksum is not already in the database)
    *   If the fingerprint is already in the database, it 
    *   calls are_duplicates to compare them in more detail
    *   It returns an md5 hash if unique or -1 if not.
    ******************************************************* */
    function is_unique($filePathAndName, $fingerprint) {

		// Check for rough matches with the file hash stored in the DB
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
            // If similar files exist, check them
            $match_found = null;
            foreach($matches as $match) {
                if ($this->are_duplicates($filePathAndName, $this->completed_files_path.$match['IName'])) {
                    // We found a match, die and return the file name of the duplicate found
                    return $match['IName'];
                }
            }
            
            // Turned out not to be a match
            return null;
        }

    }


    /* *******************************************************
    *   Are Duplicates
    *
    *   This function compares two images by resizing them
    *   to a common size and then analysing the colours of
    *   each pixel and calculating the difference between
    *   both images for each colour channel and returns
    *   an index representing how similar they are.
    ******************************************************* */
    function are_duplicates($file1, $file2) {

        // Load in both images and resize them to 16x16 pixels
        $image1_src = @imagecreatefromjpeg($file1);
        $image2_src = @imagecreatefromjpeg($file2);
        list($image1_width, $image1_height) = getimagesize($file1);
        list($image2_width, $image2_height) = getimagesize($file2);
        $image1_small = imagecreatetruecolor($this->small_size, $this->small_size);
        $image2_small = imagecreatetruecolor($this->small_size, $this->small_size);
        imagecopyresampled($image1_small, $image1_src, 0, 0, 0, 0, $this->small_size, $this->small_size, $image1_width, $image1_height);
        imagecopyresampled($image2_small, $image2_src, 0, 0, 0, 0, $this->small_size, $this->small_size, $image2_width, $image2_height);

        // Compare the pixels of each image and figure out the colour difference between them
        for ($x = 0; $x < 16; $x++) {
            for ($y = 0; $y < 16; $y++) {
                $image1_color = imagecolorsforindex($image1_small, imagecolorat($image1_small, $x, $y));
                $image2_color = imagecolorsforindex($image2_small, imagecolorat($image2_small, $x, $y));
                $difference +=  abs($image1_color['red'] - $image2_color['red']) + 
                                abs($image1_color['green'] - $image2_color['green']) +
                                abs($image1_color['blue'] - $image2_color['blue']);
            }
        }
        
        $difference = $difference / 256;
        
        if ($difference <= $this->deviation) {
        	// The images match
            return 1;
        } else {
        	// The images don't match
            return 0;
        }

    }
}           
?>