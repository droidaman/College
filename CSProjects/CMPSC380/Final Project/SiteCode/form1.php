<?php
	include("connect.php");
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<title>CS380 Final Project - Input Form 1</title>
		<link rel="stylesheet" type="text/css" href="assets/css/style.css" />
		<script type="text/javascript" src="assets/js/jquery-1.4.1.js"></script>
	</head>
	<body>
		<div id="header"><a href="internal.php"><img src="assets/images/header.png" alt="Site Logo" /></a></div>
		<div class="invertedshiftdown2">
			<ul>
				<li><a href="internal.php" title="Home">Home</a></li>
				<li class="current"><a href="form1.php" title="Form 1">Form 1</a></li>
				<li><a href="form2.php" title="Form 2">Form 2</a></li>
				<li><a href="form3.php" title="Form 3">Form 3</a></li>
				<li><a href="dviz.php" title="Data Visualization">Data Visualization</a></li>
				<li><a href="dump.php" title="Database Dump">Database Dump</a></li>
			</ul>
		</div>
		<br /><br />
		<div style="text-align: center; color: #FF0000; font-weight:bold;">CS380 Final Project Form 1: To enter data into the database use one of the forms in the menu below</div>
        <br />
    <fieldset>
		<legend><a name="add">Place New Order</a></legend>
		<div class="fieldsetcontent">
		<span class="desc">Place a new carnation order by filling out the form below.</span>
		<br /><br />
		<form action="process.php" method="post">
			<input type="hidden" name="FID" value="1" />
			<input type="hidden" name="UID" value="1" />
			<table cellpadding="2" border="2">
				<tr>
					<td><strong>Buyer's Name*:</strong><br />
					Enter the name of the person buying the flower(s).</td>
					<td><input type="text" name="text1" /></td>
				</tr>
				<tr>
					<td><strong>Anonymous sender?</strong><br />
					Check this box if you would like the flowers to be delivered anonymously.</td>
					<td>
						<input type="hidden" name="check1" value="defunchk" />
						<input type="checkbox" name="check1" />
					</td>
				</tr>
				<tr>
					<td><strong>Number of flowers*:</strong><br />
					Enter the number of flowers you would like to purchase.<br />
					Remember, flowers are $1 apiece and $10 for a bouquet of 12 flowers.</td>
					<td><input type="text" name="text2" value="1" size="3" /></td>
				</tr>
				<tr>
					<td><strong>Recipient Name*:</strong><br />
					Enter the name of the flower recipient.</td>
					<td><input type="text" name="text3" /></td>
				</tr>
				<tr>
					<td><strong>Recipient Homeroom:</strong><br />
					If you know it, enter the homeroom of the flower recipient.<br />
					 We can look it up if you aren't sure.</td>
					<td><input type="text" name="text4" size="4" maxlength="4" /></td>
				</tr>
				<tr>
					<td><strong>Message:</strong><br />
					Enter a message to be included with the flower(s).</td>
					<td><textarea name="textarea1" rows="5" cols="20"></textarea></td>
				</tr>
				<tr>
					<td><strong>Submit Order</strong></td>
					<td><button name="submit" type="submit">Submit Order</button></td>
				</tr>
				</table>
		</form>
		* - Required field
		</div>
	</fieldset>
    <div id="footer">Evolving Data Storage System &copy; 2013 Braden Licastro. Version 1.2 Build 6.3</div>	
	</body>
</html>
