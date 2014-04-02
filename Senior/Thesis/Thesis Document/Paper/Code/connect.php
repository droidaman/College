<?php
/*******************************
 *                             *
 *       Global Variables      *
 *                             *
 *******************************/
$dbhost = 'localhost';
$user = 'thesisDBusr';
$pass = 'Th3s1sDB!';
$dbname = 'thesisDB';

/*******************************
 *                             *
 *     Database Connection     *
 *                             *
 *******************************/
try {
	// Attempt to connect to the database. Uses a PDO for security reasons.
	$conn = new PDO("mysql:host=$dbhost;dbname=$dbname", $user, $pass);
	// Set the error reporting mode and restrict errors returned to exceptions only.
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
} catch(PDOException $e) {
	// An error occured while connecting, display it to help with diagnosis.
	echo 'ERROR: ' . $e->getMessage();
}
?>