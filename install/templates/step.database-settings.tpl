<?php include('header.tpl'); ?>

<div class="form">
    <div class="install-header">
        <h3><?php _e('Database Settings'); ?></h3>
    </div>

    <div class="install-guide"><?php _e('Enter your database connection details. If you\'re not sure about these, contact your host.'); ?></div>

    <?php if (!empty($message)) : ?>
        <div class="install-message"><?php echo $message; ?></div>
    <?php endif; ?>

    <form action="?step=3" method="post">

    <div class="install-content">
        <table class="table">
            <tbody>
                <tr>
                    <td><?php _e('Database name'); ?></td>
                    <td><input type="text" name="database_name" value="<?php echo $settings['database_name']; ?>"/></td>
                </tr>
                <tr>
                    <td><?php _e('Database host'); ?></td>
                    <td><input type="text" name="database_host" value="<?php echo $settings['database_host']; ?>"/></td>
                </tr>
                <tr>
                    <td><?php _e('Database username'); ?></td>
                    <td><input type="text" name="database_username" value="<?php echo $settings['database_username']; ?>"/></td>
                </tr>
                <tr>
                    <td><?php _e('Database password'); ?></td>
                    <td><input type="password" name="database_password" value="<?php echo $settings['database_password']; ?>"/></td>
                </tr>
                <tr>
                    <td><?php _e('Table prefix'); ?></td>
                    <td><input type="text" name="table_prefix" value="<?php echo $settings['table_prefix']; ?>"/></td>
                </tr>

            </tbody>
        </table>
    </div>

    <div class="install-footer">
        <button class="btn-next" type="submit" name="button" value="next"><?php _e('Next'); ?></button>
    </div>

    </form>
</div>

<?php include('footer.tpl'); ?>