<?php
/*******************************
 *                             *
 *          Debugging          *
 *                             *
 *******************************/

// Uncomment to turn on debugging
//error_reporting(E_ALL);
//ini_set('display_errors', 'On');

/*******************************
 *                             *
 *   Thumbnail Functionality   *
 *                             *
 *******************************/

// This method has been expanded to allow for any common image filetype except bmp.
function makeThumb($druTarget, $publicThumbTarget, $filename, $thumbSize){	
	// Set Filenames
	$srcFile = $druTarget.$filename;
	$thumbFile = $publicThumbTarget.'thumb_'.$filename;
	
	// Determine the File Type
	$type = substr($filename, strrpos($filename, '.') + 1);
	
	// Create the Source Image
	switch($type){
		case 'jpg': case 'jpeg':
			$src = imagecreatefromjpeg($srcFile);
			break;
		case 'png':
			$src = imagecreatefrompng($srcFile);
			break;
		case 'gif':
			$src = imagecreatefromgif($srcFile);
			break;
	}

	// Determine the Image Dimensions
	$oldW = imagesx($src);
	$oldH = imagesy($src);

	// Calculate the New Image Dimensions
	if($oldH > $oldW){
		// Portrait
		$srcX = 0;
		$srcY = ($oldH / 2) - ($oldW / 2);
		$srcW = $oldW;
		$srcH = $oldW;
	} else {
		// Landscape
		$srcY = 0;
		$srcX = ($oldW / 2)-($oldH / 2);
		$srcH = $oldH;
		$srcW = $oldH;
	}

	// Create the new Image
	$dst = imagecreatetruecolor($thumbSize, $thumbSize);
	
	// Transcribe the Source Image into the New (Square) Image
	imagecopyresampled($dst, $src, 0, 0, $srcX, $srcY, $thumbSize, $thumbSize, $srcW, $srcH);
	
	// Save the appropriate image type to the server
	switch($type){
		case 'jpg': case 'jpeg':
			imagejpeg($dst, $thumbFile);
			break;
		case 'png':
			imagepng($dst, $thumbFile);
			break;
		case 'gif':
			imagegif($dst, $thumbFile);
			break;
	}

	// Clean up the unnecessary images
	imagedestroy($dst);
	imagedestroy($src);
}
?>