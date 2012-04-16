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
$_SESSION['ADMINID'] = "";
$_SESSION['ADMINUSERNAME'] = "";
$_SESSION['ADMINPASSWORD'] = "";
session_unregister("ADMINID");
session_unregister("ADMINUSERNAME");
session_unregister("ADMINPASSWORD");
session_destroy();
header("location: index.php");
?>
