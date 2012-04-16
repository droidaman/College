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

if($_REQUEST[register]!="")
{
	$username = htmlentities(strip_tags($_REQUEST[username]), ENT_COMPAT, "UTF-8");
	$username = str_replace("(", "", $username);
	$username = str_replace(")", "", $username);
	$password = htmlentities(strip_tags($_REQUEST[password]), ENT_COMPAT, "UTF-8");
	$confirmpassword = htmlentities(strip_tags($_REQUEST[confirmpassword]), ENT_COMPAT, "UTF-8");
	$email = htmlentities(strip_tags($_REQUEST[email]), ENT_COMPAT, "UTF-8");
	$gender = stripslashes($_REQUEST[gender]);
	$captcha = htmlentities(strip_tags($_REQUEST[captcha]), ENT_COMPAT, "UTF-8");
	if ($username == "")
	{
		$error="1";
		echo "error1";
	}
	elseif (!verify_email_username($username))
	{
		$error = "2";
		echo "error2";
	}
	elseif ($password == "")
	{
		$error="6";
		echo "error6";
	}
	elseif ($confirmpassword == "")
	{
		$error="7";
		echo "error7";
	}
	elseif ($password != $confirmpassword)
	{
		$error="8";
		echo "error8";
	}
	elseif ($email == "")
	{
		$error="9";
		echo "error9";
	}
	elseif(!verify_valid_email($email))
	{
		$error = "3";
		echo "error3";
	}
	elseif (!verify_email_unique($email))
	{
		$error = "4";
		echo "error4";
	}
	elseif ($gender == "" || !is_numeric($gender))
	{
		$error="5";
		echo "error5";
	}
	elseif ($captcha != $_SESSION['captcha'])
	{
		$error="10";
		echo "error10";
	}
	
	if ($error == "")
	{
		$md5pass = md5($password);
		$query="INSERT INTO members SET email='".mysql_real_escape_string($email)."',username='".mysql_real_escape_string($username)."',gender='".mysql_real_escape_string($gender)."', password='".mysql_real_escape_string($md5pass)."', addtime='".time()."', lastlogin='".time()."', ip='".$_SERVER['REMOTE_ADDR']."', lip='".$_SERVER['REMOTE_ADDR']."'";
		$result=$conn->execute($query);
		$userid = mysql_insert_id();
		
		if($userid != "" && is_numeric($userid) && $userid > 0)
		{
			$query="SELECT USERID,email,username,verified,gender from members WHERE USERID='".mysql_real_escape_string($userid)."'";
			$result=$conn->execute($query);
			
			$SUSERID = $result->fields['USERID'];
			$SEMAIL = $result->fields['email'];
			$SUSERNAME = $result->fields['username'];
			$SVERIFIED = $result->fields['verified'];
			$SGENDER = $result->fields['gender'];
			SESSION_REGISTER("USERID");
			$_SESSION[USERID]=$SUSERID;
			SESSION_REGISTER("EMAIL");
			$_SESSION[EMAIL]=$SEMAIL;
			SESSION_REGISTER("USERNAME");
			$_SESSION[USERNAME]=$SUSERNAME;
			SESSION_REGISTER("VERIFIED");
			$_SESSION[VERIFIED]=$SVERIFIED;
			SESSION_REGISTER("SGENDER");
			$_SESSION[SGENDER]=$SGENDER;
			
			// Generate Verify Code Begin
			$verifycode = generateCode(5).time();
			$query = "INSERT INTO members_verifycode SET USERID='".mysql_real_escape_string($SUSERID)."', code='$verifycode'";
            $conn->execute($query);
			if(mysql_affected_rows()>=1)
			{
				$proceedtoemail = true;
			}
			else
			{
				$proceedtoemail = false;
			}
			// Generate Verify Code End
			
			// Send Welcome E-Mail Begin
			if ($proceedtoemail)
			{
                STemplate::assign('verifycode',$verifycode);
                $sendto = $SEMAIL;
                $sendername = $config['site_name'];
				STemplate::assign('sendername',$sendername);
                $from = $config['site_email'];
				$query = "SELECT * FROM sendmail WHERE EID='welcomeemail'";
                $executequery = $conn->execute($query);
                $subject = $executequery->fields['subject']." ".$sendername;
                $sendmailtemplate = $executequery->fields['template'];
                $sendmailbody=STemplate::fetch($sendmailtemplate);
                mailme($sendto,$sendername,$from,$subject,$sendmailbody,$bcc="");
			}
			// Send Welcome E-Mail End
			echo "ok";
		}
	}
}
?>