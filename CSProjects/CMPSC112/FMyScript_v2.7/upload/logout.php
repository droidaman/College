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
destroy_slrememberme($_SESSION[USERNAME]);
$_SESSION[USERID]="";
session_unregister("USERID");
$_SESSION[EMAIL]="";
session_unregister("EMAIL");
$_SESSION[USERNAME]="";
session_unregister("USERNAME");
$_SESSION[VERIFIED]="";
session_unregister("VERIFIED");
$_SESSION[GENDER]="";
session_unregister("GENDER");

if(isset($_SESSION[FB]))
{
	$_SESSION[FB]="";
	session_unregister("FB");
}

header("location: $config[baseurl]/");
?>
