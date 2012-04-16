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
$thebaseurl = $config['baseurl'];

if (is_numeric($_REQUEST[id]))
{
	$id = intval($_REQUEST[id]);
	$query = "SELECT * FROM posts_comments WHERE PID='$id' ORDER BY CID desc limit 5";
	$executequery = $conn->execute($query);
	$showcomments =  $executequery->getarray();
	STemplate::assign('showcomments',$showcomments);
}
else
{
	$error = $lang['143'];
}

STemplate::assign('error',$error);
STemplate::display('viewcomments.tpl');
//TEMPLATES END
?>