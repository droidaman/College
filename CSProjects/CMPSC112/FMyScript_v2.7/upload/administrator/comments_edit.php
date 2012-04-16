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

$CID = intval($_REQUEST['CID']);

if($_POST['submitform'] == "1")
{
	if($CID > 0)
	{
		$arr = array("details");
		foreach ($arr as $value)
		{
			$sql = "update posts_comments set $value='".mysql_real_escape_string($_POST[$value])."' where CID='".mysql_real_escape_string($CID)."'";
			$conn->execute($sql);
		}

		$message = "Comment Successfully Edited.";
		Stemplate::assign('message',$message);
	}
}

if($CID > 0)
{
	$query = $conn->execute("select * from posts_comments where CID='".mysql_real_escape_string($CID)."' limit 1");
	$comment = $query->getrows();
	Stemplate::assign('comment', $comment[0]);
}

$mainmenu = "9";
$submenu = "1";
Stemplate::assign('mainmenu',$mainmenu);
Stemplate::assign('submenu',$submenu);
STemplate::display("administrator/global_header.tpl");
STemplate::display("administrator/comments_edit.tpl");
STemplate::display("administrator/global_footer.tpl");
?>