<div class="view-main">
    <{plugin key="workflowtransition_view_top" args=$details}>

            <!-- Standard layout columns -->
        <table class="table table-bordered table-custom-layout equal-split">
            <tbody>
                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['ID_WORKFLOW']) && ((isset($aclviewablecolumns['ID_WORKFLOW']) && $aclviewablecolumns['ID_WORKFLOW']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_WORKFLOW']) || $aclviewablecolumns['ID_WORKFLOW']))) }>
        <{if !isset($columns2hide) || !in_array('ID_WORKFLOW', $columns2hide) }>
    		<td class="form-field form-field-label column-id-workflow">
	                    		                    		        <label class="attribute-name"><{_t('Workflow')}></label>
            </td>
            <td class="form-field form-field-value column-id-workflow" colspan="3">
            	<div class="attribute-line column-id-workflow type-reftext">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['ID_WORKFLOW']) && $acleditablecolumns['ID_WORKFLOW']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['ID_WORKFLOW']) || $acleditablecolumns['ID_WORKFLOW'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->reftext_ID_WORKFLOW}>
        <{if isset($smarty.session.acl.workflow.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/workflow/view/<{$details->refuuid_ID_WORKFLOW}>"><{$details->reftext_ID_WORKFLOW|escape}></a>
        <{else}>
            <{$details->reftext_ID_WORKFLOW|escape}>        <{/if}>
    <{else}>
		<{$details->ID_WORKFLOW}>
    <{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
            <{if Framework::hasModule('Workflow')}>
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-id-workflow" class="input-id-workflow" name="`$prefix`workflowtransition_formdata_ID_WORKFLOW" value=$details->ID_WORKFLOW text=$details->reftext_ID_WORKFLOW datasource="WORKFLOW" valuecol="CODE" textcol="NAME" sortcol=""}>

                            <{if isset($smarty.session.acl.workflow.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/workflow/new" title="Create a New Workflow">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-workflow input-type-text" type="text" name="<{$prefix}>workflowtransition_formdata_ID_WORKFLOW" value="<{$details->ID_WORKFLOW|escape}>"  />
        <{/if}>
                                    </span>
                                -->
                            <{else}>
                                
    <{if $details->reftext_ID_WORKFLOW}>
        <{if isset($smarty.session.acl.workflow.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/workflow/view/<{$details->refuuid_ID_WORKFLOW}>"><{$details->reftext_ID_WORKFLOW|escape}></a>
        <{else}>
            <{$details->reftext_ID_WORKFLOW|escape}>        <{/if}>
    <{else}>
		<{$details->ID_WORKFLOW}>
    <{/if}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['NAME']) && ((isset($aclviewablecolumns['NAME']) && $aclviewablecolumns['NAME']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['NAME']) || $aclviewablecolumns['NAME']))) }>
        <{if !isset($columns2hide) || !in_array('NAME', $columns2hide) }>
    		<td class="form-field form-field-label column-name">
	            		        <label class="attribute-name"><{_t('Name')}></label>
            </td>
            <td class="form-field form-field-value column-name" colspan="3">
            	<div class="attribute-line column-name type-text">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['NAME']) && $acleditablecolumns['NAME']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['NAME']) || $acleditablecolumns['NAME'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->NAME|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-name input-type-text" type="text" name="<{$prefix}>workflowtransition_formdata_NAME" value="<{$details->NAME|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->NAME|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['CODE']) && ((isset($aclviewablecolumns['CODE']) && $aclviewablecolumns['CODE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CODE']) || $aclviewablecolumns['CODE']))) }>
        <{if !isset($columns2hide) || !in_array('CODE', $columns2hide) }>
    		<td class="form-field form-field-label column-code">
	            		        <label class="attribute-name"><{_t('Code')}></label>
            </td>
            <td class="form-field form-field-value column-code" colspan="3">
            	<div class="attribute-line column-code type-text">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['CODE']) && $acleditablecolumns['CODE']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['CODE']) || $acleditablecolumns['CODE'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->CODE|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-code input-type-text" type="text" name="<{$prefix}>workflowtransition_formdata_CODE" value="<{$details->CODE|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->CODE|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['START_ID_WORKFLOW_STAGE']) && ((isset($aclviewablecolumns['START_ID_WORKFLOW_STAGE']) && $aclviewablecolumns['START_ID_WORKFLOW_STAGE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['START_ID_WORKFLOW_STAGE']) || $aclviewablecolumns['START_ID_WORKFLOW_STAGE']))) }>
        <{if !isset($columns2hide) || !in_array('START_ID_WORKFLOW_STAGE', $columns2hide) }>
    		<td class="form-field form-field-label column-start-id-workflow-stage">
	                    		        	                <{if isset($smarty.session.acl.workflowstage.view)}>
    	                    <{if $details->START_ID_WORKFLOW_STAGE}>
                                <i class="fa fa-caret-right row-expander view-row-expander" data-module="workflowstage" data-id="<{$details->refuuid_START_ID_WORKFLOW_STAGE}>"></i>
                            <{/if}>
                        <{/if}>
    	                            		        <label class="attribute-name"><{_t('Start workflow stage')}></label>
            </td>
            <td class="form-field form-field-value column-start-id-workflow-stage" colspan="3">
            	<div class="attribute-line column-start-id-workflow-stage type-reftext">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['START_ID_WORKFLOW_STAGE']) && $acleditablecolumns['START_ID_WORKFLOW_STAGE']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['START_ID_WORKFLOW_STAGE']) || $acleditablecolumns['START_ID_WORKFLOW_STAGE'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->reftext_START_ID_WORKFLOW_STAGE}>
        <{if isset($smarty.session.acl.workflowstage.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/workflowstage/view/<{$details->refuuid_START_ID_WORKFLOW_STAGE}>"><{$details->reftext_START_ID_WORKFLOW_STAGE|escape}></a>
        <{else}>
            <{$details->reftext_START_ID_WORKFLOW_STAGE|escape}>        <{/if}>
    <{else}>
		<{$details->START_ID_WORKFLOW_STAGE}>
    <{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
            <{if Framework::hasModule('WorkflowStage')}>
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-start-id-workflow-stage" class="input-start-id-workflow-stage" name="`$prefix`workflowtransition_formdata_START_ID_WORKFLOW_STAGE" value=$details->START_ID_WORKFLOW_STAGE text=$details->reftext_START_ID_WORKFLOW_STAGE datasource="WORKFLOW_STAGE" valuecol="CODE" textcol="NAME" sortcol=""}>

                            <{if isset($smarty.session.acl.workflowstage.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/workflowstage/new" title="Create a New Workflow Stage">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-start-id-workflow-stage input-type-text" type="text" name="<{$prefix}>workflowtransition_formdata_START_ID_WORKFLOW_STAGE" value="<{$details->START_ID_WORKFLOW_STAGE|escape}>"  />
        <{/if}>
                                    </span>
                                -->
                            <{else}>
                                
    <{if $details->reftext_START_ID_WORKFLOW_STAGE}>
        <{if isset($smarty.session.acl.workflowstage.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/workflowstage/view/<{$details->refuuid_START_ID_WORKFLOW_STAGE}>"><{$details->reftext_START_ID_WORKFLOW_STAGE|escape}></a>
        <{else}>
            <{$details->reftext_START_ID_WORKFLOW_STAGE|escape}>        <{/if}>
    <{else}>
		<{$details->START_ID_WORKFLOW_STAGE}>
    <{/if}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['END_ID_WORKFLOW_STAGE']) && ((isset($aclviewablecolumns['END_ID_WORKFLOW_STAGE']) && $aclviewablecolumns['END_ID_WORKFLOW_STAGE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['END_ID_WORKFLOW_STAGE']) || $aclviewablecolumns['END_ID_WORKFLOW_STAGE']))) }>
        <{if !isset($columns2hide) || !in_array('END_ID_WORKFLOW_STAGE', $columns2hide) }>
    		<td class="form-field form-field-label column-end-id-workflow-stage">
	                    		        	                <{if isset($smarty.session.acl.workflowstage.view)}>
    	                    <{if $details->END_ID_WORKFLOW_STAGE}>
                                <i class="fa fa-caret-right row-expander view-row-expander" data-module="workflowstage" data-id="<{$details->refuuid_END_ID_WORKFLOW_STAGE}>"></i>
                            <{/if}>
                        <{/if}>
    	                            		        <label class="attribute-name"><{_t('End workflow stage')}></label>
            </td>
            <td class="form-field form-field-value column-end-id-workflow-stage" colspan="3">
            	<div class="attribute-line column-end-id-workflow-stage type-reftext">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['END_ID_WORKFLOW_STAGE']) && $acleditablecolumns['END_ID_WORKFLOW_STAGE']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['END_ID_WORKFLOW_STAGE']) || $acleditablecolumns['END_ID_WORKFLOW_STAGE'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->reftext_END_ID_WORKFLOW_STAGE}>
        <{if isset($smarty.session.acl.workflowstage.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/workflowstage/view/<{$details->refuuid_END_ID_WORKFLOW_STAGE}>"><{$details->reftext_END_ID_WORKFLOW_STAGE|escape}></a>
        <{else}>
            <{$details->reftext_END_ID_WORKFLOW_STAGE|escape}>        <{/if}>
    <{else}>
		<{$details->END_ID_WORKFLOW_STAGE}>
    <{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
            <{if Framework::hasModule('WorkflowStage')}>
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-end-id-workflow-stage" class="input-end-id-workflow-stage" name="`$prefix`workflowtransition_formdata_END_ID_WORKFLOW_STAGE" value=$details->END_ID_WORKFLOW_STAGE text=$details->reftext_END_ID_WORKFLOW_STAGE datasource="WORKFLOW_STAGE" valuecol="CODE" textcol="NAME" sortcol=""}>

                            <{if isset($smarty.session.acl.workflowstage.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/workflowstage/new" title="Create a New Workflow Stage">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-end-id-workflow-stage input-type-text" type="text" name="<{$prefix}>workflowtransition_formdata_END_ID_WORKFLOW_STAGE" value="<{$details->END_ID_WORKFLOW_STAGE|escape}>"  />
        <{/if}>
                                    </span>
                                -->
                            <{else}>
                                
    <{if $details->reftext_END_ID_WORKFLOW_STAGE}>
        <{if isset($smarty.session.acl.workflowstage.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/workflowstage/view/<{$details->refuuid_END_ID_WORKFLOW_STAGE}>"><{$details->reftext_END_ID_WORKFLOW_STAGE|escape}></a>
        <{else}>
            <{$details->reftext_END_ID_WORKFLOW_STAGE|escape}>        <{/if}>
    <{else}>
		<{$details->END_ID_WORKFLOW_STAGE}>
    <{/if}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['ACTION']) && ((isset($aclviewablecolumns['ACTION']) && $aclviewablecolumns['ACTION']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ACTION']) || $aclviewablecolumns['ACTION']))) }>
        <{if !isset($columns2hide) || !in_array('ACTION', $columns2hide) }>
    		<td class="form-field form-field-label column-action">
	            		        <label class="attribute-name"><{_t('Action')}></label>
            </td>
            <td class="form-field form-field-value column-action" colspan="3">
            	<div class="attribute-line column-action type-text">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['ACTION']) && $acleditablecolumns['ACTION']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['ACTION']) || $acleditablecolumns['ACTION'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->ACTION|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-action input-type-text" type="text" name="<{$prefix}>workflowtransition_formdata_ACTION" value="<{$details->ACTION|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->ACTION|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['ID_USER_GROUP']) && ((isset($aclviewablecolumns['ID_USER_GROUP']) && $aclviewablecolumns['ID_USER_GROUP']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_USER_GROUP']) || $aclviewablecolumns['ID_USER_GROUP']))) }>
        <{if !isset($columns2hide) || !in_array('ID_USER_GROUP', $columns2hide) }>
    		<td class="form-field form-field-label column-id-user-group">
	                    		                    		        <label class="attribute-name"><{_t('User group')}></label>
            </td>
            <td class="form-field form-field-value column-id-user-group" colspan="3">
            	<div class="attribute-line column-id-user-group type-reftext">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['ID_USER_GROUP']) && $acleditablecolumns['ID_USER_GROUP']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['ID_USER_GROUP']) || $acleditablecolumns['ID_USER_GROUP'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->reftext_ID_USER_GROUP}>
        <{if isset($smarty.session.acl.usergroup.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/usergroup/view/<{$details->refuuid_ID_USER_GROUP}>"><{$details->reftext_ID_USER_GROUP|escape}></a>
        <{else}>
            <{$details->reftext_ID_USER_GROUP|escape}>        <{/if}>
    <{else}>
		<{$details->ID_USER_GROUP}>
    <{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
            <{if Framework::hasModule('UserGroup')}>
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-id-user-group" class="input-id-user-group" name="`$prefix`workflowtransition_formdata_ID_USER_GROUP" value=$details->ID_USER_GROUP text=$details->reftext_ID_USER_GROUP datasource="USER_GROUP" valuecol="ID" textcol="NAME" sortcol=""}>

                            <{if isset($smarty.session.acl.usergroup.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/usergroup/new" title="Create a New User Group">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-user-group input-type-text" type="text" name="<{$prefix}>workflowtransition_formdata_ID_USER_GROUP" value="<{$details->ID_USER_GROUP|escape}>"  />
        <{/if}>
                                    </span>
                                -->
                            <{else}>
                                
    <{if $details->reftext_ID_USER_GROUP}>
        <{if isset($smarty.session.acl.usergroup.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/usergroup/view/<{$details->refuuid_ID_USER_GROUP}>"><{$details->reftext_ID_USER_GROUP|escape}></a>
        <{else}>
            <{$details->reftext_ID_USER_GROUP|escape}>        <{/if}>
    <{else}>
		<{$details->ID_USER_GROUP}>
    <{/if}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['ID_USER_ROLE']) && ((isset($aclviewablecolumns['ID_USER_ROLE']) && $aclviewablecolumns['ID_USER_ROLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_USER_ROLE']) || $aclviewablecolumns['ID_USER_ROLE']))) }>
        <{if !isset($columns2hide) || !in_array('ID_USER_ROLE', $columns2hide) }>
    		<td class="form-field form-field-label column-id-user-role">
	                    		                    		        <label class="attribute-name"><{_t('User role')}></label>
            </td>
            <td class="form-field form-field-value column-id-user-role" colspan="3">
            	<div class="attribute-line column-id-user-role type-reftext">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['ID_USER_ROLE']) && $acleditablecolumns['ID_USER_ROLE']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['ID_USER_ROLE']) || $acleditablecolumns['ID_USER_ROLE'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->reftext_ID_USER_ROLE}>
        <{if isset($smarty.session.acl.userrole.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/userrole/view/<{$details->refuuid_ID_USER_ROLE}>"><{$details->reftext_ID_USER_ROLE|escape}></a>
        <{else}>
            <{$details->reftext_ID_USER_ROLE|escape}>        <{/if}>
    <{else}>
		<{$details->ID_USER_ROLE}>
    <{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
            <{if Framework::hasModule('UserRole')}>
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-id-user-role" class="input-id-user-role" name="`$prefix`workflowtransition_formdata_ID_USER_ROLE" value=$details->ID_USER_ROLE text=$details->reftext_ID_USER_ROLE datasource="USER_ROLE" valuecol="ID" textcol="NAME" sortcol=""}>

                            <{if isset($smarty.session.acl.userrole.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/userrole/new" title="Create a New User Role">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-user-role input-type-text" type="text" name="<{$prefix}>workflowtransition_formdata_ID_USER_ROLE" value="<{$details->ID_USER_ROLE|escape}>"  />
        <{/if}>
                                    </span>
                                -->
                            <{else}>
                                
    <{if $details->reftext_ID_USER_ROLE}>
        <{if isset($smarty.session.acl.userrole.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/userrole/view/<{$details->refuuid_ID_USER_ROLE}>"><{$details->reftext_ID_USER_ROLE|escape}></a>
        <{else}>
            <{$details->reftext_ID_USER_ROLE|escape}>        <{/if}>
    <{else}>
		<{$details->ID_USER_ROLE}>
    <{/if}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['TRANSITION_ID_SCREEN']) && ((isset($aclviewablecolumns['TRANSITION_ID_SCREEN']) && $aclviewablecolumns['TRANSITION_ID_SCREEN']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['TRANSITION_ID_SCREEN']) || $aclviewablecolumns['TRANSITION_ID_SCREEN']))) }>
        <{if !isset($columns2hide) || !in_array('TRANSITION_ID_SCREEN', $columns2hide) }>
    		<td class="form-field form-field-label column-transition-id-screen">
	                    		                    		        <label class="attribute-name"><{_t('Transition screen')}></label>
            </td>
            <td class="form-field form-field-value column-transition-id-screen" colspan="3">
            	<div class="attribute-line column-transition-id-screen type-reftext">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['TRANSITION_ID_SCREEN']) && $acleditablecolumns['TRANSITION_ID_SCREEN']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['TRANSITION_ID_SCREEN']) || $acleditablecolumns['TRANSITION_ID_SCREEN'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->reftext_TRANSITION_ID_SCREEN}>
        <{if isset($smarty.session.acl.screen.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/screen/view/<{$details->refuuid_TRANSITION_ID_SCREEN}>"><{$details->reftext_TRANSITION_ID_SCREEN|escape}></a>
        <{else}>
            <{$details->reftext_TRANSITION_ID_SCREEN|escape}>        <{/if}>
    <{else}>
		<{$details->TRANSITION_ID_SCREEN}>
    <{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
            <{if Framework::hasModule('Screen')}>
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-transition-id-screen" class="input-transition-id-screen" name="`$prefix`workflowtransition_formdata_TRANSITION_ID_SCREEN" value=$details->TRANSITION_ID_SCREEN text=$details->reftext_TRANSITION_ID_SCREEN datasource="SCREEN" valuecol="CODE" textcol="TITLE" sortcol=""}>

                            <{if isset($smarty.session.acl.screen.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/screen/new" title="Create a New Screen">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-transition-id-screen input-type-text" type="text" name="<{$prefix}>workflowtransition_formdata_TRANSITION_ID_SCREEN" value="<{$details->TRANSITION_ID_SCREEN|escape}>"  />
        <{/if}>
                                    </span>
                                -->
                            <{else}>
                                
    <{if $details->reftext_TRANSITION_ID_SCREEN}>
        <{if isset($smarty.session.acl.screen.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/screen/view/<{$details->refuuid_TRANSITION_ID_SCREEN}>"><{$details->reftext_TRANSITION_ID_SCREEN|escape}></a>
        <{else}>
            <{$details->reftext_TRANSITION_ID_SCREEN|escape}>        <{/if}>
    <{else}>
		<{$details->TRANSITION_ID_SCREEN}>
    <{/if}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                            </tbody>
        </table>
    	<!-- Standard layout columns end -->
    
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
                                <tr class="attribute-line column-<{$item->COLUMN_CODE}> type-<{$item->TYPE}>>
                            		<td class="form-field form-field-label column-<{$item->COLUMN_CODE}>">
                        		        <label class="attribute-name"><{_t($item->NAME)}></label>
                                    </td>
                                    <td class="form-field form-field-value column-<{$item->COLUMN_CODE}>">
                                		<div class="attribute-value">
                                            <{CustomFieldHelper::getCustomFieldValue($details, $item->COLUMN)}>
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

    <{if $additional_view_fields}>
        <table class="table table-bordered table-custom-layout equal-split">
            <tbody>
                <{foreach from=$additional_view_fields item=item}>
                    <tr class="attribute-line">
                		<td class="form-field form-field-label">
            		        <label class="attribute-name"><{$item.label}></label>
                        </td>
                        <td class="form-field form-field-value">
                    		<div class="attribute-value">
                                <{$item.value}>
                    		</div>
                        </td>
            		</tr>
            	<{/foreach}>
            </tbody>
        </table>
    <{/if}>

    <{plugin key="workflowtransition_view_bottom" args=$details}>

    <script type="text/javascript">
        ///////////////////////////////////////////////////////////////////////////////
        // VISIBILITY REFLECTION
        workflowtransitionview_get_visibility_settings = function (model) {
            var settings = {};

            
            return settings;
        }

        workflowtransitionview_apply_visibility_settings = function (settings) {
            $.each(settings, function(key, value) {
                workflowtransitionview_apply_block_visibility(key, value);
            });
        }

        workflowtransitionview_apply_block_visibility = function (key, value) {
            var block = $('.column-' + key.replace(/_/g, '-').toLowerCase());

            if (value) {
                block.show('slow');
            } else {
                block.hide('slow');
            }
        }

        workflowtransitionview_update_visibility_settings = function () {
            var settings = workflowtransitionview_get_visibility_settings();

            workflowtransitionview_apply_visibility_settings(settings);
        }

        $(function() {
            workflowtransitionview_update_visibility_settings();
        });

        $(function() {
            // x. Row expanders
            $('.view-main .view-row-expander').die('click').live('click', function(event) {
                event.preventDefault();

                var expander = $(this);
                var tr = expander.closest('tr');
                var table = tr.closest('table');

                var module = expander.data('module');
                var id = expander.data('id');

                // Hide others
                table.find('tr').not(tr).find('.view-row-expander').addClass('fa-caret-right').removeClass('fa-caret-down');
                table.find('tr.view-embedded-view').not('tr.' + module + '-view-embedded-view-' + id).hide();

                expander.toggleClass('fa-caret-right');
                expander.toggleClass('fa-caret-down');

                var tr_expandable = tr.next('tr.' + module + '-view-embedded-view-' + id);

                if (tr_expandable.length == 0) {
                    $.ajax({
                        type: "get",
                        url: "<{$smarty.const.APPLICATION_URL}>/" + module + "/rowExpandedView/" + id + "?source=view&colcount=4"
                    }).done(function(html) {
                        tr.after(html);
                    });
                }

                tr_expandable.toggle();
            });

//            // x. Onfly view edit
//            $('td.form-field-value').die('click').live('click', function(){
//                var td = $(this);
//
//                var view = $(this).find('.value-mode');
//                var edit = $(this).find('.edit-mode');
//                var input = $(this).find('.edit-mode>:input');
//
//                if (view.length == 0 || edit.length == 0) {
//                    return;
//                }
//
//                if (edit.is(":visible")) {
//                    return;
//                }
//
//                view.hide();
//                edit.show();
//
//                input.css('max-width', td.width() - 10);
//                input.focus();
//
//                var saved = false;
//
//                input.off('blur').on('blur', function(event) {
//                    event.preventDefault();
//
//                    // Workaround in case of an unexpected blur event from an auto-complete selection box
//                    if (input.is("select") && event.type == 'blur') {
//                        return;
//                    }
//
//                    var saved = false;
//                    input.change();
//                    saved = true;
//                });
//
//                input.off('change').on('change', function(event) {
//                    event.preventDefault();
//
//                    if (saved) {
//                        return;
//                    }
//
//                    var message = edit.find('.message');
//
//                    if (message.length == 0) {
//                        message = $('<div class="message"></div>').insertBefore(input);
//                    }
//
//                    $.ajax({
//                        type: "post",
//                        dataType: "json",
//                        url: "<{$smarty.const.APPLICATION_URL}>/workflowtransition/fieldSave",
//                        data: td.find(':input').serialize() + "&workflowtransition_formdata_UUID=<{$details->UUID}>"
//                    }).done(function(data) {
//                        if (data.success) {
//                            if (input.is("select")) {
//                                var txt = input.find('option:selected').map(function () {
//                                    return $(this).text().trim();
//                                }).get().join(', ');
//
//                                view.html(txt);
//                            } else {
//                                view.html(input.val());
//                            }
//
//                            view.show();
//                            edit.hide();
//
//                            message.remove();
//                        } else {
//                            input.focus();
//
//                            message.html('<span>' + data.message + '</span>');
//                        }
//                    });
//                });
//            });
        });

    </script>
</div>