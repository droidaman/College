<?php
	include("connect.php");
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<title>CS380 Final Project - Input Form 2</title>
		<link rel="stylesheet" type="text/css" href="assets/css/style.css" />
		<script type="text/javascript" src="assets/js/jquery-1.4.1.js"></script>
	</head>
	<body>
		<div id="header"><a href="internal.php"><img src="assets/images/header.png" alt="Site Logo" /></a></div>
		<div class="invertedshiftdown2">
			<ul>
				<li><a href="internal.php" title="Home">Home</a></li>
				<li><a href="form1.php" title="Form 1">Form 1</a></li>
				<li class="current"><a href="form2.php" title="Form 2">Form 2</a></li>
				<li><a href="form3.php" title="Form 3">Form 3</a></li>
				<li><a href="dviz.php" title="Data Visualization">Data Visualization</a></li>
				<li><a href="dump.php" title="Database Dump">Database Dump</a></li>
			</ul>
		</div>
		<br /><br />
		<div style="text-align: center; color: #FF0000; font-weight:bold;">CS380 Final Project Form 2: To enter data into the database use one of the forms in the menu below</div>
        <br />
<fieldset>
		<legend><a name="add">Place New Order</a></legend>
		<div class="fieldsetcontent">
		<span class="desc">Place a new t-shirt order by filling out the form below.</span>
		<br /><br />
		<form action="process.php" method="post">
			<input type="hidden" name="FID" value="2" />
			<input type="hidden" name="UID" value="1" />
			<table cellpadding="2" border="1">
				<tr>
					<td><strong>Buyer's Name*:</strong><br />
					Enter the name of the person buying the shirt(s).</td>
					<td><input type="text" name="text1" /></td>
				</tr>
				<tr>
					<td><strong>Email*:</strong><br />
					Only needed for you to access and edit your order.</td>
					<td><input type="text" name="text2" /></td>
				</tr>
				<tr>
					<td><strong>Buyer's Homeroom:</strong><br />
					If applicable, enter the buyer's homeroom number.</td>
					<td><input type="text" name="text3" size="5" /></td>
				</tr>
				<tr>
					<td><strong>School*:</strong><br />
					Who are you supporting: Derry or Latrobe? Choose which style of shirt you want to order.</td>
					<td><input type="radio" name="radio1" value="derry" />Derry<br />
					<input type="radio" name="radio1" value="latrobe" />Latrobe</td>
				</tr>
				<tr>
					<td><strong>Shirt Size*:</strong><br />
					Choose your shirt size. <em><strong>Note: </strong> If you are ordering multiple shirts, they 
					must all be of the same size. To order shirts of different sizes, please create multiple orders, one for each 
					shirt size.</em></td>
					<td><select name="drop1">
						<option value="small">Small</option>
						<option value="medium">Medium</option>
						<option value="large">Large</option>
						<option value="x-large">Extra Large</option>
						<option value="xx-large">Double Extra Large</option>
						<option value="xxx-large">Triple Extra Large</option>
					</select></td>
				</tr>
				<tr>
					<td><strong>Quantity*:</strong><br />
					Enter the number of shirts you would like to order. Be sure to see the Shirt Size note for information on 
					ordering multiple shirt sizes.</td>
					<td><input type="text" name="text4" size="2" value="1" /></td>
				</tr>
				<tr>
					<td><strong>Submit Order</strong></td>
					<td><button name="submit" type="submit">Submit Order</button></td>
				</tr>
				</table>
		</form>
		<strong>* - Required field</strong>
		</div>
	</fieldset>
    <div id="footer">Evolving Data Storage System &copy; 2013 Braden Licastro. Version 1.2 Build 6.3</div>	
	</body>
</html>
