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

if($page=="")
{
	$page = "1";
}
$currentpage = $page;

if ($page >=2)
{
	$pagingstart = ($page-1)*$config[items_per_page];
}
else
{
	$pagingstart = "0";
}

$type = htmlentities(strip_tags($_REQUEST['type']), ENT_COMPAT, "UTF-8");
$text = htmlentities(strip_tags($_REQUEST['text']), ENT_COMPAT, "UTF-8");
$cat = intval($_REQUEST['cat']);
if($type == "member")
{
	$username = mysql_real_escape_string($_REQUEST['username']);
	$gender = mysql_real_escape_string($_REQUEST['gender']);
	if($gender == "1" || $gender == "0")
	{
		$addsql2 = "AND gender='$gender'";
	}
	$city = mysql_real_escape_string($_REQUEST['city']);
	if($city != "")
	{
		$addsql2 .= "AND city like '%$city%'";
	}
	$country = mysql_real_escape_string($_REQUEST['country']);
	if($country != "")
	{
		$addsql2 .= "AND country like '%$country%'";
	}
}

if($cat > 0)
{
	$addsql = "AND A.category='$cat'";
}

if($text != "")
{
	$sterm[] = $text;
	$sterm[0] = str_replace("'", "''", $sterm[0]);
	$sterm[0] = str_replace("  ", "", $sterm[0]);
	$sterm[0] = str_replace("-", "", $sterm[0]);
	$stermsplit = explode(" ",$sterm[0]);
	$stripapos = str_replace("'", "''", $searchterm);
	$stermstr = "";
	if (count($stermsplit)>=1) 
	{
		for($i=0;$i<count($stermsplit);$i++)
		{
			if ($stermsplit[$i] != "" && $stermsplit[$i] != "-" && $stermsplit[$i] != " ")
			{
				$stermstr.="AND A.story like '%$stermsplit[$i]%' ";
			}
		}
	}
	$stermstr .= " ";
}

if($type == "article")
{
	$query1 = "SELECT count(*) as total from posts A where A.active='1' $stermstr $addsql order by A.PID desc limit $config[maximum_results]";
	$query2 = "SELECT * from posts A, categories B where A.active='1' AND A.category=B.CATID $stermstr $addsql order by USERID desc limit $pagingstart, $config[items_per_page]";
}
elseif($type == "member")
{
	$query1 = "SELECT count(*) as total from members where status='1' AND username like '%$username%' $addsql2 order by USERID desc limit $config[maximum_results]";
	$query2 = "SELECT * from members where status='1' AND username like '%$username%' $addsql2 order by USERID desc limit $pagingstart, $config[items_per_page]";
}
	
$executequery1 = $conn->Execute($query1);

$stotal = $executequery1->fields['total'];
if ($stotal > 0)
{
	if($executequery1->fields['total']<=$config[maximum_results])
	{
		$total = $executequery1->fields['total'];
	}
	else
	{
		$total = $config[maximum_results];
	}
	
	$toppage = ceil($total/$config[items_per_page]);
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
	

	$add = "type=$type";
	if($text != "")
	{
		$add .= "&text=$text";
	}
	if($cat > 0)
	{
		$add .= "&cat=$cat";
	}
	if($username != "")
	{
		$add .= "&username=$username";
	}
	if($gender != "")
	{
		$add .= "&gender=$gender";
	}
	if($city != "")
	{
		$add .= "&city=$city";
	}
	if($country != "")
	{
		$add .= "&country=$country";
	}
	
	if ($currentpage > 0)
	{
		if($currentpage > 1) 
		{
			$pagelinks.="<a href='$thebaseurl/search.php?$add&page=1'>$lang[64]</a>&nbsp;&nbsp;";
			$pagelinks.="...&nbsp;&nbsp;";
			$pagelinks.="<a href='$thebaseurl/search.php?$add&page=$theprevpage'>&laquo; $lang[65]</a>&nbsp;&nbsp;";
			STemplate::assign('tpp',$theprevpage);
		}
		
		$counter=0;
		
		$lowercount = $currentpage-5;
		if ($lowercount <= 0) $lowercount = 1;
		
		while ($lowercount < $currentpage)
		{
			$pagelinks.="<a href='$thebaseurl/search.php?$add&page=$lowercount'>$lowercount</a>&nbsp;&nbsp;";
			$lowercount++;
			$counter++;
		}
		
		$pagelinks.="<strong>$currentpage</strong>&nbsp;&nbsp;";
		
		$uppercounter = $currentpage+1;
		
		while (($uppercounter < $currentpage+10-$counter) && ($uppercounter<=$toppage))
		{
			$pagelinks.="<a href='$thebaseurl/search.php?$add&page=$uppercounter'>$uppercounter</a>&nbsp;&nbsp;";
			$uppercounter++;
		}
		
		if($currentpage < $toppage) 
		{
			$pagelinks.="<a href='$thebaseurl/search.php?$add&page=$thenextpage'>$lang[66] &raquo;</a>&nbsp;&nbsp;";
			STemplate::assign('tnp',$thenextpage);
			$pagelinks.="...&nbsp;&nbsp;";
			$pagelinks.="<a href='$thebaseurl/search.php?$add&page=$toppage'>$lang[67]</a>&nbsp;&nbsp;";
		}
	}
}
if($type == "article")
{
	$templateselect = "search.tpl";
	$pagetitle = "$text $lang[22]";
}
else
{
	$templateselect = "search2.tpl";
	$pagetitle = "$username $city $country $lang[22]";
}
STemplate::assign('pagetitle',$pagetitle);

//TEMPLATES BEGIN
STemplate::assign('type',$type);
STemplate::assign('text',$text);
STemplate::assign('stotal',$stotal);
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