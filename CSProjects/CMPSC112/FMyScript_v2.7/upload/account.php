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

if ($_SESSION[USERID] != "" && $_SESSION[USERID] >= 0 && is_numeric($_SESSION[USERID]))
{	
	$query1 = "SELECT count(*) as total from posts where active='1' order by last_viewed desc limit 5";
	$query2 = "SELECT * from posts A, categories B where A.active='1' AND A.category=B.CATID order by last_viewed desc limit 5";
	$executequery1 = $conn->Execute($query1);
	$totalvideos = $executequery1->fields['total'];
	if ($totalvideos > 0)
	{	
		$executequery2 = $conn->Execute($query2);
		$posts = $executequery2->getrows();
	}
	$templateselect = "account.tpl";
}
else
{
	header("Location:$config[baseurl]/login.php");exit;
}

$pagetitle = $lang[39];
STemplate::assign('pagetitle',$pagetitle);

//TEMPLATES BEGIN
STemplate::assign('posts',$posts);
STemplate::assign('error',$error);
STemplate::display('header.tpl');
STemplate::display($templateselect);
STemplate::display('footer.tpl');
//TEMPLATES END
?>