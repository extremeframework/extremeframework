<div class="edit-main edit_details">
    <{if $messages}>
        <ul class="message">
            <{foreach from=$messages key=field item=message}>
                <li data-error-field="<{$field}>"><{$message}></li>
            <{/foreach}>
        </ul>
    <{/if}>

    <form name="workflowtransitionform" id="workflowtransitionform" class="form-edit scope-main" action="<{$smarty.const.APPLICATION_URL}>/workflowtransition/save/?back=1" method="post" enctype="multipart/form-data">
        <input type="hidden" name="workflowtransition_formdata_UUID" value="<{$details->UUID}>" />
        <input type="hidden" name="view-type" value="edit" />
        <{if isset($preset)}><input type="hidden" name="preset" value="<{$preset}>" /><{/if}>
        <{if isset($presetvalue)}><input type="hidden" name="presetvalue" value="<{$presetvalue}>" /><{/if}>
        <{if isset($presetparams)}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="preset_<{$key}>" value="<{$value}>" />
                <input type="hidden" name="workflowtransition_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>

        <{plugin key="workflowtransition_form_top" args=$details}>

                    <!-- Standard layout rows -->
            <table class="table table-bordered table-custom-layout equal-split">
                <tbody>
                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['ID_WORKFLOW'])}>
    
        <{if $preset == 'ID_WORKFLOW'}>
            <input type="hidden" class="input-id-workflow" name="workflowtransition_formdata_ID_WORKFLOW" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ID_WORKFLOW']) && !$acleditablecolumns['ID_WORKFLOW'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ID_WORKFLOW'])}>
            <input type="hidden" class="input-id-workflow" name="workflowtransition_formdata_ID_WORKFLOW" value="<{$details->ID_WORKFLOW}>" />
        <{else}>
    		<td class="form-row form-row-id-workflow">
                <div class="form-field form-field-label">
        		    <label><{_t('Workflow')}></label>
                </div>
            </td>
            <td class="form-row form-row-id-workflow" colspan="3">
                <div class="form-field form-field-value column-id-workflow">
                                            
            <{if Framework::hasModule('Workflow')}>
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-id-workflow" class="input-id-workflow" name="`$prefix`workflowtransition_formdata_ID_WORKFLOW" value=$details->ID_WORKFLOW text=$details->reftext_ID_WORKFLOW datasource="WORKFLOW" valuecol="CODE" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

                            <{if isset($smarty.session.acl.workflow.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/workflow/new" title="Create a New Workflow">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-workflow input-type-text" type="text" name="<{$prefix}>workflowtransition_formdata_ID_WORKFLOW" value="<{$details->ID_WORKFLOW|escape}>"  />
        <{/if}>
                            <{if $columntooltips.ID_WORKFLOW}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.ID_WORKFLOW}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['NAME'])}>
    
        <{if $preset == 'NAME'}>
            <input type="hidden" class="input-name" name="workflowtransition_formdata_NAME" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['NAME']) && !$acleditablecolumns['NAME'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['NAME'])}>
            <input type="hidden" class="input-name" name="workflowtransition_formdata_NAME" value="<{$details->NAME}>" />
        <{else}>
    		<td class="form-row form-row-name form-row-mandatory">
                <div class="form-field form-field-label">
        		    <label><{_t('Workflow transition name')}><span class="mandatory">*</span></label>
                </div>
            </td>
            <td class="form-row form-row-name form-row-mandatory" colspan="3">
                <div class="form-field form-field-value column-name">
                                            

    <input class="input-name input-type-text" type="text" name="<{$prefix}>workflowtransition_formdata_NAME" value="<{$details->NAME|escape}>"  />
                        <{if $columntooltips.NAME}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.NAME}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['CODE'])}>
    
        <{if $preset == 'CODE'}>
            <input type="hidden" class="input-code" name="workflowtransition_formdata_CODE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['CODE']) && !$acleditablecolumns['CODE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['CODE'])}>
            <input type="hidden" class="input-code" name="workflowtransition_formdata_CODE" value="<{$details->CODE}>" />
        <{else}>
    		<td class="form-row form-row-code form-row-mandatory">
                <div class="form-field form-field-label">
        		    <label><{_t('Code')}><span class="mandatory">*</span></label>
                </div>
            </td>
            <td class="form-row form-row-code form-row-mandatory" colspan="3">
                <div class="form-field form-field-value column-code">
                                            <{if $details->ID && $details->CODE != ''}>
                            <input type="hidden" class="input-code" name="workflowtransition_formdata_CODE" value="<{$details->CODE}>" />
                            
    <{$details->CODE|escape}>
                        <{else}>
                            

    <input class="input-code input-type-text" type="text" name="<{$prefix}>workflowtransition_formdata_CODE" value="<{$details->CODE|escape}>"  />
                            <{if $columntooltips.CODE}>
                                <i class="fa fa-info-circle" title="<{$columntooltips.CODE}>"></i>
                            <{/if}>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['START_ID_WORKFLOW_STAGE'])}>
    
        <{if $preset == 'START_ID_WORKFLOW_STAGE'}>
            <input type="hidden" class="input-start-id-workflow-stage" name="workflowtransition_formdata_START_ID_WORKFLOW_STAGE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['START_ID_WORKFLOW_STAGE']) && !$acleditablecolumns['START_ID_WORKFLOW_STAGE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['START_ID_WORKFLOW_STAGE'])}>
            <input type="hidden" class="input-start-id-workflow-stage" name="workflowtransition_formdata_START_ID_WORKFLOW_STAGE" value="<{$details->START_ID_WORKFLOW_STAGE}>" />
        <{else}>
    		<td class="form-row form-row-start-id-workflow-stage">
                <div class="form-field form-field-label">
        		    <label><{_t('Start workflow stage')}></label>
                </div>
            </td>
            <td class="form-row form-row-start-id-workflow-stage" colspan="3">
                <div class="form-field form-field-value column-start-id-workflow-stage">
                                            
            <{if Framework::hasModule('WorkflowStage')}>
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-start-id-workflow-stage" class="input-start-id-workflow-stage" name="`$prefix`workflowtransition_formdata_START_ID_WORKFLOW_STAGE" value=$details->START_ID_WORKFLOW_STAGE text=$details->reftext_START_ID_WORKFLOW_STAGE datasource="WORKFLOW_STAGE" valuecol="CODE" textcol="NAME" sortcol="NAME" groupcol="ID_WORKFLOW" blankitem=""}>

                            <{if isset($smarty.session.acl.workflowstage.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/workflowstage/new" title="Create a New Workflow Stage">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-start-id-workflow-stage input-type-text" type="text" name="<{$prefix}>workflowtransition_formdata_START_ID_WORKFLOW_STAGE" value="<{$details->START_ID_WORKFLOW_STAGE|escape}>"  />
        <{/if}>
                            <{if $columntooltips.START_ID_WORKFLOW_STAGE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.START_ID_WORKFLOW_STAGE}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['END_ID_WORKFLOW_STAGE'])}>
    
        <{if $preset == 'END_ID_WORKFLOW_STAGE'}>
            <input type="hidden" class="input-end-id-workflow-stage" name="workflowtransition_formdata_END_ID_WORKFLOW_STAGE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['END_ID_WORKFLOW_STAGE']) && !$acleditablecolumns['END_ID_WORKFLOW_STAGE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['END_ID_WORKFLOW_STAGE'])}>
            <input type="hidden" class="input-end-id-workflow-stage" name="workflowtransition_formdata_END_ID_WORKFLOW_STAGE" value="<{$details->END_ID_WORKFLOW_STAGE}>" />
        <{else}>
    		<td class="form-row form-row-end-id-workflow-stage">
                <div class="form-field form-field-label">
        		    <label><{_t('End workflow stage')}></label>
                </div>
            </td>
            <td class="form-row form-row-end-id-workflow-stage" colspan="3">
                <div class="form-field form-field-value column-end-id-workflow-stage">
                                            
            <{if Framework::hasModule('WorkflowStage')}>
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-end-id-workflow-stage" class="input-end-id-workflow-stage" name="`$prefix`workflowtransition_formdata_END_ID_WORKFLOW_STAGE" value=$details->END_ID_WORKFLOW_STAGE text=$details->reftext_END_ID_WORKFLOW_STAGE datasource="WORKFLOW_STAGE" valuecol="CODE" textcol="NAME" sortcol="NAME" groupcol="ID_WORKFLOW" blankitem=""}>

                            <{if isset($smarty.session.acl.workflowstage.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/workflowstage/new" title="Create a New Workflow Stage">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-end-id-workflow-stage input-type-text" type="text" name="<{$prefix}>workflowtransition_formdata_END_ID_WORKFLOW_STAGE" value="<{$details->END_ID_WORKFLOW_STAGE|escape}>"  />
        <{/if}>
                            <{if $columntooltips.END_ID_WORKFLOW_STAGE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.END_ID_WORKFLOW_STAGE}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['ACTION'])}>
    
        <{if $preset == 'ACTION'}>
            <input type="hidden" class="input-action" name="workflowtransition_formdata_ACTION" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ACTION']) && !$acleditablecolumns['ACTION'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ACTION'])}>
            <input type="hidden" class="input-action" name="workflowtransition_formdata_ACTION" value="<{$details->ACTION}>" />
        <{else}>
    		<td class="form-row form-row-action">
                <div class="form-field form-field-label">
        		    <label><{_t('Action')}></label>
                </div>
            </td>
            <td class="form-row form-row-action" colspan="3">
                <div class="form-field form-field-value column-action">
                                            

    <input class="input-action input-type-text" type="text" name="<{$prefix}>workflowtransition_formdata_ACTION" value="<{$details->ACTION|escape}>"  />
                        <{if $columntooltips.ACTION}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.ACTION}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['ID_USER_GROUP'])}>
    
        <{if $preset == 'ID_USER_GROUP'}>
            <input type="hidden" class="input-id-user-group" name="workflowtransition_formdata_ID_USER_GROUP" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ID_USER_GROUP']) && !$acleditablecolumns['ID_USER_GROUP'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ID_USER_GROUP'])}>
            <input type="hidden" class="input-id-user-group" name="workflowtransition_formdata_ID_USER_GROUP" value="<{$details->ID_USER_GROUP}>" />
        <{else}>
    		<td class="form-row form-row-id-user-group">
                <div class="form-field form-field-label">
        		    <label><{_t('User group')}></label>
                </div>
            </td>
            <td class="form-row form-row-id-user-group" colspan="3">
                <div class="form-field form-field-value column-id-user-group">
                                            
            <{if Framework::hasModule('UserGroup')}>
            <{html_ref_select multilingual="1" autocomplete="1" ajax="0" method="" id="input-id-user-group" class="input-id-user-group" name="`$prefix`workflowtransition_formdata_ID_USER_GROUP" value=$details->ID_USER_GROUP text=$details->reftext_ID_USER_GROUP datasource="USER_GROUP" valuecol="ID" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

                            <{if isset($smarty.session.acl.usergroup.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/usergroup/new" title="Create a New User Group">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-user-group input-type-text" type="text" name="<{$prefix}>workflowtransition_formdata_ID_USER_GROUP" value="<{$details->ID_USER_GROUP|escape}>"  />
        <{/if}>
                            <{if $columntooltips.ID_USER_GROUP}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.ID_USER_GROUP}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['ID_USER_ROLE'])}>
    
        <{if $preset == 'ID_USER_ROLE'}>
            <input type="hidden" class="input-id-user-role" name="workflowtransition_formdata_ID_USER_ROLE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ID_USER_ROLE']) && !$acleditablecolumns['ID_USER_ROLE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ID_USER_ROLE'])}>
            <input type="hidden" class="input-id-user-role" name="workflowtransition_formdata_ID_USER_ROLE" value="<{$details->ID_USER_ROLE}>" />
        <{else}>
    		<td class="form-row form-row-id-user-role">
                <div class="form-field form-field-label">
        		    <label><{_t('User role')}></label>
                </div>
            </td>
            <td class="form-row form-row-id-user-role" colspan="3">
                <div class="form-field form-field-value column-id-user-role">
                                            
            <{if Framework::hasModule('UserRole')}>
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-id-user-role" class="input-id-user-role" name="`$prefix`workflowtransition_formdata_ID_USER_ROLE" value=$details->ID_USER_ROLE text=$details->reftext_ID_USER_ROLE datasource="USER_ROLE" valuecol="ID" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

                            <{if isset($smarty.session.acl.userrole.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/userrole/new" title="Create a New User Role">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-user-role input-type-text" type="text" name="<{$prefix}>workflowtransition_formdata_ID_USER_ROLE" value="<{$details->ID_USER_ROLE|escape}>"  />
        <{/if}>
                            <{if $columntooltips.ID_USER_ROLE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.ID_USER_ROLE}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['TRANSITION_ID_SCREEN'])}>
    
        <{if $preset == 'TRANSITION_ID_SCREEN'}>
            <input type="hidden" class="input-transition-id-screen" name="workflowtransition_formdata_TRANSITION_ID_SCREEN" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['TRANSITION_ID_SCREEN']) && !$acleditablecolumns['TRANSITION_ID_SCREEN'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['TRANSITION_ID_SCREEN'])}>
            <input type="hidden" class="input-transition-id-screen" name="workflowtransition_formdata_TRANSITION_ID_SCREEN" value="<{$details->TRANSITION_ID_SCREEN}>" />
        <{else}>
    		<td class="form-row form-row-transition-id-screen">
                <div class="form-field form-field-label">
        		    <label><{_t('Transition screen')}></label>
                </div>
            </td>
            <td class="form-row form-row-transition-id-screen" colspan="3">
                <div class="form-field form-field-value column-transition-id-screen">
                                            
            <{if Framework::hasModule('Screen')}>
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-transition-id-screen" class="input-transition-id-screen" name="`$prefix`workflowtransition_formdata_TRANSITION_ID_SCREEN" value=$details->TRANSITION_ID_SCREEN text=$details->reftext_TRANSITION_ID_SCREEN datasource="SCREEN" valuecol="CODE" textcol="TITLE" sortcol="TITLE" groupcol="" blankitem=""}>

                            <{if isset($smarty.session.acl.screen.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/screen/new" title="Create a New Screen">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-transition-id-screen input-type-text" type="text" name="<{$prefix}>workflowtransition_formdata_TRANSITION_ID_SCREEN" value="<{$details->TRANSITION_ID_SCREEN|escape}>"  />
        <{/if}>
                            <{if $columntooltips.TRANSITION_ID_SCREEN}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.TRANSITION_ID_SCREEN}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['ORDERING'])}>
    
        <{if $preset == 'ORDERING'}>
            <input type="hidden" class="input-ordering" name="workflowtransition_formdata_ORDERING" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ORDERING']) && !$acleditablecolumns['ORDERING'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ORDERING'])}>
            <input type="hidden" class="input-ordering" name="workflowtransition_formdata_ORDERING" value="<{$details->ORDERING}>" />
        <{else}>
    		<td class="form-row form-row-ordering">
                <div class="form-field form-field-label">
        		    <label><{_t('Ordering')}></label>
                </div>
            </td>
            <td class="form-row form-row-ordering" colspan="3">
                <div class="form-field form-field-value column-ordering">
                                            
        <input class="input-ordering input-type-number number-format" type="text" name="<{$prefix}>workflowtransition_formdata_ORDERING" value="<{if $details->ORDERING != 0}><{$details->ORDERING}><{/if}>"  />
                        <{if $columntooltips.ORDERING}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.ORDERING}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                    </tbody>
            </table>
        	<!-- Standard layout rows end -->
        
        <{if $customfields}>
            <div class="layout-block layout-block-section">
                <div class="layout-section">
                    <div class="layout-section-header">
                        <span><{_t('Additional information')}></span>
                        <div class="header-arrow"></div>
                        <div class="clearer"></div>
                    </div>
                    <div class="layout-section-content">
                        <table class="table table-bordered table-custom-layout equal-split">
                            <tbody>
                                <{foreach from=$customfields item=item}>
                                    <tr class="form-row form-row-<{$item->COLUMN_CODE}><{if $item->IS_REQUIRED}> form-row-mandatory<{/if}>">
                                		<td>
                                            <div class="form-field form-field-label">
                                    		    <label><{_t($item->NAME)}><{if $item->IS_REQUIRED}><span class="mandatory">*</span><{/if}></label>
                                            </div>
                                        </td>
                                        <td colspan="3">
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

        <{plugin key="workflowtransition_form_bottom" args=$details}>
    </form>
</div>

    <{if $details->UUID == 0}>
        <script type="text/javascript">
            $(document).ready(function() {
                                                            alias_hint('workflowtransition_formdata_NAME', 'workflowtransition_formdata_CODE');
                                                });
        </script>
    <{/if}>


<script type="text/javascript">
    $(function() {
        if (document.activeElement == document.body) {
        	$('#workflowtransitionform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<script type="text/javascript">
    $('#workflowtransitionform :input').change(function() {
        $('#workflowtransitionform').data('changed', true);
    });

        function saveDraft() {
        if ($('#workflowtransitionform').length) {
            if ($('#workflowtransitionform').data('changed')) {
                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/workflowtransition/savedraft/",
                    data: $('#workflowtransitionform').serialize()
                });

                $('#workflowtransitionform').data('changed', false);
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
    workflowtransition_get_editing_model = function () {
        var model = {};

        var formdata = $('#workflowtransitionform').find('[name*=workflowtransition_formdata]').serializeArray();

        jQuery.map(formdata, function(x) {
            x.name = x.name.replace('workflowtransition_formdata_', '');

            model[x.name] = x.value;

            return x;
        });

        return model;
    }

    workflowtransition_get_visibility_settings = function (model) {
        var settings = {};

        // Rules based on dependency settings
        <{foreach from=$fielddependencies item=item}>
            <{foreach from=$item->DEPENDENCY_COLUMNS item=column}>
                settings['<{$column}>'] = in_array(model['<{$item->SOURCE_COLUMN}>'], ['<{implode("', '", $item->SOURCE_VALUES)}>']);
            <{/foreach}>
        <{/foreach}>

        return settings;
    }

    workflowtransition_apply_visibility_settings = function (settings) {
        $.each(settings, function(key, value) {
            workflowtransition_apply_block_visibility(key, value);
        });
    }

    workflowtransition_apply_block_visibility = function (key, value) {
        var block = $('.form-row-' + key.toLowerCase().replace(/_/g, '-'));

        if (value) {
            block.show();
        } else {
            block.hide();
        }
    }

    workflowtransition_update_visibility_settings = function () {
        var model = workflowtransition_get_editing_model();

        var settings = workflowtransition_get_visibility_settings(model);

        workflowtransition_apply_visibility_settings(settings);
    }

    $(function() {
        $('#workflowtransitionform :input').change(function() {
            workflowtransition_update_visibility_settings();
        });

        workflowtransition_update_visibility_settings();
    });
</script>