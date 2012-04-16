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

if (is_numeric($_REQUEST['pid']))
{
	$pid = $_REQUEST['pid'];
	STemplate::assign('pid',$pid);
}
else
{
	$error = $lang['138'];
}

if ($error == "")
{
	if (does_post_exist($pid))
	{
		if($_REQUEST['comsub'] != "")
		{	
			$RID = intval($_POST['in_reply_to']);
			if($RID > 0)
			{
				$query="SELECT RID FROM posts_comments WHERE CID='".mysql_real_escape_string($RID)."'";
				$executequery=$conn->execute($query);
				$RID2 = intval($executequery->fields['RID']);
				if($RID2 > 0)
				{
					$RID = $RID2;	
				}
			}
			$SUID = intval($_SESSION['USERID']);
			if($SUID > 0)
			{
				$comment = htmlentities(strip_tags($_REQUEST[comment]), ENT_COMPAT, "UTF-8");
				if($comment == "")
				{
					$error = $lang['150'];
				}
				else
				{
					$query="INSERT INTO posts_comments SET USERID='".mysql_real_escape_string($SUID)."', PID='".mysql_real_escape_string($pid)."', RID='".mysql_real_escape_string($RID)."', details='".mysql_real_escape_string($comment)."', time_added='".time()."'";
					$result=$conn->execute($query);
					$message = $lang['151'];
					$query="SELECT category FROM posts WHERE PID='".mysql_real_escape_string($pid)."'";
					$executequery=$conn->execute($query);
					$scid = intval($executequery->fields['category']);
					$query = "SELECT A.USERID, B.email FROM subscribe A, members B WHERE A.PID='".mysql_real_escape_string($pid)."' AND A.USERID=B.USERID"; 
					$mailres = $conn->execute($query);
					$mails = $mailres->getrows();
					foreach ($mails as $i)
					{
						$TID = $i[0];
						$TM = $i[1];
						if($TID != "" && $TM != "")
						{
							$sendto = $TM;
							$sendername = $config['site_name'];
							$from = $config['site_email'];
							$subject = $lang['212'];
							$scat = get_cat($scid);
							$slink = $config['baseurl']."/view/".$scat."/".$pid;
							$sendmailbody = $lang['213']."<br>".$slink;
							mailme($sendto,$sendername,$from,$subject,$sendmailbody,$bcc="");
						}
					}
				}
			}
		}
		
		$query = "SELECT * FROM posts A, categories B WHERE A.category=B.CATID AND A.PID='".mysql_real_escape_string($pid)."' AND A.active='1'";
       	$executequery = $conn->execute($query);
       	$parray = $executequery->getarray();
		STemplate::assign('parray',$parray);		
		STemplate::assign('pagetitle',stripslashes($parray[0][story]));
		$USERID = $parray[0][USERID];
		STemplate::assign('USERID',$USERID);
		$PID = $parray[0][PID];
		$category = $parray[0][category];
		STemplate::assign('PID',$PID);
		update_last_viewed($PID);
		update_your_viewed($USERID);
		if (session_verification())
		{
			update_you_viewed($_SESSION[USERID]);
		}
		$query = "SELECT * FROM posts_comments WHERE PID='".mysql_real_escape_string($PID)."' AND RID='0' ORDER BY vote desc";
		$executequery = $conn->execute($query);
		$showcomments =  $executequery->getarray();
		STemplate::assign('showcomments',$showcomments);		
	}	
	else
	{
		$error = $lang['139'];
	}
}


//TEMPLATES BEGIN
STemplate::assign('error',$error);
STemplate::assign('message',$message);
STemplate::display('header.tpl');
STemplate::display('view.tpl');
STemplate::display('footer.tpl');
//TEMPLATES END
?>