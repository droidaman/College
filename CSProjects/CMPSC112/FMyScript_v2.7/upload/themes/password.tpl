	<div id="wrapper">
      
    	<div class="post">
    		<h3>{$lang87}</h3>
            
            {include file="error.tpl"}
                        
            <form method="post" name="resetpasswordForm" id="resetpasswordForm" action="{$baseurl}/password"> 
            <div class="form">
                <div class="champ">
                	<label>{$lang16}:</label>
                    <input type="text" name="lusername" value="{$smarty.request.lusername}" />	
                </div>
                <div class="champ">
                	<p>{$lang88}</p>
                </div>
                <div class="ok">
                    <input type="submit" value="{$lang51}" name="resetpassword" />
                </div>
            </div>
            </form>

    	</div>
    
    ﻿</div>
    
    {include file="right.tpl"}