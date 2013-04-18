<?php
	include("connect.php");
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<title>CS380 Final Project - Input Form 3</title>
		<link rel="stylesheet" type="text/css" href="assets/css/style.css" />
		<script type="text/javascript" src="assets/js/jquery-1.4.1.js"></script>
	</head>
	<body>
		<div id="header"><a href="index.php"><img src="assets/images/header.png" alt="Site Logo" /></a></div>
		<div class="invertedshiftdown2">
			<ul>
				<li><a href="internal.php" title="Home">Home</a></li>
				<li><a href="form1.php" title="Form 1">Form 1</a></li>
				<li><a href="form2.php" title="Form 2">Form 2</a></li>
				<li class="current"><a href="form3.php" title="Form 3">Form 3</a></li>
				<li><a href="dviz.php" title="Data Visualization">Data Visualization</a></li>
				<li><a href="dump.php" title="Database Dump">Database Dump</a></li>
			</ul>
		</div>
		<br /><br />
		<div style="text-align: center; color: #FF0000; font-weight:bold;">CS380 Final Project Form 3: To enter data into the database use one of the forms in the menu below</div>
        <br />
<fieldset>	
		<legend><a name="add">Take Survey</a></legend>
		<div class="fieldsetcontent">
		<span class="desc">Complete the survey by filling out the form below.</span>
		<br /><br />
		<form action="order_process.php" method="post">
			<table cellpadding="2" border="1">
				<tr>
					<td><strong>Name:</strong><br />
					Enter your name.</td>
					<td><input type="text" name="buyername" /></td>
				</tr>
				<tr>
					<td><strong>Homeroom:</strong><br />
					Enter your homeroom number.</td>
					<td><input type="text" name="homeroom" size="4" /></td>
				</tr>
				<tr>
					<td><strong>After school plans:</strong><br />
					Please select the most appropriate option detailing your after high-school plans.</td>
					<td>
						<input type="radio" name="plan" value="College">College</input><br />
						<input type="radio" name="plan" value="Tech School">Technical School</input><br />
						<input type="radio" name="plan" value="Military">Military</input><br />
						<input type="radio" name="plan" value="Workforce">Workforce</input><br />
						<input type="radio" name="plan" value="Undecided">Undecided</input><br />
					</td>
				</tr>
				<tr>
					<td><strong>School:</strong><br />
					If you chose College or Technical School, enter its name here. If you selected Military, please indicate what branch.</td>
					<td><input type="text" name="school" /></td>
				</tr>
				<tr>
					<td><strong>College Sports?</strong><br />
					Indicate if you are playing any sports next year (do not include intermural sports).</td>
					<td><input type="radio" name="playsports" value="yes">Yes</input><br />
					<input type="radio" name="playsports" value="no">No</input><br />
					<input type="text" name="sports" /></td>
				</tr>
				<tr>
					<td><strong>Submit Survey</strong></td>
					<td><button name="submitorder" type="submit">Submit Survey</button></td>
				</tr>
				</table>
		</form>
		</div>
	</fieldset>
    <div id="footer">Evolving Data Storage System &copy; 2013 Braden Licastro. Version 1.2 Build 6.3</div>	
	</body>
</html>
