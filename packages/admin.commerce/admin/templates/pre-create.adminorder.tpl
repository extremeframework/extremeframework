<div class="modal-header">
    <button class="close" aria-hidden="true" data-dismiss="modal" type="button" title="<{$smarty.const.L_CLOSE}>">x</button>
    <h3><{label key="L_NEW" format="ucwords"}> <{$smarty.const.L_ADMIN_ORDER|ucwords}></h3>
</div>


<div id="adminorder-edit" class="edit_details">

    <{if !isset($prefix) }>
        <{assign var='prefix' value=''}>
    <{/if}>

    <!-- Language bar -->
    
    
    <!-- Details -->
    <div class="section">
        <div>
                            <div class="edit-main edit_details">
    <{if isset($messages.adminorder) }>
        <ul class="message">
            <{foreach from=$messages.adminorder key=field item=message}>
                <li data-error-field="<{$field}>"><{$message}></li>
            <{/foreach}>
        </ul>
    <{/if}>

    <form name="adminorderform" id="adminorderform" class="form-edit scope-main" action="<{$smarty.const.APPLICATION_URL}>/adminorder/save/?back=1" method="post" enctype="multipart/form-data">
        <input type="hidden" name="adminorder_formdata_UUID" value="<{$details->UUID}>" />
        <input type="hidden" name="view-type" value="pre-create" />
        <{if isset($preset)}><input type="hidden" name="preset" value="<{$preset}>" /><{/if}>
        <{if isset($presetvalue)}><input type="hidden" name="presetvalue" value="<{$presetvalue}>" /><{/if}>
        <{if isset($presetparams)}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="preset_<{$key}>" value="<{$value}>" />
                <input type="hidden" name="adminorder_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>

        <{plugin key="adminorder_form_top" args=$details}>

                    <!-- Standard layout rows -->
            <table class="table table-bordered table-custom-layout equal-split">
                <tbody>
                                                                                                                                                <tr>
    
            
                    </tr>                                                                                            <tr>
    
            
                    </tr>                                                                                                                                                                                                                                                        <tr>
    
            
                    </tr>                                                                                            <tr>
    
            
                    </tr>                                                                                            <tr>
    
            
                    </tr>                                                                                                                                                <tr>
    
            
                    </tr>                                                                                                                                                <tr>
    
            
                    </tr>                                                                                                                                                                                                                                                                                                                                                                                                                    <tr>
    
            
                    </tr>                                                                                            <tr>
    
            
                    </tr>                                    </tbody>
            </table>
        	<!-- Standard layout rows end -->
        
        <{if $customfields}>
            <div class="layout-block layout-block-section">
                <div class="layout-section">
                    <div class="layout-section-header">
                        <span><{label text="L_ADDITIONAL_INFORMATION"}></span>
                        <div class="header-arrow"></div>
                        <div class="clearer"></div>
                    </div>
                    <div class="layout-section-content">
                        <table class="table table-bordered table-custom-layout equal-split">
                            <tbody>
                                <{foreach from=$customfields item=item}>
                                    <tr>
                                		<td class="form-row form-row-<{$item->COLUMN_CODE}><{if $item->IS_REQUIRED}> form-row-mandatory<{/if}>">
                                            <div class="form-field form-field-label">
                                    		    <label><{label text=$item->NAME}><{if $item->IS_REQUIRED}><span class="mandatory">*</span><{/if}></label>
                                            </div>
                                        </td>
                                        <td class="form-row form-row-<{$item->COLUMN_CODE}><{if $item->IS_REQUIRED}> form-row-mandatory<{/if}>" colspan="3">
                                            <div class="form-field form-field-value column-<{$item->COLUMN_CODE}>">
                                                <{include file="item.edit.tpl" customfield=$item id=$details->UUID value=CustomFieldHelper::getCustomFieldValue($details, $item->COLUMN)}>
                                            </div>
                                        </td>
                            		</tr>
                            	<{/foreach}>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        <{/if}>

        <{plugin key="adminorder_form_bottom" args=$details}>
    </form>
</div>



<script type="text/javascript">
    $(function() {
        if (document.activeElement == document.body) {
        	$('#adminorderform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<script type="text/javascript">
    $('#adminorderform :input').change(function() {
        $('#adminorderform').data('changed', true);
    });

        function saveDraft() {
        if ($('#adminorderform').length) {
            if ($('#adminorderform').data('changed')) {
                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/adminorder/savedraft/",
                    data: $('#adminorderform').serialize()
                });

                $('#adminorderform').data('changed', false);
            }
        }
    }

    $(function() {
        if (window.saveDraftTimer !== 'undefined' && window.saveDraftTimer != null) {
            window.clearInterval(window.saveDraftTimer);
        }

        window.saveDraftTimer = window.setInterval(saveDraft, <{$smarty.const.SAVE_DRAFT_INTERVAL}> * 1000);
    });
    </script>

<script type="text/javascript">
    $(function() {
        $('.message li').each(function(){
            var li = $(this);
            var field = li.data('error-field');
            var target = $('.input-' + field);

            target.closest('tr').addClass('form-row-with-error');

            li.css('cursor', 'pointer').click(function(){
                target.focus();
            });
        });
    });
</script>

<script type="text/javascript">
    ///////////////////////////////////////////////////////////////////////////////
    // VISIBILITY REFLECTION
    adminorder_get_editing_model = function () {
        var model = {};

        var formdata = $('#adminorderform').find('[name*=adminorder_formdata]').serializeArray();

        jQuery.map(formdata, function(x) {
            x.name = x.name.replace('adminorder_formdata_', '');

            model[x.name] = x.value;

            return x;
        });

        return model;
    }

    adminorder_get_visibility_settings = function (model) {
        var settings = {};

        // Rules based on dependency settings
        <{foreach from=$fielddependencies item=item}>
            <{foreach from=$item->DEPENDENCY_COLUMNS item=column}>
                settings['<{$column}>'] = in_array(model['<{$item->SOURCE_COLUMN}>'], ['<{implode("', '", $item->SOURCE_VALUES)}>']);
            <{/foreach}>
        <{/foreach}>

        return settings;
    }

    adminorder_apply_visibility_settings = function (settings) {
        $.each(settings, function(key, value) {
            adminorder_apply_block_visibility(key, value);
        });
    }

    adminorder_apply_block_visibility = function (key, value) {
        var block = $('.form-row-' + key.toLowerCase().replace(/_/g, '-'));

        if (value) {
            block.show();
        } else {
            block.hide();
        }
    }

    adminorder_update_visibility_settings = function () {
        var model = adminorder_get_editing_model();

        var settings = adminorder_get_visibility_settings(model);

        adminorder_apply_visibility_settings(settings);
    }

    $(function() {
        $('#adminorderform :input').change(function() {
            adminorder_update_visibility_settings();
        });

        adminorder_update_visibility_settings();
    });
</script>                    </div>
    </div>

        <{assign var='canaccess2anytab' value='0'}>
            <{if isset($smarty.session.acl.adminorderitem) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
    
    <{if $canaccess2anytab}>
        <div id="adminordertabs" class="section">
            <ul>
                                <{if isset($smarty.session.acl.adminorderitem) }>
                    <li><a href="#tab-adminorderitems"><{label key="L_ADMIN_ORDER_ITEM"}> <span class="badge adminorderitem-badge-count"></span></a></li>
                <{/if}>
                            </ul>

                            <{if isset($smarty.session.acl.adminorderitem) }>
                    <div id="tab-adminorderitems">
                    	<{if true || $tab == 'adminorderitems'}>
                        	<h2 class="print"><{label key="L_ADMIN_ORDER_ITEM"}></h2>
                                                            <{ajaxmodule class="WidgetListAdminOrderItem" method="" readonly=!WorkflowHelper::isEditable($details->WFID) ID_ADMIN_ORDER="`$details->ID`" where=""  template='widgetlist.adminorderitem.tpl'}>
                                                    <{/if}>
                    </div>
                <{/if}>
                    </div>

        <script type="text/javascript">
        $(document).ready(function(){
        	$( "#adminordertabs" ).tabs({
        		cookie: {
        			// store cookie for a day, without, it would be a session cookie
        			expires: 1
        		}
        	});
        });
        </script>
    <{/if}>

    
            <div class="modal-footer quickCreateActions">
            <a class="btn-cancel pull-right" type="reset" data-dismiss="modal"><{label key="L_CANCEL"}></a>
            <button class="btn btn-success" type="submit" onclick="$('#pageform').submit()">
                <strong><{label key="L_SAVE"}></strong>
            </button>
                    </div>
    </div>

<script type="text/javascript">
    $(function() {
    	bind_hotkey('#adminorderform', 'f2', 'a.button-save');
    	bind_hotkey('#adminorderform', 'ctrl+s', 'a.button-save');
    	bind_hotkey('#adminorderform', 'f3', 'a.button-save-more');
    	bind_hotkey('#adminorderform', 'ctrl+m', 'a.button-save-more');
    	bind_hotkey('#adminorderform', 'esc', 'a.button-cancel');
    });
</script>

<script type="text/javascript">
    $(function() {
        $('meta[name=description]').attr('content', '<{$meta_description|escape}>');
    });
</script>