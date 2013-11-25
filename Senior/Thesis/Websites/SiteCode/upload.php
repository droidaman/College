<?php

/*******************************
 *                             *
 *          Debugging          *
 *                             *
 *******************************/

// Uncomment to turn on debugging
//error_reporting(E_ALL);
//ini_set('display_errors', 'On');

// Print the PHP max stats for this directory...
//echo 'upload_max_filesize' . ini_get('upload_max_filesize');
//echo 'post_max_size' . ini_get('post_max_size');


/*******************************
 *                             *
 *      Misc Functionality     *
 *                             *
 *******************************/

// Allow us to connect to the database, IMPORTANT!
include "scripts/connect.php";

// Converts from bytes to a more managable number
function bytesToSize1024($bytes, $precision = 2) {
    $unit = array('B','KB','MB');
    
    return @round($bytes / pow(1024, ($i = floor(log($bytes, 1024)))), $precision).' '.$unit[$i];
}

// Details about the file being used in the system
$sFileName = $_FILES['image_file']['name'];
$sFileType = $_FILES['image_file']['type'];
$sFileSize = bytesToSize1024($_FILES['image_file']['size'], 1);

// Upload directory information
$truTarget = "/var/www/srthesis/uploads/";
$druTarget = "/var/www/srthesis/uploads_reduced/";

// Creates a (hopefully) case sensitive alphanumeric image handle for the URL
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
 *    Duplication handlers     *
 *                             *
 *******************************/

// Simple Duplicate File Locator
// Uses an SHA1 File hash to initially check for duplicates
function simpleDupCheck($fileHash) {
	// Check for rough matches with the file hash stored in the DB
	try {
		$stmt = $GLOBALS["conn"]->prepare('SELECT COUNT(*) FROM `share_tracker` WHERE `uMethod` = \'1\' AND `hash` = :fileHash');
		$stmt->execute(array(':fileHash'=>$fileHash));
		$nMatch = $stmt->fetch();
		$nMatch = $nMatch[0];
	} catch(PDOException $e) {
		$error = 'ERROR: ' . $e->getMessage();
	}

	// Was there a match?
	if($nMatch == '0')
	{
		// No exact match, look for 'close' candidates
		deepDupCheck();
	} else {
		// Found a 100% identical match
		return true;
	}
}

function deepDupCheck() {
	// Deeper analysis code
	
	// Temporary - never finds similar images
	return false;
}

/*******************************
 *                             *
 *       Upload handlers       *
 *                             *
 *******************************/

// Error control for user response
$error = '';
$notice = '';
// Globally rename the new upload file.
$imageHandle = createImageHandle(6);
$uFileName = renameFile($sFileName, $imageHandle);

// Traditional upload function
function trUpload()
{
	// Allow access to the global (scope) variables
	global $error, $truTarget, $uFileName;
	
	// Make sure we aren't accidentally overwriting anything this time.
    if (file_exists($truTarget . $uFileName))
    {
    	// More than one upload per second? Problem solved. Error just in case though.
    	$error = '<p>Filename uniqueness not preserved.<br />Please retry or contact the webmaster if this problem persists.</p>';
	} else {
		// Actually upload the file!
		if(move_uploaded_file($_FILES['image_file']['tmp_name'], $truTarget . $uFileName))
		{			
			// Add the image to the database!
			try {
				$stmt = $GLOBALS["conn"]->prepare('INSERT INTO share_tracker (ILookup, IName, directory, uMethod) VALUES (:imageHandle,:imageName,:directory,:uMethod)');
				$stmt->execute(array(':imageHandle'=>$GLOBALS["imageHandle"],
									 ':imageName'=>$uFileName,
									 ':directory'=>'uploads',
									 ':uMethod'=>'0'));
			} catch(PDOException $e) {
				$error = 'ERROR: ' . $e->getMessage();
			}

		} else {
			$error = '<p><strong>ERROR!</strong> File could not be saved to the server.<br />Please retry or contact the webmaster if this problem persists.</p>';
		}
    }
}

// Duplicate reduced upload function
function drUpload()
{
	// Allow access to the global (scope) variables
	global $notice, $error, $truTarget, $druTarget, $uFileName;
	
	// Make sure we aren't accidentally overwriting anything this time.
    if (file_exists($druTarget . $uFileName))
    {
    	// More than one upload per second? Problem solved. Error just in case though.
    	$error = '<p>Filename uniqueness not preserved.<br />Please retry or contact the webmaster if this problem persists.</p>';
	} else {
		//Creates the 40-bit file hash for dup lookup
		$shaHash = sha1_file($truTarget . $uFileName);

		// Uniqueness check...
		if(simpleDupCheck($shaHash))
		{
			// Exact dup found, respond appropriately
			$notice = "<p>Image was not added to duplicate reduced directory, file already exists.</p>";
		} else {
			// Unique so actually upload the file!
			if(copy($truTarget . $uFileName, $druTarget . $uFileName))
			{
				// Create an image handle for the duplicate reduced link! (Technically a different image)
				$newiHandle = createImageHandle(6);
				$notice = "<p>The image was not in the duplicate directory and was added to a separate database.</p>"; //, identical image also accessable here:<br /><a href=\"http://skynetgds.no-ip.biz/srthesis/irc.php?view={$newiHandle}\">http://skynetgds.no-ip.biz/srthesis/irc.php?view={$newiHandle}</a></p>";
				
				// Add the image to the database!
				try {
					$stmt = $GLOBALS["conn"]->prepare('INSERT INTO share_tracker (ILookup, IName, directory, uMethod, hash) VALUES (:imageHandle,:imageName,:directory,:uMethod, :shaHash)');
					$stmt->execute(array(':imageHandle'=>$newiHandle,
										 ':imageName'=>$uFileName,
										 ':directory'=>'uploads_reduced',
										 ':uMethod'=>'1',
										 ':shaHash'=>$shaHash));
				} catch(PDOException $e) {
					$error = 'ERROR: ' . $e->getMessage();
				}
			
			} else {
		    	$error = '<p><strong>ERROR!</strong> File could not be saved to the server.<br />Please retry or contact the webmaster if this problem persists.</p>';
			}
		}	
    }
}

//Call the upload functions.
trupload();
drupload();

// Give the user some much needed output.
if(!$error) {
echo <<<EOF
	<p>Your image has been successfully uploaded to the server.<br /></p>
	$notice
	<p>To share your image, use the following link:<br />
	<a href="http://skynetgds.no-ip.biz/srthesis/irc.php?view={$imageHandle}">http://skynetgds.no-ip.biz/srthesis/irc.php?view={$imageHandle}</a></p>
EOF;
} else {
	// Something interrupted the process and shouldn't have...
	echo $error;
}
?>