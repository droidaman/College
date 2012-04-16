	<div id="wrapper">
    	<div class="post">
    		<h3>{$lang20}</h3>
    		{literal}
			<script type="text/javascript">
				$(document).ready(function() {
					$("#signupform").submit(function() {
						$(this).ajaxSubmit({
								beforeSubmit: function(before) {
								$('#loadingsignup').css('display','block');
								$("#resultsignup").html('');
								$("#resultsignup").css('display','none');
								},
								success: function(retour) {
									$('#loadingsignup').css('display','none');
										if(retour == 'error1') {
											$('#resultsignup').html('<p class=\"pasgood\">{/literal}{$lang29}{literal}</p>');
										} else if(retour == 'error2') {
											$('#resultsignup').html('<p class=\"pasgood\">{/literal}{$lang30}{literal}</p>');
										} else if(retour == 'error3') {
											$('#resultsignup').html('<p class=\"pasgood\">{/literal}{$lang31}{literal}</p>');
										} else if(retour == 'error4') {
											$('#resultsignup').html('<p class=\"pasgood\">{/literal}{$lang32}{literal}</p>');
										} else if(retour == 'error5') {
											$('#resultsignup').html('<p class=\"pasgood\">{/literal}{$lang33}{literal}</p>');
										} else if(retour == 'error6') {
											$('#resultsignup').html('<p class=\"pasgood\">{/literal}{$lang34}{literal}</p>');
										} else if(retour == 'error7') {
											$('#resultsignup').html('<p class=\"pasgood\">{/literal}{$lang35}{literal}</p>');
										} else if(retour == 'error8') {
											$('#resultsignup').html('<p class=\"pasgood\">{/literal}{$lang36}{literal}</p>');
										} else if(retour == 'error9') {
											$('#resultsignup').html('<p class=\"pasgood\">{/literal}{$lang37}{literal}</p>');
										} else if(retour == 'error10') {
											$('#resultsignup').html('<p class=\"pasgood\">{/literal}{$lang191}{literal}</p>');
										} else if(retour == 'ok') {
											$('#resultsignup').html('<p class=\"good\">{/literal}{$lang38}{literal}...</p>');
											setTimeout("document.location.href = '{/literal}{$baseurl}{literal}/account?new=1';",3000)
										}
										$("#resultsignup").hide();
										$('#resultsignup').fadeIn(500);
										setTimeout("$('#resultsignup').fadeOut();",5000);
								}
							}); 
							return false;
					});
				});
            </script>
    		{/literal}
            <form name="signup" id="signupform" action="{$baseurl}/signup_check.php" method="post">
            <div class="form">
                <div class="champ">
                    <label>{$lang16}:</label>
                    <input type="text" name="username" value="" maxlength="25" />	
                </div>
                <div class="separ">&nbsp;</div>
                <div class="champ">
                    <label>{$lang17} :</label>
                    <input type="password" name="password" />	
                </div>
                <div class="champ">
                    <label>{$lang23} :</label>
                    <input type="password" name="confirmpassword" />	
                </div>
                <div class="separ">&nbsp;</div>
                <div class="champ">
                    <label>{$lang24} :</label>
                    <input type="text" name="email" value="" />
                </div>
                <div class="separ">&nbsp;</div>
                <div class="champ">
                    <label>{$lang25} :</label>
                    <select name="gender">
                    <option value="1">{$lang26}</option>
                    <option value="0">{$lang27}</option>
                    </select>
                </div>
                <div class="separ">&nbsp;</div>
                <div class="champ">
                    <label><img src="{$baseurl}/include/captcha2.php" /></label>
                    <input type="text" name="captcha" maxlength="5" />	
                </div>
                <p id="loadingsignup" style="text-align:left;margin:0px 0px 0px 238px; display:none;"><img src="{$imageurl}/loadingAnimation.gif"></p>
                <div class="result" id="resultsignup"></div>
                <div class="ok">
                    <input type="submit" value="{$lang28} !" />
                    {if $enable_fc eq "1"}
                    <br /><br />
                    {literal}
                    <fb:login-button perms="email,user_birthday,user_about_me">{/literal}{$lang233}{literal}</fb:login-button>
                    {/literal}
                    {/if}
                </div>
                <input type="hidden" name="register" value="1" />
            </div>
            </form>
    
    	</div>
    
    ﻿</div>
    
    {include file="right.tpl"}