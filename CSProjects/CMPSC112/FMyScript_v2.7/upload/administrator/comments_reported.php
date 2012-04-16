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
include_once("../include/functions/import.php");
verify_login_admin();
$adminurl = $config['adminurl'];

// DELETE 
if($_REQUEST[delete]=="1")
{
	$DCID = intval($_REQUEST['CID']);
	if($DCID > 0)
	{
		$deletecomment = $DCID;
		
		$deletefrom[] = "posts_comments";

		for($j=0;$j < count($deletefrom);$j++)
		{
			$query = "DELETE FROM ".$deletefrom[$j]." WHERE CID='$deletecomment'";
			$conn->Execute($query);
		}
	}	
	$message = "Comment Successfully Deleted.";
	Stemplate::assign('message',$message);
}
// DELETE 

//DELETE REPORT
if($_POST['rsub']=="1")
{
	$RRID = $_POST['RRID'];
	$sql="DELETE FROM posts_comments_reports WHERE RID='".mysql_real_escape_string($RRID)."'";
	$conn->Execute($sql);
}
//DELETE REPORT

if($_REQUEST['sortby']=="PID")
{
	$sortby = "PID";
	$sort =" order by B.PID";
	$add1 = "&sortby=PID";
}
elseif($_REQUEST['sortby']=="story")
{
	$sortby = "story";
	$sort =" order by B.story";
	$add1 = "&sortby=story";
}
elseif($_REQUEST['sortby']=="username")
{
	$sortby = "username";
	$sort =" order by C.username";
	$add1 = "&sortby=username";
}
elseif($_REQUEST['sortby']=="details")
{
	$sortby = "details";
	$sort =" order by A.details";
	$add1 = "&sortby=details";
}
elseif($_REQUEST['sortby']=="time_added")
{
	$sortby = "time_added";
	$sort =" order by A.time_added";
	$add1 = "&sortby=time_added";
}
else
{
	$sortby = "CID";
	$sort =" order by A.CID";
	$add1 = "&sortby=CID";
}

if($_REQUEST['sorthow']=="desc")
{
	$sorthow ="desc";
	$add1 .= "&sorthow=desc";
}
else
{
	$sorthow ="asc";
	$add1 .= "&sorthow=asc";
}

//Search
$fromid = intval($_REQUEST['fromid']);
$toid = intval($_REQUEST['toid']);
$pid = intval($_REQUEST['pid']);
$story = $_REQUEST['story'];
$username = $_REQUEST['username'];
$details = $_REQUEST['details'];
$add1 .= "&fromid=$fromid&toid=$toid&pid=$pid&story=$story&username=$username&details=$details";
if($_POST['submitform'] == "1" || ($_REQUEST['fromid']!="" || $toid>0 || $pid>0 || $story!="" || $details!="" || $username!=""))
{
	if($fromid > 0)
	{
		$addtosql = "AND A.CID>='".mysql_real_escape_string($fromid)."'";
		Stemplate::assign('fromid',$fromid);
	}
	else
	{
		$addtosql = "AND A.CID>'".mysql_real_escape_string($fromid)."'";
	}
	if($toid > 0)
	{
		$addtosql .= "AND A.CID<='".mysql_real_escape_string($toid)."'";
		Stemplate::assign('toid',$toid);
	}
	if($pid > 0)
	{
		$addtosql .= "AND B.PID='".mysql_real_escape_string($pid)."'";
		Stemplate::assign('pid',$pid);
	}
	if($story != "")
	{
		$addtosql .= "AND B.story like'%".mysql_real_escape_string($story)."%'";
		Stemplate::assign('story',$story);
	}
	if($details != "")
	{
		$addtosql .= "AND A.details like'%".mysql_real_escape_string($details)."%'";
		Stemplate::assign('details',$details);
	}
	if($username != "")
	{
		$addtosql .= "AND C.username like'%".mysql_real_escape_string($username)."%'";
		Stemplate::assign('username',$username);
	}
	Stemplate::assign('search',"1");
}
//Search End

$page = intval($_REQUEST['page']);
if($page=="")
{
	$page = "1";
}
$currentpage = $page;

if ($page >=2)
{
	$pagingstart = ($page-1)*$config['items_per_page'];
}
else
{
	$pagingstart = "0";
}

$queryselected = "select A.CID,B.PID,C.username,D.RID from posts_comments A,posts B, members C, posts_comments_reports D WHERE A.PID=B.PID AND A.USERID=C.USERID AND A.CID=D.CID $addtosql $sort $sorthow limit $config[maximum_results]";
$query2 = "select A.*,B.PID,B.story,C.username,D.RID,D.time from posts_comments A,posts B, members C, posts_comments_reports D WHERE A.PID=B.PID AND A.USERID=C.USERID AND A.CID=D.CID $addtosql $sort $sorthow limit $pagingstart, $config[items_per_page]";
$executequeryselected = $conn->Execute($queryselected);
$totalvideos = $executequeryselected->rowcount();	
if ($totalvideos > 0)
{
	if($totalvideos<=$config[maximum_results])
	{
		$total = $totalvideos;
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
	$results = $executequery2->getrows();
	$beginning=$pagingstart+1;
	$ending=$pagingstart+$executequery2->recordcount();
	$pagelinks="";
	$k=1;
	$theprevpage=$currentpage-1;
	$thenextpage=$currentpage+1;
	if ($currentpage > 0)
	{	
		if($currentpage > 1) 
		{
			$pagelinks.="<a href='$adminurl/comments_reported.php?page=1$add1' title='first page'>First</a>&nbsp;";
			$pagelinks.="<a href='$adminurl/comments_reported.php?page=$theprevpage$add1'>Previous</a>&nbsp;";
		};
		$counter=0;
		$lowercount = $currentpage-5;
		if ($lowercount <= 0) $lowercount = 1;
		while ($lowercount < $currentpage)
		{
			$pagelinks.="<a href='$adminurl/comments_reported.php?page=$lowercount$add1'>$lowercount</a>&nbsp;";
			$lowercount++;
			$counter++;
		}
		$pagelinks.=$currentpage."&nbsp;";
		$uppercounter = $currentpage+1;
		while (($uppercounter < $currentpage+10-$counter) && ($uppercounter<=$toppage))
		{
			$pagelinks.="<a href='$adminurl/comments_reported.php?page=$uppercounter$add1'>$uppercounter</a>&nbsp;";
			$uppercounter++;
		}
		if($currentpage < $toppage) 
		{
			$pagelinks.="<a href='$adminurl/comments_reported.php?page=$thenextpage$add1'>Next</a>&nbsp;";
			$pagelinks.="<a href='$adminurl/comments_reported.php?page=$toppage$add1' title='last page'>Last</a>&nbsp;";
		};
	}
}
else
{
	$error = "There are no reported comments yet.";
}

$mainmenu = "9";
$submenu = "1";
Stemplate::assign('mainmenu',$mainmenu);
Stemplate::assign('submenu',$submenu);
Stemplate::assign('sorthow',$sorthow);
Stemplate::assign('sortby',$sortby);
Stemplate::assign('currentpage',$currentpage);
STemplate::display("administrator/global_header.tpl");
STemplate::assign('beginning',$beginning);
STemplate::assign('ending',$ending);
STemplate::assign('pagelinks',$pagelinks);
STemplate::assign('total',$total+0);
STemplate::assign('results',$results);
Stemplate::assign('error',$error);
STemplate::display("administrator/comments_reported.tpl");
STemplate::display("administrator/global_footer.tpl");
?>