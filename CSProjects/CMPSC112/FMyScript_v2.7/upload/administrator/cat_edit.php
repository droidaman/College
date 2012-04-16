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

include("../include/config.php");
include_once("../include/functions/import.php");
verify_login_admin();

$CATID = intval($_REQUEST[CATID]);
if($CATID > 0)
{
	if($_POST['submitform'] == "1")
	{
		$sql = "update categories set name='".mysql_real_escape_string($_POST[name])."' where CATID='".mysql_real_escape_string($CATID)."'";
		$conn->execute($sql);
		$message = "Category Successfully Edited.";
		Stemplate::assign('message',$message);
	}

	$query = $conn->execute("select * from categories where CATID='".mysql_real_escape_string($CATID)."' limit 1");
	$category = $query->getrows();
	Stemplate::assign('category', $category[0]);
}

$mainmenu = "3";
$submenu = "1";
Stemplate::assign('mainmenu',$mainmenu);
Stemplate::assign('submenu',$submenu);
STemplate::display("administrator/global_header.tpl");
STemplate::display("administrator/cat_edit.tpl");
STemplate::display("administrator/global_footer.tpl");
?>