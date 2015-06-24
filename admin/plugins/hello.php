<?php
/**
 * Plugin Name : Hello World
 * Version : 0.1
 * Author : Tran Quoc Viet
 * Description : This is an example plugin that will popup a Javascript message 'Hello World'
 * Plugin URL : http://www.extremeframework.com
 * Author URL : http://www.extremeframework.com
 */
function plugin_hello($args) {
?>
    <script type="text/javascript">
        $(document).ready(function(){
            alert("Hello World");
        });
    </script>
<?php
}

PluginManager::add_action('generic_head', 'plugin_hello');