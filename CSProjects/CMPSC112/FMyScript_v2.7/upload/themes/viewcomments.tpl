		{if $error ne ""}
        	<p>{$error}</p>
        {else}
            {if $showcomments|@count gt 0}
                {section name=vc loop=$showcomments}
                <p>{insert name=get_stripped_phrase value=a assign=comdetails details=$showcomments[vc].details}{$comdetails|stripslashes}</p>
                <div style="text-align: center; margin: 0px 0px 4px 0px !important; margin: 10px 0px;"><img src="{$imageurl}/separ.gif" /></div>
                {/section}
            {else}
            	<p>{$lang143}</p>
            {/if}
        {/if}