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

$id = intval($_REQUEST['id']);
$query = "SELECT A.username,B.time from members A, members_visits B where B.VID=A.USERID AND B.ID='".mysql_real_escape_string($id)."' order by B.time desc limit 1";
header("Content-Type: text/xml"); 
header("Expires: 0"); 
print "<root>"; 
$db=mysql_connect ($DBHOST,$DBUSER,$DBPASSWORD) or die ('I cannot connect to the database because: ' . mysql_error());
mysql_select_db ($DBNAME); 
  
$result = mysql_query($query) or die ('Query Error: ' . mysql_error()); 
while ($results = mysql_fetch_array($result)) 
{   
	print "<date>"; 
 	print date("d/m/Y", $results[time]);
	print " ";
	print date("g:i a", $results[time]);
	print "</date>\n";		
	print "<login>"; 
 	print $results[username]; 
	print "</login>\n"; 
} 
mysql_close(); 
print "</root>"; 
?> 