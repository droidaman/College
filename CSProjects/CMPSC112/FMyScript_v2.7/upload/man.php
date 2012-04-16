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

$page = intval($_REQUEST[page]);

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
elseif($s == "m")
{
	$ftime = firstDayOfMonth2();
	$addsql .= " AND time_added>='$ftime'";
	$addsql2 .= " AND A.time_added>='$ftime'";
}
elseif($s == "y")
{
	$ftime = firstDayOfYear2();
	$addsql .= " AND time_added>='$ftime'";
	$addsql2 .= " AND A.time_added>='$ftime'";
}

$max = $config['items_per_page'];

if($page=="")
{
	$page = "1";
}
$currentpage = $page;

if ($page >=2)
{
	$pagingstart = ($page-1)*$max;
}
else
{
	$pagingstart = "0";
}

$query1 = "SELECT count(*) as total from posts where active='1' AND gender='1' $addsql order by time_added desc limit $config[maximum_results]";
$query2 = "SELECT * from posts A, categories B where A.active='1' AND A.gender='1' $addsql2 AND A.category=B.CATID order by A.time_added desc limit $pagingstart, $max";
	
$executequery1 = $conn->Execute($query1);

$totalvideos = $executequery1->fields['total'];
if ($totalvideos > 0)
{
	if($executequery1->fields['total']<=$config[maximum_results])
	{
		$total = $executequery1->fields['total'];
	}
	else
	{
		$total = $config[maximum_results];
	}
	
	$toppage = ceil($total/$max);
	if($toppage==0)
	{
		$xpage=$toppage+1;
	}
	else
	{
		$xpage = $toppage;
	}
	
	$executequery2 = $conn->Execute($query2);
	$posts = $executequery2->getrows();
	$beginning=$pagingstart+1;
	$ending=$pagingstart+$executequery2->recordcount();
	$pagelinks="";
	$k=1;
	$theprevpage=$currentpage-1;
	$thenextpage=$currentpage+1;
	
	if($s != "")
	{
		$adds = "&s=$s";
	}
	if ($currentpage > 0)
	{
		if($currentpage > 1) 
		{
			$pagelinks.="<a href='$thebaseurl/man?page=1$adds'>$lang[64]</a>&nbsp;&nbsp;";
			$pagelinks.="...&nbsp;&nbsp;";
			$pagelinks.="<a href='$thebaseurl/man?page=$theprevpage$adds'>&laquo; $lang[65]</a>&nbsp;&nbsp;";
			STemplate::assign('tpp',$theprevpage);
		}
		
		$counter=0;
		
		$lowercount = $currentpage-5;
		if ($lowercount <= 0) $lowercount = 1;
		
		while ($lowercount < $currentpage)
		{
			$pagelinks.="<a href='$thebaseurl/man?page=$lowercount$adds'>$lowercount</a>&nbsp;&nbsp;";
			$lowercount++;
			$counter++;
		}
		
		$pagelinks.="<strong>$currentpage</strong>&nbsp;&nbsp;";
		
		$uppercounter = $currentpage+1;
		
		while (($uppercounter < $currentpage+10-$counter) && ($uppercounter<=$toppage))
		{
			$pagelinks.="<a href='$thebaseurl/man?page=$uppercounter$adds'>$uppercounter</a>&nbsp;&nbsp;";
			$uppercounter++;
		}
		
		if($currentpage < $toppage) 
		{
			$pagelinks.="<a href='$thebaseurl/man?page=$thenextpage$adds'>$lang[66] &raquo;</a>&nbsp;&nbsp;";
			STemplate::assign('tnp',$thenextpage);
			$pagelinks.="...&nbsp;&nbsp;";
			$pagelinks.="<a href='$thebaseurl/man?page=$toppage$adds'>$lang[67]</a>&nbsp;&nbsp;";
		}
	}
}

$templateselect = "man.tpl";
$pagetitle = $lang[237];
STemplate::assign('pagetitle',$pagetitle);

//TEMPLATES BEGIN
STemplate::assign('beginning',$beginning);
STemplate::assign('ending',$ending);
STemplate::assign('pagelinks',$pagelinks);
STemplate::assign('total',$total);
STemplate::assign('posts',$posts);
STemplate::display('header.tpl');
STemplate::display($templateselect);
STemplate::display('footer.tpl');
//TEMPLATES END
?>