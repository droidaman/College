Welcome {$smarty.session.USERNAME},

To complete your registration, please confirm your e-mail address by clicking this link:

<a href={$baseurl}/confirmemail/{$verifycode}>{$baseurl}/confirmemail/{$verifycode}</a>

If you cannot click the link, then visit this url: 

<a href={$baseurl}/confirmemail/>{$baseurl}/confirmemail/</a>

And enter the following code:

Code: {$verifycode}


Thank You,
{$sendername}
