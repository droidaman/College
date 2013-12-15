<!DOCTYPE html>
<html lang="en" dir="ltr">
	
	<head>
		<title>About CS Thesis | CS14-11 | Braden Licastro</title>
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
		        <li class="active"><a href="about.php">About the Topic</a></li>
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
		    	<p style="text-align:center">On this page you will find details relating to the approximate algorithmic image deduplication thesis.<br />Keep checking back as information will be updated and added on a regular basis!</p>
		    </section>
		    <section id="slider"><img src="images/ResearchPage.png" alt="Image Submission Process"></section>
		    
		    <!-- main content -->
		    <div id="homepage">
		      <!-- services area -->
		      <h1>Project Details</h1>
		      <p style="text-align:center;"><strong>Approximate Algorithmic Image Matching to Reduce Online Storage Overhead of User Submitted Images</strong></p>
		      <section id="services" class="clear">
				<div>
					<p><strong>Purpose:</strong></p>
						<p>Current systems allow for duplicate data to be uploaded to the server by multiple users, requiring large amounts of storage space. The proposed research will target the issue of storing user submitted image data while reducing storage overhead through a series of algorithms and analysis methods.</p>
					<p><strong>Example:</strong></p>
						<p>Websites such as imgur, photobucket, as well as many others allow users to upload and share images free of cost. User A wishes to share an image with friends and uploads said image to the server and is provided a link that the public can access the image from. User B also wishes to share the exact same image (possibly a different resolution) and uploads it to the server. Both users have added identical – or near identical information to the server and have caused redundancy.</p>
					<p><strong>Use of proposed system:</strong></p>
						<p>As with the earlier example, user A wants to share an image and uploads it to the photo sharing website. The image will be processed, determined to be unique, and will subsequently be added to the server. User B also wishes to share the same image (possibly a different resolution) and proceeds to upload it to the server, it is processed, and is determined to be a duplicate of an image already on the server.</p>
						<p>If the new image is lower resolution or the same resolution as the existing one, the site will show the user the most probable match and display the higher/same resolution image and the one they wish to upload. If the user determines it is the same image, the new image will be discarded and a link will be generated for the existing image. If the new image is a higher resolution, and the user states it is the same, the new image will be uploaded and the old one preserved to keep users from maliciously overwriting a previous share.</p>
					<p><strong>Benefit:</strong></p>
						<p>By using this system, storage costs can be reduced in addition to electrical costs as less server nodes are required to operate as storage space. In addition, the users receive better service as a higher resolution image alternative may be recommended to the one they wish to share.</p>
				</div>
			  </section>
				
		      <!-- services area -->
		      <h1>Related Documents (Note: LaTex files may be provided upon special request)</h1>
		      <section id="services" class="clear">
		        <article>
		          <figure><img src="images/document.gif" width="32" height="32" alt=""></figure>
		          <strong>Formal Statement</strong>
		          <p>This document outlines a first look into the future research, describes example usage, and motivating factors behind it.</p>
		          <p class="more"><a href="deliverables/licastb_formal-statement.pdf">View Formal Statement &raquo;</a></p>
		        </article>
		        <article>
		          <figure><img src="images/document.gif" width="32" height="32" alt=""></figure>
		          <strong>Proposal Documents</strong>
		          <p>The thesis proposal roughly outlines an introduction to the area of thesis research, related works, method of approach for the research and accompanying programs, and the overall evaluation strategy. The defense document is the supplementary presentation used to argue the feasability and validity of the proposed area of research.</p>
		          <p class="more"><a href="deliverables/licastb_thesis-proposal.pdf">View Thesis Proposal &raquo;</a></p>
		          <p class="more"><a href="deliverables/licastb_thesis-proposal-defense.pdf">View Proposal Defense &raquo;</a></p>
		        </article>
		        <article class="last">
		          <figure><img src="images/document.gif" width="32" height="32" alt=""></figure>
		          <strong>Thesis Documents</strong>
		          <p>This is the deliverable research document being created as a part of the senior thesis research program. Please note this will be a continuous effort over the coming months and will change drastically as time progresses. The thesis defense presentation and accompanying poster will be included at a later time.</p>
		          <p class="more"><a href="deliverables/licastb_thesis.pdf">View Thesis Paper &raquo;</a></p>
		        </article>
		      </section>
		      <!-- / services area -->
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
