<?php
/**************************************************************************************************
| F My Script
| http://www.fmyscript.com
| webmaster@fmyscript.com
|
|**************************************************************************************************
|
| By using this software you agree that you have read and acknowledged our End-User License 
| Agreement available at http://www.fmyscript.com/eula.html and to be bound by it.
|
| Copyright (c) 2010 fmyscript.com. All rights reserved.
|**************************************************************************************************/

include("include/config.php");
include("include/functions/import.php");

$id = intval($_REQUEST['id']);
$type = $_REQUEST['type'];

if($id > 0)
{
	if($type == "article")
	{
		$query="INSERT INTO posts_reports SET PID='".mysql_real_escape_string($id)."', time='".time()."', date='".date("Y-m-d")."'";
		$result=$conn->execute($query);
	}
	elseif($type == "comment")
	{
		$query="INSERT INTO posts_comments_reports SET CID='".mysql_real_escape_string($id)."', time='".time()."', date='".date("Y-m-d")."'";
		$result=$conn->execute($query);
	}
}
?>