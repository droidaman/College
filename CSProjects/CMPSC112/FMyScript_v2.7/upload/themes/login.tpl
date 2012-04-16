	<div id="wrapper">
      
    	<div class="post">
    		<h3>{$lang18}</h3>
            
            {include file="error.tpl"}
            
            <form name="login" id="loginform" action="{$baseurl}/login" method="post">
            <div class="form">
                <div class="champ">
                    <label>{$lang16}:</label>
                    <input type="text" name="lusername" value="{$smarty.request.lusername}" maxlength="25" />	
                </div>
                <div class="separ">&nbsp;</div>
                <div class="champ">
                    <label>{$lang17} :</label>
                    <input type="password" name="lpassword" />	
                </div>
                <div class="ok">
                    <input type="submit" value="{$lang51}" />
                </div>
                <input type="hidden" name="redirect" value="{$r}" />
                <input type="hidden" name="authenticate" value="1" />
            </div>
            </form>
    
    	</div>
    
    ﻿</div>
    
    {include file="right.tpl"}