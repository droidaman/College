<?php

/*******************************
 *                             *
 *          Debugging          *
 *                             *
 *******************************/

// Uncomment to turn on debugging
error_reporting(E_ALL);
ini_set('display_errors', 'On');


/*******************************
 *                             *
 *    File/Script Importing    *
 *                             *
 *******************************/

// Allow us to connect to the database, IMPORTANT!
include "scripts/connect.php";

// Provide us with the missing functions!
include "scripts/dupFindComplex.php";


/*******************************
 *                             *
 *    Duplication handler      *
 *                             *
 *******************************/

// Simple Duplicate File Locator
// Uses an SHA1 File hash to initially check for duplicates
function simpleDupCheck($filePath, $fileHash) {

	// Check for rough matches with the file hash stored in the DB
	try {
		$stmt = $GLOBALS["conn"]->prepare('SELECT `IName` FROM `share_tracker` WHERE `uMethod` = \'1\' AND `hash` = :fileHash');
		$stmt->execute(array(':fileHash'=>$fileHash));
	} catch(PDOException $e) {
		$error = 'ERROR: ' . $e->getMessage();
	}

	// Was there a match? If so, return the file name.
	if ($stmt->rowCount() > 0) {
		$nMatch = $stmt->fetch();
		return $nMatch[0];
	} else {
		// No exact match, look for 'close' candidates
		deepDupCheck();
	}

/*	// Was there a match?
	if($nMatch == '0')
	{
		// No exact match, look for 'close' candidates
		deepDupCheck();
	} else {
		// Found a 100% identical match
		return true;
	}*/

}

?>