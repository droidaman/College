<?php
/*******************************
 *                             *
 *          Debugging          *
 *                             *
 *******************************/
// Uncomment to turn on debugging
//error_reporting(E_ALL & ~E_NOTICE);
//ini_set('display_errors', 'On');

/*******************************
 *                             *
 *   Thumbnail Functionality   *
 *                             *
 *******************************/

/**********************************************************
 *   Function makeThumb(params)							  *
 *	 													  *
 *	 Description: Creates a thumbnail of $thumbSize size  *
 *														  *
 *   druTarget - Duplicate reduced 						  *
 *   pubicThumbTarget - Public accessable thumb directory *
 *   filename - Name of the file to create the thumb from *
 *   thumbSize - Thumbnail size to create (in px)		  *
 *														  *
 *	 Returns: N/A										  *
 *	 Calls:	  N/A										  *
 **********************************************************/
function makeThumb($druTarget, $publicThumbTarget, $filename, $thumbSize) {	

	// Set filenames.
	$srcFile = $druTarget.$filename;
	$thumbFile = $publicThumbTarget.'thumb_'.$filename;
	
	// Determine the file type.
	$type = substr($filename, strrpos($filename, '.') + 1);
	
	// Create the source image.
	switch($type) {
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

	// Determine the image dimensions.
	$oldW = imagesx($src);
	$oldH = imagesy($src);

	// Calculate the new image dimensions.
	if($oldH > $oldW) {
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

	// Create the new image.
	$dst = imagecreatetruecolor($thumbSize, $thumbSize);
	
	// Transcribe the source image into the new (square) image.
	imagecopyresampled($dst, $src, 0, 0, $srcX, $srcY, $thumbSize, $thumbSize, $srcW, $srcH);
	
	// Save the appropriate image type to the server.
	switch($type) {
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

	// Clean up the unnecessary images.
	imagedestroy($dst);
	imagedestroy($src);
}
?>