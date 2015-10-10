<?php
function smarty_function_media($params, &$smarty)
{
    $html = '';

	$src = isset($params['src']) && !empty($params['src'])? $params['src'] : (isset($params['default'])? $params['default'] : '');

    if (empty($src)) {
        return '';
    }

	$thumbnail = isset($params['thumbnail'])? $params['thumbnail'] : false;
	$linkicon = isset($params['linkicon'])? $params['linkicon'] : false;
	$width = isset($params['width'])? $params['width'] : 0;
	$height = isset($params['height'])? $params['height'] : 0;
	$class = isset($params['class'])? $params['class'] : '';

    if (!empty($class)) {
        $class = ' class="'.$class.'" ';
    }

    if (preg_match('/\.(gif|jpg|jpeg|png|swf|flv|svg)/is', $src, $matches)) {
        $extension = $matches[1];

        if (preg_match('/(gif|jpg|jpeg|png|svg)/is', $extension)) {
            $remote = preg_match('/http/i', $src);

            if ($thumbnail && !$remote) {
                $width = $width? $width : THUMBS_WIDTH;
                $height = $height? $height : THUMBS_HEIGHT;

                $html = '<a class="fancybox" href="'.UPLOAD_URL.'/'.$src.'" target="blank"><img '.$class.'src="'.APPLICATION_URL.'/thumb/'.$width.'x'.$height.'/'.$src.'"/></a>';
            } else {
                $height = $height? $height : THUMBS_HEIGHT;

                if ($remote) {
                    $html = '<img '.$class.'src="'.$src.'" height="'.$height.'"/>';
                } else {
                    $html = '<img '.$class.'src="'.UPLOAD_URL.'/'.$src.'" height="'.$height.'"/>';
                }
            }
        } else if (preg_match('/(flv|swf)/is', $extension)) {
            if (preg_match_all('/([0-9 ]+)x([0-9 ]+)/is', $src, $matches, PREG_SET_ORDER)) {
                $matches = array_pop($matches);

                $width = trim($matches[1]);
                $height = trim($matches[2]);
            }

			//list($width, $height) = getimagesize($src);

			$width = max(400, $width);
			$height = max(300, $height);

            $html = '<object '.$class.' id="detectme" classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" border="0" width="'.$width.'" height="'.$height.'"><param name="movie" value="'.$src.'"><param name="AllowScriptAccess" value="samedomain"><param name="quality" value="High"><param name="wmode" value="transparent"><param name="FlashVars" value=""><embed src="'.$src.'"  name="detectme" flashvars="" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" play="true" loop="true" wmode="transparent" allowscriptaccess="samedomain" width="'.$width.'" height="'.$height.'"></object>';
        }
    } elseif (preg_match('/youtube\.com\/watch\?v=([a-z0-9]+)/is', $src, $matches)) {
        $html = '<object '.$class.' style="height: 390px; width: 640px"><param name="movie" value="http://www.youtube.com/v/'.$matches[1].'?version=3&feature=player_embedded"><param name="allowFullScreen" value="true"><param name="allowScriptAccess" value="always"><embed src="http://www.youtube.com/v/'.$matches[1].'?version=3&feature=player_embedded" type="application/x-shockwave-flash" allowfullscreen="true" allowScriptAccess="always" width="640" height="360"></object>';
    } else {
        $height = $height? $height : THUMBS_HEIGHT;

    	$html = '<img '.$class.'src="'.$src.'" height="'.$height.'"/>';
    }

    if ($linkicon) {
        $html .= '<span style="margin-left:3px;background:url('.APPLICATION_URL.'/images/link-icon.png) no-repeat;">&nbsp;&nbsp;&nbsp;&nbsp;</span>';
    }

	return $html;
}