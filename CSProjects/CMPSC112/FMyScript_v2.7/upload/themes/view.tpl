	<div id="wrapper">
    	
        {if $error ne "" OR $message ne ""}
        <div class="post">
        {include file="error.tpl"}
        </div>
        {/if}
        <a name="top"></a>
    	<!-- FMS -->
        {include file="vote_js.tpl"}
                
		<div class="post">
        	<p>
            	{insert name=clickable_link value=var text=$parray[0].story|stripslashes|nl2br}
            </p>
            <div class="date">
            	<div class="left_part">
                	<a href="{$baseurl}/view/{$parray[0].name|stripslashes}/{$parray[0].PID}" id="article_{$parray[0].PID}" name="{$baseurl}/viewcomments.php?id={$parray[0].PID}&width=500" class="jTip">#{$parray[0].PID}</a>
                    <br /><a href="{$baseurl}/view/{$parray[0].name|stripslashes}/{$parray[0].PID}"><img src="{$imageurl}/comments.png" /></a> {insert name=com_count value=var assign=cc PID=$parray[0].PID}{$cc} {$lang140}
                </div>
                <div class="right_part">
                	<p>
                    	{assign var=RID value=$parray[0].PID}
                        {if $smarty.cookies.$RID ne ""}
                        <span id="vote{$parray[0].PID}">
                            {$lang72} ({$parray[0].vote_yes})
                        </span> - 
                        <span id="votebf{$parray[0].PID}">
                            {$lang71} ({$parray[0].vote_no})
                        </span>
                        {else}
                        <span id="vote{$parray[0].PID}">
                            <a href="javascript:;" onclick="VOTEYES('{$parray[0].PID}','{$parray[0].vote_yes}');">{$lang72}</a> ({$parray[0].vote_yes})
                        </span> - 
                        <span id="votebf{$parray[0].PID}">
                            <a href="javascript:;" onclick="VOTENO('{$parray[0].PID}','{$parray[0].vote_no}');" class="bf">{$lang71}</a> ({$parray[0].vote_no})
                        </span>
                        {/if}
                    </p>
                    <p style="margin-top:2px;">
                    	{$parray[0].time_added|date_format} {$parray[0].time_added|date_format:"%I:%M %p"} - <a class="liencat" href="{$baseurl}/category/{$parray[0].CATID}/{$parray[0].name|stripslashes}">{$parray[0].name|stripslashes}</a> - {$lang63} {if $parray[0].USERID GT "0"}<a href="{$baseurl}/members/{$parray[0].USERID}/{$parray[0].username|stripslashes}">{$parray[0].username|stripslashes}</a>{else}{$parray[0].username|stripslashes}{/if}&nbsp;({if $parray[0].gender eq "0"}<a href="{$baseurl}/woman" style="color:#999999">{$lang234}</a>{else}<a href="{$baseurl}/man" style="color:#999999">{$lang235}</a>{/if})
                    </p>
                </div>
            </div>
            {if $smarty.session.USERID ne ""}
            {literal}
            <script language="javascript" type="text/javascript">
            function AddToFav(action,id) {
                $.get("{/literal}{$baseurl}/add_to_fav{literal}.php?action="+action+"&id="+id,function() {
                    if (action == 'add') {
                        $('#plus'+id+' .plus_bouton#favori').attr('OnClick',"AddToFav('delete','"+id+"');");
                        $('#plus'+id+' .plus_bouton#favori .label').html('{/literal}{$lang137}{literal}');
                    } else {
                        $('#plus'+id+' .plus_bouton#favori').attr('OnClick',"AddToFav('add','"+id+"');");
                        $('#plus'+id+' .plus_bouton#favori .label').html('{/literal}{$lang136}{literal}');
                    }
                });
            }
            </script>
            {/literal}
            {/if}
            <div class="more">
            	<a href="javascript:;" onclick="plusToggle('{$parray[0].PID}');"><img src="{$imageurl}/plus_mini.gif"></a>
            </div>
            <div class="clear"></div>
            
            <div>
            <p style="float:left; margin-top:3px;">       
				<a href="http://twitter.com/share" class="twitter-share-button" data-url="{$baseurl}/view/{$parray[0].name|stripslashes}/{$parray[0].PID}" data-via="{$twitter}" data-text="{insert name=strip_special2 value=a assign=cstory2 text=$parray[0].story}{$cstory2}" data-count="horizontal">Tweet</a><script type="text/javascript" src="http://platform.twitter.com/widgets.js"></script>
            </p>
            <p style="float:left; margin-top:1px;">
                <a name="fb_share" share_url="{$baseurl}/view/{$parray[0].name|stripslashes}/{$parray[0].PID}"></a>
  				<script src="http://www.facebook.com/connect.php/js/FB.SharePro/" type="text/javascript"></script>
				&nbsp;
				<div style="padding-top:3px;">
                	<iframe src="http://www.facebook.com/plugins/like.php?href={$baseurl}/view/{$parray[0].name|stripslashes}/{$parray[0].PID}&amp;layout=button_count&amp;show_faces=false&amp;width=450&amp;action=like&amp;colorscheme=light&amp;height=35" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:200px; height:35px;" allowTransparency="true"></iframe>
                </div>
            </p>
            </div>
            <div class="clear"></div>
            
            <div id="plus{$parray[0].PID}" class="plus">
            	{insert name=get_fav_status value=var assign=fc PID=$parray[0].PID}
            	{if $smarty.session.USERID eq ""}
            	<div class="plus_bouton" onclick="document.location='{$baseurl}/signup';" id="subscribe">
                	<div class="icone"><img src="{$imageurl}/subscribe.png"/></div>
                    <div class="label">{$lang194}</div>
                </div>
                {else}
                <div class="plus_bouton" onclick="AddToFav('{if $fc eq "0"}add{else}delete{/if}','{$parray[0].PID}');" id="favori">
                	<div class="icone"><img src="{$imageurl}/star.gif"/></div>
                    <div class="label">{if $fc eq "0"}{$lang136}{else}{$lang137}{/if}</div>
                </div>
                {/if}
                <div class="plus_bouton">
                	<div class="label" style="padding-left: 0;">
                    	{literal}
						<script language="javascript" type="text/javascript">
                        SHARETHIS.addEntry({
                            title:'{/literal}#{$parray[0].PID}{literal}',
							summary:'<a href=\"{/literal}{$baseurl}/view/{$parray[0].name}/{$parray[0].PID}{literal}\" class=\"oldlink\">{/literal}{insert name=strip_special value=a assign=cstory text=$parray[0].story}{$cstory}{literal}</a>',
							content:'{/literal}{$imageurl}{literal}/logo400.jpg',
							url:'{/literal}{$baseurl}/view/{$parray[0].name}/{$parray[0].PID}{literal}'
                        }, {button:true} );
                        </script>
                        {/literal}
                    </div>
                </div>
                <div class="clear"></div>
                <div class="content"></div>
                <div class="clear"></div>
            </div>
			<div class="clear"></div>
		</div>
        <!-- END FMS -->
        
        {insert name=get_advertisement AID=3}
        <div style="padding-bottom:10px;"></div>
        
        <div class="post" style="height: 20px;">
        	<h3 style="float: left;">{$lang140}</h3>
            {if $smarty.session.USERID GT "0"}
            {insert name=get_sub_stat value=a assign=subt PID=$parray[0].PID USERID=$smarty.session.USERID}
            {literal}
       		<script language="javascript" type="text/javascript">
            function toggleSubCom(id) {
                $.get("{/literal}{$baseurl}{literal}/subcom.php?id="+id,function(html) {
                    if (html == '1') {			
                        $('span.subtocom').fadeOut( function() { $('span.subtocom').html('<a href="javascript:toggleSubCom(\''+id+'\');">{/literal}{$lang209}{literal}</a>'); $('span.subtocom').fadeIn(); });
                    } else {
                        $('span.subtocom').fadeOut( function() { $('span.subtocom').html('<a href="javascript:toggleSubCom(\''+id+'\');">{/literal}{$lang210}{literal}</a>'); $('span.subtocom').fadeIn(); });
                    }
                });
            
            }
			</script>
        	{/literal}
            <p class="suivi">{$lang211}: <span class="subtocom"><a href="javascript:;" onclick="toggleSubCom('{$parray[0].PID}');">{if $subt GT "0"}{$lang209}{else}{$lang210}{/if}</a></span></p>
            {/if}
            <p class="suivi">&nbsp;</p>
        </div>
        
        <!-- LOOP -->
        {literal}
        <script language="javascript" type="text/javascript">
        function reportcom(type,id) {
            $('#reportcom'+id).css('display','none');
            $.get("{/literal}{$baseurl}/report{literal}.php?type="+type+"&id="+id,function(html) {
                $('#reportcom'+id).html('{/literal}{$lang142}{literal}');
            });
            $('#reportcom'+id).fadeIn();
        }
		function thumb(id,type) {
			$.post('{/literal}{$baseurl}/{literal}/thumb.php',{'ref_id':id,'type':type},function(html) {
				$('.post#c'+id+' .thumbs').css('display','none').html('<img src="{/literal}{$imageurl}/{literal}/thumb_up_off.png" /> <img src="{/literal}{$imageurl}/{literal}/thumb_down_off.png" />').fadeIn();
			});
		
		}
		function comReply(id) {
			$('form#comment div#infos').html('In reply to #'+id+' (<a href="javascript:;" onclick="comReply_cancel();">Cancel</a>)');
			$('form#comment input[name=in_reply_to]').val(id);
			document.location = '#comment';
			$('form#comment textarea[name=texte]').focus();
		
		}
		function comReply_cancel() {
		
			$('form#comment div#infos').html('');
			$('form#comment input[name=in_reply_to]').val('0');
		}
		</script>
        {/literal}
        {if $cc eq "0"}
        <div class="post">
        	<p>{$lang143}</p>
        </div>
        {else}
        {section name=vc loop=$showcomments}
        {insert name=get_username_from_userid value=var assign=uname USERID=$showcomments[vc].USERID}
        {insert name=get_member_profilepicture assign=profilepicture value=var USERID=$showcomments[vc].USERID}
        
        <div class="post" id="c{$showcomments[vc].CID}">
        	<a name="c_{$showcomments[vc].CID}"></a>
            <div class="right">
            	<div class="thumbs">
                	{if $smarty.session.USERID eq ""}
                	<img src="{$imageurl}/thumb_up_off.png" /> <img src="{$imageurl}/thumb_down_off.png" />
                    {else}
                    	<a href="javascript:;" onclick="thumb('{$showcomments[vc].CID}','1');"><img src="{$imageurl}/thumb_up.png" /></a> <a href="javascript:;" onclick="thumb('{$showcomments[vc].CID}','0');"> <img src="{$imageurl}/thumb_down.png" /></a>
                    {/if}
                </div>
            </div>
            <p class="texte">{insert name=get_stripped_phrase value=a assign=comdetails details=$showcomments[vc].details}{$comdetails|stripslashes}</p>
            <div class="clear"></div>
            <div style="border:1px solid #9dd7f8;" class="avatar_container">
            	<a href="{$baseurl}/members/{$showcomments[vc].USERID}/{$uname|stripslashes}" title="{$uname|stripslashes}"><img src="{$membersprofilepicurl}/thumbs/{$profilepicture}" class="avatar" /></a>
            </div>
            <div class="userinfos">
            	<p>
                	<a href="#c_{$showcomments[vc].CID}">#{$showcomments[vc].CID}</a> - {$showcomments[vc].time_added|date_format} {$showcomments[vc].time_added|date_format:"%I:%M %p"} {$lang63} <b><a class="pseudo" href="{$baseurl}/members/{$showcomments[vc].USERID}/{$uname|stripslashes}">{$uname|stripslashes}</a></b>{if $smarty.session.USERID ne ""} - <a href="javascript:;" onclick="comReply('{$showcomments[vc].CID}');">{$lang208}</a>{/if}
                	<br /><span id="reportcom{$showcomments[vc].CID}"><a href="javascript:reportcom('comment','{$showcomments[vc].CID}');">{$lang141}</a></span>
                </p>
            </div>
            <div class="clear"></div>
        </div>
        
        {insert name=get_replies value=a assign=replies CID=$showcomments[vc].CID PID=$parray[0].PID}
        {section name=i loop=$replies}
        {insert name=get_username_from_userid value=var assign=uname USERID=$replies[i].USERID}
        {insert name=get_member_profilepicture assign=profilepicture value=var USERID=$replies[i].USERID}
        
        <div class="post reply" id="c{$replies[i].CID}">
        	<a name="c_{$replies[i].CID}"></a>
            <div class="right">
            	<div class="thumbs">
                	{if $smarty.session.USERID eq ""}
                	<img src="{$imageurl}/thumb_up_off.png" /> <img src="{$imageurl}/thumb_down_off.png" />
                    {else}
                    	<a href="javascript:;" onclick="thumb('{$replies[i].CID}','1');"><img src="{$imageurl}/thumb_up.png" /></a> <a href="javascript:;" onclick="thumb('{$replies[i].CID}','0');"> <img src="{$imageurl}/thumb_down.png" /></a>
                    {/if}
                </div>
            </div>
            <p class="texte">{insert name=get_stripped_phrase value=a assign=comdetails details=$replies[i].details}{$comdetails|stripslashes}</p>
            <div class="clear"></div>
            <div style="border:1px solid #9dd7f8;" class="avatar_container">
            	<a href="{$baseurl}/members/{$replies[i].USERID}/{$uname|stripslashes}" title="{$uname|stripslashes}"><img src="{$membersprofilepicurl}/thumbs/{$profilepicture}" class="avatar" /></a>
            </div>
            <div class="userinfos">
            	<p>
                	<a href="#c_{$replies[i].CID}">#{$replies[i].CID}</a> - {$replies[i].time_added|date_format} {$replies[i].time_added|date_format:"%I:%M %p"} {$lang63} <b><a class="pseudo" href="{$baseurl}/members/{$replies[i].USERID}/{$uname|stripslashes}">{$uname|stripslashes}</a></b> - <a href="javascript:;" onclick="comReply('{$replies[i].CID}');">{$lang208}</a>
                	<br /><span id="reportcom{$replies[i].CID}"><a href="javascript:reportcom('comment','{$replies[i].CID}');">{$lang141}</a></span>
                </p>
            </div>
            <div class="clear"></div>
        </div>
        
        {/section}
        {/section}
        {/if}
        <!-- LOOP END -->
        
        <div class="post" style="height: 20px;">
        	<h3 style="float: left;">{$lang144}</h3>
            <p class="suivi">&nbsp;</p>
        </div>
        
        <div class="post">
        	<a name="commenter"></a>
            {if $smarty.session.USERID ne ""}
            <p style="float:left;">{$lang147}</p>
            <p style="float:right"><a href="#top">{$lang148}</a></p>
            <div class="clear"></div>
            <form id="comment" action="{$baseurl}/view/{$smarty.request.cat}/{$smarty.request.pid}" method="post" style="margin: 10px auto 10px;">
                <div class="champ" id="pseudo">
                    <strong>{$lang50} :</strong> 
                    {$smarty.session.USERNAME|stripslashes}
                </div>
                <input type="hidden" name="in_reply_to" value="0" />
                <div class="champ" id="infos"></div>
                <textarea name="comment" style="margin-left: 0;"></textarea>
                <div class="ok">
                    <input type="submit" value="{$lang51}" name="comsub"/>
                </div>
            </form>
            <p style="float:right"><a target="_blank" href="{$baseurl}/termsofuse">{$lang149}</a>.</p>
            {else}
            <p>{$lang145}</p>
            <p><a href="{$baseurl}/signup">{$lang146}</a></p>
            {/if}
            <div class="clear"></div>
        </div>
        

	</div>  

    {include file="right.tpl"}