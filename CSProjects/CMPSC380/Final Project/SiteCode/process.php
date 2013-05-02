<?php
/*
	This file contains all the functions for adding or 'in the future' modifying content from the database.
 */

// Connect to the database
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
	
	// Inserts the submissions into the database one firld at a time
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
		$eidResult=mysql_query($sql) or die($query."<br/><br/>".mysql_error());
		
		// Adds query resultto array so we can loop indefinitely in the future
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
				
				// Insert the complete data into the database.
				$querystring = "INSERT INTO `text_data` (`EID`, `UID`, `input`) VALUES ('$EID', '$UID', '$text');";
				$doquery = mysql_query($querystring) or die($query."<br/><br/>".mysql_error());
				
				// Increment so we can move to the next posted field
				$count++;
			} else {
				break;
			}
		}

		// Reset the element counter for the next field type.
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
				
				// Insert the complete data into the database.
				$querystring = "INSERT INTO `textarea_data` (`EID`, `UID`, `input`) VALUES ('$EID', '$UID', '$text');";
				$doquery = mysql_query($querystring) or die($query."<br/><br/>".mysql_error());
								
				// Increment so we can move to the next posted field
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
					// Protect option ID from SQL injection
					$opid = mysql_real_escape_string($opidRows['opid']);
					break;
				}
				
				// Insert the complete data into the database.
				$querystring = "INSERT INTO `radio_data` (`EID`, `UID`, `opid`) VALUES ('$EID', '$UID', '$opid');";
				$doquery = mysql_query($querystring) or die($query."<br/><br/>".mysql_error());
						
				// Increment so we can move to the next posted field
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

				// Make sure the checkbox was checked before running query
				if($text != 'defunchk'){
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
				
					// Insert the complete data into the database.
					$querystring = "INSERT INTO `check_data` (`EID`, `UID`) VALUES ('$EID', '$UID');";
					$doquery = mysql_query($querystring) or die($query."<br/><br/>".mysql_error());
							
					// Increment so we can move to the next posted field	
					$count++;
				} else {
					// Increment so we can move to the next posted field
					$count++;
				}
			} else {
				break;
			}
		}
		
		// Reset the element counter.
		$count = 1;
		
		// Find all of the dropdown data 
		while(true){

			// If the item exists
			if(isset($_POST['drop' . $count])){
				// Get the posted data and protect it from SQL injection
				$text = $_POST['drop' . $count];
				$text = mysql_real_escape_string($text);

				// Fetch the elements corresponding EID for INSERT
				foreach ($eidRows as $rows) {
					// See if the current element name matches our iterative element name
					if($rows['ename'] == 'drop' . $count){
						// Set the element ID and break to reduce server load
						$EID = $rows['EID'];
						break;
					}
				}
				
				// Protect Element ID from SQL injection
				$EID = mysql_real_escape_string($EID);

				// Get option IDs from the database for processing
				$query = "SELECT `opid` FROM `drop_options` WHERE `EID`='$EID' AND `value`='$text';";
				$opidResult=mysql_query($query) or die($query."<br/><br/>".mysql_error());
				
				while($opidRows=mysql_fetch_array($opidResult)){
					// Protect option ID from SQL injection
					$opid = mysql_real_escape_string($opidRows['opid']);
					break;
				}
				
				// Insert the complete data into the database.
				$querystring = "INSERT INTO `drop_data` (`EID`, `UID`, `opid`) VALUES ('$EID', '$UID', '$opid');";
				$doquery = mysql_query($querystring) or die($query."<br/><br/>".mysql_error());
							
				// Increment so we can move to the next posted field	
				$count++;
			} else {
				break;
			}
		}

		// Redirects to the submission review page if everything worked as expected.
		header('Location: dump.php');
	}
	
}

/* Initialize data modification process */
$Process = new Process;
?>