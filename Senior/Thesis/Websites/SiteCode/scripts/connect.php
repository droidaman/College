<?php
	// Modify these settings to connect to the database properly
	$dbhost = 'localhost';
	$user = 'thesisDBusr';
	$pass = 'Th3s1sDB!';
	$dbname = 'thesisDB';

	try {
		$conn = new PDO("mysql:host=$dbhost;dbname=$dbname", $user, $pass);
	    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	} catch(PDOException $e) {
		echo 'ERROR: ' . $e->getMessage();
	}
?>