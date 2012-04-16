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

$redirect = stripslashes($_REQUEST['redirect']);
$r = base64_decode($redirect);
STemplate::assign('r',$r);

if ($_SESSION[USERID] != "" && $redirect != "")
{
	header("Location:$redirect");exit;
}

if($_REQUEST[authenticate]!="")
{
	$username = htmlentities(strip_tags($_REQUEST[lusername]), ENT_COMPAT, "UTF-8");
	$password = htmlentities(strip_tags($_REQUEST[lpassword]), ENT_COMPAT, "UTF-8");
	
	if($username=="")
	{
		$error="$lang[29]";
	}
	elseif($password=="")
	{
		$error="$lang[34]";
	}
	else
	{
		$encryptedpassword = md5($password);
		$query="SELECT status,USERID,email,username,verified,gender from members WHERE username='".mysql_real_escape_string($username)."' and password='".mysql_real_escape_string($encryptedpassword)."'";
		$result=$conn->execute($query);
		
		if($result->recordcount()<1)
		{
			$error="$lang[61]";
		}
		elseif($result->fields['status']=="0")
		{
			$error = "$lang[62]";
		}

		if($error=="")
		{
			$query="update members set lastlogin='".time()."', lip='".$_SERVER['REMOTE_ADDR']."' WHERE username='".mysql_real_escape_string($username)."'";
			$conn->execute($query);
	    	SESSION_REGISTER("USERID");$_SESSION[USERID]=$result->fields['USERID'];
			SESSION_REGISTER("EMAIL");$_SESSION[EMAIL]=$result->fields['email'];
			SESSION_REGISTER("USERNAME");$_SESSION[USERNAME]=$result->fields['username'];
			SESSION_REGISTER("VERIFIED");$_SESSION[VERIFIED]=$result->fields['verified'];
			SESSION_REGISTER("GENDER");$_SESSION[GENDER]=$result->fields['gender'];
			
			if($_REQUEST["remember"]=="yes")
			{
				create_slrememberme();
			}
			
			if($redirect == "")
			{
				header("Location:$config[baseurl]/account");exit;
			}
			else
			{
				header("Location:$redirect");exit;
			}

		}
	}
}

$pagetitle = "$lang[18]";
STemplate::assign('pagetitle',$pagetitle);

STemplate::assign('message',$message);
STemplate::assign('error',$error);

//TEMPLATES BEGIN
STemplate::display('header.tpl');
STemplate::display('login.tpl');
STemplate::display('footer.tpl');
//TEMPLATES END
?>