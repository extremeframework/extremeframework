<div class="view-main">
    <{plugin key="objectacl_view_top" args=$details}>

            <!-- Standard layout columns -->
        <table class="table table-bordered table-custom-layout equal-split">
            <tbody>
                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['MODULE']) && ((isset($aclviewablecolumns['MODULE']) && $aclviewablecolumns['MODULE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['MODULE']) || $aclviewablecolumns['MODULE']))) }>
        <{if !isset($columns2hide) || !in_array('MODULE', $columns2hide) }>
    		<td class="form-field form-field-label column-module">
	                    		        	                <{if isset($smarty.session.acl.adminmodule.view)}>
    	                    <{if $details->MODULE}>
                                <i class="fa fa-caret-right row-expander view-row-expander" data-module="adminmodule" data-id="<{$details->refuuid_MODULE}>"></i>
                            <{/if}>
                        <{/if}>
    	                            		        <label class="attribute-name"><{_t('Module')}></label>
            </td>
            <td class="form-field form-field-value column-module" colspan="3">
            	<div class="attribute-line column-module type-reftext">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['MODULE']) && $acleditablecolumns['MODULE']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['MODULE']) || $acleditablecolumns['MODULE'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->reftext_MODULE}>
        <{if isset($smarty.session.acl.adminmodule.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminmodule/view/<{$details->refuuid_MODULE}>"><{$details->reftext_MODULE|escape}></a>
        <{else}>
            <{$details->reftext_MODULE|escape}>        <{/if}>
    <{else}>
		<{$details->MODULE}>
    <{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
            <{if Framework::hasModule('AdminModule')}>
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-module" class="input-module" name="`$prefix`objectacl_formdata_MODULE" value=$details->MODULE text=$details->reftext_MODULE datasource="ADMIN_MODULE" valuecol="MODULE" textcol="NAME" sortcol="NAME"}>

                            <{if isset($smarty.session.acl.adminmodule.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminmodule/new" title="Create a New Admin Module">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-module input-type-text" type="text" name="<{$prefix}>objectacl_formdata_MODULE" value="<{$details->MODULE|escape}>"  />
        <{/if}>
                                    </span>
                                -->
                            <{else}>
                                
    <{if $details->reftext_MODULE}>
        <{if isset($smarty.session.acl.adminmodule.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminmodule/view/<{$details->refuuid_MODULE}>"><{$details->reftext_MODULE|escape}></a>
        <{else}>
            <{$details->reftext_MODULE|escape}>        <{/if}>
    <{else}>
		<{$details->MODULE}>
    <{/if}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['OBJECT_ID']) && ((isset($aclviewablecolumns['OBJECT_ID']) && $aclviewablecolumns['OBJECT_ID']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['OBJECT_ID']) || $aclviewablecolumns['OBJECT_ID']))) }>
        <{if !isset($columns2hide) || !in_array('OBJECT_ID', $columns2hide) }>
    		<td class="form-field form-field-label column-object-id">
	            		        <label class="attribute-name"><{_t('Object')}></label>
            </td>
            <td class="form-field form-field-value column-object-id" colspan="3">
            	<div class="attribute-line column-object-id type-key">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['OBJECT_ID']) && $acleditablecolumns['OBJECT_ID']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['OBJECT_ID']) || $acleditablecolumns['OBJECT_ID'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->OBJECT_ID|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-object-id input-type-text" type="text" name="<{$prefix}>objectacl_formdata_OBJECT_ID" value="<{$details->OBJECT_ID|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->OBJECT_ID|escape}>
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
            <{html_ref_select multilingual="1" autocomplete="1" ajax="0" method="" id="input-id-user-group" class="input-id-user-group" name="`$prefix`objectacl_formdata_ID_USER_GROUP" value=$details->ID_USER_GROUP text=$details->reftext_ID_USER_GROUP datasource="USER_GROUP" valuecol="ID" textcol="NAME" sortcol="NAME"}>

                            <{if isset($smarty.session.acl.usergroup.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/usergroup/new" title="Create a New User Group">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-user-group input-type-text" type="text" name="<{$prefix}>objectacl_formdata_ID_USER_GROUP" value="<{$details->ID_USER_GROUP|escape}>"  />
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
    
            
        
        
            <{if !isset($excludedcolumns['ID_USER']) && ((isset($aclviewablecolumns['ID_USER']) && $aclviewablecolumns['ID_USER']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_USER']) || $aclviewablecolumns['ID_USER']))) }>
        <{if !isset($columns2hide) || !in_array('ID_USER', $columns2hide) }>
    		<td class="form-field form-field-label column-id-user">
	                    		        	                <{if isset($smarty.session.acl.user.view)}>
    	                    <{if $details->ID_USER}>
                                <i class="fa fa-caret-right row-expander view-row-expander" data-module="user" data-id="<{$details->refuuid_ID_USER}>"></i>
                            <{/if}>
                        <{/if}>
    	                            		        <label class="attribute-name"><{_t('User')}></label>
            </td>
            <td class="form-field form-field-value column-id-user" colspan="3">
            	<div class="attribute-line column-id-user type-reftext">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['ID_USER']) && $acleditablecolumns['ID_USER']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['ID_USER']) || $acleditablecolumns['ID_USER'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->reftext_ID_USER}>
        <{if isset($smarty.session.acl.user.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/user/view/<{$details->refuuid_ID_USER}>"><{$details->reftext_ID_USER|escape}></a>
        <{else}>
            <{$details->reftext_ID_USER|escape}>        <{/if}>
    <{else}>
		<{$details->ID_USER}>
    <{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
            <{if Framework::hasModule('User')}>
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-id-user" class="input-id-user" name="`$prefix`objectacl_formdata_ID_USER" value=$details->ID_USER text=$details->reftext_ID_USER datasource="USER" valuecol="ID" textcol="FIRST_NAME+LAST_NAME" sortcol="FIRST_NAME"}>

                            <{if isset($smarty.session.acl.user.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/user/new" title="Create a New User">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-user input-type-text" type="text" name="<{$prefix}>objectacl_formdata_ID_USER" value="<{$details->ID_USER|escape}>"  />
        <{/if}>
                                    </span>
                                -->
                            <{else}>
                                
    <{if $details->reftext_ID_USER}>
        <{if isset($smarty.session.acl.user.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/user/view/<{$details->refuuid_ID_USER}>"><{$details->reftext_ID_USER|escape}></a>
        <{else}>
            <{$details->reftext_ID_USER|escape}>        <{/if}>
    <{else}>
		<{$details->ID_USER}>
    <{/if}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['ARG_ID_USER_GROUP']) && ((isset($aclviewablecolumns['ARG_ID_USER_GROUP']) && $aclviewablecolumns['ARG_ID_USER_GROUP']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ARG_ID_USER_GROUP']) || $aclviewablecolumns['ARG_ID_USER_GROUP']))) }>
        <{if !isset($columns2hide) || !in_array('ARG_ID_USER_GROUP', $columns2hide) }>
    		<td class="form-field form-field-label column-arg-id-user-group">
	                    		                    		        <label class="attribute-name"><{_t('Arg user group')}></label>
            </td>
            <td class="form-field form-field-value column-arg-id-user-group" colspan="3">
            	<div class="attribute-line column-arg-id-user-group type-reftext">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['ARG_ID_USER_GROUP']) && $acleditablecolumns['ARG_ID_USER_GROUP']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['ARG_ID_USER_GROUP']) || $acleditablecolumns['ARG_ID_USER_GROUP'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->reftext_ARG_ID_USER_GROUP}>
        <{if isset($smarty.session.acl.usergroup.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/usergroup/view/<{$details->refuuid_ARG_ID_USER_GROUP}>"><{$details->reftext_ARG_ID_USER_GROUP|escape}></a>
        <{else}>
            <{$details->reftext_ARG_ID_USER_GROUP|escape}>        <{/if}>
    <{else}>
		<{$details->ARG_ID_USER_GROUP}>
    <{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
            <{if Framework::hasModule('UserGroup')}>
            <{html_ref_select multilingual="1" autocomplete="1" ajax="0" method="" id="input-arg-id-user-group" class="input-arg-id-user-group" name="`$prefix`objectacl_formdata_ARG_ID_USER_GROUP" value=$details->ARG_ID_USER_GROUP text=$details->reftext_ARG_ID_USER_GROUP datasource="USER_GROUP" valuecol="ID" textcol="NAME" sortcol="NAME"}>

                            <{if isset($smarty.session.acl.usergroup.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/usergroup/new" title="Create a New User Group">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-arg-id-user-group input-type-text" type="text" name="<{$prefix}>objectacl_formdata_ARG_ID_USER_GROUP" value="<{$details->ARG_ID_USER_GROUP|escape}>"  />
        <{/if}>
                                    </span>
                                -->
                            <{else}>
                                
    <{if $details->reftext_ARG_ID_USER_GROUP}>
        <{if isset($smarty.session.acl.usergroup.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/usergroup/view/<{$details->refuuid_ARG_ID_USER_GROUP}>"><{$details->reftext_ARG_ID_USER_GROUP|escape}></a>
        <{else}>
            <{$details->reftext_ARG_ID_USER_GROUP|escape}>        <{/if}>
    <{else}>
		<{$details->ARG_ID_USER_GROUP}>
    <{/if}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['ARG_ID_USER']) && ((isset($aclviewablecolumns['ARG_ID_USER']) && $aclviewablecolumns['ARG_ID_USER']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ARG_ID_USER']) || $aclviewablecolumns['ARG_ID_USER']))) }>
        <{if !isset($columns2hide) || !in_array('ARG_ID_USER', $columns2hide) }>
    		<td class="form-field form-field-label column-arg-id-user">
	                    		        	                <{if isset($smarty.session.acl.user.view)}>
    	                    <{if $details->ARG_ID_USER}>
                                <i class="fa fa-caret-right row-expander view-row-expander" data-module="user" data-id="<{$details->refuuid_ARG_ID_USER}>"></i>
                            <{/if}>
                        <{/if}>
    	                            		        <label class="attribute-name"><{_t('Arg user')}></label>
            </td>
            <td class="form-field form-field-value column-arg-id-user" colspan="3">
            	<div class="attribute-line column-arg-id-user type-reftext">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['ARG_ID_USER']) && $acleditablecolumns['ARG_ID_USER']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['ARG_ID_USER']) || $acleditablecolumns['ARG_ID_USER'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->reftext_ARG_ID_USER}>
        <{if isset($smarty.session.acl.user.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/user/view/<{$details->refuuid_ARG_ID_USER}>"><{$details->reftext_ARG_ID_USER|escape}></a>
        <{else}>
            <{$details->reftext_ARG_ID_USER|escape}>        <{/if}>
    <{else}>
		<{$details->ARG_ID_USER}>
    <{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
            <{if Framework::hasModule('User')}>
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-arg-id-user" class="input-arg-id-user" name="`$prefix`objectacl_formdata_ARG_ID_USER" value=$details->ARG_ID_USER text=$details->reftext_ARG_ID_USER datasource="USER" valuecol="ID" textcol="FIRST_NAME+LAST_NAME" sortcol="FIRST_NAME"}>

                            <{if isset($smarty.session.acl.user.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/user/new" title="Create a New User">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-arg-id-user input-type-text" type="text" name="<{$prefix}>objectacl_formdata_ARG_ID_USER" value="<{$details->ARG_ID_USER|escape}>"  />
        <{/if}>
                                    </span>
                                -->
                            <{else}>
                                
    <{if $details->reftext_ARG_ID_USER}>
        <{if isset($smarty.session.acl.user.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/user/view/<{$details->refuuid_ARG_ID_USER}>"><{$details->reftext_ARG_ID_USER|escape}></a>
        <{else}>
            <{$details->reftext_ARG_ID_USER|escape}>        <{/if}>
    <{else}>
		<{$details->ARG_ID_USER}>
    <{/if}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['ID_ACL_TYPE']) && ((isset($aclviewablecolumns['ID_ACL_TYPE']) && $aclviewablecolumns['ID_ACL_TYPE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_ACL_TYPE']) || $aclviewablecolumns['ID_ACL_TYPE']))) }>
        <{if !isset($columns2hide) || !in_array('ID_ACL_TYPE', $columns2hide) }>
    		<td class="form-field form-field-label column-id-acl-type">
	                    		                    		        <label class="attribute-name"><{_t('Acl type')}></label>
            </td>
            <td class="form-field form-field-value column-id-acl-type" colspan="3">
            	<div class="attribute-line column-id-acl-type type-reftext">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['ID_ACL_TYPE']) && $acleditablecolumns['ID_ACL_TYPE']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['ID_ACL_TYPE']) || $acleditablecolumns['ID_ACL_TYPE'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->reftext_ID_ACL_TYPE}>
        <{if isset($smarty.session.acl.acltype.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/acltype/view/<{$details->refuuid_ID_ACL_TYPE}>"><{$details->reftext_ID_ACL_TYPE|escape}></a>
        <{else}>
            <{$details->reftext_ID_ACL_TYPE|escape}>        <{/if}>
    <{else}>
		<{$details->ID_ACL_TYPE}>
    <{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
            <{if Framework::hasModule('AclType')}>
            <{html_ref_select multilingual="1" autocomplete="1" ajax="0" method="" id="input-id-acl-type" class="input-id-acl-type" name="`$prefix`objectacl_formdata_ID_ACL_TYPE" value=$details->ID_ACL_TYPE text=$details->reftext_ID_ACL_TYPE datasource="ACL_TYPE" valuecol="ID" textcol="NAME" sortcol="NAME"}>

                            <{if isset($smarty.session.acl.acltype.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/acltype/new" title="Create a New Acl Type">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-acl-type input-type-text" type="text" name="<{$prefix}>objectacl_formdata_ID_ACL_TYPE" value="<{$details->ID_ACL_TYPE|escape}>"  />
        <{/if}>
                                    </span>
                                -->
                            <{else}>
                                
    <{if $details->reftext_ID_ACL_TYPE}>
        <{if isset($smarty.session.acl.acltype.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/acltype/view/<{$details->refuuid_ID_ACL_TYPE}>"><{$details->reftext_ID_ACL_TYPE|escape}></a>
        <{else}>
            <{$details->reftext_ID_ACL_TYPE|escape}>        <{/if}>
    <{else}>
		<{$details->ID_ACL_TYPE}>
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

    <{plugin key="objectacl_view_bottom" args=$details}>

    <script type="text/javascript">
        ///////////////////////////////////////////////////////////////////////////////
        // VISIBILITY REFLECTION
        objectaclview_get_visibility_settings = function (model) {
            var settings = {};

            
            return settings;
        }

        objectaclview_apply_visibility_settings = function (settings) {
            $.each(settings, function(key, value) {
                objectaclview_apply_block_visibility(key, value);
            });
        }

        objectaclview_apply_block_visibility = function (key, value) {
            var block = $('.column-' + key.replace(/_/g, '-').toLowerCase());

            if (value) {
                block.show('slow');
            } else {
                block.hide('slow');
            }
        }

        objectaclview_update_visibility_settings = function () {
            var settings = objectaclview_get_visibility_settings();

            objectaclview_apply_visibility_settings(settings);
        }

        $(function() {
            objectaclview_update_visibility_settings();
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
//                        url: "<{$smarty.const.APPLICATION_URL}>/objectacl/fieldSave",
//                        data: td.find(':input').serialize() + "&objectacl_formdata_UUID=<{$details->UUID}>"
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