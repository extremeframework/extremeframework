<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class ThumbController extends AppController
{
	var $image_library		= 'gd2';	// Can be:  imagemagick, netpbm, gd, gd2
	var $library_path		= '';
	var $dynamic_output		= FALSE;	// Whether to send to browser or write to disk
	var $source_image		= '';
	var $new_image			= '';
	var $width				= '';
	var $height				= '';
	var $quality			= '90';
	var $create_thumb		= FALSE;
	var $thumb_marker		= '_thumb';
	var $maintain_ratio		= TRUE;		// Whether to maintain aspect ratio when resizing or use hard values
	var $master_dim			= 'auto';	// auto, height, or width.  Determines what to use as the master dimension
	var $rotation_angle		= '';
	var $x_axis				= '';
	var	$y_axis				= '';

	// Watermark Vars
	var $wm_text			= '';			// Watermark text if graphic is not used
	var $wm_type			= 'text';		// Type of watermarking.  Options:  text/overlay
	var $wm_x_transp		= 4;
	var $wm_y_transp		= 4;
	var $wm_overlay_path	= '';			// Watermark image path
	var $wm_font_path		= '';			// TT font
	var $wm_font_size		= 17;			// Font size (different versions of GD will either use points or pixels)
	var $wm_vrt_alignment	= 'B';			// Vertical alignment:   T M B
	var $wm_hor_alignment	= 'C';			// Horizontal alignment: L R C
	var $wm_padding			= 0;			// Padding around text
	var $wm_hor_offset		= 0;			// Lets you push text to the right
	var $wm_vrt_offset		= 0;			// Lets you push  text down
	var $wm_font_color		= '#ffffff';	// Text color
	var $wm_shadow_color	= '';			// Dropshadow color
	var $wm_shadow_distance	= 2;			// Dropshadow distance
	var $wm_opacity			= 50;			// Image opacity: 1 - 100  Only works with image

	// Private Vars
	var $source_folder		= '';
	var $dest_folder		= '';
	var $mime_type			= '';
	var $orig_width			= '';
	var $orig_height		= '';
	var $image_type			= '';
	var $size_str			= '';
	var $full_src_path		= '';
	var $full_dst_path		= '';
	var $create_fnc			= 'imagecreatetruecolor';
	var $copy_fnc			= 'imagecopyresampled';
	var $error_msg			= array();
	var $wm_use_drop_shadow	= FALSE;
	var $wm_use_truetype	= FALSE;

    function indexAction() {
        if (isset($_REQUEST['args']) && preg_match('/([0-9]+)(x|\/)([0-9]+)\/(.*)/is', $_REQUEST['args'], $matches)) {
            $w = $matches[1];
            $h = $matches[3];
            $src = $matches[4];
        } else {
            $src = isset($_REQUEST['src'])? $_REQUEST['src'] : THUMBS_NOIMAGE;
            $w = isset($_REQUEST['w'])? $_REQUEST['w'] : THUMBS_WIDTH;
            $h = isset($_REQUEST['h'])? $_REQUEST['h'] : THUMBS_HEIGHT;
        }

        if (!file_exists(UPLOAD_DIR.'/'.$src)) {
            $src = THUMBS_NOIMAGE;
        }
        if (!intval($w)) {
            $w = THUMBS_WIDTH;
        }
        if (!intval($h)) {
            $h = THUMBS_HEIGHT;
        }

        $config['image_library'] = 'gd2';
        $config['source_image']	= UPLOAD_DIR.'/'.$src;
        $config['create_thumb'] = TRUE;
        $config['maintain_ratio'] = TRUE;
        $config['width'] = $w;
        $config['height'] = $h;
        $config['dynamic_output']	= TRUE;

        $this->initialize($config);
        $this->process('resize');
    }

    function resize($source, $maxwidth, $maxheight, $allowzooming = false) {
        // x. No need to resize if smaller
		if (!$allowzooming) {
    		$this->get_image_properties($source, false);

		    if ($this->orig_width <= $maxwidth && $this->orig_height <= $maxheight) {
		        return;
		    }
		}

        $config = array();

        $config['image_library'] = 'gd2';
        $config['source_image']	= $source;
        $config['create_thumb'] = false;
        $config['maintain_ratio'] = TRUE;
        $config['width'] = $maxwidth;
        $config['height'] = $maxheight;
        $config['dynamic_output']	= false;

        $this->initialize($config);
        $this->process('resize');
    }

    function trim_border_white_spaces($source, $hex) {
        $config = array();

        $config['image_library'] = 'gd2';
        $config['source_image']	= $source;
        $config['create_thumb'] = false;
        $config['maintain_ratio'] = TRUE;
        $config['dynamic_output']	= false;

        $this->initialize($config);

        //load the image
        $img = $this->image_create_gd($source);

        // find the trimmed image border
        $box = $this->imageTrimmedBox($img, $hex);

        // copy cropped portion
        $img2 = imagecreatetruecolor($box['w'], $box['h']-1);
        imagecopy($img2, $img, 0, 0, $box['l'], $box['t'], $box['w'], $box['h']-1);

		// save it
		if ( ! $this->image_save_gd($img2))
		{
			return FALSE;
		}

		//  Kill the file handles
		imagedestroy($img);
		imagedestroy($img2);

        return true;
    }

    function imageTrimmedBox($img, $hex){
        $width = imagesx($img);
        $height = imagesy($img);
        $b_top = 0;
        $b_lft = 0;
        $b_btm = $height - 1;
        $b_rt = $width - 1;

        //top
        for(; $b_top < $height; ++$b_top) {
            for($x = 0; $x < $width; ++$x) {
                if(imagecolorat($img, $x, $b_top) <= $hex) {
                    break 2;
                }
            }
        }

        // return false when all pixels are trimmed
        if ($b_top == $height) return false;

        // bottom
        for(; $b_btm >= 0; --$b_btm) {
            for($x = 0; $x < $width; ++$x) {
                if(imagecolorat($img, $x, $b_btm) <= $hex) {
                    break 2;
                }
            }
        }

        // left
        for(; $b_lft < $width; ++$b_lft) {
            for($y = $b_top; $y <= $b_btm; ++$y) {
                if(imagecolorat($img, $b_lft, $y) <= $hex) {
                    break 2;
                }
            }
        }

        // right
        for(; $b_rt >= 0; --$b_rt) {
            for($y = $b_top; $y <= $b_btm; ++$y) {
                if(imagecolorat($img, $b_rt, $y) <= $hex) {
                    break 2;
                }
            }
        }

        $b_btm++;
        $b_rt++;
        return array(
            'l' => $b_lft,
            't' => $b_top,
            'r' => $b_rt,
            'b' => $b_btm,
            'w' => $b_rt - $b_lft,
            'h' => $b_btm - $b_top
        );
    }

	function initialize($props = array())
	{
		/*
		 * Convert array elements into class variables
		 */
		if (count($props) > 0)
		{
			foreach ($props as $key => $val)
			{
				$this->$key = $val;
			}
		}

		/*
		 * Is there a source image?
		 *
		 * If not, there's no reason to continue
		 *
		 */
		if ($this->source_image == '')
		{
			$this->set_error('imglib_source_image_required');
			return FALSE;
		}

		/*
		 * Is getimagesize() Available?
		 *
		 * We use it to determine the image properties (width/height).
		 * Note:  We need to figure out how to determine image
		 * properties using ImageMagick and NetPBM
		 *
		 */
		if ( ! function_exists('getimagesize'))
		{
			$this->set_error('imglib_gd_required_for_props');
			return FALSE;
		}

		$this->image_library = strtolower($this->image_library);

		/*
		 * Set the full server path
		 *
		 * The source image may or may not contain a path.
		 * Either way, we'll try use realpath to generate the
		 * full server path in order to more reliably read it.
		 *
		 */
		if (function_exists('realpath') AND @realpath($this->source_image) !== FALSE)
		{
			$full_source_path = str_replace("\\", "/", realpath($this->source_image));
		}
		else
		{
			$full_source_path = $this->source_image;
		}

		$x = explode('/', $full_source_path);
		$this->source_image = end($x);
		$this->source_folder = str_replace($this->source_image, '', $full_source_path);

		// Set the Image Properties
		if ( ! $this->get_image_properties($this->source_folder.$this->source_image))
		{
			return FALSE;
		}

		/*
		 * Assign the "new" image name/path
		 *
		 * If the user has set a "new_image" name it means
		 * we are making a copy of the source image. If not
		 * it means we are altering the original.  We'll
		 * set the destination filename and path accordingly.
		 *
		 */
		if ($this->new_image == '')
		{
			$this->dest_image = $this->source_image;
			$this->dest_folder = $this->source_folder;
		}
		else
		{
			if (strpos($this->new_image, '/') === FALSE)
			{
				$this->dest_folder = $this->source_folder;
				$this->dest_image = $this->new_image;
			}
			else
			{
				if (function_exists('realpath') AND @realpath($this->new_image) !== FALSE)
				{
					$full_dest_path = str_replace("\\", "/", realpath($this->new_image));
				}
				else
				{
					$full_dest_path = $this->new_image;
				}

				// Is there a file name?
				if ( ! preg_match("#\.(jpg|jpeg|gif|png)$#i", $full_dest_path))
				{
					$this->dest_folder = $full_dest_path.'/';
					$this->dest_image = $this->source_image;
				}
				else
				{
					$x = explode('/', $full_dest_path);
					$this->dest_image = end($x);
					$this->dest_folder = str_replace($this->dest_image, '', $full_dest_path);
				}
			}
		}

		/*
		 * Compile the finalized filenames/paths
		 *
		 * We'll create two master strings containing the
		 * full server path to the source image and the
		 * full server path to the destination image.
		 * We'll also split the destination image name
		 * so we can insert the thumbnail marker if needed.
		 *
		 */
		if ($this->create_thumb === FALSE OR $this->thumb_marker == '')
		{
			$this->thumb_marker = '';
		}

		$xp	= $this->explode_name($this->dest_image);

		$filename = $xp['name'];
		$file_ext = $xp['ext'];

		$this->full_src_path = $this->source_folder.$this->source_image;
		$this->full_dst_path = $this->dest_folder.$filename.$this->thumb_marker.$file_ext;

		/*
		 * Should we maintain image proportions?
		 *
		 * When creating thumbs or copies, the target width/height
		 * might not be in correct proportion with the source
		 * image's width/height.  We'll recalculate it here.
		 *
		 */
		if ($this->maintain_ratio === TRUE && ($this->width != '' AND $this->height != ''))
		{
			$this->image_reproportion();
		}

		/*
		 * Was a width and height specified?
		 *
		 * If the destination width/height was
		 * not submitted we will use the values
		 * from the actual file
		 *
		 */
		if ($this->width == '')
			$this->width = $this->orig_width;

		if ($this->height == '')
			$this->height = $this->orig_height;

		// Set the quality
		$this->quality = trim(str_replace("%", "", $this->quality));

		if ($this->quality == '' OR $this->quality == 0 OR ! is_numeric($this->quality))
			$this->quality = 90;

		// Set the x/y coordinates
		$this->x_axis = ($this->x_axis == '' OR ! is_numeric($this->x_axis)) ? 0 : $this->x_axis;
		$this->y_axis = ($this->y_axis == '' OR ! is_numeric($this->y_axis)) ? 0 : $this->y_axis;

		// Watermark-related Stuff...
		if ($this->wm_font_color != '')
		{
			if (strlen($this->wm_font_color) == 6)
			{
				$this->wm_font_color = '#'.$this->wm_font_color;
			}
		}

		if ($this->wm_shadow_color != '')
		{
			if (strlen($this->wm_shadow_color) == 6)
			{
				$this->wm_shadow_color = '#'.$this->wm_shadow_color;
			}
		}

		if ($this->wm_overlay_path != '')
		{
			$this->wm_overlay_path = str_replace("\\", "/", realpath($this->wm_overlay_path));
		}

		if ($this->wm_shadow_color != '')
		{
			$this->wm_use_drop_shadow = TRUE;
		}

		if ($this->wm_font_path != '')
		{
			$this->wm_use_truetype = TRUE;
		}

		return TRUE;
	}

    function process($action = 'resize') {
		$v2_override = FALSE;

		// If the target width/height match the source, AND if the new file name is not equal to the old file name
		// we'll simply make a copy of the original with the new name... assuming dynamic rendering is off.
		if ($this->dynamic_output === FALSE)
		{
			if ($this->orig_width == $this->width AND $this->orig_height == $this->height)
			{
				if ($this->source_image != $this->new_image)
				{
					if (@copy($this->full_src_path, $this->full_dst_path))
					{
						@chmod($this->full_dst_path, FILE_WRITE_MODE);
					}
				}

				return TRUE;
			}
		}

		// Let's set up our values based on the action
		if ($action == 'crop')
		{
			//  Reassign the source width/height if cropping
			$this->orig_width  = $this->width;
			$this->orig_height = $this->height;

			// GD 2.0 has a cropping bug so we'll test for it
			if ($this->gd_version() !== FALSE)
			{
				$gd_version = str_replace('0', '', $this->gd_version());
				$v2_override = ($gd_version == 2) ? TRUE : FALSE;
			}
		}
		else
		{
			// If resizing the x/y axis must be zero
			$this->x_axis = 0;
			$this->y_axis = 0;
		}

		//  Create the image handle
		if ( ! ($src_img = $this->image_create_gd()))
		{
			return FALSE;
		}

		//  Create The Image
		//
		//  old conditional which users report cause problems with shared GD libs who report themselves as "2.0 or greater"
		//  it appears that this is no longer the issue that it was in 2004, so we've removed it, retaining it in the comment
		//  below should that ever prove inaccurate.
		//
		//  if ($this->image_library == 'gd2' AND function_exists('imagecreatetruecolor') AND $v2_override == FALSE)
		if ($this->image_library == 'gd2' AND function_exists('imagecreatetruecolor'))
		{
			$create	= 'imagecreatetruecolor';
			$copy	= 'imagecopyresampled';
		}
		else
		{
			$create	= 'imagecreate';
			$copy	= 'imagecopyresized';
		}

		$dst_img = $create($this->width, $this->height);

		if ($this->image_type == 3) // png we can actually preserve transparency
		{
			imagealphablending($dst_img, FALSE);
			imagesavealpha($dst_img, TRUE);
		}

		$copy($dst_img, $src_img, 0, 0, $this->x_axis, $this->y_axis, $this->width, $this->height, $this->orig_width, $this->orig_height);

		//  Show the image
		if ($this->dynamic_output == TRUE)
		{
			$this->image_display_gd($dst_img);
		}
		else
		{
			// Or save it
			if ( ! $this->image_save_gd($dst_img))
			{
				return FALSE;
			}
		}

		//  Kill the file handles
		imagedestroy($dst_img);
		imagedestroy($src_img);

		// Set the file to 777
		@chmod($this->full_dst_path, FILE_WRITE_MODE);

		return TRUE;
    }

	function get_image_properties($path = '', $return = FALSE)
	{
		// For now we require GD but we should
		// find a way to determine this using IM or NetPBM

		if ($path == '')
			$path = $this->full_src_path;

		if ( ! file_exists($path))
		{
			$this->set_error('imglib_invalid_path');
			return FALSE;
		}

		$vals = @getimagesize($path);

		$types = array(1 => 'gif', 2 => 'jpeg', 3 => 'png');

		$mime = (isset($types[$vals['2']])) ? 'image/'.$types[$vals['2']] : 'image/jpg';

		if ($return == TRUE)
		{
			$v['width']			= $vals['0'];
			$v['height']		= $vals['1'];
			$v['image_type']	= $vals['2'];
			$v['size_str']		= $vals['3'];
			$v['mime_type']		= $mime;

			return $v;
		}

		$this->orig_width	= $vals['0'];
		$this->orig_height	= $vals['1'];
		$this->image_type	= $vals['2'];
		$this->size_str		= $vals['3'];
		$this->mime_type	= $mime;

		return TRUE;
	}

	function explode_name($source_image)
	{
		$ext = strrchr($source_image, '.');
		$name = ($ext === FALSE) ? $source_image : substr($source_image, 0, -strlen($ext));

		return array('ext' => $ext, 'name' => $name);
	}

	function image_reproportion()
	{
		if ( ! is_numeric($this->width) OR ! is_numeric($this->height) OR $this->width == 0 OR $this->height == 0)
			return;

		if ( ! is_numeric($this->orig_width) OR ! is_numeric($this->orig_height) OR $this->orig_width == 0 OR $this->orig_height == 0)
			return;

		$new_width	= ceil($this->orig_width*$this->height/$this->orig_height);
		$new_height	= ceil($this->width*$this->orig_height/$this->orig_width);

		$ratio = (($this->orig_height/$this->orig_width) - ($this->height/$this->width));

		if ($this->master_dim != 'width' AND $this->master_dim != 'height')
		{
			$this->master_dim = ($ratio < 0) ? 'width' : 'height';
		}

		if (($this->width != $new_width) AND ($this->height != $new_height))
		{
			if ($this->master_dim == 'height')
			{
				$this->width = $new_width;
			}
			else
			{
				$this->height = $new_height;
			}
		}
	}

	function image_create_gd($path = '', $image_type = '')
	{
		if ($path == '')
			$path = $this->full_src_path;

		if ($image_type == '')
			$image_type = $this->image_type;


		switch ($image_type)
		{
			case	 1 :
						if ( ! function_exists('imagecreatefromgif'))
						{
							$this->set_error(array('imglib_unsupported_imagecreate', 'imglib_gif_not_supported'));
							return FALSE;
						}

						return imagecreatefromgif($path);
				break;
			case 2 :
						if ( ! function_exists('imagecreatefromjpeg'))
						{
							$this->set_error(array('imglib_unsupported_imagecreate', 'imglib_jpg_not_supported'));
							return FALSE;
						}

						return imagecreatefromjpeg($path);
				break;
			case 3 :
						if ( ! function_exists('imagecreatefrompng'))
						{
							$this->set_error(array('imglib_unsupported_imagecreate', 'imglib_png_not_supported'));
							return FALSE;
						}

						return imagecreatefrompng($path);
				break;

		}

		$this->set_error(array('imglib_unsupported_imagecreate'));
		return FALSE;
	}

	function image_save_gd($resource)
	{
		switch ($this->image_type)
		{
			case 1 :
						if ( ! function_exists('imagegif'))
						{
							$this->set_error(array('imglib_unsupported_imagecreate', 'imglib_gif_not_supported'));
							return FALSE;
						}

						if ( ! @imagegif($resource, $this->full_dst_path))
						{
							$this->set_error('imglib_save_failed');
							return FALSE;
						}
				break;
			case 2	:
						if ( ! function_exists('imagejpeg'))
						{
							$this->set_error(array('imglib_unsupported_imagecreate', 'imglib_jpg_not_supported'));
							return FALSE;
						}

						if ( ! @imagejpeg($resource, $this->full_dst_path, $this->quality))
						{
							$this->set_error('imglib_save_failed');
							return FALSE;
						}
				break;
			case 3	:
						if ( ! function_exists('imagepng'))
						{
							$this->set_error(array('imglib_unsupported_imagecreate', 'imglib_png_not_supported'));
							return FALSE;
						}

						if ( ! @imagepng($resource, $this->full_dst_path))
						{
							$this->set_error('imglib_save_failed');
							return FALSE;
						}
				break;
			default		:
							$this->set_error(array('imglib_unsupported_imagecreate'));
							return FALSE;
				break;
		}

		return TRUE;
	}

	// --------------------------------------------------------------------

	/**
	 * Dynamically outputs an image
	 *
	 * @access	public
	 * @param	resource
	 * @return	void
	 */
	function image_display_gd($resource)
	{
		header("Content-Disposition: filename={$this->source_image};");
		header("Content-Type: {$this->mime_type}");
		header('Content-Transfer-Encoding: binary');
		header('Expires: '.gmdate('D, d M Y H:i:s', time()+24*60*60).' GMT');
        header('Cache-Control: public, max-age=86400, pre-check=86400');
        Header('Pragma: public');

		switch ($this->image_type)
		{
			case 1		:	imagegif($resource);
				break;
			case 2		:	imagejpeg($resource, NULL, $this->quality);
				break;
			case 3		:	imagepng($resource);
				break;
			default		:	echo 'Unable to display the image';
				break;
		}
	}

	function set_error($msg) {
    }
}