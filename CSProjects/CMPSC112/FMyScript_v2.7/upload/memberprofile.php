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

// Verify valid member
if (is_numeric($_REQUEST[pid]))
{
	$pid = $_REQUEST[pid];
	STemplate::assign('pid',$pid);
}
else
{
	$error = "$lang[154]";
}

if ($error == "")
{
	if (does_profile_exist($pid))
	{
		$query = "SELECT * FROM members WHERE USERID='".mysql_real_escape_string($pid)."'";
       	$executequery = $conn->execute($query);
       	$profilearray = $executequery->getarray();
		STemplate::assign('profilearray',$profilearray);
		if(mysql_affected_rows()>=1)
		{
			$USERID = $profilearray[0][USERID];
			STemplate::assign('USERID',$USERID);
			STemplate::assign('pagetitle',$profilearray[0][username]."'s $lang[157]");
			update_viewcount_profile($USERID);
			
			if (session_verification())
			{
				update_pviewed($_SESSION[USERID],$USERID);
			}
			
			$query1 = "SELECT count(*) as total from posts A, posts_favorited B where A.active='1' AND B.USERID='$USERID' AND A.PID=B.PID order by last_viewed desc";
			$query2 = "SELECT * from posts A, categories B, posts_favorited C where A.active='1' AND A.category=B.CATID AND C.USERID='$USERID' AND A.PID=C.PID order by last_viewed desc";
			$executequery1 = $conn->Execute($query1);
			$total = $executequery1->fields['total'];
			if ($total > 0)
			{	
				$executequery2 = $conn->Execute($query2);
				$posts = $executequery2->getrows();
			}
			
			$query3 = "SELECT A.USERID,A.username,B.ID from members A, members_visits B where B.PID='".mysql_real_escape_string($USERID)."' AND A.USERID=B.VID order by B.time desc limit 14";
			if(mysql_affected_rows()>=1)
			{	
				$executequery3 = $conn->Execute($query3);
				$recent = $executequery3->getrows();
			}
	
			$showtheme = "memberprofile.tpl";
		}
		else
		{
			$error = "$lang[156]";
		}
	}	
	else
	{
		$error = "$lang[155]";
	}
}


//TEMPLATES BEGIN
STemplate::assign('total',$total);
STemplate::assign('posts',$posts);
STemplate::assign('recent',$recent);
STemplate::assign('error',$error);
STemplate::assign('message',$message);

STemplate::display('header.tpl');
if ($error == "")
{
	STemplate::display($showtheme);
}
else
{
	STemplate::display('empty.tpl');
}
STemplate::display('footer.tpl');
//TEMPLATES END
?>