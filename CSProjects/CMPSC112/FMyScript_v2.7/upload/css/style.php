<?php
header('Content-type: text/css');
include("../include/config.php");
$imageurl = $config['imageurl'];
?>
*{ margin:0;padding:0;border:0}body{color:#444;font-family:"Lucida Grande","Lucida Sans Unicode",Verdana,Arial,sans-serif;font-size:13px;line-height:1.5em;background:url('<?php echo $imageurl; ?>/bg.jpg') repeat-x #e6fbff}a,a:link{color:#0062BD;text-decoration:none}a:hover{color:#0062BD;text-decoration:underline}.clear{clear:both;display:block}span.mot{background:#f7efa9}.info{padding:8px;background-color:#fff;-moz-border-radius:8px;-webkit-border-radius:8px;margin-bottom:35px;font-weight:bold}.static{padding:8px;background-color:#fff;-moz-border-radius:8px;-webkit-border-radius:8px;margin-bottom:35px;font-weight:normal}.static a,a:link{color:#0062BD;text-decoration:none}.static a:hover{color:#0062BD;text-decoration:underline}.drapeaux{position:absolute;top:5px;right:5px}.drapeaux .flag{float:left;margin-left:5px}#haut{height:60px;line-height:1.0;margin-top:10px}#haut a,a:hover{color:#444}#haut a{text-decoration:underline}#haut a:hover{text-decoration:none}#haut a.submit{font-weight:bold}#haut .maintitle a{text-decoration:none}#haut p{float:right;font-weight:bold;font-size:30px;margin-top:40px;margin-right:-4px}#haut .maintitle{font-size:150%;font-weight:bold;width:300px;line-height:1.3em}#haut .title{font-size:70%;font-weight:bold;width:300px;line-height:1.3em}#haut .twitter{float:right;margin-top:10px}#haut .facebook{width:58px;float:right;margin-top:12px;margin-left:10px}.menu{margin:6px 0px 0px 30px !important;margin:6px 0px 0px 15px;text-align:right;float:left}.menu h1{font-weight:normal;font-size:13px;float:left}.menu .tiret{float:left;margin:0 5px 0 5px}.recherche_aide{float:right;margin-bottom:3px}#haut .recherche_aide a{color:#0062BD;text-decoration:none}#recherche_haut{float:right;width:200px;text-align:right}#recherche_haut input#mot{border:1px solid #888;width:120px;font-family:"Lucida Grande";font-size:13px;color:#444;margin:0;height:16px;float:right}#recherche_haut input#submit_srch{background:#F9F9F9;font-size:8px;font-weight:bold;color:#444;text-transform:uppercase;margin:0px 0px 0px 3px;float:right}#submit{margin:25px 0 0 0;display:none}#submit input{border:1px solid #ADADAD;padding:4px}#submit input#firstname{display:none}#submit textarea{margin-top:6px;border:1px solid #ADADAD;padding:4px;font-family:"Lucida Grande","Lucida Sans Unicode",Verdana,Arial,sans-serif;font-size:13px;width:874px}#submit .ok{float:right;margin:10px 0 10px 10px}#submit .ok input{padding:4px 15px;font-weight:bold;border:1px solid #ADADAD}#submit select{border:1px solid #ADADAD;padding:4px;width:160px}#content{width:900px;margin-left:auto;margin-right:auto}#content .homelink{display:block;float:right;color:#000;font-size:82%}#wrapper{margin-top:20px;float:left;width:728px}.post{padding:8px;background-color:#fff;-moz-border-radius:8px;-webkit-border-radius:8px;margin-bottom:18px !important;margin-bottom:15px;overflow:hidden}.post div.right {float: right;text-align: right;}.post.reply {margin-left: 30px;}.post h2{font-size:13px;margin-bottom:5px}.post.moins{color:#999}.post.plus{color:#477526}.post.highlight{background-color:#f8faeb}.post.menublog{text-align:center}.post a,a:link{color:#0062BD;text-decoration:none}.post a:hover{color:#0062BD;text-decoration:underline}.post a.bf,a.bf:link{color:#4c93d6;text-decoration:none}.post p a.oldlink,.post p a.oldlink:link,.post p a.oldlink:hover{color:#444;text-decoration:none}.post a.bf:hover{color:#0062BD;text-decoration:underline}.post .userinfos{float:left;margin:12px 0 0 0}.post .userinfos p{font-size:75%;color:#808080;line-height:1.5em}.post img.avatar{width:22px;height:22px;border:1px solid #e4e4e4}.post .avatar_container{float:left;margin:12px 8px 0px 0px;padding:2px;width:24px;height:24px;text-align:center}.post .avatar_container_fiche{margin:0 14px 0px 0px;padding:2px;width:24px;height:24px;text-align:center}.post .userinfos p a.pseudo,.userinfos p a.pseudo:link{color:#808080}.post .userinfos p a.pseudo:hover{color:#808080;text-decoration:underline}a.stbutton{padding:0 0 0 22px !important}a.stbutton{color:#444}a.stbutton:hover{color:#444;text-decoration:none}.date {margin-top: 5px;	line-height: 140%;float: left;}.date .left_part {float: left;}.date .right_part {float: left;margin-left: 4px;border-left: 2px solid #e5e5e5;padding-left: 3px;}.date a.stbutton{padding:0 0 0 0 !important}.date a.stbutton{color:#0062BD;text-transform:lowercase}.date a.stbutton:hover{color:#0062BD;text-transform:lowercase;text-decoration:underline}.post .date a.liencat,.date a.liencat:link{color:#808080}.post .date a.liencat:hover{color:#808080;text-decoration:underline}.post .plus{display:none;text-align:right}.post p.it{font-style:italic;color:#999}.post .more{float:right}*+html .post .more{margin-top:6px;float:right}* html .post .more{margin-top:6px;float:right}.post .plus .plus_bouton{float:right;padding:2px 6px;margin-right:4px;cursor:pointer;height:23px}.post .plus .plus_bouton:hover{background:#EAEAEA}.post .plus .plus_bouton .icone{margin-top:3px;float:left}.post .plus .plus_bouton .label{float:left;padding:1px 0pt 0pt 6px;color:#444}.post .plus .content{display:none}.post .suivi{float:right;margin-top:1px}.date{display:block;font-size:75%;color:#808080}.date a,.date a:link{text-decoration:none}.date a:hover{text-decoration:underline}.delete{display:block; float:right;margin-top:-19px;margin-left:4px}.date .w{color:#fb82ff}.date .m{color:#82c3ff}.pagination{color:#444;font-size:82%;position:relative;overflow:hidden}.pagination a{color:#0062BD}.pagination a:hover{color:#0062BD;text-decoration:underline}.pagination p.left{display:block;float:left}.pagination p.right{display:block;float:right}.Ligne{height:20px;border-bottom:1px solid #ADADAD;width:660px}.Ligne .LigneDate{float:left;width:100px}.Ligne .LigneTitre{float:left}.Ligne .LigneEdit{float:right;text-align:right;width:40px}.Ligne .LigneHits{float:right;text-align:left;width:40px}#droite{float:left;margin-left:10px;_margin-left:6px;margin-top:20px;display:inline}#droite .box{padding:8px;width:146px;background-color:#fff;-moz-border-radius:8px;-webkit-border-radius:8px;margin-bottom:18px !important;margin-bottom:15px}#droite .box .titretop{font-size:100%;font-weight:bold}#droite .box h4{font-size:100%;font-weight:bold}#droite .box ul{list-style-type:none;margin-top:2px;margin-left:6px}#droite .box ul li{width:100%}#droite .box ul li h3 a{display:block;font-size:13px;font-weight:normal}#droite .box#boutique ul{margin-left:0}#droite .box#boutique #paypal{text-align:center;margin-top:5px}#droite .box#boutique ul li.total{background:#f9f7e6;color:#991717;text-align:right;padding-right:2px}#droite .box#boutique ul li.option{font-size:10px;text-align:right}#droite .box#boutique ul li.option div.opt{float:left;padding-bottom:3px;height:16px}#droite .box#boutique ul li.option a{display:inline}#droite .box a,#droite .box a:link{color:#0062BD;text-decoration:underline}#droite .box a:hover{color:#0062BD;text-decoration:none}#droite .box ul li.active a,#droite .box ul li.active h2 a:link{color:#444;text-decoration:none;font-style:italic;font-size:13px;font-weight:normal}#droite .box ul li.active a,#droite .box ul li.active h2{color:#444;text-decoration:none;font-style:italic;font-size:13px;font-weight:normal}#droite .box ul li.active h2 a:hover{color:#0062BD;text-decoration:none}#droite .box ul li.operation a,#droite .box ul li.operation h3 a:link{color:#cb3c3c;text-decoration:underline}#droite .box ul li.operation h3 a:hover{color:#cb3c3c;text-decoration:none}#droite .box.footer{font-size:10px;color:#888}#droite .box.footer a{display:inline;color:#777}#droite .box.footer .decal{margin-left:8px}#droite .box.footer .bold{font-weight:bold}#droite .box.publicite{text-align:center}#droite .box.publicite img{margin-top:5px}#droite .box li.resume{font-size:11px}#droite .box li.tout{text-align:right;font-size:11px}#submit_connexion{width:73px;height:24px;border:0;padding-right:0px}#recherche{margin-top:6px;margin-bottom:6px;height:1%;overflow:hidden}#recherche input#mot{border:1px solid #888;width:120px;padding:3px;font-family:"Lucida Grande","Lucida Sans Unicode",Verdana,Arial,sans-serif;font-size:13px;color:#444;margin-left:9px}#recherche input#submit_srch{background:#F9F9F9;border:1px solid #888;padding:2px;font-size:8px;font-weight:bold;color:#444;text-transform:uppercase;float:right;margin-top:5px;margin-right:9px}#droite p.social{text-align:center}#footer{width:730px;margin-left:auto;margin-right:auto;margin-top:10px;font-size:11px;color:#AAA;padding-right:176px}#footer a{text-decoration:underline}#footer a:hover{text-decoration:none}#footer a,a:hover{color:#AAA}#footer .post{text-align:center;margin-bottom:0;margin-bottom:0 !important;background:transparent}form.submitsh .input_mail{float:left;margin-top:10px}form.submitsh .input_auteur{float:left}form.submitsh .input_cat{float:right}form.submitsh .input_sexe{float:right;margin-right:10px}form.submitsh #firstname{display:none}form.submitsh #loadingsubmitsh{text-align:center;display:none;margin:5px 0px 5px 0px;padding:0}form.submitsh .result{width:884px;margin:10px 0px 0px 0px;text-align:center;display:none}form.submitsh .ok #compteur{float:left;margin:4px 5px 0px 0px}form#comment{margin:10px 0;width:690px;margin-left:10px}form#comment .champ{text-align:right;margin-top:4px}form#comment .champ#pseudo{float:left}form#comment .champ#url{float:right}form#comment #firstname{display:none}form#comment .champ input{border:1px solid #ADADAD;width:180px;padding:3px;font-family:"Lucida Grande","Lucida Sans Unicode",Verdana,Arial,sans-serif;font-size:13px;color:#444}form#comment textarea{border:1px solid #ADADAD;width:682px;height:150px;padding:3px;font-family:"Lucida Grande","Lucida Sans Unicode",Verdana,Arial,sans-serif;font-size:13px;color:#444;margin-top:4px}form#comment .ok{text-align:right;margin-top:4px}form#comment .ok input{padding:4px 15px;font-weight:bold;border:1px solid #ADADAD}.form{margin-top:25px;margin-bottom:15px;text-align:left}.form .champ{width:712px;height:28px}.form .separ{width:712px;height:14px}.form .champ label{float:left;width:230px;text-align:right;margin:4px;margin-top:3px}.form .champ label.error{margin-left:5px;color:red;width:150px;display:none;text-align:left}.form .champ input{border:1px solid #ADADAD;width:240px;padding:3px;font-family:"Lucida Grande","Lucida Sans Unicode",Verdana,Arial,sans-serif;font-size:13px;color:#444;float:left}.form .champ input.checkbox{width:24px;float:right;border:0}.form .champ input.radio{width:24px;float:none;border:0}.form .champ input#codepostal{width:79px}.form .champ input#ville{width:150px;margin-left:3px}.form .champ input#jour{width:40px;text-align:center;margin-left:3px}.form .champ input#mois{width:40px;text-align:center}.form .champ input#annee{width:86px;text-align:center;margin-left:3px}.form .champ select{border:1px solid #ADADAD;width:180px;padding:3px;font-family:"Lucida Grande","Lucida Sans Unicode",Verdana,Arial,sans-serif;font-size:13px;color:#444;float:left}.form .champ textarea{border:1px solid #ADADAD;width:400px;height:150px;padding:3px;font-family:"Lucida Grande","Lucida Sans Unicode",Verdana,Arial,sans-serif;font-size:13px;color:#444;margin-top:4px}.form .champ label.error{float:right;margin-right:7px}.form .ok{text-align:left;margin-top:15px;margin-left:238px}.form .ok input{padding:4px 15px;font-weight:bold;border:1px solid #ADADAD}.form .champ input.submit_ami{padding:2px 15px;font-weight:bold;border:1px solid #ADADAD;float:left;width:130px;margin-left:4px}.form .result{width:408px;margin:10px 0px 0px 238px;text-align:center;display:none}.good{background-color:#e4ffe0;border-top:1px solid #5bba4c;border-bottom:1px solid #5bba4c;padding:5px}.pasgood{background-color:#ffe0e0;border-top:1px solid #ba4c4c;border-bottom:1px solid #ba4c4c;padding:5px}.content_result{margin-top:25px;margin-bottom:15px;text-align:center}.loginform input{border:1px solid #ADADAD;width:139px;padding:3px;font-family:"Lucida Grande","Lucida Sans Unicode",Verdana,Arial,sans-serif;font-size:13px;color:#444;margin-top:4px}.loginform input.submit{padding:2px 15px;font-weight:bold;border:1px solid #ADADAD;width:100px;margin-left:22px;margin-bottom:8px}.loginform .liens{text-align:right}#editcomment textarea{border:1px solid #ADADAD;width:680px;height:100px;padding:3px;font-family:"Lucida Grande","Lucida Sans Unicode",Verdana,Arial,sans-serif;font-size:13px;color:#444;margin:10px}#editcomment input.submit{float:right;margin-right:14px;padding:4px 15px;font-weight:bold;border:1px solid #ADADAD}#editcomment .result{width:685px;margin:10px auto 10px auto;text-align:center}.classement{margin-top:15px}.classement .item{height:20px}.classement .item.highlight{background-color:#f8faeb}.classement .item .login{float:left;padding-left:6px}.classement .item .infos{float:right}.classement .item .score{float:left;width:80px;text-align:center}.classement .item .place{float:left;width:80px;text-align:center}.classement .item .evolution{float:left;width:80px;text-align:center}
.msg {
	display:none;
	padding:10px 10px 2px 10px;
	width:675px;
	border-bottom: 1px solid #DDDDDD;
}

.result {
	width:500px;
	margin:10px auto 10px auto;
	text-align:center;
}

.liste{
	text-align: left;
	font-size: 13px;
	margin:10px 0px 10px 10px;
}

.liste .ligne{
	float:left;
	border-bottom: 1px solid #DDDDDD;
	height: 23px;
	margin-top:2px; 
	width:695px; 
}

.liste .lignetop{
	float:left;
	border-bottom: 1px solid #DDDDDD;
	padding:0 5px 0 5px; 
	background-color:#F6F6F6;
}

.liste .ligne p{ 
	float:left; 
	font-size: 13px;
}

.liste .lignetop p{
	float:left;
	font-size: 13px;
}

.liste .lignetop .itemtop {
	font-weight:bold;
	color:#424242;
	padding:2px 0;
	font-size: 11px;
}

.liste .ligne .noitem{
	text-align:center;	
	width:695px;
}

.date_ask{
	width:156px;
}

.type_ask{
	width:386px;
}

.statut_ask{
	width:105px;
	text-align:right;
}

.plus_msg {
	width:26px;
}

.etat_msg {
	width:46px;
}

.date_msg {
	width:86px;
}

.pseudo_msg {
	width:146px;
}

.sujet_msg {
 	width:316px;
}

.sujet_msg_outbox {
	width:361px;
}

.outil_msg {
	width:66px;
	text-align:right;
}

.newmsg {
	font-weight:bold;
}
.search_photo{width:75px}.search_login{width:200px}.search_ville{width:180px}.search_pays{width:130px}.search_civilite{width:100px;text-align:right}#suivi ul{margin:15px 0 15px 30px;list-style-type:none}.informations{margin:0 0 0 20px;float:left}.informations ul{list-style-type:none;margin:5px 0 0 0;width:420px}.informations ul li{padding:2px 0 2px 0;border-bottom:1px solid #e0e0e0}