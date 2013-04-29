<?php
/* This file contains all the functions for adding or modifying content from the databases.
 * It was modeled off of the Rockdown Registration System's process.php. For more information
 * on that source, please see that archived software.
 * Part of the Shirt Ordering System. Copyright 2010 FullForce Applications.
 */

include("connect.php");

class Process
{
	// Prevent unauthorized access
	function Process(){
		if(isset($_POST['submit'])){
			$this->AddSubmission();
		} else {
			echo "Direct access to this file is not allowed. " ?><a href="internal.php">Return</a><?php echo " to the home page and try again.";
		}
	}
	
	// Inserts the submissions into the database
	function AddSubmission(){
		//Assigns values from the form
		$FID = $_POST['FID'];
		$UID = $_POST['UID'];
		//Prevents MySQL injections (i.e. hacking)
		$FID = mysql_real_escape_string($FID);
		$UID = mysql_real_escape_string($UID);

		// Element number counter
		$count = 1;
		
		// Get element IDs from the database for processing
		$sql="SELECT `EID`,`ename` FROM `elements` WHERE `FID`=$FID;";
		$eidResult=mysql_query($sql);
		
		$eidRows = array();
		while($rows = mysql_fetch_array($eidResult))
		{
		    $eidRows[] = $rows;
		}
				
		// Find all of the input text data 
		while(true){
			// If the item exists
			if(isset($_POST['text' . $count])){
				// Get the posted data and protect it from SQL injection
				$text = $_POST['text' . $count];
				$text = mysql_real_escape_string($text);
				
				// Fetch the elements corresponding EID for INSERT
				foreach ($eidRows as $rows) {
					// See if the current element name matches our iterative element name
					if($rows['ename'] == 'text' . $count){
						// Set the element ID and break to reduce server load
						$EID = $rows['EID'];
						break;
					}
				}

				// Protect Element ID from SQL injection
				$EID = mysql_real_escape_string($EID);
				
				$querystring = "INSERT INTO `text_data` (`EID`, `UID`, `input`) VALUES ('$EID', '$UID', '$text');";
				$doquery = mysql_query($querystring);
								
				$count++;
			} else {
				break;
			}
		}

		// Reset the element counter.
		$count = 1;

		// Find all of the textarea data 
		while(true){
			// If the item exists
			if(isset($_POST['textarea' . $count])){
				// Get the posted data and protect it from SQL injection
				$text = $_POST['textarea' . $count];
				$text = mysql_real_escape_string($text);
								
				// Fetch the elements corresponding EID for INSERT
				foreach ($eidRows as $rows) {
					// See if the current element name matches our iterative element name
					if($rows['ename'] == 'textarea' . $count){
						// Set the element ID and break to reduce server load
						$EID = $rows['EID'];
						break;
					}
				}

				// Protect Element ID from SQL injection
				$EID = mysql_real_escape_string($EID);
				
				$querystring = "INSERT INTO `textarea_data` (`EID`, `UID`, `input`) VALUES ('$EID', '$UID', '$text');";
				$doquery = mysql_query($querystring);
								
				$count++;
			} else {
				break;
			}
		}

		// Reset the element counter.
		$count = 1;

		// Find all of the radio data 
		while(true){

			// If the item exists
			if(isset($_POST['radio' . $count])){
				// Get the posted data and protect it from SQL injection
				$text = $_POST['radio' . $count];
				$text = mysql_real_escape_string($text);

				// Fetch the elements corresponding EID for INSERT
				foreach ($eidRows as $rows) {
					// See if the current element name matches our iterative element name
					if($rows['ename'] == 'radio' . $count){
						// Set the element ID and break to reduce server load
						$EID = $rows['EID'];
						break;
					}
				}
				
				// Protect Element ID from SQL injection
				$EID = mysql_real_escape_string($EID);

				// Get option IDs from the database for processing
				$query = "SELECT `opid` FROM `radio_options` WHERE `EID`='$EID' AND `value`='$text';";
				$opidResult=mysql_query($query) or die($query."<br/><br/>".mysql_error());
				
				while($opidRows=mysql_fetch_array($opidResult)){
					// Protect orderID from SQL injection
					$opid = mysql_real_escape_string($opidRows['opid']);
					break;
				}
				
				$querystring = "INSERT INTO `radio_data` (`EID`, `UID`, `opid`) VALUES ('$EID', '$UID', '$opid');";
				$doquery = mysql_query($querystring);
								
				$count++;
			} else {
				break;
			}
		}
		
		// Reset the element counter.
		$count = 1;

		// Find all of the check data 
		while(true){

			// If the item exists
			if(isset($_POST['check' . $count])){
				// Get the posted data and protect it from SQL injection
				$text = $_POST['check' . $count];
				$text = mysql_real_escape_string($text);

				// Fetch the elements corresponding EID for INSERT
				foreach ($eidRows as $rows) {
					// See if the current element name matches our iterative element name
					if($rows['ename'] == 'check' . $count){
						// Set the element ID and break to reduce server load
						$EID = $rows['EID'];
						break;
					}
				}
				
				// Protect Element ID from SQL injection
				$EID = mysql_real_escape_string($EID);

				// Get option IDs from the database for processing
				$query = "SELECT `opid` FROM `check_options` WHERE `EID`='$EID' AND `value`='$text';";
				$opidResult=mysql_query($query) or die($query."<br/><br/>".mysql_error());
				
				while($opidRows=mysql_fetch_array($opidResult)){
					// Protect orderID from SQL injection
					$opid = mysql_real_escape_string($opidRows['opid']);
					break;
				}
				
				$querystring = "INSERT INTO `check_data` (`EID`, `UID`, `opid`) VALUES ('$EID', '$UID', '$opid');";
				$doquery = mysql_query($querystring);
								
				$count++;
			} else {
				break;
			}
		}
		
		// Reset the element counter.
		$count = 1;

		// Redirects to the order review. Since this is the first time, it automatically fills in both the orderid and name
		header('Location: dump.php');
	}
	
}

/* Initialize Order process */
$Process = new Process;
?>
