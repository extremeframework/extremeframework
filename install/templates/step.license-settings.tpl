<?php include('header.tpl'); ?>

<div class="form">
    <div class="install-header">
        <h3><?php _e('Licence Settings'); ?></h3>
    </div>

    <div class="install-guide"><?php _e('Enter your license details.'); ?></div>

    <?php if (!empty($message)) : ?>
        <div class="install-message"><?php echo $message; ?></div>
    <?php endif; ?>

    <form action="?step=5" method="post">

    <div class="install-content">
        <table class="table">
            <tbody>
                <tr>
                    <td><?php _e('Domain name'); ?></td>
                    <td><?php echo $domain_name; ?></td>
                </tr>
                <tr>
                    <td><?php _e('License key'); ?></td>
                    <td><input name="license_key" value="<?php echo $settings['license_key']; ?>"/></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <p><?php _e('If you do not own a key you can create a key online:'); ?></p>
                        <p><?php _e('<a href="%s" target="blank"><span class="c">Create a license key</span></a>', LICENSE_ONLINE_CREATION_URL); ?></p>
                        <p><?php _e('<i>When you are asked to enter a machine code, please use the code:</i> <span class="m">%s</span>', $machine_code); ?>.</p>
                    </td>
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