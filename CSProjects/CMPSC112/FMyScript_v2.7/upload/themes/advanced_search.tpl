	<div id="wrapper">

        <div class="post">
            <h2 class="top">{$lang171}</h2>
            <form class="form" action="{$baseurl}/search.php" method="GET">	
            	<input type="hidden" name="type" value="article" />
                <div class="champ">
                    <label>{$lang172} :</label>
                    <input type="text" name="text" value=""/>	
                </div>
                <div class="champ">
                    <label>{$lang173} :</label>
                    <select name="cat">
                    <option value="0">{$lang174}</option>
                    {insert name=get_categories assign=cat}
                    {section name=i loop=$cat}
                    <option value="{$cat[i].CATID}">{$cat[i].name|stripslashes}</option>
                    {/section}
                    </select>
                </div>
                <div class="ok">
                    <input type="submit" value="{$lang22}" />
                </div>
            </form>
        </div>
        
        <a name="members"></a>
        <div class="post">
        	<h2 class="top">{$lang175}</h2>
            <form class="form" action="{$baseurl}/search.php" method="GET">
            <input type="hidden" name="type" value="member" />
                <div class="champ">
                    <label>{$lang16} :</label>
                    <input type="text" name="username" value=""/>	
                </div>
                <div class="champ">
                <label>{$lang25} :</label>
                    <select name="gender">
                        <option value="">{$lang52}</option>
                        <option value="1">{$lang26}</option>
                        <option value="0">{$lang27}</option>
                    </select>
                </div>
                <div class="champ">
                    <label>{$lang102} :</label>
                    <input type="text" name="city" value=""/>	
                </div>
                <div class="champ">
                    <label>{$lang103} :</label>
                    <input type="text" name="country" value=""/>	
                </div>
                <div class="ok">
                    <input type="submit" value="{$lang22}" />
                </div>
            </form>
        </div>


	</div>  

    {include file="right.tpl"}