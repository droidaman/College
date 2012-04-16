	<div id="wrapper">
    	<!-- LOOP -->
        {include file="vote_js.tpl"}
        
        <div class="post">
        	<div style="float:left">
                <p><b>{$lang4}</b></p>
            </div>
            <div class="clear"></div>
        </div>
        
        {insert name=get_advertisement AID=3}
        <div style="padding-bottom:10px;"></div>
        
        <div class="post">
            <p style="text-align:center; font-size:12px">
            	<b>{$lang196}:</b> {if $s eq "a" OR $s eq ""}{$lang197}{else}<a href="{$baseurl}/random">{$lang197}</a>{/if} | {if $s eq "t"}{$lang198}{else}<a href="{$baseurl}/random?s=t">{$lang198}</a>{/if} | {if $s eq "w"}{$lang199}{else}<a href="{$baseurl}/random?s=w">{$lang199}</a>{/if} | {if $s eq "m"}{$lang200}{else}<a href="{$baseurl}/random?s=m">{$lang200}</a>{/if} | {if $s eq "y"}{$lang201}{else}<a href="{$baseurl}/random?s=y">{$lang201}</a>{/if}
            </p>
        </div>
        
        {section name=i loop=$posts}
		{include file="posts_bit.tpl"}
        {/section}
        <!-- END LOOP -->
	</div>  

    {include file="right.tpl"}