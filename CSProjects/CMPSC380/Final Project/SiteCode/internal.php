<?php
	include("connect.php");
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<title>CS380 Final Project - Home</title>
		<link rel="stylesheet" type="text/css" href="assets/css/style.css" />
		<script type="text/javascript" src="assets/js/jquery-1.4.1.js"></script>
	</head>
	<body>
		<div id="header"><a href="index.php"><img src="assets/images/header.png" alt="Site Logo" /></a></div>
		<div class="invertedshiftdown2">
			<ul>
				<li class="current"><a href="internal.php" title="Home">Home</a></li>
				<li><a href="form1.php" title="Form 1">Form 1</a></li>
				<li><a href="form2.php" title="Form 2">Form 2</a></li>
				<li><a href="form3.php" title="Form 3">Form 3</a></li>
				<li><a href="dviz.php" title="Data Visualization">Data Visualization</a></li>
				<li><a href="dump.php" title="Database Dump">Database Dump</a></li>
			</ul>
		</div>
		<br /><br />
        <div id="content">
            <h2>Computer Science 380 Spring 2013 Final Project</h2>
        </div>
        <div id="content2">
            <strong>Evolving Data Set Storage using a General Purpose Schema</strong><br /><br />
            <div>Goal:
                <p id="tab">To design a schema capable of storing a set of data generated from an online form. The database must be able to store and recall data from any form design without schema modification.</p>
            </div>
            <div>Deliverables:
                <p id="tab">Upon completion of the lab the following items will be turned</p>
                <ul id="tab">
                    <li>Form code including any style sheets</li>
                    <li>Database schema</li>
                    <li>Printout of database contents after completing insertions using form</li>
                    <li>Graphical representation of data pulled from database</li>
                    <li>Writeup of any important notes, and difficulties encountered</li>
                </ul>
            </div>
            <div>Implementation:
                <p id="tab">In order to implement a system that will be able to successfully complete the required tasks outlined in the goal section several languages and stages of development are required. XHTML will be used for any layout and data display with accompanying CSS style files for interface styling. The PHP language will be used to implement the form elements, and perform any database transactions. When a form is submitted, the data will be inserted into the appropriate database tables. There will be one table for each of the following form elements: Multiple Choice, Checkbox, Paragraph, and Text.</p>
                <p id="tab">To visualize the text and paragraph data, word clouds will be implemented in addition to allowing the user to view the full text. Checkboxes and Multiple choice will be represented using graphs. All graphical display will be done using HTML5, PHP, and Javascript libraries.</p>
            </div>
            <div>Testing:
                <p id="tab">To test the system, three forms will be used, each of varying levels of complexity. Five sets of data will be submitted using each form, all using the same tables. The database will be examined for correct content, and the data will be shown using the built in visualizations.</p>
            </div>
            <div>Evaluation:
                <p id="tab">To evaluate the system, the final data in the database will be examined for correctness. If the data is correct, and can be accurately visualized the schema will be considered successful. In addition, data will be shown for each form submission. If the form data is correctly recalled for each individual submission, the system is working correctly.</p>
            </div>
        </div>
    <div id="footer">Evolving Data Storage System &copy; 2013 Braden Licastro. Version 1.2 Build 6.3</div>	
	</body>
</html>
