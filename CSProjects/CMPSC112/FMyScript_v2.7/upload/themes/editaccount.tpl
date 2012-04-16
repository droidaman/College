    <div id="wrapper">
        <script type="text/javascript" src="{$baseurl}/js/thickbox-compressed.js"></script>
    
    	{if $error ne "" OR $message ne ""}
        <div class="post">
    	{include file="error.tpl"}
        </div>
        {/if}
        
        <div class="post">
            <div style="float:left; width:585px;">
                <h3 style="width:400px;">{$lang47}</h3>
                <p><a href="{$baseurl}/members/{$smarty.session.USERID}/{$smarty.session.USERNAME}">{$lang40}</a></p>
                <div class="clear"></div>
            </div>
            <div style="float:right;" id="photo">
                {insert name=get_member_profilepicture assign=profilepicture value=var USERID=$memberarray[0].USERID}
                <img src="{$membersprofilepicurl}/thumbs/{$profilepicture}?timestamp={$smarty.now}" style="border:1px solid #000;">		
            </div>
            <div class="clear"></div>
            <form class="form" id="profilform" action="{$baseurl}/editaccount" enctype="multipart/form-data" method="POST">
                <div class="champ">
                    <label>{$lang96} :</label>
                    <input type="text" name="firstname" value="{$memberarray[0].firstname}" />
                </div>
                
                <div class="champ">
                    <label>{$lang97} :</label>
                    <input type="text" name="lastname" value="{$memberarray[0].lastname}" />
                </div>
                
                <div class="champ">
                    <label>{$lang98} :</label>
                    <select name="bday" style="width:100px"><option>{$lang99}</option>{$bdays}</select><select name="bmonth" style="width:150px"><option>{$lang100}</option>{$bmonths}</select><select name="byear" style="width:100px"><option>{$lang101}</option>{$byears}</select>
                </div>
                
                <div class="champ">
                    <label>{$lang25} :</label>
                    <select name="gender" style="width:100px">
                        <option value="1" {if $memberarray[0].gender eq "1"}selected="selected"{/if}>{$lang26}</option>
                        <option value="0" {if $memberarray[0].gender eq "0"}selected="selected"{/if}>{$lang27}</option>
                    </select>
                </div>		           
                
                <div class="champ">
                    <label>{$lang102} :</label>
                    <input type="text" name="city" value="{$memberarray[0].city}"/>	
                </div>
        
                <div class="champ">
                    <label>{$lang103} :</label>
                    <select name=country><option value="Choose Country">{$lang104}</option>{$country}</select>	
                </div>
                
                <div class="champ" style="height:80px;">
                    <label>{$lang105} :</label>
                    <textarea name="description" style="height:60px;">{insert name=get_stripped_phrase2 value=a assign=pdesc details=$memberarray[0].description}{$pdesc}</textarea>
                </div>
                
                <div class="champ">
                    <label>Change your picture :</label>
                    <input type="file" name="profilepicimage" id="profilepicimage">	
                </div>
                
                <div class="ok">
                    <input type="submit" value="{$lang106}" name="change" />
                </div>
            </form>
        </div>
        
        <div class="post">
            <center>
			{insert name=get_advertisement AID=1}
            </center>
        </div>
    

    
    ﻿</div>
    
    {include file="right.tpl"}
