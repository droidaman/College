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
$SID = intval($_SESSION['USERID']);

if ($PID > 0 && $SID > 0)
{
	$query = "select count(*) as total from subscribe WHERE PID='".mysql_real_escape_string($PID)."' AND USERID='".mysql_real_escape_string($SID)."'"; 
	$executequery=$conn->execute($query);
    $total = $executequery->fields['total'];
	
	if($total > 0)
	{
		echo "0";
		$query = "DELETE FROM subscribe WHERE PID='".mysql_real_escape_string($PID)."' AND USERID='".mysql_real_escape_string($SID)."'"; 
		$conn->execute($query);
	}
	else
	{
		echo "1";
		$query = "INSERT INTO subscribe SET PID='".mysql_real_escape_string($PID)."', USERID='".mysql_real_escape_string($SID)."'"; 
		$conn->execute($query);
	}
}
else
{
	echo $PID;
}
?>