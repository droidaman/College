<?php

/*******************************
 *                             *
 *          Debugging          *
 *                             *
 *******************************/

// Uncomment to turn on debugging
//error_reporting(E_ALL);
//ini_set('display_errors', 'On');


/*******************************
 *                             *
 *    File/Script Importing    *
 *                             *
 *******************************/

// Allow us to connect to the database, IMPORTANT!
include "connect.php";
// PHP GD script to check for duplicates
include "phpDupeImage.php";


/*******************************
 *                             *
 *     Duplication handler     *
 *                             *
 *******************************/

// Uses modified PHP GD image finder to determine uniqueness.
function deepDupCheck($filePath, $uploadDir, $fingerprint) {
	$dc = new phpDupeImage();
	$dc->completed_files_path = $uploadDir;
	
	// Check and see if the file is in fact unique
	$matchResult = $dc->is_unique($filePath, $fingerprint);
	
	// Return the match result after thorough examination
	return $matchResult;
	
	// Temporary - never finds similar images
	//return null;
}

?>