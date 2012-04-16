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

function seo_clean_titles_rss($title)
{
	$title = str_replace("quot;", "", $title);
	$title = str_replace ( array ('&Agrave;', '&agrave;', '&Aacute;', '&aacute;', '&yacute;', '&Yacute;', '&Egrave;', '&egrave;', '&Eacute;', '&eacute;', '&Igrave;', '&igrave;', '&Iacute;', '&iacute;', '&Ntilde;', '&ntilde;', '&Ograve;', '&ograve;', '&Oacute;', '&oacute;', '&Ugrave;', '&ugrave;', '&Uacute;', '&uacute;', '&Uuml;', '&uuml;', '&Atilde;', '&sup3;', '&aelig;', '&thorn;', '&aacute;', '&eth;', '&uml;', '&ouml;', '&Ouml;'), array ( 'A', 'a', 'A', 'a', 'y', 'Y', 'E', 'e', 'E', 'e', 'I', 'i', 'I', 'i', 'N', 'n', 'O', 'o', 'O', 'o', 'U', 'u', 'U', 'u', 'U', 'u', 'o', '', 'ae', 'th', 'a', 'd', 'o', 'o', 'O'), $title);
	$title = str_replace("&amp;", "&", $title);
    $title = preg_replace("/&([a-z]+);/", "", $title); 
    $title = str_replace(array(":", "?", "!", "$", "^", "*", ",", ";", "'", '"', "%", "~", "@", "#", "[", "]", "<", ">", "\\", "/", "=", "+"), "", $title);
    $title = str_replace(array("&"), array("und"), $title);
    $title = htmlentities($title,ENT_COMPAT,'utf-8');
    $title = str_replace ( array ('&auml;', '&ouml;', '&uuml;', '&szlig;'), array ( 'ae', 'oe', 'ue', 'ss'), $title);
    $title = preg_replace("/&([a-z]+);/", "", $title); 
	return "$title";
}

function limit_rss($title)
{	
	$title = explode(" ", $title);
	$i = 0;
	foreach($title as $line)
	{
		if($i < 15)
		{
			$title2 .= $line." ";
			$i++;
		}
	}
	
	return "$title2";
}

$getfilter = htmlentities(strip_tags($_REQUEST[filter]));
$filter = escape($getfilter);

$query = "SELECT A.*, B.* from posts A, categories B where A.active='1' AND A.category=B.CATID order by A.PID desc limit 20";
$showtitle = $lang['192'];
$pagelink   = $config['baseurl']."/rss.php"; 

header("Content-Type: text/xml"); 
header("Expires: 0"); 
print "<?xml version=\"1.0\" encoding=\"utf-8\" ?>\n"; 
print "<rss version=\"2.0\" xmlns:atom=\"http://www.w3.org/2005/Atom\">";
print "<channel>\n"; 
print "<atom:link href=\"$pagelink\" rel=\"self\" type=\"application/rss+xml\" />";
print "<title>".$showtitle." - ".$config['site_name']."</title>\n"; 
print "<link>$pagelink</link>\n"; 
print "<description>".$showtitle."</description>\n"; 

$db=mysql_connect ($DBHOST,$DBUSER,$DBPASSWORD) or die ('I cannot connect to the database because: ' . mysql_error());
mysql_select_db ($DBNAME); 
@mysql_query("SET NAMES 'UTF8'");
$result = mysql_query($query) or die ('Query Error: ' . mysql_error()); 
while ($results = mysql_fetch_array($result)) 
{ 
  $link       = $config['baseurl']."/view/".str_replace(" ", "%20", $results['name'])."/".$results['PID'];
  $description = str_replace ("&amp","",htmlspecialchars(stripslashes($results['story']))); 
  $getusername = $results[username];
	print "<item>\n"; 
	print "  <title>".limit_rss(seo_clean_titles_rss($description))."</title>\n";
	print "  <link>".$link."</link>\n";
	print "  <guid>".$link."</guid>\n"; 
	print "  <description>\n"; 
	print "    <![CDATA["; 
	print seo_clean_titles_rss($description)."<br><br>By: $getusername"; 
  	
	print "<br />on ";
	$list=explode('-',$results[date_added]);
	print_r($list[2]);print_r('-');
	print_r($list[1]);print_r('-');
	print_r($list[0]);

	$category = $results[name];
	
	print "<br>Category: $category"; 
	
	print "<br>Yes Votes: $results[vote_yes] | No Votes: $results[vote_no]";
	
	
	print "<br/><br/><br /><hr>"; 
	print "    ]]>\n"; 
	print "  </description>\n"; 
	print "  <author>".$getusername."</author>\n"; 
	print "</item>\n"; 
} 
mysql_close(); 
print "</channel>\n"; 
print "</rss>"; 
?> 