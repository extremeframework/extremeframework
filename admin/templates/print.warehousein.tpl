    <{assign var='meta_description' value=$details->TITLE}>
    <{include file="header.tpl"}>

    </head>

    <body class="module module-<{$module}>" id="<{$module}>">

    <{$tmp1 = strtolower(_t('L_VIEW'))}>
    <{$tmp2 = strtolower(_t('L_WAREHOUSE_IN'))}>
    <{$title = "$tmp1 $tmp2"}>

    <{include file="top.tpl"}>

    <h1 class="heading hidden-print">
        <span class="h"><{$title}></span>

        <!-- Prev / Next -->
        <span style="margin-left:10px; font-size:12px; font-weight: normal">
            <{if $previd}>
                <a style="text-decoration: none" class="button-view-prev scope-main" href="<{$smarty.const.APPLICATION_URL}>/warehousein/view/<{$previd}>"><{label key="L_PREV"}></a>&nbsp;
            <{/if}>
            <{if $nextid}>
                <a style="text-decoration: none" class="button-view-next scope-main" href="<{$smarty.const.APPLICATION_URL}>/warehousein/view/<{$nextid}>"><{label key="L_NEXT"}></a>
            <{/if}>
            &nbsp;&nbsp;<a style="text-decoration: none" class="button-view-refresh scope-main" href="<{$smarty.const.APPLICATION_URL}>/warehousein/view/<{$details->ID}>"><i class="fa fa-refresh"></i></a>
        </span>
    </h1>

<div id="warehouseinview" class="view_details mainview">

<{if isset($messages.warehousein) }>
<{foreach from=$messages.warehousein key=ignored item=message}>
<li><{$message}></li>
<{/foreach}>
<{/if}>

<!-- Control bar -->
<div class="view-control-bar hidden-print">
    <!-- Language bar -->

    <!-- Control buttons -->
    <div class="view-buttons">
    	<{if $details->ID}>
    		    			<{if isset($smarty.session.acl.warehousein.edit) }>
    		    <div class="button-general">
    		        <a class="button-edit scope-main" href="<{$smarty.const.APPLICATION_URL}>/warehousein/edit/<{$details->ID}><{if isset($preset)}>/preset/<{$preset}><{/if}><{if isset($presetvalue)}>/presetvalue/<{$presetvalue}><{/if}>"><span class="button-face"><{label key="L_EDIT"}></span></a>
    		    </div>
    		    <{/if}>
    		    	    <{foreach from=$additional_view_buttons item=button}>
    		    <div class="button-general button-additional">
    		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
    		    </div>
    	    <{/foreach}>

    	    	    		            		            <{if isset($smarty.session.acl.warehousein.delete) }>
    		            		            <div class="button-general">
    		                <a class="button-delete scope-main" href="<{$smarty.const.APPLICATION_URL}>/warehousein/delete/<{$details->ID}>"><span class="button-face"><{label key="L_DELETE"}></span></a>
    		            </div>
    		            		            <{/if}>
    		            	            	            <{else}>
    		        <{/if}>
            	        <div class="button-general">
            <a class="button-close scope-main" href="<{$smarty.const.APPLICATION_URL}>/warehousein/close/"><span class="button-face"><{label key="L_CLOSE"}></span></a>
        </div>
    	        <div class="clearer"></div>
    </div>
</div>

<!-- Details -->
<div class="section">
    <div>
        <div class="mirror-title" style="clear:none;display:none;"></div>
<style>
.form-header {
    font-weight: bold;
}
.form-header-middle {
    text-align: center;
}
.form-header-right {
    text-align: right;
}
.form-footer-section {
    float: left;
    min-width: 20%;
    text-align: center;
}
.form-line {
    margin: 10px 0;
}
.form-header {
    margin-bottom:10px;
}
.form-footer {
    margin-top:10px;
}
</style>

        <div class="row form-header">
            <div class="col-xs-6 col-sm-4 form-header-left">
                <div>Công ty TNHH An Loc</div>
                <div>Địa chỉ: TT An Lộc- Bình Long</div>
            </div>
            <div class="col-xs-6 col-sm-4 form-header-middle">
                <div>Phiếu nhập kho</div>
                <div>Ngày 21/03/2014</div>
                <div>Số PNK-38</div>
            </div>
            <div class="col-xs-6 col-sm-4 form-header-right">
                <div>Mẫu số 32 - ND 48</div>
            </div>
            <div class="clearer"></div>
        </div>

        <div class="row form-line">Họ tên người giao hàng: Cty xăng dầu Sông Bé - TNHH MTV</div>
        <div class="row form-line">Địa chỉ:</div>
        <div class="row form-line">Lý do nhập:</div>
        <div class="row form-line">Nhập vào kho:</div>

        <table class="item_list">
            <thead>
                <tr>
                    <th>
                        Tên vật tư
                    </th>
                    <th>
                        Đvt
                    </th>
                    <th>
                        Số lượng
                    </th>
                    <th>
                        Đơn giá
                    </th>
                    <th>
                        Thành tiền
                    </th>
                </tr>
            </thead>

            <tbody>
                {loop}
                <tr>
                    <td>
                        Dầu DO
                    </td>
                    <td>
                        lít
                    </td>
                    <td>
                        52,199
                    </td>
                    <td>
                        20,257
                    </td>
                    <td>
                        1,055,124
                    </td>
                </tr>
                {/loop}
            </tbody>
        </table>

        <div class="row form-footer">
            <div class="form-footer-section col-xs-6 col-sm-4">
                <div>Thủ kho</div>
                <div>(ký tên)</div>
            </div>
            <div class="form-footer-section col-xs-6 col-sm-4">
                <div>Kế toán</div>
                <div>(ký tên)</div>
            </div>
            <div class="form-footer-section col-xs-6 col-sm-4">
                <div>Thủ quỹ</div>
                <div>(ký tên)</div>
            </div>
            <div class="clearer"></div>
        </div>

<!-- ////////////////////////////////// -->

    </div>
    <div class="clearer"></div>
</div>

<script type="text/javascript">
    $(document).ready(function(){
    	var origin = $('#warehouseinview .form-field-value .column-title');
    	var mirror = $('#warehouseinview .mirror-title');

    	mirror.html(origin.html());
    	mirror.addClass('mirror-name attribute-line column-name');
        mirror.show();
        //origin.hide();
    });
</script>

<script type="text/javascript">
    $(function() {
    	bind_hotkey('#warehouseinview', 'f2', '.button-edit');
    	bind_hotkey('#warehouseinview', 'esc', '.button-close');
    	bind_hotkey('#warehouseinview', 'left', '.button-view-prev');
    	bind_hotkey('#warehouseinview', 'right', '.button-view-next');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#warehouseinview :focusable:first').focus();
        }

    	$('#warehouseinview').click(function(){
    	    var focused = $('#warehouseinview :focus');

    	    if (focused.length == 0) {
                $('#warehouseinview :focusable:first').focus();
    	    }
    	});
    });

            $(function() {
        	//$('.view-buttons').scrollToFixed();
        });
    </script>

<script type="text/javascript">
    $(function() {
        $('meta[name=description]').attr('content', '<{$meta_description|escape}>');
    });
</script>

<{include file="footer.tpl"}>