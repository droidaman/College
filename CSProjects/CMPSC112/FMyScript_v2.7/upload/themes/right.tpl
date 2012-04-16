	<div id="droite">
		<div class="box" id="box_categories">
			<div class="titretop">{$lang11}</div>
			<ul>
				<li><a href="{$baseurl}/">{$lang12}</a></li>
                {insert name=get_categories assign=cat}
                {section name=i loop=$cat}
				<li id="{$cat[i].name|stripslashes|lower}" class=""><h3><a href="{$baseurl}/category/{$cat[i].CATID}/{$cat[i].name|stripslashes|lower}">{$cat[i].name|stripslashes}</a></h3></li>
                {/section}
			</ul>
		</div>
        {if $smarty.session.USERID ne ""}
        {literal}
		<script type="text/javascript">
        function loadContent(elementSelector, sourceURL) {
        $(""+elementSelector+"").load(""+sourceURL+"");
        }
        </script>
        {/literal}
        <div id="loadme"></div>
        <div class="box">
            <h4 style="float:left;">{$smarty.session.USERNAME|stripslashes}</h4>
            <p style="float:right;font-size:11px;"><a href="javascript:loadContent('#loadme', '{$baseurl}/log_out');">{$lang49}</a></p>
            <div class="clear"></div>
            <ul>
            	<li><a style="display:inline;" href="{$baseurl}/members/{$smarty.session.USERID}/{$smarty.session.USERNAME}">{$lang46}</a></li>
                <li><a style="display:inline;" href="{$baseurl}/editaccount">{$lang47}</a></li>
                <li><a style="display:inline;" href="{$baseurl}/changeemail">{$lang117}</a></li>
                <li><a style="display:inline;" href="{$baseurl}/changepass">{$lang118}</a></li>
                <li><a href="{$baseurl}/favorites">{$lang48}</a></li>
                <li><a href="{$baseurl}/mailbox">{$lang214} ({insert name=total_msgs value=a MSGTO=$smarty.session.USERID})</a></li>
                <li><a href="{$baseurl}/account">{$lang39}</a></li>		
            </ul>
        </div>
		{else}
		<div class="box">
			<div class="titretop">{$lang15}</div>
            <div class="loginform">
            <form name="login" action="{$baseurl}/login" method="post">
            	{$lang16}
                <input type="text" name="lusername" />
                {$lang17}
                <input type="password" name="lpassword" />
                <input type="checkbox" value="yes" name="remember" style="width:20px; border:0px; vertical-align: baseline">&nbsp;{$lang207}
                <input type="submit" value="{$lang18}" />
                <div class="liens"><a href="{$baseurl}/signup"><b>{$lang20}</b></a> - <a href="{$baseurl}/password">{$lang19}</a></div>
                <input type="hidden" name="authenticate" value="1" />
            </form>
            </div>
            {if $enable_fc eq "1"}
            <br />
            {literal}
            <fb:login-button perms="email,user_birthday,user_about_me">{/literal}{$lang233}{literal}</fb:login-button>
            {/literal}
            {/if}
		</div>
        {/if}
		<div class="box publicite">
        	<center>
			{insert name=get_advertisement AID=2}
            </center>
		</div>
	</div>
</div>