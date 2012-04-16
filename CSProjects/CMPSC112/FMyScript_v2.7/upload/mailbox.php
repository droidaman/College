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
	$sto = htmlentities(strip_tags($_REQUEST['sendto']), ENT_COMPAT, "UTF-8");
	STemplate::assign('sto',$sto);
	$query = "SELECT A.*, B.username from messages_inbox A, members B where A.MSGFROM=B.USERID AND A.MSGTO='".mysql_real_escape_string($_SESSION[USERID])."' order by A.MID desc";
	$executequery = $conn->Execute($query);
	$m = $executequery->getrows();
	STemplate::assign('m',$m);
	$templateselect = "mailbox.tpl";
}
else
{
	$l = $config['baseurl']."/mailbox";
	$r = base64_encode($l);
	header("Location:$config[baseurl]/login.php?redirect=$r");exit;
}

$pagetitle = $lang['214'];
STemplate::assign('pagetitle',$pagetitle);

//TEMPLATES BEGIN
STemplate::assign('error',$error);
STemplate::display('header.tpl');
STemplate::display($templateselect);
STemplate::display('footer.tpl');
//TEMPLATES END
?>