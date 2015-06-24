<?php include('header.tpl'); ?>

<div class="form">
    <div class="install-header">
        <h3><?php _e('System Checking'); ?></h3>
    </div>

    <div class="install-guide"><?php _e('Before you can continue, all system requirements must be satisfied.'); ?></div>

    <?php if (!empty($message)) : ?>
        <div class="install-message"><?php echo $message; ?></div>
    <?php endif; ?>

    <form action="?step=2" method="post">

    <div class="install-content">
        <pre>
<?php _e('Apache modules'); ?>:
<?php foreach ($apache_modules_status as $module => $status) : ?>
    <?php echo $module; ?> : <?php echo $status? _t('OK') : '<span class="missing">'._t('Missing').'</span>'; ?>

<?php endforeach; ?>

<?php _e('PHP extensions'); ?>:
<?php foreach ($php_extensions_status as $extension => $status) : ?>
    <?php echo $extension; ?> : <?php echo $status? _t('OK') : '<span class="missing">'._t('Missing').'</span>'; ?>

<?php endforeach; ?>

<?php _e('Directory and files'); ?>:
    <?php echo 'admin/app_config.php'; ?> : <?php echo $is_admin_writable? _t('OK') : '<span class="missing">'._t('Not writable').'</span>'; ?>

    <?php echo 'admin/cache'; ?> : <?php echo $is_admin_template_pub_writable? _t('OK') : '<span class="missing">'._t('Not writable').'</span>'; ?>

    <?php echo 'front/app_config.php'; ?> : <?php echo $is_front_writable? _t('OK') : '<span class="missing">'._t('Not writable').'</span>'; ?>

    <?php echo 'front/cache'; ?> : <?php echo $is_front_template_pub_writable? _t('OK') : '<span class="missing">'._t('Not writable').'</span>'; ?>

    <?php echo 'public/uploads'; ?> : <?php echo $is_upload_dir_writable? _t('OK') : '<span class="missing">'._t('Not writable').'</span>'; ?>

    <?php echo 'shared/app_config.php'; ?> : <?php echo $is_shared_writable? _t('OK') : '<span class="missing">'._t('Not writable').'</span>'; ?>

    <?php echo 'shared/app_constant.php'; ?> : <?php echo $is_constant_writable? _t('OK') : '<span class="missing">'._t('Not writable').'</span>'; ?>

        </pre>
    </div>

    <div class="install-footer">
        <button class="btn-next" type="submit" name="button" value="next"><?php echo $ok? _e('Next') : _e('Retry'); ?></button>
    </div>

    </form>
</div>

<?php include('footer.tpl'); ?>