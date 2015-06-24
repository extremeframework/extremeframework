<?php include('header.tpl'); ?>

<div class="form">
    <div class="install-header">
        <h3><?php _e('Welcome'); ?></h3>
    </div>

    <?php if (!empty($message)) : ?>
        <div class="install-message"><?php echo $message; ?></div>
    <?php endif; ?>

    <form action="?step=1" method="post">

    <div class="install-content">
        <p><?php _e('Welcome to Apps4Clouds installation wizard. We will guide you through all installation steps.'); ?></p>

        <p><?php _e('Click Next to start checking system requirements.'); ?></p>
    </div>

    <div class="install-footer">
        <button class="btn-next" type="submit" name="button" value="next"><?php _e('Next'); ?></button>
    </div>

    </form>
</div>

<?php include('footer.tpl'); ?>