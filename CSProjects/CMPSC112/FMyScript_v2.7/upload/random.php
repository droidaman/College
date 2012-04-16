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

$s = stripslashes(strip_tags($_REQUEST['s']));
STemplate::assign('s',$s);
if($s == "t")
{
	$ftime = time() - (24 * 60 * 60);
	$addsql .= " AND time_added>='$ftime'";
	$addsql2 .= " AND A.time_added>='$ftime'";
}
elseif($s == "w")
{
	$ftime = time() - (7 * 24 * 60 * 60);
	$addsql .= " AND time_added>='$ftime'";
	$addsql2 .= " AND A.time_added>='$ftime'";
}
elseif($t == "m")
{
	$ftime = time() - (31 * 24 * 60 * 60);
	$addsql .= " AND time_added>='$ftime'";
	$addsql2 .= " AND A.time_added>='$ftime'";
}
elseif($t == "y")
{
	$ftime = time() - (365 * 24 * 60 * 60);
	$addsql .= " AND time_added>='$ftime'";
	$addsql2 .= " AND A.time_added>='$ftime'";
}

$query1 = "SELECT count(*) as total from posts where active='1' $addsql order by rand() limit $config[rand_stories]";
$query2 = "SELECT * from posts A, categories B where A.active='1' $addsql2 AND A.category=B.CATID order by rand() limit $config[rand_stories]";
$executequery1 = $conn->Execute($query1);
$totalvideos = $executequery1->fields['total'];
if ($totalvideos > 0)
{	
	$executequery2 = $conn->Execute($query2);
	$posts = $executequery2->getrows();
}

$templateselect = "random.tpl";
$pagetitle = $lang['4'];
STemplate::assign('pagetitle',$pagetitle);

//TEMPLATES BEGIN
STemplate::assign('posts',$posts);
STemplate::display('header.tpl');
STemplate::display($templateselect);
STemplate::display('footer.tpl');
//TEMPLATES END
?>