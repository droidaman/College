<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	     <link href="/library/skin/tool_base.css" type="text/css" rel="stylesheet" media="all" />
	    <link href="/library/skin/allegheny281/tool.css" type="text/css" rel="stylesheet" media="all" />
	    <meta http-equiv="Content-Style-Type" content="text/css" />
	    <title>Allegheny Sakai</title>
		<script type="text/javascript" language="JavaScript" src="/library/js/headscripts.js"></script>
		<meta name="viewport" content="width=320, user-scalable=no"/>
			</head>
	<body onload="if ((document.getElementById('pw').passwordfocus != true)) document.getElementById('eid').focus() ;parent.updCourier(doubleDeep, ignoreCourier);">
		<script type="text/javascript" language="JavaScript">
			focus_path = ["eid"];
		</script>
		<!-- xlogin.vm -->
		<table class="login" cellpadding="0" cellspacing="0" border="0">
		<tr>
			<th colspan="2">Login Required</th>
		</tr>
		<tr>
			<td class="logo"></td>
			<td class="form">
				<form method="post" action="https://sakai.allegheny.edu/access/login" enctype="application/x-www-form-urlencoded">
									<table border="0" class="loginform">
					<tr>
						<td><label for="eid">user id</label></td>
						<td><input name="eid" id="eid" value="" type="text" size="15"/></td>
					</tr>
					<tr>
						<td><label for="pw">password</label></td>
						<td><input name="pw" id="pw" value="" type="password" onfocus="this.passwordfocus = true; " size="15"/></td>
					</tr>
										<tr>
												<td colspan="2"><input name="submit" type="submit" id="submit" value="Login"/></td>
											</tr>
					</table>
				</form>
			</td>
		</tr>
		</table>
		<!-- end xlogin.vm -->
	</body>
</html>
