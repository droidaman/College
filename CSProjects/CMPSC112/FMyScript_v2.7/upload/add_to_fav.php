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
$action = $_REQUEST['action'];
$USERID = intval($_SESSION['USERID']);

if($id > 0 && $USERID > 0)
{
	if($action == "add")
	{
		$query="INSERT INTO posts_favorited SET USERID='".mysql_real_escape_string($USERID)."', PID='".mysql_real_escape_string($id)."'";
		$result=$conn->execute($query);
	}
	elseif($action == "delete")
	{
		$query="DELETE FROM posts_favorited WHERE USERID='".mysql_real_escape_string($USERID)."' AND PID='".mysql_real_escape_string($id)."'";
		$result=$conn->execute($query);
	}
}
?>