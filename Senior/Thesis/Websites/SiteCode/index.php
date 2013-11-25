<?php
	//Uncomment to turn on debugging
	ini_set('display_errors', 'On');

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
		<title>CS Thesis Home | CS14-11 | Braden Licastro</title>
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
		        <li class="active"><a href="index.php">Home</a></li>
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
		    	<p style="text-align:center">Welcome! This site is the thesis work of Braden Licastro for the Allegheny College Department of Computer Science.<br />Keep checking back for frequent changes as rapid development of website code and support documentation occurs daily!</p>
		    </section>
		    <section id="slider">
		    	<section id="infoPage">
    				<img src="<?php echo $profile->photoURL()?>" alt="<?php echo $profile->fullName()?>" width="164" height="164" />

            		<header>
             	    	<span style="font-size:64px; font-weight:normal; line-height:1; text-shadow:2px 2px 0 rgba(22,22,22,0.5); padding-left: 10px; color:#dfdfdf;"><?php echo $profile->fullName()?></span><br />
            	    	<span style="font-size: 18px; font-weight: normal; text-shadow: 1px 1px 0 rgba(255, 255, 255, 0.1); padding-left: 25px; color:#777;"><?php echo $profile->tags()?></span>
           			</header>

            		<p class="description"><?php echo nl2br($profile->description())?></p>

            		<ul class="vcard">
                		<li class="fn"><?php echo $profile->fullName()?><br /></li>
                		<li class="org"><?php echo $profile->company()?><br /></li>
                		<li class="tel"><?php echo $profile->cellphone()?><br /></li>
                		<li><a class="url" href="<?php echo $profile->website()?>"><?php echo $profile->website()?></a></li>
            		</ul>
				</section>
			</section>
		    
		    <!-- main content -->
		    <div id="homepage">
		      <!-- services area -->
		      <h1>News and Updates</h1>
		      <section id="services" class="clear">
		        <article>
		          <figure><img src="images/update.gif" width="32" height="32" alt=""></figure>
		          <strong>Paradigm Shift</strong>
		          <p>Over the past week much of the development effort has been funneled into adding content to the website and tweaking the interface for better function and viewer experience. Over the next week I will be shifting focus to more relevant code work by bringing the image upload and sharing system online. Upon the completion of this task all effort will be put into completing the comp related code and algorithms.</p>
		        </article>
		        <article>
		          <figure><img src="images/news.gif" width="32" height="32" alt=""></figure>
		          <strong>Feature Online</strong>
		          <p>As of late, the website has undergone major transformations &ndash;most notibly, the image viewing system located near the bottom of several pages on this site. Login is not required to view the images, and a gallery will be opened in the near future allowing the viewing of every image on the server. Please be patient as these new festures come online, they may be buggy at first.</p>
		        </article>
		        <article class="last">
		          <figure><img src="images/update.gif" width="32" height="32" alt=""></figure>
		          <strong>Permissions Change</strong>
		          <p>After much debate and consideration it was determined that it would be in the best interest of the research project to close off part of the Interactive Research Center. As of 10/8/13 all image uploads to the system will require a username and password. If you wish to participate in the research project please email &lang;licastb&rang; and you will be added to the access list if approved.</p>
		        </article>
		      </section>
		      <!-- / services area -->
		      
				<!-- Locate the image on the server with the DB entry -->
				<?php
					try {
						$stmt = $conn->prepare('SELECT * FROM share_tracker WHERE uMethod = "1" ORDER BY ID DESC LIMIT 4');
						$stmt->execute();
						// Get array containing all of the result rows
						$result = $stmt->fetchAll();
					} catch(PDOException $e) {
						echo 'ERROR: ' . $e->getMessage();
					}
				?>

   			<!-- One Quarter -->
<h1>Latest User Submitted Images</h1>
		      <section id="latest" class="last clear">
		        <article class="one_quarter">
					<?php
						// If one or more rows were returned...
						if (array_key_exists(0, $result)) {
							$row = $result[0];
							echo "<figure><div style=\"height:215px; overflow:hidden;\"><img src=\"./" . $row['directory'] . "/" . $row['IName'] .  "\" width = \"215px\" alt=\"\"></div><figcaption><a href=\"./irc.php?view=" . $row['ILookup'] . "\">View Image</a></figcaption></figure>";
						} else {
							echo "<figure><div style=\"height:215px; overflow:hidden;\"><img src=\"./images/not_found.jpg\" width=\"215\" alt=\"\"></div><figcaption>Image Not Available</figcaption></figure>";
						}
					?>
		        </article>
		        <article class="one_quarter">
					<?php
						// If one or more rows were returned...
						if (array_key_exists(1, $result)) {
							$row = $result[1];
							echo "<figure><div style=\"height:215px; overflow:hidden;\"><img src=\"./" . $row['directory'] . "/" . $row['IName'] .  "\" width = \"215px\" alt=\"\"></div><figcaption><a href=\"./irc.php?view=" . $row['ILookup'] . "\">View Image</a></figcaption></figure>";
						} else {
							echo "<figure><div style=\"height:215px; overflow:hidden;\"><img src=\"./images/not_found.jpg\" width=\"215\" alt=\"\"></div><figcaption>Image Not Available</figcaption></figure>";
						}
					?>
		        </article>
		        <article class="one_quarter">
					<?php
						// If one or more rows were returned...
						if (array_key_exists(2, $result)) {
							$row = $result[2];
							echo "<figure><div style=\"height:215px; overflow:hidden;\"><img src=\"./" . $row['directory'] . "/" . $row['IName'] .  "\" width = \"215px\" alt=\"\"></div><figcaption><a href=\"./irc.php?view=" . $row['ILookup'] . "\">View Image</a></figcaption></figure>";
						} else {
							echo "<figure><div style=\"height:215px; overflow:hidden;\"><img src=\"./images/not_found.jpg\" width=\"215\" alt=\"\"></div><figcaption>Image Not Available</figcaption></figure>";
						}
					?>
		        </article>
		        <article class="one_quarter lastbox">
					<?php
						// If one or more rows were returned...
						if (array_key_exists(3, $result)) {
							$row = $result[3];
							echo "<figure><div style=\"height:215px; overflow:hidden;\"><img src=\"./" . $row['directory'] . "/" . $row['IName'] .  "\" width = \"215px\" alt=\"\"></div><figcaption><a href=\"./irc.php?view=" . $row['ILookup'] . "\">View Image</a></figcaption></figure>";
						} else {
							echo "<figure><div style=\"height:215px; overflow:hidden;\"><img src=\"./images/not_found.jpg\" width=\"215\" alt=\"\"></div><figcaption>Image Not Available</figcaption></figure>";
						}
					?>
		        </article>
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
