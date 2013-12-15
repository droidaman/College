<?php
	//Uncomment to turn on debugging
	//ini_set('display_errors', 'On');

    // Connect to our database
    include "scripts/connect.php";

	// This function calculates directory vitals to be shown as needed in the graphs.
	function folderstats($dir) {
		$count_size = 0;
		$count = 0;
		$dir_array = scandir($dir);

		foreach($dir_array as $key=>$filename) {
			if($filename!=".." && $filename!=".") {
				if(is_dir($dir."/".$filename)) {
					$new_folderstats = folderstats($dir."/".$filename);
					$count_size = $count_size + $new_folderstats[0];
					$count += $new_folderstats[1];
				} else if(is_file($dir."/".$filename)) {
					$count_size = $count_size + filesize($dir."/".$filename);
					$count++;
		}	}	}
		
		return array($count_size,$count);
	}
	
	$dirupld = folderstats("/var/www/srthesis/uploads");
	$dirupldred = folderstats("/var/www/srthesis/uploads_reduced");

?>
 
<!DOCTYPE html>
<html lang="en" dir="ltr">
	
	<head>
		<title>CS Thesis Server Status | CS14-11 | Braden Licastro</title>
		<meta charset="iso-8859-1">
		<link rel="stylesheet" href="styles/layout.css" type="text/css">
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
		        <li class="active"><a href="stats.php">Server Stats</a></li>
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
		    	<p style="text-align:center;">This page contains live information allowing for real time viewing of the research project's test directory data. </p>
		    </section>
		    <section id="slider">
		    	<div style="text-align: center; float:left; margin: 0px 0px 15px 100px; width: 300px; color:black"><strong>Total Directory Size</strong> (MB)</div><div style="text-align: center; float:right; margin:0px 100px 15px 0px; width: 300px; color:black;"><strong>Directory File Count</strong> (# of Files)</div>
				<div style="clear: both;"></div>
				<div id="graphDiv1" style="float: left; padding-left: 100px;"></div><div id="graphDiv2" style="float: right; padding-right: 100px;"></div>
				<div style="clear: both;"></div>
			</section>

		    <!-- main content -->
		    <div id="homepage">
   		      <!-- services area -->
		      <h1>Vital Statistics</h1>
		      <section id="services" class="clear">
		        <article>
		          <figure><img src="images/stat.gif" width="32" height="32" alt=""></figure>
		          <strong>Storage Utilization</strong>
				  <div><br /><br /><hr /></div>
		          <p><?php echo "Traditional Upload Directory:<br />&emsp;&emsp;" . round(($dirupld[0]/1048576), 2) . " MB <br />";
		          		   echo "Duplicate Reduced Directory:<br />&emsp;&emsp;" . round(($dirupldred[0]/1048576), 2) . " MB <br />";?></p>
		        </article>
		        <article>
		          <figure><img src="images/stat.gif" width="32" height="32" alt=""></figure>
		          <strong>Directory File Count</strong>
				  <div><br /><br /><hr /></div>
		          <p><?php echo "Traditional Upload Count:<br />&emsp;&emsp;" . $dirupld[1] . " Files <br />";
		          		   echo "Duplicate Reduced Count:<br />&emsp;&emsp;" . $dirupldred[1] . " Files <br />";?></p>
		        </article>
		        <article class="last">
		          <figure><img src="images/settings.gif" width="32" height="32" alt=""></figure>
		          <strong>Server Statistics</strong>
				  <div><br /><br /><hr /></div>
				  <p>Using the proposed redundency minimalization algorithms, storage usage was reduced <?php echo round(((($dirupld[0]-$dirupldred[0])/$dirupld[0])*100), 2);  ?>% .</p>
		          <hr /><p>To view all images currently in the duplicate reduced directory, please <a href="view.php"> &laquo; CLICK HERE! &raquo;</a></p>
		          <p class="more"><a href="../service-status">View Server Statistics &raquo;</a></p>
		        </article>
		      </section>
		      <!-- / services area -->
		      
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

	<input type="hidden" name="upldsz" id="upldsz" value="<?php echo json_encode($dirupld[0]); ?>">
	<input type="hidden" name="upldredsz" id="upldredsz" value=" <?php echo json_encode($dirupldred[0]); ?>">
	<?php if ($dirupld[1] == 0 && $dirupldred[1] == 0){	?>
		<input type="hidden" name="upldct" id="upldct" value="<?php echo json_encode($dirupld[1]); ?>">
		<input type="hidden" name="upldredct" id="upldredct" value=" <?php echo json_encode($dirupldred[1]); ?>">
	<?php } else { ?>
		<input type="hidden" name="upldct" id="upldct" value="<?php echo json_encode($dirupld[1]+1); ?>">
		<input type="hidden" name="upldredct" id="upldredct" value=" <?php echo json_encode($dirupldred[1]+1); ?>">
	<?php } ?>
	

	<!-- Scripts for the bar graphs! -->
	<!--[if IE]><script src="scripts/excanvas.js"></script><![endif]-->
	<script src="scripts/html5-canvas-bar-graph.js"></script>
	<script>
	(function () {
	
		function createCanvas(divName) {
			
			var div = document.getElementById(divName);
			var canvas = document.createElement('canvas');
			div.appendChild(canvas);
			if (typeof G_vmlCanvasManager != 'undefined') {
				canvas = G_vmlCanvasManager.initElement(canvas);
			}	
			var ctx = canvas.getContext("2d");
			return ctx;
		}
		
		var ctx = createCanvas("graphDiv1");
		var upldsz=document.getElementById("upldsz").value;
		var upldredsz=document.getElementById("upldredsz").value;		

		var graph = new BarGraph(ctx);
		graph.maxValue = Math.ceil((Math.max(upldsz,upldredsz) + 1)/1048576);
		graph.margin = 10;
		graph.width = 300;
		graph.height = 250;
		graph.colors = ["#49a0d8", "#d353a0"];
		graph.xAxisLabelArr = ["Redundant", "Duplicate Reduced"];
		graph.update([0, 0]);
		setTimeout(function () {
			graph.update([Math.ceil(upldsz/1048576), Math.ceil(upldredsz/1048576)]);
		}, 400);
		
		var ctx2 = createCanvas("graphDiv2");
		var upldct=document.getElementById("upldct").value;
		var upldredct=document.getElementById("upldredct").value;
		
		var graph2 = new BarGraph(ctx2);
		graph2.maxValue = Math.max(upldct,upldredct) + 1;
		graph2.margin = 10;
		graph2.width = 300;
		graph2.height = 250;
		graph2.colors = ["#ffc527", "#df4c27"];
		graph2.xAxisLabelArr = ["Redundant", "Duplicate Reduced"];
		graph2.update([0, 0]);
		setTimeout(function () {
			graph2.update([upldct, upldredct]);
		}, 650);

	}());
	</script>
	</body>
</html>
