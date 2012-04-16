				{assign var=RID value=$posts[i].PID}
                {if $smarty.cookies.$RID ne ""}
                <span id="vote{$posts[i].PID}">
                	{$lang72} ({$posts[i].vote_yes})
                </span> - 
                <span id="votebf{$posts[i].PID}">
                	{$lang71} ({$posts[i].vote_no})
                </span>
                {else}
                <span id="vote{$posts[i].PID}">
                	<a href="javascript:;" onclick="VOTEYES('{$posts[i].PID}','{$posts[i].vote_yes}');">{$lang72}</a> ({$posts[i].vote_yes})
                </span> - 
                <span id="votebf{$posts[i].PID}">
                	<a href="javascript:;" onclick="VOTENO('{$posts[i].PID}','{$posts[i].vote_no}');" class="bf">{$lang71}</a> ({$posts[i].vote_no})
                </span>
                {/if}