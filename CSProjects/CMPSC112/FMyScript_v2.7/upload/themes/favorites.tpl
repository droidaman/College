	<div id="wrapper">
        
        <div class="post">
           	<p align="center"><center>{insert name=get_advertisement AID=5}</center></p>
        </div>
        
        <div class="post">
        	<h3>{$lang48}</h3> 
        </div>
        {include file="vote_js.tpl"}
        {section name=i loop=$posts}
		{include file="posts_bit.tpl"}
        {/section}
        
    ﻿</div>
    
    {include file="right.tpl"}