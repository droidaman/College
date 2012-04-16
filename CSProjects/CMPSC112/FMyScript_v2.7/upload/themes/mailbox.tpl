	<script type="text/javascript">
	{literal}
	function toggle(obj) {
		var el = document.getElementById(obj);
		if ( el.style.display != 'none' ) {
			$('#' + obj).slideUp();
		}
		else {
			$('#' + obj).slideDown();
		}
	}
	function resetfields()
	{
		$('#sendto').val('');
		$('#sendsub').val('');
		$('#sendmsg').val('');
	}
	function updateread(id) {
		$.post("{/literal}{$baseurl}/updateread.php{literal}",{"id":id},function(html) {
		});
		
		$('#LK' + id).removeClass('newmsg');
		$('#IM' + id).attr('src', '{/literal}{$imageurl}/msg_open{literal}.gif');

	}
	function delmsg(id,uid) {
		$.post("{/literal}{$baseurl}/delmsg.php{literal}",{"id":id,"uid":uid},function(html) {
		});
		
		$('#BX' + id).fadeOut();

	}
	$(document).ready(function() {		
		$('#sendmessage').submit(function() {
			$('#resultmsg').html('');
			$("#loadingsendmessage").css('display','block');
			$.post($(this).attr('action'), $(this).serialize(), function(data) {
																		 
				if(data == 'error1') {
					$('#resultmsg').html('<p class=\"pasgood\">{/literal}{$lang222}{literal}</p>');
			  		$('#resultmsg').show();
			  		$("#loadingsendmessage").css('display','none');
			  		setTimeout("$('#resultmsg').fadeOut();",5000);
				}else if(data == 'error4') {
					$('#resultmsg').html('<p class=\"pasgood\">{/literal}{$lang226}{literal}</p>');
			  		$('#resultmsg').show();
			  		$("#loadingsendmessage").css('display','none');
			  		setTimeout("$('#resultmsg').fadeOut();",5000);
				}else if(data == 'error2') {
					$('#resultmsg').html('<p class=\"pasgood\">{/literal}{$lang223}{literal}</p>');
			  		$('#resultmsg').show();
			  		$("#loadingsendmessage").css('display','none');
			  		setTimeout("$('#resultmsg').fadeOut();",5000);
				}else if(data == 'error3') {
					$('#resultmsg').html('<p class=\"pasgood\">{/literal}{$lang224}{literal}</p>');
			  		$('#resultmsg').show();
			  		$("#loadingsendmessage").css('display','none');
			  		setTimeout("$('#resultmsg').fadeOut();",5000);
				}else if(data == 'success'){
					$('#resultmsg').html('<p class=\"good\">{/literal}{$lang225}{literal}</p>');
			  		$('#resultmsg').show();
			  		$("#loadingsendmessage").css('display','none');
					resetfields();
			  		setTimeout("$('#resultmsg').fadeOut();",5000);
				}
			  
			});
		return false;
		});
	});
	{/literal}
	</script>
    <div id="wrapper">

		<div class="post">
        	<h3>{$lang215}</h3>
        	<p>{$lang216}</p>
        </div>
        
        <div class="post">
           	<p align="center"><center>{insert name=get_advertisement AID=4}</center></p>
        </div>
        
        <div class="post">
            <h3>{$lang217}</h3>
            <a name="smsg"></a>
            <div class="clear"></div>
        
            <form class="form" name="sendmessage" id="sendmessage" action="{$baseurl}/send.php" method="post">
                <div class="champ">
                    <label>{$lang218}:</label>
                    <input type="text" name="sendto" id="sendto" class="adddest" value="{$sto}" />	
                </div>
                <div class="champ">
                    <label>{$lang219}:</label>
                    <input type="text" name="sendsub" id="sendsub"/>	
                </div>
                <div class="champ" style="height:165px">
                    <label>{$lang220}:</label>
                    <textarea name="sendmsg" id="sendmsg"></textarea>
                </div>
                <p id="loadingsendmessage" style="text-align:left;margin:0px 0px 5px 238px; display:none;"><img src="{$imageurl}/loadingAnimation.gif"></p>
                <div class="result" id="resultmsg"></div>
                <div class="ok" style="margin-top:5px;">
                    <input type="submit" name="ok" value="{$lang221}" />
                </div>
                <input type="hidden" name="ajaxmsg" value="1" />
            </form>
        
        </div>
        
        <div class="post" id="inbox">
        <h3>{$lang227}</h3>
            <div class="liste">
                <div class="lignetop">
                    <p class="plus_msg itemtop">&nbsp;</p>
                    <p class="etat_msg itemtop">{$lang228}</p>
                    <p class="date_msg itemtop">{$lang229}</p>
                    <p class="pseudo_msg itemtop">{$lang230}</p>
        
                    <p class="sujet_msg itemtop"></p>
                    <p class="outil_msg itemtop">{$lang231}</p>
                    <div class="clear"></div>
                </div>
                <div class="clear"></div>
                <div id="messages">
					{section name=i loop=$m}
                    <div class="ligne" id="BX{$m[i].MID}">
                        <p class="plus_msg"><a href="#" onclick="toggle('M{$smarty.section.i.iteration}'); {if $m[i].unread eq "1"}updateread('{$m[i].MID}');{/if}"><img src="{$imageurl}/toggle_0.gif" /></a></p>
                        <p class="etat_msg"><img id="IM{$m[i].MID}" src="{$imageurl}/msg_{if $m[i].unread eq "1"}new{else}open{/if}.gif" /></p>
                        <p class="date_msg">{$m[i].time|date_format}</p>
                        <p class="pseudo_msg"><a href="{$baseurl}/members/{$m[i].MSGFROM}/{$m[i].username|stripslashes}">{$m[i].username|stripslashes}</a></p>
                        <p class="sujet_msg"><a id="LK{$m[i].MID}" href="#" onclick="toggle('M{$smarty.section.i.iteration}');  {if $m[i].unread eq "1"}updateread('{$m[i].MID}');{/if}" {if $m[i].unread eq "1"}class="newmsg"{/if}>{$m[i].subject|stripslashes}</a></p>
                        <p class="outil_msg"><a href="#" onclick="delmsg('{$m[i].MID}', '{$smarty.session.USERID}');"><img src="{$imageurl}/delete.gif" /></a></p>
                        <div class="clear"></div> 
                    </div>
                    <div class="clear"></div>
                    <div class="msg" id="M{$smarty.section.i.iteration}" style="display:none">
                        {$m[i].message|stripslashes|nl2br}
                    </div>
                	{/section}
                </div>
                <div class="clear"></div>
            </div>
        </div>
        
    ﻿</div>
    
    {include file="right.tpl"}