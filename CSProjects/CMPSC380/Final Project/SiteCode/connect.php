<?php
	// Modify these settings to connect to the database properly
	$dbhost = 'localhost';
	$dbuser = 'ffapps4u_srvbin';
	$dbpass = '12survey!';
	$dbname = 'ffapps4u_surveybin';

	$conn = mysql_connect($dbhost, $dbuser, $dbpass) or die ('<span class="phperror">Error connecting to MySQL</span>');
	mysql_select_db($dbname) or die('<span class="phperror">Error connecting to database.</span>');
?>
