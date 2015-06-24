<?php
require_once(dirname(__FILE__).'/config.php');

$dir = opendir($uploads_dir);
while(false !== ( $file = readdir($dir)) ) {
    if (in_array(substr($file, -3), array('jpg', 'png', 'gif'))) {
        echo '<li>';
        echo '<a class="insert" href="'.$uploads_url.$file.'">&nbsp;</a>';
        echo '<a class="delete" href="'.$uploads_url.$file.'">&nbsp;</a>';
        echo '<img src="'.$thumbs_url.$file.'" alt="">';
        echo '</li>';
    }
}
closedir($dir);
?>