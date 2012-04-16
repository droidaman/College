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
    $query = "SELECT * FROM members WHERE USERID='".mysql_real_escape_string($_SESSION[USERID])."'";
    $executequery = $conn->execute($query);
    $memberarray = $executequery->getarray();
	STemplate::assign('memberarray',$memberarray);
	
	// Split Birthday Begin
	$birthday = explode("-",$memberarray[0][birthday]);
	STemplate::assign('bdays',listdays($birthday[2]));
	STemplate::assign('bmonths',listmonths($birthday[1]));
	STemplate::assign('byears',listyears($birthday[0]));
	// Split Birthday End
	
	STemplate::assign('country',listcountries($memberarray[0][country]));
		
	if($_REQUEST[change]!="")
	{
		$firstname = htmlentities(strip_tags($_REQUEST[firstname]), ENT_COMPAT, "UTF-8");
		$lastname = htmlentities(strip_tags($_REQUEST[lastname]), ENT_COMPAT, "UTF-8");
		$description = htmlentities(strip_tags($_REQUEST[description]), ENT_COMPAT, "UTF-8");
		$city = htmlentities(strip_tags($_REQUEST[city]), ENT_COMPAT, "UTF-8");
		
		$moresql = "";
		if (is_numeric($_REQUEST[gender]))
		{
			if ($_REQUEST[gender] == "0")
			{
				$moresql .= ", gender='0'";
			}
			elseif ($_REQUEST[gender] == "1")
			{
				$moresql .= ", gender='1'";
			}
		}
		
		if (is_numeric($_REQUEST[bday]) && is_numeric($_REQUEST[bmonth]) && is_numeric($_REQUEST[byear]))
		{
			$joinbday = "$_REQUEST[byear]-$_REQUEST[bmonth]-$_REQUEST[bday]";
			$moresql .= ", birthday='".mysql_real_escape_string($joinbday)."'";
		}
		
		if ($_REQUEST[country] != "Choose Country")
		{
			$country = htmlentities(strip_tags($_REQUEST[country]), ENT_COMPAT, "UTF-8");
			$moresql .= ", country='".mysql_real_escape_string($country)."'";
		}
				
		$query="UPDATE members SET firstname='".mysql_real_escape_string($firstname)."', lastname='".mysql_real_escape_string($lastname)."', description='".mysql_real_escape_string($description)."', city='".mysql_real_escape_string($city)."' $moresql WHERE USERID='$_SESSION[USERID]'";
		$conn->execute($query);

		$message = $lang['107'];
		

		$uploadedimage = $_FILES['profilepicimage']['tmp_name'];
		
		if($uploadedimage != "")
		{
			$theimageinfo = getimagesize($uploadedimage);
			
			if ($error == "")
			{
					
				$thepp = $_SESSION[USERID];
			
				if($theimageinfo[2] == 1)
				{
					$thepp .= ".gif";
				}
				elseif($theimageinfo[2] == 2)
				{
					$thepp .= ".jpg";
				}
				elseif($theimageinfo[2] == 3)
				{
					$thepp .= ".png";
				}
				else
				{
					$error = "$lang[134]";
				}
			}
			
			
			if($error == "")
			{
				$myvideoimgnew=$config['membersprofilepicdir']."/".$thepp;
				if(file_exists($myvideoimgnew))
				{
					unlink($myvideoimgnew);
				}
				$myconvertimg = $_FILES['profilepicimage']['tmp_name'];
				
				move_uploaded_file($myconvertimg, $myvideoimgnew);
				
				$origwidth = $theimageinfo[0];
				$origheight = $theimageinfo[1];
				$max_width = "200";
				if ($origwidth > $max_width)
				{
					$new_width = $max_width;
					$ratio = $origheight / $origwidth;
					$new_height = ceil($new_width *$ratio);
				}
				else
				{
					$new_width = $origwidth;
					$new_height = $origheight;
				}
								
				generatethumbs($myvideoimgnew,$myvideoimgnew,$new_width,$new_height);
				
				$max_width_thumbs = "100";
				$max_height_thumbs = "100";
				$tothumbdir = $config['membersprofilepicdir']."/thumbs/".$thepp;
				if(file_exists($tothumbdir))
				{
					unlink($tothumbdir);
				}
				generatethumbs($myvideoimgnew,$tothumbdir,$max_width_thumbs,$max_height_thumbs);
				
				if(file_exists($config['membersprofilepicdir']."/".$thepp))
				{
					$query = "UPDATE members SET profilepicture='$thepp' WHERE USERID='".mysql_real_escape_string($_SESSION[USERID])."'";
					$conn->execute($query);
				}
				else
				{
					$error = "$lang[135]";
				}
			}
		}
	}
	$templateselect = "editaccount.tpl";
}
else
{
	header("Location:$config[baseurl]/login.php");exit;
}

$pagetitle = "$lang[47]";
STemplate::assign('pagetitle',$pagetitle);

//TEMPLATES BEGIN
STemplate::assign('error',$error);
STemplate::assign('message',$message);
STemplate::display('header.tpl');
STemplate::display($templateselect);
STemplate::display('footer.tpl');
//TEMPLATES END
?>