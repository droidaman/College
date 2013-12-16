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

// Provide us with the missing functions!
include "dupFindComplex.php";


/*******************************
 *                             *
 *    Duplication handler      *
 *                             *
 *******************************/

// Simple Duplicate File Locator
// Uses an SHA1 File hash to initially check for duplicates
function simpleDupCheck($filePath, $fileHash, $uploadDir, $fingerprint) {

	// Check for perfect matches with the file hash stored in the DB
	try {
		$stmt = $GLOBALS["conn"]->prepare('SELECT `IName` FROM `share_tracker` WHERE `uMethod` = \'1\' AND `hash` = :fileHash');
		$stmt->execute(array(':fileHash'=>$fileHash));
	} catch(PDOException $e) {
		$error = 'ERROR: ' . $e->getMessage();
	}

	// Was there a match? If so, return the file name.
	if ($stmt->rowCount() > 0) {
		$nMatch = $stmt->fetch();
		echo "Simple Check was enough";
		return $nMatch[0];
	} else {
		// No exact match, look for 'close' candidates
		echo "Deep Check Run";
		return deepDupCheck($filePath, $uploadDir, $fingerprint);
	}
}

/*// Force in depth check every time.
function simpleDupCheck($filePath, $fileHash, $uploadDir, $fingerprint) {
	$result = deepDupCheck($filePath, $uploadDir, $fingerprint);
	return $result;
}*/


?>