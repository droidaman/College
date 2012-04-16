	<div id="wrapper">
      
    	<div class="post">
    		<br />
            
            {include file="error.tpl"}
            
            {if $smarty.request.code eq ""}
            <h3>{$lang82}</h3>
            <form id="signup" name="signup" action="{$baseurl}/confirmemail/" method="post"> 
            <div class="form">
                <div class="champ">
                    <input type="text" name="code" value="{$smarty.request.code}" maxlength="16" />	
                </div>
                <div class="ok">
                    <input type="submit" value="{$lang51}" name="submitcode" />
                </div>
            </div>
            </form>
    		{/if}
    	</div>
    
    ﻿</div>
    
    {include file="right.tpl"}