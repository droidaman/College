	<div id="wrapper">

        
        <div class="post">
        	<div style="float:left">
                <p><b>{insert name=get_static value=var sel=title ID=2}</b></p>
            </div>
            <div class="clear"></div>
        </div>
        
        {insert name=get_advertisement AID=3}
        <div style="padding-bottom:10px;"></div>
        
		<div class="post">
        	<p>
            	{insert name=get_static value=var sel=value ID=2}
            </p>
		</div>
	</div>  

    {include file="right.tpl"}