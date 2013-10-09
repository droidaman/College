<?php
//Uncomment to turn on debugging
//ini_set('display_errors', 'On');

// Converts from bytes to a more managable number
function bytesToSize1024($bytes, $precision = 2) {
    $unit = array('B','KB','MB');
    return @round($bytes / pow(1024, ($i = floor(log($bytes, 1024)))), $precision).' '.$unit[$i];
}

// Creates a (hopefully) case sensitive alphanumeric image handle
function createImageHandle($length){
    $handle = "";
    $codeAlphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    $codeAlphabet.= "abcdefghijklmnopqrstuvwxyz";
    $codeAlphabet.= "0123456789";
    for($i=0;$i<$length;$i++){
        $handle .= $codeAlphabet[rand(0,strlen($codeAlphabet))];
    }
    return $handle;
}

$sFileName = $_FILES['image_file']['name'];
$sFileType = $_FILES['image_file']['type'];
$sFileSize = bytesToSize1024($_FILES['image_file']['size'], 1);
$imageHandle = createImageHandle(6);

echo <<<EOF
<p>Your image has been successfully uploaded to the server.<br /></p>
<p>To share your image, use the following link:<br />
<a href="http://skynetgds.no-ip.biz/srthesis/irc.php?view={$imageHandle}">http://skynetgds.no-ip.biz/srthesis/irc.php?view={$imageHandle}</a></p>
EOF;

?>