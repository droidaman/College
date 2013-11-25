<?php

error_reporting(E_ALL ^ E_NOTICE);
date_default_timezone_set('America/New_York');


$info = array(
	'firstName'		=> 'Braden',
	'middleName'	=> 'D.',
	'lastName'		=> 'Licastro',
	'photoURL'		=> 'images/photo.jpg',
	'birthDay'		=> strtotime('15-08-1991'),
	'city'			=> 'Pittsburgh',
	'country'		=> 'United States',
	'street'		=> '501 Kingsberry Court',
	'zip'			=> '15237',
	'company'		=> 'Allegheny College',
	'website'		=> 'http://www.fullforceapps.com/',
	'email'			=> 'licastb@allegheny.edu',
	'cellphone'		=> '7244939192',
	'description'	=> "I am a webdeveloper living in Pennsylvania. I enjoy designing and coding web applications, photography, skiing and music.",
	'tags'			=> 'Student, Developer, Photographer',
	'facebook'		=> 'http://www.facebook.com/braden.licastro',
	'twitter'		=> 'http://twitter.com/1bradensenough'
);


/*

	// Additional properties that can take part of the $info
	// array (will be visible in the generated vcard):

	'educationTitle', 'addon', 'nickname', 'company', 'organisation', 'department', 'jobTitle',
	'telephoneWork1', 'telephoneWork2', 'telephoneHome1', 'telephoneHome2', 'carphone', 'pager',
	'additionalTelephone','faxWork','faxHome','ISDN','preferredTelephone','telex', 'workStreet',
	'workZIP','workCity','workRegion','workCountry','homeStreet','homeZIP', 'homeRegion',
	'postalStreet','postalZIP','postalCity', 'postalRegion', 'postalCountry','role'

*/
?>