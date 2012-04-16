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

$pid = intval($_REQUEST['pid']);
$i = intval($_REQUEST['i']);
if($pid > 0 && $i >= 0)
{
	if($i == "1")
	{
		$query="UPDATE posts SET mod_yes=mod_yes+1 WHERE PID='".mysql_real_escape_string($pid)."'";
		$result=$conn->execute($query);
		
		$query2 = "SELECT mod_yes FROM posts WHERE PID='".mysql_real_escape_string($pid)."' AND active='0'";
       	$executequery2 = $conn->execute($query2);
       	$parray2 = $executequery2->getarray();
		$mc = $parray2[0]['mod_yes'];
		
		$myes = $config['myes'];
		
		if($mc >= $myes)
		{
			$query="UPDATE posts SET active='1', time_added='".time()."' WHERE PID='".mysql_real_escape_string($pid)."' AND active='0'";
			$result=$conn->execute($query);
			
			$query = "SELECT * FROM posts A, categories B WHERE A.category=B.CATID AND A.PID='".mysql_real_escape_string($pid)."' AND A.active='1'";
			$executequery = $conn->execute($query);
			$parray = $executequery->getarray();
			$email = $parray[0][email];
			$cat = $parray[0][category];
			
			if ($email != "")
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
	elseif($i == "3")
	{
		$query="UPDATE posts SET mod_no=mod_no+1 WHERE PID='".mysql_real_escape_string($pid)."'";
		$result=$conn->execute($query);
		
		$query2 = "SELECT mod_no FROM posts WHERE PID='".mysql_real_escape_string($pid)."' AND active='0'";
       	$executequery2 = $conn->execute($query2);
       	$parray2 = $executequery2->getarray();
		$mc = $parray2[0]['mod_no'];
		
		$mno = $config['mno'];
		
		if($mc >= $mno)
		{
			$query="DELETE FROM posts WHERE active='0' AND PID='".mysql_real_escape_string($pid)."'";
			$result=$conn->execute($query);
		}
	}
}

if($i != "0")
{
	if($pid != "")
	{
		if(!isset($_SESSION['MDR']))
		{
			SESSION_REGISTER("MDR");
			$_SESSION['MDR'] = " AND A.PID!='$pid'";
		}
		else
		{
			$_SESSION['MDR'] .= " AND A.PID!='$pid'";
		}
	}
}

$query = "SELECT * from posts A, categories B where A.active='0' AND A.category=B.CATID ".$_SESSION['MDR']." order by rand() limit 1";
header("Content-Type: text/xml"); 
header("Expires: 0"); 
print "<root>"; 
$db=mysql_connect ($DBHOST,$DBUSER,$DBPASSWORD) or die ('I cannot connect to the database because: ' . mysql_error());
mysql_select_db ($DBNAME); 
@mysql_query("SET NAMES 'UTF8'");
$result = mysql_query($query) or die ('Query Error: ' . mysql_error()); 
while ($results = mysql_fetch_array($result)) 
{   
	print "<id>"; 
 	print $results[PID]; 
	print "</id>\n"; 
	print "<billet>"; 
 	print stripslashes($results[story]); 
	print "</billet>\n"; 
	print "<date>"; 
 	print date("d/m/Y", $results['time_added']);
	print " ";
	print date("g:i a", $results['time_added']);
	print " - ".$results[name];
	print "</date>\n";		
} 
mysql_close(); 
print "</root>"; 
?> 