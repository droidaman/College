	<div id="wrapper">
      
    	<div class="post">
    		<h3>{$lang117}</h3>
            
            {include file="error.tpl"}
            
            {if $error eq "" AND $message eq ""}
            <form id="changeform" name="changeform" action="{$baseurl}/changeemail" method="post">
            <div class="form">
                <p>{$lang119}: {$emailverified}{if $ev1 eq "0"} <a href="{$baseurl}/resendconfirmation/{$smarty.session.USERID}">({$lang120})</a>{/if}</p>
                <div class="separ">&nbsp;</div>
                <div class="champ">
                    <label>{$lang121} :</label>
                    <input type="text" name="email" value="{$getemail}" />	
                </div>
                <div class="ok">
                    <input type="submit" value="{$lang51}" />
                </div>
                <input type="hidden" name="change" value="1" />
            </div>
            </form>
    		{/if}
            
    	</div>
    
    ﻿</div>
    
    {include file="right.tpl"}       