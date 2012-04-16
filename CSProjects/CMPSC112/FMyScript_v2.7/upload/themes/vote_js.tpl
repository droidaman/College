		{literal}
		<script language="javascript" type="text/javascript">
        function VOTEYES(id,nb) {
            $('#vote'+id).css('display','none');
            $.post("{/literal}{$baseurl}/vote_yes.php{literal}",{"id":id,"nb":nb},function(html) {
                $('#vote'+id).html('{/literal}{$lang189}{literal} ('+html+')').fadeIn();
            });
			$.post("{/literal}{$baseurl}/vote_yes2.php{literal}",{"id":id,"nb":nb},function(html) {
            });
        }
        function VOTENO(id,nb) {
            $('#votebf'+id).css('display','none');
            $.post("{/literal}{$baseurl}/vote_no.php{literal}",{"id":id,"nb":nb},function(html) {
                $('#votebf'+id).html('{/literal}{$lang190}{literal} ('+html+')').fadeIn();
            });
			$.post("{/literal}{$baseurl}/vote_no2.php{literal}",{"id":id,"nb":nb},function(html) {
            });
        }
		</script>
        {/literal}