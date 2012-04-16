	<div id="wrapper">
    
        <div class="post">
        	<h3>{$lang39}</h3>
        	<p><a href="{$baseurl}/members/{$smarty.session.USERID}/{$smarty.session.USERNAME}">{$lang40}</a> | <a href="{$baseurl}/editaccount">{$lang41}</a> | <a href="{$baseurl}/changeemail">{$lang117}</a> | <a href="{$baseurl}/changepass">{$lang118}</a> | <a href="{$baseurl}/favorites">{$lang48}</a> | <a href="{$baseurl}/mailbox">{$lang214} ({insert name=total_msgs value=a MSGTO=$smarty.session.USERID})</a></p>
        </div>
        
        {if $smarty.request.new eq "1"}
        <div class="post">
            <p><b>{$lang43}</b></p>
            <p>{$lang44}</p>
            <p>{$lang45}</p>
        </div>
        {/if}
        
        <div class="post">
           	<p align="center"><center>{insert name=get_advertisement AID=4}</center></p>
        </div>
        
        <div class="post">
        	<h3>{$lang153}</h3> 
        </div>
        {include file="vote_js.tpl"}
        {section name=i loop=$posts}
		{include file="posts_bit.tpl"}
        {/section}
        
    ﻿</div>
    
    {include file="right.tpl"}