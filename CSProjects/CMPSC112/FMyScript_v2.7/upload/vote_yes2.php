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

$PID = intval($_REQUEST['id']);

if (!isset($_COOKIE[$PID]))
{	
	if($PID > 0)
	{	
		$expire=time()+60*60*24;
		setcookie($PID, "1", $expire);
	}
}
?>