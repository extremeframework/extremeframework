<?php include('header.tpl'); ?>

<div class="form">
    <div class="install-header">
        <h3><?php _e('User Settings'); ?></h3>
    </div>

    <div class="install-guide"><?php _e('Enter an username and password to create a first admin user.'); ?></div>

    <?php if (!empty($message)) : ?>
        <div class="install-message"><?php echo $message; ?></div>
    <?php endif; ?>

    <form action="?step=6" method="post">

    <div class="install-content">
        <table class="table">
            <tbody>
                <tr>
                    <td><?php _e('Username'); ?></td>
                    <td><input name="admin_username" value="<?php echo $settings['admin_username']; ?>"/></td>
                </tr>
                <tr>
                    <td><?php _e('Password'); ?></td>
                    <td><input name="admin_password" type="password" value="<?php echo $settings['admin_password']; ?>"/></td>
                </tr>
                <tr>
                    <td><?php _e('Re-type password'); ?></td>
                    <td><input name="admin_password2" type="password" value="<?php echo $settings['admin_password2']; ?>"/></td>
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