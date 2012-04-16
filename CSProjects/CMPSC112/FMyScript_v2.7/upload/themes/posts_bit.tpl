		<div class="post">
        	<p>
            	<a href="{$baseurl}/view/{$posts[i].name|stripslashes}/{$posts[i].PID}" class="oldlink">{$posts[i].story|stripslashes|nl2br}</a>
            </p>
            <div class="date">
            	<div class="left_part">
                	<a href="{$baseurl}/view/{$posts[i].name|stripslashes}/{$posts[i].PID}" id="article_{$posts[i].PID}" name="{$baseurl}/viewcomments.php?id={$posts[i].PID}&width=500" class="jTip">#{$posts[i].PID}</a>
                    <br /><a href="{$baseurl}/view/{$posts[i].name|stripslashes}/{$posts[i].PID}"><img src="{$imageurl}/comments.png" /></a> {insert name=com_count value=var assign=cc PID=$posts[i].PID}{$cc} {$lang140}
                </div>
                <div class="right_part">
                	<p>
                    	{include file="rate.tpl"}
                    </p>
                    <p style="margin-top:2px;">
                    	{$posts[i].time_added|date_format} {$posts[i].time_added|date_format:"%I:%M %p"} - <a class="liencat" href="{$baseurl}/category/{$posts[i].CATID}/{$posts[i].name|stripslashes}">{$posts[i].name|stripslashes}</a> - {$lang63} {if $posts[i].USERID GT "0"}<a href="{$baseurl}/members/{$posts[i].USERID}/{$posts[i].username|stripslashes}">{$posts[i].username|stripslashes}</a>{else}{$posts[i].username|stripslashes}{/if}&nbsp;({if $posts[i].gender eq "0"}<a href="{$baseurl}/woman" style="color:#999999">{$lang234}</a>{else}<a href="{$baseurl}/man" style="color:#999999">{$lang235}</a>{/if})
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
            	<a href="javascript:;" onclick="plusToggle('{$posts[i].PID}');"><img src="{$imageurl}/plus_mini.gif"></a>
            </div>
            <div class="clear"></div>
            
            <div>
            <p style="float:left; margin-top:3px;">       
				<a href="http://twitter.com/share" class="twitter-share-button" data-url="{$baseurl}/view/{$posts[i].name|stripslashes}/{$posts[i].PID}" data-via="{$twitter}" data-text="{insert name=strip_special2 value=a assign=cstory2 text=$posts[i].story}{$cstory2}" data-count="horizontal">Tweet</a><script type="text/javascript" src="http://platform.twitter.com/widgets.js"></script>
            </p>
            <p style="float:left; margin-top:1px;">
                <a name="fb_share" share_url="{$baseurl}/view/{$posts[i].name|stripslashes}/{$posts[i].PID}"></a>
  				<script src="http://www.facebook.com/connect.php/js/FB.SharePro/" type="text/javascript"></script>
				&nbsp;
				<div style="padding-top:3px;">
                <iframe src="http://www.facebook.com/plugins/like.php?href={$baseurl}/view/{$posts[i].name|stripslashes}/{$posts[i].PID}&amp;layout=button_count&amp;show_faces=false&amp;width=450&amp;action=like&amp;colorscheme=light&amp;height=35" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:200px; height:35px;" allowTransparency="true"></iframe>
                </div>
            </p>
            </div>
            <div class="clear"></div>
            
            <div id="plus{$posts[i].PID}" class="plus">
            	{insert name=get_fav_status value=var assign=fc PID=$posts[i].PID}
            	{if $smarty.session.USERID eq ""}
            	<div class="plus_bouton" onclick="document.location='{$baseurl}/signup';" id="subscribe">
                	<div class="icone"><img src="{$imageurl}/subscribe.png"/></div>
                    <div class="label">{$lang194}</div>
                </div>
                {else}
                <div class="plus_bouton" onclick="AddToFav('{if $fc eq "0"}add{else}delete{/if}','{$posts[i].PID}');" id="favori">
                	<div class="icone"><img src="{$imageurl}/star.gif"/></div>
                    <div class="label">{if $fc eq "0"}{$lang136}{else}{$lang137}{/if}</div>
                </div>
                {/if}
                <div class="plus_bouton">
                	<div class="label" style="padding-left: 0;">
                    	{literal}
						<script language="javascript" type="text/javascript">
                        SHARETHIS.addEntry({
                            title:'{/literal}#{$posts[i].PID}{literal}',
							summary:'<a href=\"{/literal}{$baseurl}/view/{$posts[i].name}/{$posts[i].PID}{literal}\" class=\"oldlink\">{/literal}{insert name=strip_special value=a assign=cstory text=$posts[i].story}{$cstory}{literal}</a>',
							content:'{/literal}{$imageurl}{literal}/logo400.jpg',
							url:'{/literal}{$baseurl}/view/{$posts[i].name}/{$posts[i].PID}{literal}'
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