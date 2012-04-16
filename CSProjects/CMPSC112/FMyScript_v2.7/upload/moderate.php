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
STemplate::assign('mod',"1");

$query1 = "SELECT count(*) as total from posts A where A.active='0' ".$_SESSION['MDR']." order by rand() limit 1";
$query2 = "SELECT * from posts A, categories B where A.active='0' AND A.category=B.CATID ".$_SESSION['MDR']." order by rand() limit 1";
$executequery1 = $conn->Execute($query1);
$total = $executequery1->fields['total'];
if ($total > 0)
{	
	$executequery2 = $conn->Execute($query2);
	$posts = $executequery2->getrows();
}

$templateselect = "moderate.tpl";

$pagetitle = $lang[6];
STemplate::assign('pagetitle',$pagetitle);

//TEMPLATES BEGIN
STemplate::assign('total',$total);
STemplate::assign('posts',$posts);
STemplate::display('header.tpl');
STemplate::display($templateselect);
STemplate::display('footer.tpl');
//TEMPLATES END
?>