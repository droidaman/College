<?php
	// Uncomment to turn on debugging
	//error_reporting(E_ALL);
	//ini_set('display_errors', 'On');

	// Allow sessions to be passed so we can see if the user is logged in
    session_start();
    $authData = simplexml_load_file("scripts/auth.xml");
    
    // Connect to our database
    include "scripts/connect.php";

    
	// Login/misc error reporting.
	$errorMessage = "";
    $un = "";
    $pw = "";
    $name = "";

	// If the user has submitted the form
	if (isset($_POST['btnLogin'])){
		// Store login to variables
		$un = $_POST['tbUsername'];
		$pw = $_POST['tbPassword'];
		
    	for($i = 0; $i < count($authData); $i++){
        	$unChk = $authData->login_details[$i]->username;
        	$pwChk = $authData->login_details[$i]->password;
			$name = $authData->login_details[$i]->name;

        	if(($unChk == $un) && ($pwChk == $pw)){
            	$_SESSION['usrauth'] = "$name";
            	
				// Redirect them to the same page they were on
 				header('Location:'.$_SERVER['PHP_SELF'].'');
 				die();
 			}
    	}

    	// We have exited loop (and therefore not been directed) we have a invalid login
    	$errorMessage = "User authentication failed.";
	}

	if($_GET["logout"] === "success"){
		session_destroy();
 		header('Location:'.$_SERVER['PHP_SELF'].'');
		die();
	}
?> 

<!DOCTYPE html>
<html lang="en" dir="ltr">
	
	<head>
		<title>CS Thesis Interactive Research Center | CS14-11 | Braden Licastro</title>
		<meta charset="iso-8859-1">
		<link rel="stylesheet" href="styles/layout.css" type="text/css">
		<link rel="stylesheet" href="styles/upload.css" type="text/css">
		<script src="scripts/upload.js"></script>
		<!--[if lt IE 9]><script src="scripts/html5shiv.js"></script><![endif]-->
		
		<script src="scripts/lightbox/jquery-1.10.2.min.js"></script>
		<script src="scripts/lightbox/lightbox-2.6.min.js"></script>
		<link href="styles/lightbox.css" rel="stylesheet" />
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
		        <li class="active"><a href="irc.php">Interactive Research Center</a></li>
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
		   		<?php
		   			if(isset($_SESSION['usrauth'])){
		   				echo "<p style=\"text-align:center;\">Welcome, " . $_SESSION['usrauth'] . "! <a href=\"http://skynetgds.no-ip.biz/srthesis/irc.php?logout=success\">Log out?</a>";
		   			} else {
		    			echo "<p style=\"text-align:center;\">The image sharing form has been password protected to ensure comp integrity.<br/>To receive a password please contact &lt;licastb&gt;</p>";
		    		}
		    	?>
		    </section>
		    
		    <!-- USER AUTHENTICATION FORCED (Not for image viewing though) -->
		    <?php
				if(isset($_GET["view"]) && !empty($_GET["view"])) {
					$view = $_GET['view'];
			?>
			    	<section id="slider">
	            		<div class="contr">
	            			<h2 style="text-transform:none; color:#929292;">Viewing Image: <?php echo $view; ?></h2>
	            		</div>
						<div class="upload_form_cont" style="width: 100%; margin: 0 auto; text-align:center;">
							<!-- Locate the image on the server with the DB entry -->
							<?php
								try {
									$stmt = $conn->prepare('SELECT * FROM share_tracker WHERE ILookup = :view');
	    							$stmt->execute(array('view' => $view));
 
									# Get array containing all of the result rows
									$result = $stmt->fetchAll();
 
									# If one or more rows were returned...
									if (count($result)) {
									    foreach($result as $row) {
											echo "<br /><a href=\"" . $row['directory'] . "/" . $row['IName'] .  "\"  data-lightbox=\"lightbox-single\" title=\"Viewing Image: " . $view .  "\"><img src=\"" . $row['directory'] . "/" . $row['IName'] .  "\" alt= \"\" width=\"500px\"></a><br /><br />";
									    }
									} else {
									    echo "<div style=\"text-align:center;\"><br /><img src=\"images/oops.jpg\" alt=\"\"></div><p style=\"text-transform:none;\"><strong>OOPS! The image you were looking for was not found; Please make sure the URL is correct and try again.<br /><br /></strong></p>";
									}
								} catch(PDOException $e) {
    								echo 'ERROR: ' . $e->getMessage();
    							}
							?>
						</div>
					</section>
			<?php
				} else {
		   			if(isset($_SESSION['usrauth'])){
		   	?>
				    <section id="slider">
		            	<div class="contr">
		            		<h2 style="text-transform:none; color:#929292;">Select an image and share it with friends using the form below!</h2>
		            	</div>
						<div class="upload_form_cont">
		                	<form id="upload_form" enctype="multipart/form-data" method="post" action="upload.php">
		                    	<div>
		                        	<div><label for="image_file">Please select jpeg image file</label></div>
		                        	<div><input type="file" name="image_file" id="image_file" onchange="fileSelected();" /></div>
		                    	</div>
			                   	<div id="error">Valid .jpg or .jpeg image files only!</div>
			                   	<div id="warnsize">Your file is too large. Please select a file smaller than 15MB. </div>
		                    	<div>
		                        	<input type="button" id="btnUpload" value="Upload" onclick="startUploading()" disabled="disabled" />
		                    	</div>
		                    	<div id="fileinfo">
		                     	   <div id="filename"></div>
		                     	   <div id="filesize"></div>
		                     	   <div id="filetype"></div>
		                     	   <div id="filedim"></div>
		                    	</div>
		                    	
		                    	<div id="error2">An error occurred while uploading the image</div>
		                    	<div id="abort">The upload has been canceled by the user or the browser dropped the connection</div>
		
		                    	<div id="progress_info">
		                    	    <div id="progress"></div>
		                    	    <div id="progress_percent">&nbsp;</div>
		                    	    <div class="clear"></div>
		                    	    <div>
		                    	        <div id="speed">&nbsp;</div>
		                    	        <div id="remaining">&nbsp;</div>
		                    	        <div id="b_transfered">&nbsp;</div>
		                    	        <div class="clear"></div>
		                    	    </div>
		                        <div id="upload_response"></div>
		                    	</div>
		                	</form>
		
		                	<img id="preview" alt="" />
		                
		            	</div>
			    	</section>
				    
					<?php } else { ?>
				    <section id="slider">
   		            	<div class="contr">
		            		<h2 style="text-transform:none; color:#929292;">Image Share Sign-On ...</h2>
		            	</div>

						<div class="upload_form_cont">
							<form name="frmLogin" method="post">
								<table  style="margin:10px auto 10px 10px;">
									<tr>
										<td>Username:</td>
										<td><input type="text" name="tbUsername" /></td>
									</tr>
									<tr>
										<td>Password:</td>
										<td><input type="password" name="tbPassword" /></td>
									</tr>
									<?php if ($errorMessage != '') { ?>
										<tr>
											<td colspan="2" style="text-align:center; font-weight:bold; color: #990000;">
												<?php echo $errorMessage; ?>
											</td>
										</tr>
									<?php } ?>
									<tr>
										<td colspan="2"><input type="submit" name="btnLogin" value="Login" /></td>
									</tr>
								</table>
							</form>
						</div>
					</section>
				<?php }
				} ?>
			
			<!-- / USER AUTHENTICATION FORCED -->

		      <!-- main content -->
		      <div id="homepage">
				<!-- Locate the image on the server with the DB entry -->
				<?php
					try {
						$stmt = $conn->prepare('SELECT * FROM `share_tracker` WHERE `uMethod` = "1" AND `hash` IS NOT NULL ORDER BY ID DESC LIMIT 4');
						$stmt->execute();
						// Get array containing all of the result rows
						$result = $stmt->fetchAll();
					} catch(PDOException $e) {
						echo 'ERROR: ' . $e->getMessage();
					}
				?>

		      <!-- One Quarter -->
			  <h1>Latest User Submitted Images (<a href="view.php">View All Image Submissions</a>)</h1>
		      <section id="latest" class="last clear">
		        <article class="one_quarter">
					<?php
						// If one or more rows were returned...
						if (array_key_exists(0, $result)) {
							$row = $result[0];
							echo "<figure><div style=\"height:215px; overflow:hidden;\"><a href=\"./irc.php?view=" . $row['ILookup'] . "\"><img src=\"./thumbnails_reduced/thumb_" . $row['IName'] .  "\" width = \"215px\" alt=\"\"></a></div><figcaption><a href=\"./irc.php?view=" . $row['ILookup'] . "\">View Image</a></figcaption></figure>";
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
							echo "<figure><div style=\"height:215px; overflow:hidden;\"><a href=\"./irc.php?view=" . $row['ILookup'] . "\"><img src=\"./thumbnails_reduced/thumb_" . $row['IName'] .  "\" width = \"215px\" alt=\"\"></a></div><figcaption><a href=\"./irc.php?view=" . $row['ILookup'] . "\">View Image</a></figcaption></figure>";
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
							echo "<figure><div style=\"height:215px; overflow:hidden;\"><a href=\"./irc.php?view=" . $row['ILookup'] . "\"><img src=\"./thumbnails_reduced/thumb_" . $row['IName'] .  "\" width = \"215px\" alt=\"\"></a></div><figcaption><a href=\"./irc.php?view=" . $row['ILookup'] . "\">View Image</a></figcaption></figure>";
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
							echo "<figure><div style=\"height:215px; overflow:hidden;\"><a href=\"./irc.php?view=" . $row['ILookup'] . "\"><img src=\"./thumbnails_reduced/thumb_" . $row['IName'] .  "\" width = \"215px\" alt=\"\"></a></div><figcaption><a href=\"./irc.php?view=" . $row['ILookup'] . "\">View Image</a></figcaption></figure>";
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
