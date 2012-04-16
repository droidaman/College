	<div id="wrapper">
    	<!-- LOOP -->
        
		<div class="post">
        	<div style="float:left">
                <p>{$lang169} : <b>{$stotal}</b></p>
            </div>
            <div style="float:right;"> <a href="{$baseurl}/advanced_search">{$lang170}</a></div>
            <div class="clear"></div>
        </div>
        
        <div class="post">
            <div class="liste">
                <div class="lignetop">
                    <p class="itemtop search_photo">{$lang176}</p>
                    <p class="itemtop search_login">{$lang16}</p>
                    <p class="itemtop search_ville">{$lang102}</p>
                    <p class="itemtop search_pays">{$lang103}</p>
                    <p class="itemtop search_civilite">{$lang25}</p>
                </div>
            	<div class="clear"></div>
        
                {section name=i loop=$posts}
                {insert name=get_member_profilepicture assign=profilepicture value=var USERID=$posts[i].USERID}
                <div class="ligne" style="height:auto">
                    <p class="item search_photo"><a href="{$baseurl}/members/{$posts[i].USERID}/{$posts[i].username|stripslashes}"><img src="{$membersprofilepicurl}/thumbs/{$profilepicture}" width="65px" style="border:1px solid #000;" title="{$posts[i].username|stripslashes}"></a></p>			
                    <p class="item search_login" style="padding-top:23px;"><a href="{$baseurl}/members/{$posts[i].USERID}/{$posts[i].username|stripslashes}">{$posts[i].username|stripslashes}</a></p>
                    <p class="item search_ville" style="padding-top:23px;"><a href="{$baseurl}/search.php?type=member&city={$posts[i].city}">{$posts[i].city}</a></p>
                    <p class="item search_pays" style="padding-top:23px;"><a href="{$baseurl}/search.php?type=member&country={$posts[i].country}">{$posts[i].country}</a></p>
                    <p class="item search_civilite" style="padding-top:23px;">{if $posts[i].gender eq "1"}{$lang26}{elseif $posts[i].gender eq "0"}{$lang27}{/if}</p>
                </div>
                <div class="clear"></div>
                {/section}
            </div>
        </div>
        <!-- END LOOP -->
            
        <div class="pagination">
            <p class="left">[ {$lang68} : {$pagelinks} ]</p>
            <p class="right">&laquo; {if $tpp ne ""}<a href="{$baseurl}/search.php?type={$smarty.request.type}&username=$smarty.request.username}&gender=$smarty.request.gender}&city=$smarty.request.city}&country=$smarty.request.country}&page={$tpp}" >{$lang69}</a>{else}<span style="color: #AAA;">{$lang69}</span>{/if} | {if $tnp ne ""}<a href="{$baseurl}/search.php?type={$smarty.request.type}&username={$smarty.request.username}&gender=$smarty.request.gender}&city=$smarty.request.city}&country=$smarty.request.country}&page={$tnp}" >{$lang70}</a>{else}<span style="color: #AAA;">{$lang70}</span>{/if} &raquo;</p>
        </div>
	</div>  

    {include file="right.tpl"}