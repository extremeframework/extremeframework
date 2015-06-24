<?php
/**
 * Plugin Name: List Gear Icon
 * Version : 0.1
 * Author : Tran Quoc Viet
 * Description : This will add a gear button to all table header rows
 * Plugin URL : http://www.extremeframework.com
 * Author URL : http://www.extremeframework.com
 */
function plugin_list_gear_icon($args) {
?>
    <script type="text/javascript">
        $(document).ready(function(){
            $('table.item_list').each(function(){
                var table = $(this);

                var module = table.data('module');

                var th = table.find('th.actions');

                var gear = '<i class="fa fa-cog"></i>';

                th.append(gear);
            });
        });
    </script>
<?php
}

PluginManager::add_action('generic_list_after', 'plugin_list_gear_icon');