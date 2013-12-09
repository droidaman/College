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


/*******************************
 *                             *
 *    Environment Variables    *
 *                             *
 *******************************/

// Nothing to see here


/*******************************
 *                             *
 *      Misc Functionality     *
 *                             *
 *******************************/

/// Nothing to see here


/*******************************
 *                             *
 *    Duplication handlers     *
 *                             *
 *******************************/

function deepDupCheck() {
	// Deeper analysis code
	
	// Temporary - never finds similar images
	return null;
}

?>