<?php

/*******************************
 *                             *
 *          Debugging          *
 *                             *
 *******************************/

// Uncomment to turn on debugging
error_reporting(E_ALL);
ini_set('display_errors', 'On');

// Print the PHP max stats for this directory...
//echo 'upload_max_filesize' . ini_get('upload_max_filesize');
//echo 'post_max_size' . ini_get('post_max_size');


/*******************************
 *                             *
 *     File/Script Imports     *
 *                             *
 *******************************/

// Allow us to connect to the database, IMPORTANT!
include "scripts/connect.php";

// Provide us with the missing functions!
include "scripts/dupFindSimple.php";


/*******************************
 *                             *
 *    Environment Variables    *
 *                             *
 *******************************/

// Upload directory information
$truTarget = "/var/www/srthesis/uploads/";
$druTarget = "/var/www/srthesis/uploads_reduced/";

// Details about the file being used in the system
$sFileName = $_FILES['image_file']['name'];
$sFileType = $_FILES['image_file']['type'];
$sFileSize = bytesToSize1024($_FILES['image_file']['size'], 1);


/*******************************
 *                             *
 *      Global Variables       *
 *                             *
 *******************************/
// Global notification control for response to user
$error = '';
$trNotice = '';
$drNotice = '';

// Global filename storage
$uFileName = '';



/*******************************
 *                             *
 *      Misc Functionality     *
 *                             *
 *******************************/

// Converts from bytes to a more managable number
function bytesToSize1024($bytes, $precision = 2) {
    $unit = array('B','KB','MB');
    
    return @round($bytes / pow(1024, ($i = floor(log($bytes, 1024)))), $precision).' '.$unit[$i];
}


// Creates a case sensitive alphanumeric image handle for the URL
function createImageHandle($length){
    $handle = "";
    $codeAlphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    $codeAlphabet.= "abcdefghijklmnopqrstuvwxyz";
    $codeAlphabet.= "0123456789";
    
    for($i=0;$i<$length;$i++){
        $handle .= $codeAlphabet[rand(0,strlen($codeAlphabet))];
    }
    
    return $handle;
}


/*******************************
 *                             *
 *       File Operations       *
 *                             *
 *******************************/

// This function separates the extension from the rest of the file name and returns it 
function findext($filename) 
{
	// Only allow lowercase, split at the period and keep the trailing characters
	$filename = strtolower($filename); 
	$exts = explode(".", $filename); 
	$n = count($exts)-1; 
	$exts = $exts[$n];
	
	// Returns the extension
	return $exts;
} 


// This function renames the file and returns it with a unique identifier.
// Filename Sequence:	TTTTTTTTTT-IIIIII.EEE(E)
//						Timestamp-ImageHandle.Extension
function renameFile($filename, $imageHandle)
{
	// This applies the function to our file  
	$ext = findext($filename);

	// This line assigns a new file name (that is actually just a timestamp of the upload)
	$time = time();

	// Combine the the unix timestamp file name, and the extension 
	$reName = $time . "-" . $imageHandle . "." . $ext;
	
	// Returns the new file name
	return $reName;
}


/*******************************
 *                             *
 *       Upload handlers       *
 *                             *
 *******************************/

// Traditional upload function
function trUpload()
{
	// Allow access to the global (scope) variables
	global $trNotice, $error, $truTarget, $uFileName;
	
	// Create an image handle for the baseline upload
	$trImageHandle = createImageHandle(6);
	// Globally rename the file using this original filename
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
			// Add the image to the database!
			try {
				$stmt = $GLOBALS["conn"]->prepare('INSERT INTO share_tracker (ILookup, IName, directory, uMethod) VALUES (:imageHandle,:imageName,:directory,:uMethod)');
				$stmt->execute(array(':imageHandle'=>$trImageHandle,
									 ':imageName'=>$uFileName,
									 ':directory'=>'uploads',
									 ':uMethod'=>'0'));
				
				// Report back a success!
				$trNotice = "<p>Baseline directory upload succeeded! You may view this image <a href=\"http://skynetgds.no-ip.biz/srthesis/irc.php?view={$trImageHandle}\">HERE</a>.</p>";
			} catch(PDOException $e) {
				$error = '<p><strong>ERROR:</strong> ' . $e->getMessage() . '</p>';
			}

		} else {
			$error = '<p><strong>ERROR:</strong> File could not be saved to the server.<br />Please retry or contact the webmaster if this problem persists.</p>';
		}
    }
}


// Duplicate reduced upload function
function drUpload()
{
	// Allow access to the global (scope) variables
	global $drNotice, $error, $truTarget, $druTarget, $uFileName;
	
	// Generate the 40-bit file hash for dup lookup
	$shaHash = sha1_file($truTarget . $uFileName);

	
	// Make sure we aren't accidentally overwriting anything this time.
    if (file_exists($druTarget . $uFileName))
    {
    	// Upload will cause more than one file with the same name in the directory? Error.
    	$error = '<p><strong>ERROR:</strong> Filename uniqueness not preserved.<br />Please try again or contact the webmaster if this problem persists.</p>';	} else {

		// Uniqueness check...
		$simpleDupResponse = simpleDupCheck($truTarget . $uFileName, $shaHash);
		if($simpleDupResponse !== null)
		{
			// Every image gets a new handle, even if not in the reduced folder. (For consistency)
			$newiHandle = createImageHandle(6);

			// Exact dup found, add to DB and respond appropriately
			try {
				$stmt = $GLOBALS["conn"]->prepare('INSERT INTO share_tracker (ILookup, IName, directory, uMethod) VALUES (:imageHandle,:imageName,:directory,:uMethod)');
				$stmt->execute(array(':imageHandle'=>$newiHandle,
									 ':imageName'=>$simpleDupResponse,
									 ':directory'=>'uploads_reduced',
									 ':uMethod'=>'1'));
									 
				$drNotice = "<p><strong>NOTICE:</strong> Image was not added to duplicate reduced directory, file already exists.</p>" .
							"<br />" .
							"<p>To share your image, use the following link: " .
							"<a href=\"http://skynetgds.no-ip.biz/srthesis/irc.php?view={$newiHandle}\">http://skynetgds.no-ip.biz/srthesis/irc.php?view={$newiHandle}</a></p>";
									 
			} catch(PDOException $e) {
				$error = '<p><strong>ERROR:</strong> ' . $e->getMessage() . '</p>';
			}

		// Unique so actually upload the file!
		} else {			
			// Create an image handle for the duplicate reduced link
			$drImageHandle= createImageHandle(6);
			// Globally rename the file using this original filename
			$relinkFileName = renameFile($uFileName, $drImageHandle);

			if(copy($truTarget . $uFileName, $druTarget . $relinkFileName))
			{				
				// Add the image to the database!
				try {
					$stmt = $GLOBALS["conn"]->prepare('INSERT INTO share_tracker (ILookup, IName, directory, uMethod, hash) VALUES (:imageHandle,:imageName,:directory,:uMethod, :shaHash)');
					$stmt->execute(array(':imageHandle'=>$drImageHandle,
										 ':imageName'=>$relinkFileName,
										 ':directory'=>'uploads_reduced',
										 ':uMethod'=>'1',
										 ':shaHash'=>$shaHash));
										 
					$drNotice = "<p><strong>NOTICE:</strong> The image was unique and added to duplicate reduced directory!</p>" .
							"<br />" .
							"<p>To share your image, use the following link: " .
							"<br />" .
							"<a href=\"http://skynetgds.no-ip.biz/srthesis/irc.php?view={$drImageHandle}\">http://skynetgds.no-ip.biz/srthesis/irc.php?view={$drImageHandle}</a></p>";

				} catch(PDOException $e) {
					$error = '<p><strong>ERROR:</strong> ' . $e->getMessage() . '</p>';
				}
			
			} else {
		    	$error = '<p><strong>ERROR!</strong> File could not be saved to the server.<br />Please retry or contact the webmaster if this problem persists.</p>';
			}
		}	
    }
}

// Actually perform the uploads.
trupload(); // Creates a baseline to compare results to
drupload(); // Upload method targeted by research


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