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

if ($_REQUEST[code] != "")
{
	if (strlen($_REQUEST[code]) != "15")
	{
		$error = "$lang[89]";
	}
	else
	{
		$code = stripslashes($_REQUEST[code]);
		$query="SELECT * from members_passcode WHERE code='".mysql_real_escape_string($code)."'";
		$result=$conn->execute($query);
		
		if($result->recordcount()>=1)
		{
			$userid = $result->fields['USERID'];
			
			$randompassword = generateCode(8);
			if ($randompassword != "" && $userid != "" && is_numeric($userid) && $userid > 0)
			{
				$newpassword = md5($randompassword);
				$query="UPDATE members SET password='".mysql_real_escape_string($newpassword)."' WHERE USERID='".mysql_real_escape_string($userid)."'";
				$executequery=$conn->execute($query);
				
				if(mysql_affected_rows()>=1)
				{
					$query="SELECT * from members WHERE USERID='".mysql_real_escape_string($userid)."'";
					$executequery=$conn->execute($query);
					$gotusername = $executequery->fields['username'];
					STemplate::assign('gotusername',$gotusername);
					STemplate::assign('randompassword',$randompassword);
                	$sendto = $executequery->fields['email'];;
                	$sendername = $config['site_name'];
					STemplate::assign('sendername',$sendername);
                	$from = $config['site_email'];
					$query = "SELECT * FROM sendmail WHERE EID='sendnewpassword'";
                	$executequery = $conn->execute($query);
                	$subject = $executequery->fields['subject']." ".$sendername;
                	$sendmailtemplate = $executequery->fields['template'];
                	$sendmailbody=STemplate::fetch($sendmailtemplate);
                	mailme($sendto,$sendername,$from,$subject,$sendmailbody,$bcc="");
					
					$message = "$lang[90]";
					
					$query="DELETE FROM members_passcode WHERE code='".mysql_real_escape_string($code)."'";
					$executequery=$conn->execute($query);
				}
				else
				{
					$error = "$lang[91]";
				}
			}
			else
			{
				$error = "$lang[92]";
			}

		}
		else
		{
			$error = "$lang[93]";
		}
	}
}

$pagetitle = "$lang[94]";
STemplate::assign('pagetitle',$pagetitle);
STemplate::assign('message',$message);
STemplate::assign('error',$error);

//TEMPLATES BEGIN
STemplate::display('header.tpl');
STemplate::display('resetpassword.tpl');
STemplate::display('footer.tpl');
//TEMPLATES END
?>