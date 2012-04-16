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

$CID = intval($_REQUEST['ref_id']);
$type = $_REQUEST['type'];

if($CID > 0 && is_numeric($type) && $type >=0)
{
	$cname = "com".$CID;
	if(!isset($_COOKIE[$cname]))
	{
		if($type == "1")
		{
			$query="UPDATE posts_comments SET vote=vote+1 WHERE CID='".mysql_real_escape_string($CID)."'";
			$result=$conn->execute($query);
			$expire=time()+60*60*24;
			setcookie($cname, "1", $expire);
		}
		elseif($type == "0")
		{
			$query="UPDATE posts_comments SET vote=vote-1 WHERE CID='".mysql_real_escape_string($CID)."'";
			$result=$conn->execute($query);
			$expire=time()+60*60*24;
			setcookie($cname, "0", $expire);
		}
	}
}
?>