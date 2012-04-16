	<div id="wrapper">
      
    	<div class="post">
    		<h3>{$lang118}</h3>
            
            {include file="error.tpl"}
            
            <form id="changeform" name="changeform" action="{$baseurl}/changepass" method="post">
            <div class="form">
                <div class="champ">
                    <label>{$lang131} :</label>
                    <input type="password" name="cpassword" value="" />	
                </div>
                <div class="separ">&nbsp;</div>
                <div class="champ">
                    <label>{$lang132} :</label>
                    <input type="password" name="npassword" value="" />	
                </div>
                <div class="separ">&nbsp;</div>
                <div class="champ">
                    <label>{$lang133} :</label>
                    <input type="password" name="rnpassword" value="" />	
                </div>
                <div class="ok">
                    <input type="submit" value="{$lang51}" />
                </div>
                <input type="hidden" name="change" value="1" />
            </div>
            </form>
            
    	</div>
    
    ﻿</div>
    
    {include file="right.tpl"}