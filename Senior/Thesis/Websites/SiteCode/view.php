<?php
	// Uncomment to turn on debugging
	//error_reporting(E_ALL);
	//ini_set('display_errors', 'On');

    // Connect to our database
    include "scripts/connect.php";

	require "scripts/config.php";
	require "scripts/aboutPage.class.php";
	require "scripts/vcard.class.php";

	$profile = new AboutPage($info);
?>

<!DOCTYPE html>
<html lang="en" dir="ltr">
	
	<head>
		<title>Viewing All Submissions | CS14-11 | Braden Licastro</title>
		<meta charset="iso-8859-1">
		<link rel="stylesheet" href="styles/layout.css" type="text/css">
		<link rel="stylesheet" href="styles/about.css" type="text/css"/>
		<!--[if lt IE 9]><script src="scripts/html5shiv.js"></script><![endif]-->
	</head>
	
	<body>
		<div class="wrapper row1">
		  <header id="header" class="clear">
		    <hgroup>
		      <h1><a href="index.php">Computer Science Thesis | CS14-11</a></h1>
		      <h2>Approximate Algorithmic Image Matching to Reduce Online Storage Overhead of User Submitted Images</h2>
		    </hgroup>
		    <nav>
		      <ul>
		        <li><a href="index.php">Home</a></li>
		        <li><a href="about.php">About the Topic</a></li>
		        <li><a href="stats.php">Server Stats</a></li>
		        <li><a href="irc.php">Interactive Research Center</a></li>
		        <li><a href="http://www.cs.allegheny.edu/">Allegheny CS Department</a></li>
		      </ul>
		    </nav>
		  </header>
		</div>

		<!-- content -->
		<div class="wrapper row2">
		  <div id="container" class="clear">
		    <!-- content body -->
		   	<section id="shout">
				<h1 style="text-transform:none; text-align:center;">This page shows only the non-duplicate images uploaded to the server.<br />*Ordered latest to earliest submitted.*</h1>
		    </section>
		    
		    <!-- main content -->
		    <div id="homepage">
		      <!-- services area <h1>News and Updates</h1>-->
		      
				<!-- Locate the image on the server with the DB entry -->
				<?php
					try {
						$stmt = $conn->prepare('SELECT * FROM `share_tracker` WHERE `uMethod` = "1" AND `hash` IS NOT NULL ORDER BY ID DESC');
						$stmt->execute();
						// Get array containing all of the result rows
						$result = $stmt->fetchAll();
					} catch(PDOException $e) {
						echo 'ERROR: ' . $e->getMessage();
					}
				?>

   			<!-- One Quarter -->
			<h1>User Submitted Images</h1>
		      <section id="latest" class="last clear">
		      <?php
		      	// Number of items in our results array
		      	$count = count($result);

				//Display message if there are no items to show.		      	
		      	if(!$count){
		      		echo "<p style=\"padding-left:25px; color:orange; font-size: 1.25em;\"><strong>There are no images to display!</strong></p>";
		      	} else {
			      	// Print the items to the screen
			      	for ($index = 0; $index < $count; $index++) {
			      		// Remove right padding on rightmost quarter
					    if(($index + 1) % 4 === 0) {
					        $right = ' lastbox';
					    } else {
					    	$right = '';
					    }
					    
	   		      		// Remove bottom padding on last row of quarters
					    if((($index + 1) > ($count - ($count % 4))) || (($count % 4) === 0 && ($index + 1) > ($count - 4))) {
					        $bottom = '';
					    } else {
					    	$bottom = ' midbox';
					    }
	
						echo "<article class=\"one_quarter" . "$right" . "$bottom" . "\">";
		
						// If one or more rows were returned...
						if (array_key_exists($index, $result)) {
							$row = $result[$index];
							echo "<figure><div style=\"height:215px; overflow:hidden;\"><a href=\"./irc.php?view=" . $row['ILookup'] . "\"><img src=\"./thumbnails_reduced/thumb_" . $row['IName'] .  "\" width = \"215px\" alt=\"\"></a></div><figcaption><a href=\"./irc.php?view=" . $row['ILookup'] . "\">View Image</a></figcaption></figure>";
						} else {
							echo "<figure><div style=\"height:215px; overflow:hidden;\"><img src=\"./images/not_found.jpg\" width=\"215\" alt=\"\"></div><figcaption>Image Not Available</figcaption></figure>";
						}
						
						echo "</article>";
					}
				}
				?>
		      </section>
		      <!-- / One Quarter -->
		    </div>
		    <!-- / content body -->
		  </div>
		</div>

		<!-- Footer -->
		<div class="wrapper row3">
		  <footer id="footer" class="clear">
		    <p class="fl_left">Copyright &copy; 2013-2014 <a href="#">Braden Licastro</a></p>
		    <p class="fl_right">Template based on design by: <a href="http://www.os-templates.com/" >OS Templates</a></p>
		  </footer>
		</div>
	</body>
</html>
