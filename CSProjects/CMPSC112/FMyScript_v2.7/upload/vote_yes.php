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

$PID = intval($_REQUEST['id']);
$votes = intval($_REQUEST['nb']);

if (isset($_COOKIE[$PID]))
{
	echo $votes;
}
else
{
	$votes++;
	if($PID > 0)
	{
		$query="UPDATE posts SET vote_yes=vote_yes+1 WHERE PID='".mysql_real_escape_string($PID)."'";
		$result=$conn->execute($query);
		echo $votes;
	}
}
?>