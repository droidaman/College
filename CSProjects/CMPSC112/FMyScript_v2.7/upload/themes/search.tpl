	<div id="wrapper">
    	<!-- LOOP -->
        {include file="vote_js.tpl"}
        
		<div class="post">
        	<div style="float:left">
            	<p><b>{$lang168}</b> : {$text}<br></p>
                <p>{$lang173} : <b>{if $smarty.request.cat GT "0"}{insert name=get_cat value=var CATID=$smarty.request.cat}{else}{$lang174}{/if}</b><br></p>
                <p>{$lang169} : <b>{$stotal}</b></p>
            </div>
            <div style="float:right;"> <a href="{$baseurl}/advanced_search">{$lang170}</a></div>
            <div class="clear"></div>
        </div>
        
        {section name=i loop=$posts}
		{include file="posts_bit.tpl"}
        {/section}
        <!-- END LOOP -->
        
        <div class="pagination">
            <p class="left">[ {$lang68} : {$pagelinks} ]</p>
            <p class="right">&laquo; {if $tpp ne ""}<a href="{$baseurl}/search.php?type={$type}&text=$text}&page={$tpp}" >{$lang69}</a>{else}<span style="color: #AAA;">{$lang69}</span>{/if} | {if $tnp ne ""}<a href="{$baseurl}/search.php?type={$type}&text={$text}&page={$tnp}" >{$lang70}</a>{else}<span style="color: #AAA;">{$lang70}</span>{/if} &raquo;</p>
        </div>
	</div>  

    {include file="right.tpl"}