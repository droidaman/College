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

$MID = intval($_REQUEST['id']);
if($MID > 0)
{
	$query="UPDATE messages_inbox SET unread='0' WHERE MID='".mysql_real_escape_string($MID)."'";
	$conn->execute($query);
}
?>