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
// Provide us with the missing functions.
include "dupFindComplex.php";

/*******************************
 *                             *
 *    Duplication handler      *
 *                             *
 *******************************/
 
/**********************************************************
 *   Function simpleDupCheck(params)					  *
 *														  *
 *	 Description: Uses an SHA1 File hash to initially	  *
 *				  check for duplicates.					  *
 *														  *
 *   filePath - File path and name of the image			  *
 *   fileHash - SHA1 hash of the full file being uploaded *
 *   uploadDir - Directory path where uploads are stored  *
 *   fingerprint - MD5 fingerprint of color profile		  *
 *														  *
 *	 Returns: Name of matching image file, if found.	  *
 *	 Calls:	  If no exact match, calls deepDupCheck(*)	  *
 **********************************************************/
function simpleDupCheck($filePath, $fileHash, $uploadDir, $fingerprint) {

	// Check for exact file matches with the file hash stored in the DB.
	try {
		$stmt = $GLOBALS["conn"]->prepare('SELECT `IName` FROM `share_tracker` WHERE `uMethod` = \'1\' AND `hash` = :fileHash');
		$stmt->execute(array(':fileHash'=>$fileHash));
	} catch(PDOException $e) {
		$error = 'ERROR: ' . $e->getMessage();
	}

	// Was there a match?
	if ($stmt->rowCount() > 0) {
		// Match found, return the file name of the file on the server.
		$nMatch = $stmt->fetch();
		echo "Debug: Simple Check was enough to find a match."; /* Temporary for visual effect */
		return $nMatch[0];
	} else {
		// No exact match, look for 'approximate' candidates.
		echo "Deep Check Run";
		return deepDupCheck($filePath, $uploadDir, $fingerprint);
	}
}
?>