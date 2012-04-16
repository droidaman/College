<?php
header('Content-type: text/css');
include("../include/config.php");
$imageurl = $config['imageurl'];
?>
#JT_arrow_left{
	background-image: url(<?php echo $imageurl; ?>/arrow_left.gif);
	background-repeat: no-repeat;
	background-position: left top;
	position: absolute;
	z-index:101;
	left:-12px;
	height:23px;
	width:10px;
	top:0px;
}

#JT_arrow_right{
	background-image: url(<?php echo $imageurl; ?>/arrow_right.gif);
	background-repeat: no-repeat;
	background-position: left top;
	position: absolute;
	z-index:101;
	height:23px;
	width:11px;
	top:-2px;
}

#JT {
	position: absolute;
	z-index:100;
	border: 1px solid #CCCCCC;
	background-color: #fff;
	-moz-border-radius: 8px;
	-webkit-border-radius: 8px;
}

#JT_copy{
	padding:10px 10px 10px 10px;
	color:#333333;
}

.JT_loader{
	background-image: url(<?php echo $imageurl; ?>/loader.gif);
	background-repeat: no-repeat;
	background-position: center center;
	width:100%;
	height:12px;
}

#JT_close_left{
	background-color: #FFFFFF;
	text-align: left;
	padding-left: 8px;
	padding-bottom: 5px;
	padding-top: 2px;
	font-weight:bold;
}

#JT_close_right{
	background-color: #FFFFFF;
	text-align: left;
	padding-left: 8px;
	padding-bottom: 5px;
	padding-top: 2px;
	font-weight:bold;
}

#JT_copy p{
	margin: 0;
}