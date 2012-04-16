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

function banned_words_chk($phrase)
{
	global $conn, $config;
	$query = "SELECT word from bans_words";
	$executequery = $conn->Execute($query);
	$bwords = $executequery->getarray();
	$found = 0;
	$words = explode(" ", $phrase);
	foreach($words as $word)
	{
		foreach($bwords as $bword)
		{
			if(strtolower($word) == strtolower($bword[0]))
			{
				$found = 1;
			}
		}
	}
	if($found == "1")
	{
		return true;
	}
	else
	{
		return false;
	}
}

if($_REQUEST[substory]!="")
{
	$username = htmlentities(strip_tags($_REQUEST[uname]), ENT_COMPAT, "UTF-8");
	$username = str_replace("(", "", $username);
	$username = str_replace(")", "", $username);
	$USERID = intval($_REQUEST[uid]);
	$gender = stripslashes($_REQUEST[gender]);
	$cat = stripslashes($_REQUEST[cat]);
	$email = $_REQUEST[email];
	$content = htmlentities(strip_tags($_REQUEST[content]), ENT_COMPAT, "UTF-8");
	$clen = strlen($content);
	$captcha = stripslashes($_REQUEST['captcha']);
	if($_SESSION['USERID'] == "")
	{
		if($username != "")
		{
			if(!verify_email_username($username))
			{
				$error="1";
				echo "error1";
				exit;
			}
		}
	}
	if ($username == "")
	{
		$username = "Anonymous";
	}
	if ($gender == "" || !is_numeric($gender))
	{
		$error="2";
		echo "error2";
	}
	elseif ($cat == "" || !is_numeric($cat))
	{
		$error="4";
		echo "error4";
	}
	elseif($email != "" && !verify_valid_email($email))
	{
		$error = "3";
		echo "error3";
	}
	elseif($clen < 10)
	{
		$error = "5";
		echo "error5";
	}
	elseif($captcha != $_SESSION['imagecode'])
	{
		$error = "6";
		echo "error6";
	}
	elseif(banned_words_chk($content))
	{
		$error = "7";
		echo "error7";
	}
	if ($error == "")
	{
		$approve_stories = $config['approve_stories'];
		if($approve_stories == "1")
		{
			$active = "0";
		}
		else
		{
			$active = "1";
		}
		$query="INSERT INTO posts SET USERID='".mysql_real_escape_string($USERID)."', username='".mysql_real_escape_string($username)."', story='".mysql_real_escape_string($content)."', category='".mysql_real_escape_string($cat)."', gender='".mysql_real_escape_string($gender)."', email='".mysql_real_escape_string($email)."', time_added='".time()."', date_added='".date("Y-m-d")."', active='$active', pip='".$_SERVER['REMOTE_ADDR']."'";
		$result=$conn->execute($query);
		$pid = mysql_insert_id();
		echo "ok";	
		
		if ($active == "1" && $email != "")
		{
			$catname = get_cat($cat);
			$slink = $config['baseurl']."/view/".$catname."/".$pid;
			$sendto = $email;
			$sendername = $config['site_name'];
			$from = $config['site_email'];
			$subject = $lang['73'];
			$sendmailbody= $lang['74']."<br>".$slink."<br><br>".$lang['75']."<br>".$sendername;
			mailme($sendto,$sendername,$from,$subject,$sendmailbody,$bcc="");
		}
	}
}
?>