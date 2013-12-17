<?php
/*******************************
 *                             *
 *          Debugging          *
 *                             *
 *******************************/
// Uncomment to turn on debugging, ignore notices.
//error_reporting(E_ALL & ~E_NOTICE);
//ini_set('display_errors', 'On');

// Print the PHP max stats for this directory... more debug info.
//echo 'upload_max_filesize' . ini_get('upload_max_filesize');
//echo 'post_max_size' . ini_get('post_max_size');

/*******************************
 *                             *
 *     File/Script Imports     *
 *                             *
 *******************************/
// Allow us to connect to the database, IMPORTANT!
include "scripts/connect.php";
// Provide us with the missing functions.
include "scripts/dupFindSimple.php";
// Provide access to thumbnail creation methods.
include "scripts/thumbnailer.php";

/*******************************
 *                             *
 *    Environment Variables    *
 *                             *
 *******************************/
// Upload directory information.
$truTarget = "/var/www/srthesis/uploads/";
$druTarget = "/var/www/srthesis/uploads_reduced/";
$publicThumbTarget = "/var/www/srthesis/thumbnails_reduced/";

// Details about the file being used in the system.
$sFileName = $_FILES['image_file']['name'];
$sFileType = $_FILES['image_file']['type'];
$sFileSize = bytesToSize1024($_FILES['image_file']['size'], 1);

/*********************************/
/* Thumbnail function variables. */
/*********************************/
// Width for thumbnail images we use for fingerprinting; Recommended 150.
$thumbWidth = 150;
// Width for public visible thumbnail (Whatever the <img /> width is).
$publicThumbSize = 215;
// Sets how sensitive the fingerprinting will be.
// Higher numbers are less sensitive (more likely to match). Floats are allowed.
$sensitivity = 2;

/*******************************
 *                             *
 *      Global Variables       *
 *                             *
 *******************************/
// Global notification control for response to user.
$error = '';
$trNotice = '';
$drNotice = '';

// Global filename storage.
$uFileName = '';

/*******************************
 *                             *
 *      Misc Functionality     *
 *                             *
 *******************************/
/**********************************************************
 *   Function bytesToSize1024(params)					  *
 *														  *
 *	 Description: Converts from bytes to a more			  *
 *				  human readable format					  *
 *														  *
 *   bytes - The number to be converted					  *
 *   precision - Number of decimal places to round to	  *
 *														  *
 *	 Returns: Number in B, KB, MB, or GB				  *
 *	 Calls:	  N/A										  *
 **********************************************************/
function bytesToSize1024($bytes, $precision = 2) {
    $unit = array('B','KB','MB','GB');
    return @round($bytes / pow(1024, ($i = floor(log($bytes, 1024)))), $precision).' '.$unit[$i];
}

/**********************************************************
 *   Function createImageHandle(param)					  *
 *														  *
 *	 Description: Creates a case sensitive alphanumeric	  *
 * 				  image handle for the URL				  *
 *														  *
 *   bytes - The number to be converted					  *
 *														  *
 *	 Returns: $length character alphanumeric string		  *
 *	 Calls:	  N/A										  *
 **********************************************************/
function createImageHandle($length){
    $handle = "";
    $codeAlphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    $codeAlphabet.= "abcdefghijklmnopqrstuvwxyz";
    $codeAlphabet.= "0123456789";
    
    for($i=0;$i<$length;$i++){
        $handle .= $codeAlphabet[mt_rand(0,strlen($codeAlphabet))];
    }
    
    return $handle;
}

/**********************************************************
 *             Adapted with permission from:			  *
 *             CatPA PHP GD Image Finder code			  *
 *   Function createFingerprint(param)					  *
 *														  *
 *	 Description: Analyses the filename passed to it and  *
 *				  returns an md5 checksum of the		  *
 *				  file's histogram						  *
 *														  *
 *   filePathAndName - File and location on server the	  *
 *					   fingerprint will	be created for	  *
 *														  *
 *	 Returns: MD5 hashed histogram of the supplied file	  *
 *	 Calls:	  N/A										  *
 **********************************************************/
function createFingerprint($filePathAndName) {
    // Load the image. Escape out if it's not a valid jpeg (can be extended later).
    if (!$image = @imagecreatefromjpeg($filePathAndName)) {
        return null;
    }

    // Create thumbnail sized copy for fingerprinting.
    $width = imagesx($image);
    $height = imagesy($image);
    $ratio = $GLOBALS["thumbWidth"] / $width;
    $newwidth = $GLOBALS["thumbWidth"];
    $newheight = round($height * $ratio); 
    $smallimage = imagecreatetruecolor($newwidth, $newheight);
    imagecopyresampled($smallimage, $image, 0, 0, 0, 0, $newwidth, $newheight, $width, $height);
    $palette = imagecreatetruecolor(1, 1);
    $gsimage = imagecreatetruecolor($newwidth, $newheight);

    // Calculate the number of pixels in the resized image.
    $numpixels = $newwidth * $newheight;
    $histogram = array();
    // Iterate over x-axis pixels.
    for ($i = 0; $i < $newwidth; $i++) {
    	// Iterate over the y-axis pixels.
        for ($j = 0; $j < $newheight; $j++) {
        	// Pull the index of the current pixel.
            $pos = imagecolorat($smallimage, $i, $j);
        	// Pull RGB value of the current pixel.
            $cols = imagecolorsforindex($smallimage, $pos);
            // Split apart the RGB values of the pixel, throwing out alpha.
            $r = $cols['red'];
            $g = $cols['green'];
            $b = $cols['blue'];
            // Convert the colour to greyscale using 30% Red, 59% Blue and 11% Green.
            // Gets a single integer value representing all three values.
            $greyscale = round(($r * 0.3) + ($g * 0.59) + ($b * 0.11));
            $greyscale++;
            $value = (round($greyscale / 16) * 16) -1;
            // Use the integer value as an index and increment that index.
            $histogram[$value]++;
        }
    }
 
	// Normalize the histogram by dividing the total of each colour by the total number of pixels.
    $normhist = array();
    foreach ($histogram as $value => $count) {
        $normhist[$value] = $count / $numpixels;
    }

    // Find maximum value (most frequent colour).
    $max = 0;
    for ($i=0; $i<255; $i++) {
        if ($normhist[$i] > $max) {
            $max = $normhist[$i];
        }
    }   

    // Create a string from the histogram (with all possible values).
    $histstring = "";
    for ($i = -1; $i <= 255; $i = $i + 16) {
        $h = ($normhist[$i] / $max) * $GLOBALS["sensitivity"];
        if ($i < 0) {
            $index = 0;
        } else {
            $index = $i;
        }
        $height = round($h);
        $histstring .= $height;
    }

    // Destroy all the temporary images that we've created.
    imagedestroy($image);
    imagedestroy($smallimage);
    imagedestroy($palette);
    imagedestroy($gsimage);

    // Generate an md5sum of the histogram values and return it.
    return md5($histstring);
}


/*******************************
 *                             *
 *       File Operations       *
 *                             *
 *******************************/
/**********************************************************
 *   Function findext(param)							  *
 *														  *
 *	 Description: Separates the extension from the 		  *
 *				  rest of the filename and returns it 	  *
 *														  *
 *   filename - Filename to be split apart				  *
 *														  *
 *	 Returns: File extension of the supplied file		  *
 *	 Calls:	  N/A										  *
 **********************************************************/
function findext($filename) 
{
	// Only allow lowercase, split at the period and keep the trailing characters.
	$filename = strtolower($filename); 
	$exts = explode(".", $filename); 
	$n = count($exts)-1; 
	$exts = $exts[$n];
	
	// Returns the extension.
	return $exts;
} 

/**********************************************************
 *   Function renameFile(param)							  *
 *														  *
 *	 Description: File renamed using the below pattern	  *
 *				  TTTTTTTTTT-IIIIII.EEE(E)				  *
 *					   - where -						  *
 *				  Timestamp-ImageHandle.Extension		  *
 *														  *
 *   filename - Filename to be renamed					  *
 *   imageHandle - Newly generated image handle			  *
 *														  *
 *	 Returns: New filename with same extension as the old *
 *	 Calls:	  N/A										  *
 **********************************************************/
function renameFile($filename, $imageHandle)
{
	// Finds the file extension of the supplied file.
	$ext = findext($filename);

	// Creates a timestamp to use in the filename.
	$time = time();

	// Combine the the unix timestamp file name, and the extension.
	$reName = $time . "-" . $imageHandle . "." . $ext;
	
	// Returns the new file name.
	return $reName;
}

/*******************************
 *                             *
 *       Upload handlers       *
 *                             *
 *******************************/
/**********************************************************
 *   Function trUpload()								  *
 *														  *
 *	 Description: Traditional upload function		 	  *
 *														  *
 *	 Returns: N/A										  *
 *	 Calls:	  N/A										  *
 **********************************************************/
function trUpload()
{
	// Allow access to the global (scope) variables.
	global $trNotice, $error, $truTarget, $uFileName;
	
	// Create an image handle for the baseline upload.
	$trImageHandle = createImageHandle(6);
	// Globally rename the file using this original filename.
	$uFileName = renameFile($GLOBALS["sFileName"], $trImageHandle);
	
	// Make sure we aren't accidentally overwriting anything this time.
    if (file_exists($truTarget . $uFileName))
    {
    	// Upload will cause more than one file with the same name in the directory? Error.
    	$error = '<p><strong>ERROR:</strong> Filename uniqueness not preserved.<br />Please try again or contact the webmaster if this problem persists.</p>';
	} else {
		// Actually upload the file!
		if(move_uploaded_file($_FILES['image_file']['tmp_name'], $truTarget . $uFileName))
		{			
			try {
				// Add the image to the database!
				$stmt = $GLOBALS["conn"]->prepare('INSERT INTO share_tracker (ILookup, IName, directory, uMethod) VALUES (:imageHandle,:imageName,:directory,:uMethod)');
				$stmt->execute(array(':imageHandle'=>$trImageHandle,
									 ':imageName'=>$uFileName,
									 ':directory'=>'uploads',
									 ':uMethod'=>'0'));
				
				// Report back a success!
				$trNotice = "<p>Baseline directory upload succeeded! You may view this image <a href=\"http://skynetgds.no-ip.biz/srthesis/irc.php?view={$trImageHandle}\">HERE</a>.</p>";
			} catch(PDOException $e) {
				// Or an error...
				$error = '<p><strong>ERROR:</strong> ' . $e->getMessage() . '</p>';
			}

		} else {
			$error = '<p><strong>ERROR:</strong> File could not be saved to the server.<br />Please retry or contact the webmaster if this problem persists.</p>';
		}
    }
}

/**********************************************************
 *   Function drUpload()								  *
 *														  *
 *	 Description: Duplicate reduced upload function	 	  *
 *														  *
 *	 Returns: N/A										  *
 *	 Calls:	  N/A										  *
 **********************************************************/
function drUpload()
{
	// Allow access to the global (scope) variables.
	global $drNotice, $error, $truTarget, $druTarget, $uFileName;
	
	// Generate the 40-bit SHA1 file hash for simple dup lookup.
	$shaHash = sha1_file($truTarget . $uFileName);
	
	// Retrieve the MD5 fingerprint for storage in the database.
	$md5Fingerprint = createFingerprint($truTarget . $uFileName);
	
	// Make sure we aren't accidentally overwriting anything this time.
    if (file_exists($druTarget . $uFileName))
    {
    	// Upload will cause more than one file with the same name in the directory? Error.
    	$error = '<p><strong>ERROR:</strong> Filename uniqueness not preserved.<br />Please try again or contact the webmaster if this problem persists.</p>';	} else {

		// Uniqueness check...
		$dupResponse = simpleDupCheck($truTarget . $uFileName, $shaHash, $druTarget, $md5Fingerprint);
		if($dupResponse !== null)
		{
			// Every image gets a new handle, even if it's in the reduced folder. (For consistency)
			$newiHandle = createImageHandle(6);
			
			try {
				// Exact dup found, add to DB and respond appropriately.
				$stmt = $GLOBALS["conn"]->prepare('INSERT INTO share_tracker (ILookup, IName, directory, uMethod) VALUES (:imageHandle,:imageName,:directory,:uMethod)');
				$stmt->execute(array(':imageHandle'=>$newiHandle,
									 ':imageName'=>$dupResponse,
									 ':directory'=>'uploads_reduced',
									 ':uMethod'=>'1'));

				// Report back a success!
				$drNotice = "<p><strong>NOTICE:</strong> Image was not added to duplicate reduced directory, file already exists.</p>" .
							"<br />" .
							"<p>To share your image, use the following link: " .
							"<a href=\"http://skynetgds.no-ip.biz/srthesis/irc.php?view={$newiHandle}\">http://skynetgds.no-ip.biz/srthesis/irc.php?view={$newiHandle}</a></p>";
									 
			} catch(PDOException $e) {
				// Or a failure...
				$error = '<p><strong>ERROR:</strong> ' . $e->getMessage() . '</p>';
			}

		// Unique so actually upload the file!
		} else {			
			// Create an image handle for the duplicate reduced link.
			$drImageHandle= createImageHandle(6);
			// Globally rename the file using this original filename.
			$relinkFileName = renameFile($uFileName, $drImageHandle);

			// Copy image to dup reduced and see if success.
			if(copy($truTarget . $uFileName, $druTarget . $relinkFileName))
			{
				// Create a thumbnail for lightweight public viewing.
				makeThumb($druTarget, $GLOBALS["publicThumbTarget"], $relinkFileName, $GLOBALS["publicThumbSize"]);

				try {
					// Add the image to the database!
					$stmt = $GLOBALS["conn"]->prepare('INSERT INTO share_tracker (ILookup, IName, directory, uMethod, hash, fingerprint) VALUES (:imageHandle,:imageName,:directory,:uMethod, :shaHash, :fingerprint)');
					$stmt->execute(array(':imageHandle'=>$drImageHandle,
										 ':imageName'=>$relinkFileName,
										 ':directory'=>'uploads_reduced',
										 ':uMethod'=>'1',
										 ':shaHash'=>$shaHash,
										 ':fingerprint'=>$md5Fingerprint));

					// Report a success!
					$drNotice = "<p><strong>NOTICE:</strong> The image was unique and added to duplicate reduced directory!</p>" .
							"<br />" .
							"<p>To share your image, use the following link: " .
							"<br />" .
							"<a href=\"http://skynetgds.no-ip.biz/srthesis/irc.php?view={$drImageHandle}\">http://skynetgds.no-ip.biz/srthesis/irc.php?view={$drImageHandle}</a></p>";

				} catch(PDOException $e) {
					// Or a failure...
					$error = '<p><strong>ERROR:</strong> ' . $e->getMessage() . '</p>';
				}
			
			} else {
		    	$error = '<p><strong>ERROR!</strong> File could not be saved to the server.<br />Please retry or contact the webmaster if this problem persists.</p>';
			}
		}	
    }
}

// Call the upload functions and actually do some work!
trupload(); // Creates a baseline to compare results to.
drupload(); // Upload method targeted by research.

/*******************************
 *                             *
 *      Response handlers      *
 *                             *
 *******************************/
// Give the user some much needed output.
if(!$error) {
//Tell the user what has been going on behind the scenes.
echo <<<EOF
	$trNotice
	$drNotice
EOF;
} else {
	// Something interrupted the process and shouldn't have...
	echo $error;
}
?>