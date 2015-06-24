<?php include('header.tpl'); ?>

<div class="form">
    <div class="install-header">
        <h3><?php _e('Configuration File Creation'); ?></h3>
    </div>

    <?php if (!empty($message)) : ?>
        <div class="install-message"><?php echo $message; ?></div>
    <?php endif; ?>

    <form action="?step=7" method="post">

    <div class="install-content">
        <?php if (empty($message)) : ?>
            <p><?php _e('Everything is OK.'); ?></p>
            <p><?php _e('Click Next to start creating configuration files.'); ?></p>
        <?php endif; ?>
    </div>

    <div class="install-footer">
        <button class="btn-next" type="submit" name="button" value="next"><?php _e('Next'); ?></button>
    </div>

    </form>
</div>

<?php include('footer.tpl'); ?>