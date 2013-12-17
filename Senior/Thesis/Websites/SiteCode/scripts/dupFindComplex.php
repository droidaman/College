<?php
/*******************************
 *                             *
 *          Debugging          *
 *                             *
 *******************************/
// Uncomment to turn on debugging
//error_reporting(E_ALL & ~E_NOTICE);
//ini_set('display_errors', 'On');

/*******************************
 *                             *
 *    File/Script Importing    *
 *                             *
 *******************************/
// Allow us to connect to the database, IMPORTANT!
include "connect.php";
// PHP GD script to check for duplicates.
include "phpDupeImage.php";

/*******************************
 *                             *
 *     Duplication handler     *
 *                             *
 *******************************/
  
/**********************************************************
 *   Function deepDupCheck(params)						  *
 *														  *
 *	 Description: Uses modified PHP GD Image Finder		  *
 * 				  to determine uniqueness.				  *
 *														  *
 *   filePath - File path and name of the image			  *
 *   uploadDir - Directory path where uploads are stored  *
 *   fingerprint - MD5 fingerprint of color profile		  *
 *														  *
 *	 Returns: Result from running isUnique(*) function	  *
 *	 Calls:	  N/A										  *
 **********************************************************/
function deepDupCheck($filePath, $uploadDir, $fingerprint) {
	// Create a new instance of phpDupeImage and set the upload directory.
	$dc = new phpDupeImage();
	$dc->completed_files_path = $uploadDir;
	
	// Check and see if the file is already no the server the GD functions.
	$matchResult = $dc->is_unique($filePath, $fingerprint);
	
	// Return the result after thorough examination.
	return $matchResult;
}
?>