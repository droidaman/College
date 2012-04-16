{literal}
<style>
.boutons {
	width: 495px;
	font-size: 17px;
	margin:15px auto 0 auto;
	height:45px;
}

.boutons #oui {
	width: 154px;
	height: 30px;
	margin-right: 1px;
	background-color: #f6ffeb;
	cursor: pointer;
	float: left;
	text-align: center;
	padding-top: 12px;
	-moz-border-radius-bottomleft: 5px;
	-moz-border-radius-topleft: 5px;
}

.boutons .bordnormaloui{
	border : 1px solid #ddedc4;
}

.boutons .bordhoveroui{
	border : 1px solid #c9e799;
}

.boutons #non {
	width: 154px;
	height: 30px;
	margin-left: 1px;
	background-color: #f8f0f0;
	cursor: pointer;
	float: left;
	text-align: center;
	padding-top: 12px;
	-moz-border-radius-bottomright: 5px;
	-moz-border-radius-topright: 5px;
}

.boutons .bordhovernon{
	border : 1px solid #ffd2d2;
}

.boutons .bordnormalnon{
	border : 1px solid #fae2e2;
}

.boutons #skip {
	width: 154px;
	height: 30px;
	margin-left: 1px;
	background-color: #f8f0f0;
	cursor: pointer;
	float: left;
	text-align: center;
	padding-top: 12px;
	-moz-border-radius-bottomright: 5px;
	-moz-border-radius-topright: 5px;
}

.boutons .bordhoverskip{
	border : 1px solid #C9FFFF;
}

.boutons .bordnormalskip{
	border : 1px solid #D9FFFF;
}
</style>
<script language="javascript" type="text/javascript">
function nonabus(id) {
	$.get('{/literal}{$baseurl}{literal}/moderate_next.php?pid='+id+'&i=2',function(xml) {
			$('.post.vdm .contain').slideUp(function() {
				if ($('billet',xml).length > 0) {
					$('.post.vdm .contain').attr('id',$('id',xml).text());
					$('.post.vdm .contain .billet').html($('billet',xml).text());
					$('.post.vdm .contain .date').html($('date',xml).text());
					$('.post.vdm .contain #abus').html('<a href="javascript:abus(\''+$('id',xml).text()+'\')">{/literal}{$lang141}{literal}</a>');
					$('.post.vdm .contain').slideDown();
				} else {
					$('.post.vdm .contain .billet').css('height','35px');
					$('.post.vdm .contain .billet').css('padding-top','30px');
					$('.post.vdm .contain .billet').css('text-align','center');
					$('.post.vdm .contain .billet').html('{/literal}{$lang187}{literal} <a href="{/literal}{$baseurl}{literal}/moderate">{/literal}{$lang188}{literal}</a>');
					$('.post.vdm .contain .date').html('');
					$('.post.vdm .contain #abus').html('');
					$('.post.vdm .contain').slideDown();
					$('.boutons').fadeOut();
				}
			});
		});
}

function abus(id) {
	$('#abus').css('display','none');
	$.get("{/literal}{$baseurl}{literal}/report.php?type=article&id="+id,function(html) {
		$('#abus').html('{/literal}{$lang142}{literal}');
	});
	$('#abus').fadeIn();
	setTimeout("nonabus("+id+")",1000);
}

$(document).ready(function() {

	$('#menu h1').mouseover(function() {
		$(this).addClass('active');
	});
	$('#menu h1').mouseout(function() {
		if (!$(this).is('.selected')) {
			$(this).removeClass('active');
		}
	});

	$('.boutons #oui').click(function() {	
		var id = $('.post.vdm .contain').attr('id');
		$.get('{/literal}{$baseurl}{literal}/moderate_next.php?pid='+id+'&i=1',function(xml) {
			$('.post.vdm .contain').slideUp(function() {
				if ($('billet',xml).length > 0) {
					$('.post.vdm .contain').attr('id',$('id',xml).text());
					$('.post.vdm .contain .billet').html($('billet',xml).text());
					$('.post.vdm .contain .date').html($('date',xml).text());
					$('.post.vdm .contain #abus').html('<a href="javascript:abus(\''+$('id',xml).text()+'\')">{/literal}{$lang141}{literal}</a>');
					$('.post.vdm .contain').slideDown();
				} else {
					$('.post.vdm .contain .billet').css('height','35px');
					$('.post.vdm .contain .billet').css('padding-top','30px');
					$('.post.vdm .contain .billet').css('text-align','center');
					$('.post.vdm .contain .billet').html('{/literal}{$lang187}{literal} <a href="{/literal}{$baseurl}{literal}/moderate">{/literal}{$lang188}{literal}</a>');
					$('.post.vdm .contain .date').html('');
					$('.post.vdm .contain #abus').html('');
					$('.post.vdm .contain').slideDown();
					$('.boutons').fadeOut();
				}
			});
		});
	
	});
	
	$('.boutons #non').click(function() {	
		var id = $('.post.vdm .contain').attr('id');
		$.get('{/literal}{$baseurl}{literal}/moderate_next.php?pid='+id+'&i=3',function(xml) {
			$('.post.vdm .contain').slideUp(function() {
				if ($('billet',xml).length > 0) {
					$('.post.vdm .contain').attr('id',$('id',xml).text());
					$('.post.vdm .contain .billet').html($('billet',xml).text());
					$('.post.vdm .contain .date').html($('date',xml).text());
					$('.post.vdm .contain #abus').html('<a href="javascript:abus(\''+$('id',xml).text()+'\')">{/literal}{$lang141}{literal}</a>');
					$('.post.vdm .contain').slideDown();
				} else {
					$('.post.vdm .contain .billet').css('height','35px');
					$('.post.vdm .contain .billet').css('padding-top','30px');
					$('.post.vdm .contain .billet').css('text-align','center');
					$('.post.vdm .contain .billet').html('{/literal}{$lang187}{literal} <a href="{/literal}{$baseurl}{literal}/moderate">{/literal}{$lang188}{literal}</a>');
					$('.post.vdm .contain .date').html('');
					$('.post.vdm .contain #abus').html('');
					$('.post.vdm .contain').slideDown();
					$('.boutons').fadeOut();
				}
			});
		});
	
	});
	
	$('.boutons #skip').click(function() {	
		var id = $('.post.vdm .contain').attr('id');
		$.get('{/literal}{$baseurl}{literal}/moderate_next.php?pid='+id+'&i=0',function(xml) {
			$('.post.vdm .contain').slideUp(function() {
				if ($('billet',xml).length > 0) {
					$('.post.vdm .contain').attr('id',$('id',xml).text());
					$('.post.vdm .contain .billet').html($('billet',xml).text());
					$('.post.vdm .contain .date').html($('date',xml).text());
					$('.post.vdm .contain #abus').html('<a href="javascript:abus(\''+$('id',xml).text()+'\')">{/literal}{$lang141}{literal}</a>');
					$('.post.vdm .contain').slideDown();
				} else {
					$('.post.vdm .contain .billet').css('height','35px');
					$('.post.vdm .contain .billet').css('padding-top','30px');
					$('.post.vdm .contain .billet').css('text-align','center');
					$('.post.vdm .contain .billet').html('{/literal}{$lang187}{literal} <a href="{/literal}{$baseurl}{literal}/moderate">{/literal}{$lang188}{literal}</a>');
					$('.post.vdm .contain .date').html('');
					$('.post.vdm .contain #abus').html('');
					$('.post.vdm .contain').slideDown();
					$('.boutons').fadeOut();
				}
			});
		});
	
	});

});
</script>
{/literal}	
	<div id="wrapper">
    	<!-- LOOP -->
        
      	<div class="post">
        	<div style="float:left">
                <p><b>{$lang182}</b> : {$lang183}</p>
            </div>
            <div class="clear"></div>
        </div>
        
        {if $pub_mod eq "0"}
		<div class="post">
        	<div style="float:left">
                <p><b>{$lang184}</b></p>
            </div>
            <div class="clear"></div>
        </div> 
        {elseif $total eq "0"}
        <div class="post">
        	<div style="float:left">
                <p><b>{$lang187} <a href="{$baseurl}/moderate">{$lang188}</a></b></p>
            </div>
            <div class="clear"></div>
        </div>    
        {else}
        {section name=i loop=$posts}
        <div class="post vdm" style="margin-bottom:0px;height:80px;">
        	<div class="contain" id="{$posts[i].PID}">
            	<p class="billet" style="height:65px !important; height:60px">{$posts[i].story|stripslashes}</p>
        		<div class="clear"></div>
                <p class="date" style="float:left">{$posts[i].time_added|date_format} {$posts[i].time_added|date_format:"%I:%M %p"} - {$posts[i].name|stripslashes}</p>
                <p id="abus" style="float:right; font-size:10px;"><a href="javascript:abus('{$posts[i].PID}')">{$lang141}</a></p>
            </div>
            <div class="clear"></div>
        </div>
        
        <div class="boutons">
            <div id="oui" class="bordnormaloui" onMouseOver="javascript:this.className='bordhoveroui';" onMouseOut="javascript:this.className='bordnormaloui';">
            	<p style="float:left; margin:2px 5px 0 50px !important; margin:2px 5px 0 25px;width:16px;"><img src="{$imageurl}/tick.gif"></p>
                <p style="float:left;">{$lang185}</p>
            </div>
            <div id="skip" class="bordnormalskip" onMouseOver="javascript:this.className='bordhoverskip';" onMouseOut="javascript:this.className='bordnormalskip';">
            <p style="float:left; margin:2px 5px 0 40px !important; margin:2px 5px 0 25px;width:16px;">&nbsp;</p>
                <p style="float:left;">{$lang202}</p>
            </div>
            <div id="non" class="bordnormalnon" onMouseOver="javascript:this.className='bordhovernon';" onMouseOut="javascript:this.className='bordnormalnon';">
            	<p style="float:left; margin:2px 5px 0 50px !important; margin:2px 5px 0 25px;width:16px;"><img src="{$imageurl}/cross.gif"></p>
                <p style="float:left;">{$lang186}</p>
            </div>
        </div>
        <div class="clear"></div>
        {/section}
        {/if}
        <!-- END LOOP -->
        
        <br />
        {insert name=get_advertisement AID=3}
        
	</div>  

    {include file="right.tpl"}