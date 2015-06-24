<?php include('header.tpl'); ?>

<div class="form">
    <div class="install-header">
        <h3><?php _e('Language Selection'); ?></h3>
    </div>

    <?php if (!empty($message)) : ?>
        <div class="install-message"><?php echo $message; ?></div>
    <?php endif; ?>

    <form action="?step=0" method="post">

    <div class="install-content">
        <select size='14' name='language' id='language' style="width:150px">
            <option value="en-us" data-next="Continue" data-select="Language Selection">English</option>
            <option value="fr-fr" data-next="Continuer" data-select="Langue Sélection">Français</option>
            <option value="vi-vn" data-next="Tiếp tục" data-select="Chọn ngôn ngữ cài đặt">Tiếng Việt</option>
        </select>
    </div>

    <div class="install-footer">
        <button class="btn-next" type="submit" name="button" value="next"><?php _e('Next'); ?></button>
    </div>

    </form>
</div>

<script type="text/javascript">
    $(document).ready(function(){
        $('.btn-next').attr('disabled', 'disabled');

        $('#language').change(function() {
            var option = $('#language').find(":selected");

            var next = option.data('next');
            var select = option.data('select');

            $('.install-header h3').text(select);
            $('.btn-next').text(next).removeAttr('disabled');
        });
    });
</script>

<?php include('footer.tpl'); ?>