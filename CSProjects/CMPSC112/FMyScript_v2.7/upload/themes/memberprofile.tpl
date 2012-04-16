	<div id="wrapper">
    
    	<script type="text/javascript" src="{$baseurl}/js/thickbox-compressed.js"></script>
        {literal}
		<script type="text/javascript">
        $(document).ready(function() {
            infos = Array();
            $('img.avatar').mouseover(function() {
                var id = $(this).parent('a').attr('id');
                var idvisite = $(this).parent('a').attr('class');
                if (infos[""+idvisite+""] == null) {
                $.get("{/literal}{$baseurl}/recent.php?id={literal}"+idvisite,function(xml) {
                    var login = $('login',xml).text();
                    var date = $('date',xml).text();
                    infos[""+idvisite+""] = '<b>'+login+'</b> - '+date;
                    $('.avatar_box p').html(infos[""+idvisite+""]);
                });
                } else {
                    $('.avatar_box p').html(infos[""+idvisite+""]);
                }
            });
            $('img.avatar').mouseout(function() {
                $('.avatar_box p').html('&nbsp;');
            });
        });
        </script>
        {/literal}
        <style type="text/css">
        @import url('{$baseurl}/css/jquery.thickbox.css');
        </style>
    
    
        <div class="post">
            <h3 style="float:left;">{$profilearray[0].username|stripslashes}</h3>
            <p style="float:right"><a href="{$baseurl}/advanced_search#members">{$lang158}</a></p>
            <div class="clear"></div>
        </div>
        
        <div class="post">
	
			<div style="float:left;">
            	{insert name=get_member_profilepicture assign=profilepicture value=var USERID=$profilearray[0].USERID}
				<a href="{$membersprofilepicurl}/{$profilepicture}" title="{$profilearray[0].username|stripslashes}" class="thickbox"><img src="{$membersprofilepicurl}/{$profilepicture}" title = "{$profilearray[0].username|stripslashes}" alt="{$profilearray[0].username|stripslashes} {$membersprofilepicurl}/{$profilepicture}" longdesc = "{$membersprofilepicurl}/{$profilepicture}" style="border:1px solid #000;"></a>
                <br /><a href="{$baseurl}/mailbox?sendto={$profilearray[0].username|stripslashes}">{$lang232}</a>
            </div>
            <div class="informations">
                <h3 style="float:left;">{$lang159}</h3>
                <div class="clear"></div>
                <ul>
                	<li><b>{$lang160}</b> : {$profilearray[0].firstname} {$profilearray[0].lastname}</li>
                    <li><b>{$lang102}/{$lang103}</b> : {if $profilearray[0].city ne ""}<a href="{$baseurl}/search.php?type=member&city={$profilearray[0].city}">{$profilearray[0].city}</a>, {/if}{if $profilearray[0].country ne ""}<a href="{$baseurl}/search.php?type=member&country={$profilearray[0].country}">{$profilearray[0].country}</a>{/if}</li>
                    <li><b>{$lang98}</b> : {if $profilearray[0].birthday ne "0000-00-00"}{$profilearray[0].birthday|date_format}{/if}</li>
                    <li><b>{$lang25}</b> : {if $profilearray[0].gender eq "1"}{$lang26}{elseif $profilearray[0].gender eq "0"}{$lang27}{/if}</li>
                    <li><b>{$lang161}</b> : {$profilearray[0].profileviews}</li>
                    <li><b>{$lang162}</b> : {insert name=get_member_comments_count value=var USERID=$profilearray[0].USERID}</li>
                    <li><b>{$lang163}</b> : {insert name=get_posts_count value=var USERID=$profilearray[0].USERID}</li>	
                </ul>
            </div>

			<div class="clear"></div>
			<h3 style="margin:8px 0 4px 0;">{$lang167}</h3>			
			{section name=i loop=$recent}
            {insert name=get_member_profilepicture assign=mpp value=var USERID=$recent[i].USERID}
			<div style="float:left; border:1px solid #9dd7f8; position: relative;" class="avatar_container_fiche">
                <a href="{$baseurl}/members/{$recent[i].USERID}/{$recent[i].username|stripslashes}" id="{$smarty.section.i.iteration}" class="{$recent[i].ID}"><img src="{$membersprofilepicurl}/{$mpp}" class="avatar" title = "{$recent[i].username|stripslashes}" alt="{$recent[i].username|stripslashes} {$membersprofilepicurl}/{$mpp}" longdesc = "{$membersprofilepicurl}/{$mpp}" /></a>
            </div>
			{/section}
			<div class="clear"></div>

			<div class="avatar_box"><p style="font-size:75%; color:#808080; line-height: 1.3em; margin-top: 2px;">&nbsp;</p></div>
			
            <h3 style="margin:8px 0 0 0; float:left;">{$lang164}</h3>
            <div class="clear"></div>
            <p>{insert name=get_stripped_phrase value=a assign=pdesc details=$profilearray[0].description}{$pdesc}</p>		
        </div>
        
        <center>{insert name=get_advertisement AID=3}</center>
        <div style="padding-bottom:10px;"></div>
	
		<a name="favorite"></a>
        <div class="post">
        	<h3>{$lang165}</h3> 
        </div>
        {if $total eq "0"}
        <div class="post">{$lang166}</div>
        {else}
        {include file="vote_js.tpl"}
        {section name=i loop=$posts}
		{include file="posts_bit.tpl"}
        {/section}
        {/if}
        
    ﻿</div>
    
    {include file="right.tpl"}