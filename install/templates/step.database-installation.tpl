<?php include('header.tpl'); ?>

<div class="form">
    <div class="install-header">
        <h3><?php _e('Database Installation'); ?></h3>
    </div>

    <?php if (!empty($message)) : ?>
        <div class="install-guide"><?php _e('Installing database....failed.'); ?></div>
        <div class="install-message"><?php echo $message; ?></div>
    <?php endif; ?>

    <form action="?step=4" method="post">

    <div class="install-content">
        <?php if (empty($message)) : ?>
            <p><?php _e('Database connection OK.'); ?></p>
            <p><?php _e('Click Install to start installing the database.'); ?></p>
        <?php endif; ?>
    </div>

    <div class="install-footer">
        <button class="btn-next" type="submit" name="button" value="next"><?php echo $ok? _t('Install') : _t('Retry'); ?></button>

        <?php if ($data_exists) : ?>
            <button class="btn-skip" style="float:right" type="submit" name="button" value="skip"><?php _e('Skip'); ?></button>
        <?php endif; ?>
    </div>

    </form>
</div>

<?php include('footer.tpl'); ?>