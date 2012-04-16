<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:fb="http://www.facebook.com/2008/fbml"> 
<head>
<title>{if $pagetitle ne ""}{$pagetitle} - {/if}{$site_name}</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="description" content="{if $pagetitle ne ""}{$pagetitle} - {/if}{if $metadescription ne ""}{$metadescription} - {/if}{$site_name}">
<meta name="keywords" content="{if $pagetitle ne ""}{$pagetitle},{/if}{if $metakeywords ne ""}{$metakeywords},{/if}{$site_name}">
<meta name="title" content="{if $pagetitle ne ""}{$pagetitle} - {/if}{$site_name}" />
<meta name="medium" content="blog" />
<script type="text/javascript" src="http://w.sharethis.com/button/sharethis.js#tabs=web%2Cpost%2Cemail&amp;charset=utf-8&amp;style=rotate&amp;publisher=Your-Publisher-Id"></script>
<link rel="stylesheet" media="screen" type="text/css" href="{$cssurl}/style.php" />   
<!--[if IE 7]><link rel="stylesheet" type="text/css"href="{$cssurl}/ie7.css" /><![endif]-->    
<script type="text/javascript" src="{$baseurl}/js/jquery-1.3.1.min.js"></script>
<script type="text/javascript" src="{$baseurl}/js/jquery.form.js"></script>
<script type="text/javascript" src="{$baseurl}/js/functions.js"></script>
<link rel="stylesheet" media="screen" type="text/css" href="{$baseurl}/css/jquery.jtip.php" />
<script type="text/javascript" src="{$baseurl}/js/jquery.jtip.js"></script>
{literal}
<script>function fbs_click(u,t) {if(!u) u=location.href; if(!t) t=document.title;window.open('http://www.facebook.com/sharer.php?u='+encodeURIComponent(u)+'&t='+encodeURIComponent(t),'sharer','toolbar=0,status=0,width=626,height=436');return false;}</script>
<style> html .fb_share_button { display: -moz-inline-block; display:inline-block; padding:1px 20px 0 5px; height:15px; border:1px solid #d8dfea; background:url(http://b.static.ak.fbcdn.net/rsrc.php/zAB5S/hash/4273uaqa.gif) no-repeat top right; } html .fb_share_button:hover { color:#fff; border-color:#295582; background:#3b5998 url(http://b.static.ak.fbcdn.net/rsrc.php/zAB5S/hash/4273uaqa.gif) no-repeat top right; text-decoration:none; } </style>
{/literal}
</head>

<body>

<div id="fb-root"></div>
{if $enable_fc eq "1"}
{literal}
<script src="http://connect.facebook.net/en_US/all.js"></script>
<script>
  FB.init({appId: '{/literal}{$FACEBOOK_APP_ID}{literal}', status: true,
           cookie: true, xfbml: true});
  FB.Event.subscribe('auth.login', function(response) {
    window.location.reload();
  });	  
</script>
{/literal}
{/if}

<div class="drapeaux">
    <div id="drapen" class="flag">
    	<form name="langselecten" id="langselecten" method="post" style="padding:0; margin:0">
        <INPUT type=image value="english" src="{$imageurl}/flag_uk.gif" border="0" name="language">
        <input type="hidden" name="language" id="language" value="english" />
        </form>
    </div>
    <div id="drapes" class="flag">
    	<form name="langselectes" id="langselectes" method="post" style="padding:0; margin:0">
        <INPUT type=image value="spanish" src="{$imageurl}/flag_es.gif" border="0" name="language">
        <input type="hidden" name="language" id="language" value="spanish" />
        </form>
    </div>
    <div id="drapfr" class="flag">
    	<form name="langselectfr" id="langselectfr" method="post" style="padding:0; margin:0">
        <INPUT type=image value="french" src="{$imageurl}/flag_fr.png" border="0" name="language">
        <input type="hidden" name="language" id="language" value="french" />
        </form>
    </div>
</div>

<div id="content">
	<div id="haut">
		<div style="float:left;">
			<div class="maintitle"><a href="{$baseurl}/" title="{$site_name}" alt="{$site_name}"><img src="{$imageurl}/logo.png" /></a></div>
			<div class="title">{$site_slogan}</div>
		</div>
		<div style="float: right; font-size: 9px; margin-right:8px; width: 200px;">
			<div class="recherche_aide"><a href="{$baseurl}/advanced_search">{$lang21}</a></div>
			<form action="{$baseurl}/search.php" method="get">
            	<input type="hidden" name="type" value="article" />
				<input type="text" name="text" id="mot" /> <input type="submit" value="{$lang22}" id="submit_srch" style="background-color:#FFFFFF" />
			</form>
		</div>
		<div class="clear"></div>
		<div class="menu">
			<h1><a href="{$baseurl}/">{$lang1}</a></h1><div class="tiret">-</div>
			<h1><a href="{$baseurl}/top">{$lang2}</a></h1><div class="tiret">-</div>
			<h1><a href="{$baseurl}/flop">{$lang3}</a></h1><div class="tiret">-</div>
			<h1><a href="{$baseurl}/random">{$lang4}</a></h1><div class="tiret">-</div>
			<h1><a href="javascript:submitToggle();" class="submit" style="font-weight: bold;">{$lang5}</a></h1><div class="tiret">-</div>
			<h1><a href="{$baseurl}/moderate" style="font-weight: bold; color: #ba2c2c;">{$lang6}</a></h1>
		</div>
	</div>
	<a name="haut"></a>
    <div class="clear"></div>
    {literal}
	<script type="text/javascript">
		function reloadImage()
		{
			img = document.getElementById('cimg');
			img.src = '{/literal}{$baseurl}{literal}/include/captcha.php?' + Math.random();
		}
		function displayMail() {
			$('#submit .input_mail').html('{/literal}{$lang53} : {if $smarty.session.USERID ne ""}<input type="text" name="email" value="{$smarty.session.EMAIL}" />{else}<input type="text" name="email">{/if}{literal}');
		}
		function cut(input) {
			if (input.value.length >= {/literal}{$climit}{literal}) {
				input.value = input.value.substring(0,{/literal}{$climit}{literal});
			}
			var reste = {/literal}{$climit}{literal} - input.value.length;
			var print =  reste;
			$(".ok #compteur").html(input.value.length+'/{/literal}{$climit}{literal} {/literal}{$lang55}{literal}');
		}
		$(document).ready(function() {
			$("#submitsh").submit(function() {
				$(this).ajaxSubmit({
							beforeSubmit: function(before) {
							$('#loadingsubmitsh').css('display','block');
							$("#resultsubmitsh").html('');
							$("#resultsubmitsh").css('display','none');
							},
							success: function(retour) {
								$('#loadingsubmitsh').css('display','none');
									if(retour == 'error1') {
										$('#resultsubmitsh').html('<p class=\"pasgood\">{/literal}{$lang30}{literal}</p>');
									} else if(retour == 'error2') {
										$('#resultsubmitsh').html('<p class=\"pasgood\">{/literal}{$lang33}{literal}</p>');
									} else if(retour == 'error3') {
										$('#resultsubmitsh').html('<p class=\"pasgood\">{/literal}{$lang31}{literal}</p>');
									}else if(retour == 'error4') {
										$('#resultsubmitsh').html('<p class=\"pasgood\">{/literal}{$lang57}{literal}</p>');
									}else if(retour == 'error5') {
										$('#resultsubmitsh').html('<p class=\"pasgood\">{/literal}{$lang60}{literal}</p>');
									}else if(retour == 'error6') {
										$('#resultsubmitsh').html('<p class=\"pasgood\">{/literal}{$lang191}{literal}</p>');
									}else if(retour == 'error7') {
										$('#resultsubmitsh').html('<p class=\"pasgood\">{/literal}{$lang205}{literal}</p>');
									}else {
										$('#resultsubmitsh').html('<p class=\"good\">{/literal}{$lang58}{literal}<br><a href="javascript:submitToggle();">{/literal}{$lang59}{literal}</a></p>');
										setTimeout("$('#submitsh #update').val('');",5000);
									}	
									reloadImage();
							$('#resultsubmitsh').hide();
							$('#resultsubmitsh').fadeIn(500);
							setTimeout("$('#resultsubmitsh').fadeOut();",5000);							
							}
					}); 
				return false;
			});		
		});
	</script>
    {/literal}
    <div id="ie8"></div>
	<div id="submit" class="post">
        <h2>{$lang7}</h2><br/>
        <ul style="list-style-type: none; margin-bottom: 10px;">
        	<li>- <b>{$lang8} </b>: {$lang9}</li>
            <li style="margin-top:5px;">- {$lang10}</li>
        </ul>
        <form method="post" id="submitsh" class="submitsh" action="{$baseurl}/submit.php">
        <fieldset>
            <div class="input_auteur">
            	{$lang50} : {if $smarty.session.USERID ne ""}{$smarty.session.USERNAME|stripslashes}<input type="hidden" name="uname" value="{$smarty.session.USERNAME|stripslashes}" /><input type="hidden" name="uid" value="{$smarty.session.USERID}" />{else}<input type="text" name="uname" value="">{/if}
            </div>			
            <div class="input_cat">
            	{$lang11} : 
                <select name="cat">
                <option value="">{$lang52}</option>
                {insert name=get_categories assign=cat}
                {section name=i loop=$cat}
                <option value="{$cat[i].CATID}">{$cat[i].name|stripslashes}</option>
                {/section}
            	</select>
            </div>
            <div class="input_sexe">
            	{$lang25}? : 
                <select name="gender">
                <option value="">{$lang52}</option>
                <option value="1" {if $smarty.session.GENDER eq "1"}selected="selected"{/if}>{$lang26}</option>
                <option value="0" {if $smarty.session.GENDER eq "0"}selected="selected"{/if}>{$lang27}</option>
            	</select>
            </div>
            <textarea id="update" name="content" rows="6" onkeyup="cut(this);"></textarea>
            <div id="loadingsubmitsh"><img id="loading" src="{$imageurl}/loader.gif"></div>
            <div id="resultsubmitsh" class="result"></div>			
            <div class="input_mail"><a href="javascript:displayMail();">{$lang54}</a></div>
            <div class="ok">
            	<table><tr><td><img src="{$baseurl}/include/captcha.php" style="border: 0px; margin:0px; padding:0px" id="cimg" /></td><td><input type="text" name="captcha" value=""></td><td><div id="compteur"></div> <input type="submit" name="ok" value="{$lang51}"/></td></tr></table>
            </div>
        </fieldset>
        <input type="hidden" name="substory" value="1" />
        </form>
	</div>
    <div id="ie7"></div>