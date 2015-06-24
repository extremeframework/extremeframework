<?php include('header.tpl'); ?>

<div class="form">
    <div class="install-header">
        <h3><?php _e('Completed'); ?></h3>
    </div>

    <div class="install-guide"><?php _e('Well done! The system have been successfully installed.'); ?></div>

    <div class="install-content">
        <?php _e('<a href="%s"><button>Go to the admin panel</button></a>', $root_url.'/admin'); ?>
        <?php _e('<a href="%s"><button>Visit the front site</button></a>', $root_url); ?>
    </div>
</div>

<?php include('footer.tpl'); ?>