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

if ($_SESSION[USERID] != "" && $_SESSION[USERID] >= 0 && is_numeric($_SESSION[USERID]))
{	
	
	if($_REQUEST['ajaxmsg'] == "1")
	{
		$sendto = htmlentities(strip_tags($_REQUEST['sendto']));
		$sendsub = htmlentities(strip_tags($_REQUEST['sendsub']));
		$sendmsg = htmlentities(strip_tags($_REQUEST['sendmsg']));
		
		if($sendto == "")
		{
			echo "error1";
		}
		elseif(verify_email_username($sendto))
		{
			echo "error4";
		}
		elseif($sendsub == "")
		{
			echo "error2";
		}
		elseif($sendmsg == "")
		{
			echo "error3";
		}
		else
		{
			$query="SELECT USERID FROM members WHERE username='".mysql_real_escape_string($sendto)."'";
			$executequery=$conn->execute($query);
			$to = $executequery->fields['USERID'];
			
			if($to != "")
			{
				$query="INSERT INTO messages_inbox SET MSGTO='".mysql_real_escape_string($to)."',MSGFROM='".mysql_real_escape_string($_SESSION[USERID])."',subject='".mysql_real_escape_string($sendsub)."', message='".mysql_real_escape_string($sendmsg)."', time='".time()."'";
				$conn->execute($query);
				echo "success";
			}
		}
	}
}
else
{
	echo "login";
}

?>