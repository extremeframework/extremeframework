<div class="view-main">
    <{plugin key="user_view_top" args=$details}>

            <!-- Standard layout columns -->
        <table class="table table-bordered table-custom-layout equal-split">
            <tbody>
                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['FIRST_NAME']) && ((isset($aclviewablecolumns['FIRST_NAME']) && $aclviewablecolumns['FIRST_NAME']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['FIRST_NAME']) || $aclviewablecolumns['FIRST_NAME']))) }>
        <{if !isset($columns2hide) || !in_array('FIRST_NAME', $columns2hide) }>
    		<td class="form-field form-field-label column-first-name">
	            		        <label class="attribute-name"><{_t('L_FIRST_NAME')}></label>
            </td>
            <td class="form-field form-field-value column-first-name" colspan="3">
            	<div class="attribute-line column-first-name type-text">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['FIRST_NAME']) && $acleditablecolumns['FIRST_NAME']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['FIRST_NAME']) || $acleditablecolumns['FIRST_NAME'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->FIRST_NAME|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-first-name input-type-text" type="text" name="<{$prefix}>user_formdata_FIRST_NAME" value="<{$details->FIRST_NAME|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->FIRST_NAME|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['LAST_NAME']) && ((isset($aclviewablecolumns['LAST_NAME']) && $aclviewablecolumns['LAST_NAME']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['LAST_NAME']) || $aclviewablecolumns['LAST_NAME']))) }>
        <{if !isset($columns2hide) || !in_array('LAST_NAME', $columns2hide) }>
    		<td class="form-field form-field-label column-last-name">
	            		        <label class="attribute-name"><{_t('L_LAST_NAME')}></label>
            </td>
            <td class="form-field form-field-value column-last-name" colspan="3">
            	<div class="attribute-line column-last-name type-text">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['LAST_NAME']) && $acleditablecolumns['LAST_NAME']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['LAST_NAME']) || $acleditablecolumns['LAST_NAME'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->LAST_NAME|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-last-name input-type-text" type="text" name="<{$prefix}>user_formdata_LAST_NAME" value="<{$details->LAST_NAME|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->LAST_NAME|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['PHOTO']) && ((isset($aclviewablecolumns['PHOTO']) && $aclviewablecolumns['PHOTO']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['PHOTO']) || $aclviewablecolumns['PHOTO']))) }>
        <{if !isset($columns2hide) || !in_array('PHOTO', $columns2hide) }>
    		<td class="form-field form-field-label column-photo">
	            		        <label class="attribute-name"><{_t('L_PHOTO')}></label>
            </td>
            <td class="form-field form-field-value column-photo" colspan="3">
            	<div class="attribute-line column-photo type-image">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['PHOTO']) && $acleditablecolumns['PHOTO']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['PHOTO']) || $acleditablecolumns['PHOTO'])) }>
                    		    <span class="value-mode">
                                    
	<{media src=$details->PHOTO thumbnail=1 width=200 height=200}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

	<input class="input-photo input-type-file" type="file" name="<{$prefix}>user_formdata_PHOTO" />
    <span class="input-sizes-width-height"><input type="text" name="PHOTO[width]" size="3" style="height:20px;width:25px;margin:0"> x <input type="text" name="PHOTO[height]" size="3" style="height:20px;width:25px;margin:0" /></span>
	<{if $details->PHOTO}><div style="clear:both"></div><span id="<{$prefix}>user_PHOTO"><{media src=$details->PHOTO}> <a onclick="remove_attachment(document.userform.<{$prefix}>user_formdata_PHOTO, '<{$details->PHOTO}>', '<{$prefix}>user_PHOTO')">Remove</a></span><{/if}>
    <input type="hidden" name="<{$prefix}>user_formdata_PHOTO" value="<{$details->PHOTO}>" />
                                </span>
                                -->
                            <{else}>
                                
	<{media src=$details->PHOTO thumbnail=1 width=200 height=200}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['EMAIL']) && ((isset($aclviewablecolumns['EMAIL']) && $aclviewablecolumns['EMAIL']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['EMAIL']) || $aclviewablecolumns['EMAIL']))) }>
        <{if !isset($columns2hide) || !in_array('EMAIL', $columns2hide) }>
    		<td class="form-field form-field-label column-email">
	            		        <label class="attribute-name"><{_t('L_EMAIL')}></label>
            </td>
            <td class="form-field form-field-value column-email" colspan="3">
            	<div class="attribute-line column-email type-email">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['EMAIL']) && $acleditablecolumns['EMAIL']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['EMAIL']) || $acleditablecolumns['EMAIL'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->EMAIL|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-email input-type-text" type="text" name="<{$prefix}>user_formdata_EMAIL" value="<{$details->EMAIL|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->EMAIL|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['LOGIN']) && ((isset($aclviewablecolumns['LOGIN']) && $aclviewablecolumns['LOGIN']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['LOGIN']) || $aclviewablecolumns['LOGIN']))) }>
        <{if !isset($columns2hide) || !in_array('LOGIN', $columns2hide) }>
    		<td class="form-field form-field-label column-login">
	            		        <label class="attribute-name"><{_t('L_LOGIN')}></label>
            </td>
            <td class="form-field form-field-value column-login" colspan="3">
            	<div class="attribute-line column-login type-code">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['LOGIN']) && $acleditablecolumns['LOGIN']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['LOGIN']) || $acleditablecolumns['LOGIN'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->LOGIN|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-login input-type-text" type="text" name="<{$prefix}>user_formdata_LOGIN" value="<{$details->LOGIN|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->LOGIN|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['PASSWORD']) && ((isset($aclviewablecolumns['PASSWORD']) && $aclviewablecolumns['PASSWORD']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['PASSWORD']) || $aclviewablecolumns['PASSWORD']))) }>
        <{if !isset($columns2hide) || !in_array('PASSWORD', $columns2hide) }>
    		<td class="form-field form-field-label column-password">
	            		        <label class="attribute-name"><{_t('L_PASSWORD')}></label>
            </td>
            <td class="form-field form-field-value column-password" colspan="3">
            	<div class="attribute-line column-password type-password">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['PASSWORD']) && $acleditablecolumns['PASSWORD']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['PASSWORD']) || $acleditablecolumns['PASSWORD'])) }>
                    		    <span class="value-mode">
                                    
    ******
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-password input-type-password" type="password" name="<{$prefix}>user_formdata_PASSWORD" value="<{if $details->PASSWORD}>*****<{/if}>" />
                                </span>
                                -->
                            <{else}>
                                
    ******
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['PHONE']) && ((isset($aclviewablecolumns['PHONE']) && $aclviewablecolumns['PHONE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['PHONE']) || $aclviewablecolumns['PHONE']))) }>
        <{if !isset($columns2hide) || !in_array('PHONE', $columns2hide) }>
    		<td class="form-field form-field-label column-phone">
	            		        <label class="attribute-name"><{_t('L_PHONE')}></label>
            </td>
            <td class="form-field form-field-value column-phone" colspan="3">
            	<div class="attribute-line column-phone type-phone">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['PHONE']) && $acleditablecolumns['PHONE']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['PHONE']) || $acleditablecolumns['PHONE'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->PHONE|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-phone input-type-text" type="text" name="<{$prefix}>user_formdata_PHONE" value="<{$details->PHONE|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->PHONE|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['GENDER']) && ((isset($aclviewablecolumns['GENDER']) && $aclviewablecolumns['GENDER']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['GENDER']) || $aclviewablecolumns['GENDER']))) }>
        <{if !isset($columns2hide) || !in_array('GENDER', $columns2hide) }>
    		<td class="form-field form-field-label column-gender">
	            		        <label class="attribute-name"><{_t('L_GENDER')}></label>
            </td>
            <td class="form-field form-field-value column-gender" colspan="3">
            	<div class="attribute-line column-gender type-gender">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['GENDER']) && $acleditablecolumns['GENDER']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['GENDER']) || $acleditablecolumns['GENDER'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->GENDER}><{_t('Male')}><{else}><{_t('Female')}><{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <span class="input-type-radio"><input class="input-gender" type="radio" name="<{$prefix}>user_formdata_GENDER" value="1" <{if $details->GENDER}>checked="checked"<{/if}>><{_t('Male')}> <input type="radio" name="<{$prefix}>user_formdata_GENDER" value="0" <{if !$details->GENDER}>checked="checked"<{/if}> /><{_t('Female')}></span>
                                </span>
                                -->
                            <{else}>
                                
    <{if $details->GENDER}><{_t('Male')}><{else}><{_t('Female')}><{/if}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['DATE_OF_BIRTH']) && ((isset($aclviewablecolumns['DATE_OF_BIRTH']) && $aclviewablecolumns['DATE_OF_BIRTH']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['DATE_OF_BIRTH']) || $aclviewablecolumns['DATE_OF_BIRTH']))) }>
        <{if !isset($columns2hide) || !in_array('DATE_OF_BIRTH', $columns2hide) }>
    		<td class="form-field form-field-label column-date-of-birth">
	            		        <label class="attribute-name"><{_t('L_DATE_OF_BIRTH')}></label>
            </td>
            <td class="form-field form-field-value column-date-of-birth" colspan="3">
            	<div class="attribute-line column-date-of-birth type-date">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['DATE_OF_BIRTH']) && $acleditablecolumns['DATE_OF_BIRTH']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['DATE_OF_BIRTH']) || $acleditablecolumns['DATE_OF_BIRTH'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->DATE_OF_BIRTH|date_format:$smarty.const.SMARTY_DATE_FORMAT}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
    <input class="input-date-of-birth input-type-date field-date" type="text" id="<{$prefix}>user_formdata_DATE_OF_BIRTH" name="<{$prefix}>user_formdata_DATE_OF_BIRTH" value="<{$details->DATE_OF_BIRTH|date_format:$smarty.const.SMARTY_DATE_FORMAT}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->DATE_OF_BIRTH|date_format:$smarty.const.SMARTY_DATE_FORMAT}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['FORCE_PASSWORD_CHANGE']) && ((isset($aclviewablecolumns['FORCE_PASSWORD_CHANGE']) && $aclviewablecolumns['FORCE_PASSWORD_CHANGE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['FORCE_PASSWORD_CHANGE']) || $aclviewablecolumns['FORCE_PASSWORD_CHANGE']))) }>
        <{if !isset($columns2hide) || !in_array('FORCE_PASSWORD_CHANGE', $columns2hide) }>
    		<td class="form-field form-field-label column-force-password-change">
	            		        <label class="attribute-name"><{_t('L_FORCE_PASSWORD_CHANGE')}></label>
            </td>
            <td class="form-field form-field-value column-force-password-change" colspan="3">
            	<div class="attribute-line column-force-password-change type-yesno">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['FORCE_PASSWORD_CHANGE']) && $acleditablecolumns['FORCE_PASSWORD_CHANGE']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['FORCE_PASSWORD_CHANGE']) || $acleditablecolumns['FORCE_PASSWORD_CHANGE'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->FORCE_PASSWORD_CHANGE}><{_t('Yes')}><{else}><{_t('No')}><{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <span class="input-type-radio"><input class="input-force-password-change" type="radio" name="<{$prefix}>user_formdata_FORCE_PASSWORD_CHANGE" value="1" <{if $details->FORCE_PASSWORD_CHANGE}>checked="checked"<{/if}>><{_t('Yes')}> <input type="radio" name="<{$prefix}>user_formdata_FORCE_PASSWORD_CHANGE" value="0" <{if !$details->FORCE_PASSWORD_CHANGE}>checked="checked"<{/if}> /><{_t('No')}></span>
                                </span>
                                -->
                            <{else}>
                                
    <{if $details->FORCE_PASSWORD_CHANGE}><{_t('Yes')}><{else}><{_t('No')}><{/if}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['IS_EMAIL_VERIFIED']) && ((isset($aclviewablecolumns['IS_EMAIL_VERIFIED']) && $aclviewablecolumns['IS_EMAIL_VERIFIED']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['IS_EMAIL_VERIFIED']) || $aclviewablecolumns['IS_EMAIL_VERIFIED']))) }>
        <{if !isset($columns2hide) || !in_array('IS_EMAIL_VERIFIED', $columns2hide) }>
    		<td class="form-field form-field-label column-is-email-verified">
	            		        <label class="attribute-name"><{_t('L_IS_EMAIL_VERIFIED')}></label>
            </td>
            <td class="form-field form-field-value column-is-email-verified" colspan="3">
            	<div class="attribute-line column-is-email-verified type-yesno">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['IS_EMAIL_VERIFIED']) && $acleditablecolumns['IS_EMAIL_VERIFIED']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['IS_EMAIL_VERIFIED']) || $acleditablecolumns['IS_EMAIL_VERIFIED'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->IS_EMAIL_VERIFIED}><{_t('Yes')}><{else}><{_t('No')}><{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <span class="input-type-radio"><input class="input-is-email-verified" type="radio" name="<{$prefix}>user_formdata_IS_EMAIL_VERIFIED" value="1" <{if $details->IS_EMAIL_VERIFIED}>checked="checked"<{/if}>><{_t('Yes')}> <input type="radio" name="<{$prefix}>user_formdata_IS_EMAIL_VERIFIED" value="0" <{if !$details->IS_EMAIL_VERIFIED}>checked="checked"<{/if}> /><{_t('No')}></span>
                                </span>
                                -->
                            <{else}>
                                
    <{if $details->IS_EMAIL_VERIFIED}><{_t('Yes')}><{else}><{_t('No')}><{/if}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['FACEBOOK_ID']) && ((isset($aclviewablecolumns['FACEBOOK_ID']) && $aclviewablecolumns['FACEBOOK_ID']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['FACEBOOK_ID']) || $aclviewablecolumns['FACEBOOK_ID']))) }>
        <{if !isset($columns2hide) || !in_array('FACEBOOK_ID', $columns2hide) }>
    		<td class="form-field form-field-label column-facebook-id">
	            		        <label class="attribute-name"><{_t('L_FACEBOOK')}></label>
            </td>
            <td class="form-field form-field-value column-facebook-id" colspan="3">
            	<div class="attribute-line column-facebook-id type-key">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['FACEBOOK_ID']) && $acleditablecolumns['FACEBOOK_ID']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['FACEBOOK_ID']) || $acleditablecolumns['FACEBOOK_ID'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->FACEBOOK_ID|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-facebook-id input-type-text" type="text" name="<{$prefix}>user_formdata_FACEBOOK_ID" value="<{$details->FACEBOOK_ID|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->FACEBOOK_ID|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['FACEBOOK_OAUTH_ID']) && ((isset($aclviewablecolumns['FACEBOOK_OAUTH_ID']) && $aclviewablecolumns['FACEBOOK_OAUTH_ID']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['FACEBOOK_OAUTH_ID']) || $aclviewablecolumns['FACEBOOK_OAUTH_ID']))) }>
        <{if !isset($columns2hide) || !in_array('FACEBOOK_OAUTH_ID', $columns2hide) }>
    		<td class="form-field form-field-label column-facebook-oauth-id">
	            		        <label class="attribute-name"><{_t('L_FACEBOOK_OAUTH')}></label>
            </td>
            <td class="form-field form-field-value column-facebook-oauth-id" colspan="3">
            	<div class="attribute-line column-facebook-oauth-id type-key">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['FACEBOOK_OAUTH_ID']) && $acleditablecolumns['FACEBOOK_OAUTH_ID']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['FACEBOOK_OAUTH_ID']) || $acleditablecolumns['FACEBOOK_OAUTH_ID'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->FACEBOOK_OAUTH_ID|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-facebook-oauth-id input-type-text" type="text" name="<{$prefix}>user_formdata_FACEBOOK_OAUTH_ID" value="<{$details->FACEBOOK_OAUTH_ID|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->FACEBOOK_OAUTH_ID|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['GOOGLE_ID']) && ((isset($aclviewablecolumns['GOOGLE_ID']) && $aclviewablecolumns['GOOGLE_ID']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['GOOGLE_ID']) || $aclviewablecolumns['GOOGLE_ID']))) }>
        <{if !isset($columns2hide) || !in_array('GOOGLE_ID', $columns2hide) }>
    		<td class="form-field form-field-label column-google-id">
	            		        <label class="attribute-name"><{_t('L_GOOGLE')}></label>
            </td>
            <td class="form-field form-field-value column-google-id" colspan="3">
            	<div class="attribute-line column-google-id type-key">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['GOOGLE_ID']) && $acleditablecolumns['GOOGLE_ID']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['GOOGLE_ID']) || $acleditablecolumns['GOOGLE_ID'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->GOOGLE_ID|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-google-id input-type-text" type="text" name="<{$prefix}>user_formdata_GOOGLE_ID" value="<{$details->GOOGLE_ID|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->GOOGLE_ID|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['GOOGLE_OAUTH_ID']) && ((isset($aclviewablecolumns['GOOGLE_OAUTH_ID']) && $aclviewablecolumns['GOOGLE_OAUTH_ID']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['GOOGLE_OAUTH_ID']) || $aclviewablecolumns['GOOGLE_OAUTH_ID']))) }>
        <{if !isset($columns2hide) || !in_array('GOOGLE_OAUTH_ID', $columns2hide) }>
    		<td class="form-field form-field-label column-google-oauth-id">
	            		        <label class="attribute-name"><{_t('L_GOOGLE_OAUTH')}></label>
            </td>
            <td class="form-field form-field-value column-google-oauth-id" colspan="3">
            	<div class="attribute-line column-google-oauth-id type-key">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['GOOGLE_OAUTH_ID']) && $acleditablecolumns['GOOGLE_OAUTH_ID']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['GOOGLE_OAUTH_ID']) || $acleditablecolumns['GOOGLE_OAUTH_ID'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->GOOGLE_OAUTH_ID|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-google-oauth-id input-type-text" type="text" name="<{$prefix}>user_formdata_GOOGLE_OAUTH_ID" value="<{$details->GOOGLE_OAUTH_ID|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->GOOGLE_OAUTH_ID|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['YAHOO_ID']) && ((isset($aclviewablecolumns['YAHOO_ID']) && $aclviewablecolumns['YAHOO_ID']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['YAHOO_ID']) || $aclviewablecolumns['YAHOO_ID']))) }>
        <{if !isset($columns2hide) || !in_array('YAHOO_ID', $columns2hide) }>
    		<td class="form-field form-field-label column-yahoo-id">
	            		        <label class="attribute-name"><{_t('L_YAHOO')}></label>
            </td>
            <td class="form-field form-field-value column-yahoo-id" colspan="3">
            	<div class="attribute-line column-yahoo-id type-key">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['YAHOO_ID']) && $acleditablecolumns['YAHOO_ID']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['YAHOO_ID']) || $acleditablecolumns['YAHOO_ID'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->YAHOO_ID|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-yahoo-id input-type-text" type="text" name="<{$prefix}>user_formdata_YAHOO_ID" value="<{$details->YAHOO_ID|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->YAHOO_ID|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['YAHOO_OAUTH_ID']) && ((isset($aclviewablecolumns['YAHOO_OAUTH_ID']) && $aclviewablecolumns['YAHOO_OAUTH_ID']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['YAHOO_OAUTH_ID']) || $aclviewablecolumns['YAHOO_OAUTH_ID']))) }>
        <{if !isset($columns2hide) || !in_array('YAHOO_OAUTH_ID', $columns2hide) }>
    		<td class="form-field form-field-label column-yahoo-oauth-id">
	            		        <label class="attribute-name"><{_t('L_YAHOO_OAUTH')}></label>
            </td>
            <td class="form-field form-field-value column-yahoo-oauth-id" colspan="3">
            	<div class="attribute-line column-yahoo-oauth-id type-key">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['YAHOO_OAUTH_ID']) && $acleditablecolumns['YAHOO_OAUTH_ID']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['YAHOO_OAUTH_ID']) || $acleditablecolumns['YAHOO_OAUTH_ID'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->YAHOO_OAUTH_ID|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-yahoo-oauth-id input-type-text" type="text" name="<{$prefix}>user_formdata_YAHOO_OAUTH_ID" value="<{$details->YAHOO_OAUTH_ID|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->YAHOO_OAUTH_ID|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['IS_ENABLED']) && ((isset($aclviewablecolumns['IS_ENABLED']) && $aclviewablecolumns['IS_ENABLED']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['IS_ENABLED']) || $aclviewablecolumns['IS_ENABLED']))) }>
        <{if !isset($columns2hide) || !in_array('IS_ENABLED', $columns2hide) }>
    		<td class="form-field form-field-label column-is-enabled">
	            		        <label class="attribute-name"><{_t('L_IS_ENABLED')}></label>
            </td>
            <td class="form-field form-field-value column-is-enabled" colspan="3">
            	<div class="attribute-line column-is-enabled type-yesno">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['IS_ENABLED']) && $acleditablecolumns['IS_ENABLED']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['IS_ENABLED']) || $acleditablecolumns['IS_ENABLED'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->IS_ENABLED}><{_t('Yes')}><{else}><{_t('No')}><{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <span class="input-type-radio"><input class="input-is-enabled" type="radio" name="<{$prefix}>user_formdata_IS_ENABLED" value="1" <{if $details->IS_ENABLED}>checked="checked"<{/if}>><{_t('Yes')}> <input type="radio" name="<{$prefix}>user_formdata_IS_ENABLED" value="0" <{if !$details->IS_ENABLED}>checked="checked"<{/if}> /><{_t('No')}></span>
                                </span>
                                -->
                            <{else}>
                                
    <{if $details->IS_ENABLED}><{_t('Yes')}><{else}><{_t('No')}><{/if}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['CREATION_DATE']) && ((isset($aclviewablecolumns['CREATION_DATE']) && $aclviewablecolumns['CREATION_DATE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CREATION_DATE']) || $aclviewablecolumns['CREATION_DATE']))) }>
        <{if !isset($columns2hide) || !in_array('CREATION_DATE', $columns2hide) }>
    		<td class="form-field form-field-label column-creation-date">
	            		        <label class="attribute-name"><{_t('L_CREATION_DATE')}></label>
            </td>
            <td class="form-field form-field-value column-creation-date" colspan="3">
            	<div class="attribute-line column-creation-date type-datetime">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['CREATION_DATE']) && $acleditablecolumns['CREATION_DATE']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['CREATION_DATE']) || $acleditablecolumns['CREATION_DATE'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->CREATION_DATE|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
    <input class="input-creation-date input-type-date field-date" type="text" id="<{$prefix}>user_formdata_CREATION_DATE" name="<{$prefix}>user_formdata_CREATION_DATE" value="<{$details->CREATION_DATE|date_format:$smarty.const.SMARTY_DATE_FORMAT}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->CREATION_DATE|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['LATEST_LOGIN']) && ((isset($aclviewablecolumns['LATEST_LOGIN']) && $aclviewablecolumns['LATEST_LOGIN']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['LATEST_LOGIN']) || $aclviewablecolumns['LATEST_LOGIN']))) }>
        <{if !isset($columns2hide) || !in_array('LATEST_LOGIN', $columns2hide) }>
    		<td class="form-field form-field-label column-latest-login">
	            		        <label class="attribute-name"><{_t('L_LATEST_LOGIN')}></label>
            </td>
            <td class="form-field form-field-value column-latest-login" colspan="3">
            	<div class="attribute-line column-latest-login type-datetime">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['LATEST_LOGIN']) && $acleditablecolumns['LATEST_LOGIN']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['LATEST_LOGIN']) || $acleditablecolumns['LATEST_LOGIN'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->LATEST_LOGIN|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
    <input class="input-latest-login input-type-date field-date" type="text" id="<{$prefix}>user_formdata_LATEST_LOGIN" name="<{$prefix}>user_formdata_LATEST_LOGIN" value="<{$details->LATEST_LOGIN|date_format:$smarty.const.SMARTY_DATE_FORMAT}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->LATEST_LOGIN|escape}>
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

    <{plugin key="user_view_bottom" args=$details}>

    <script type="text/javascript">
        ///////////////////////////////////////////////////////////////////////////////
        // VISIBILITY REFLECTION
        userview_get_visibility_settings = function (model) {
            var settings = {};

            
            return settings;
        }

        userview_apply_visibility_settings = function (settings) {
            $.each(settings, function(key, value) {
                userview_apply_block_visibility(key, value);
            });
        }

        userview_apply_block_visibility = function (key, value) {
            var block = $('.column-' + key.replace(/_/g, '-').toLowerCase());

            if (value) {
                block.show('slow');
            } else {
                block.hide('slow');
            }
        }

        userview_update_visibility_settings = function () {
            var settings = userview_get_visibility_settings();

            userview_apply_visibility_settings(settings);
        }

        $(function() {
            userview_update_visibility_settings();
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
//                        url: "<{$smarty.const.APPLICATION_URL}>/user/fieldSave",
//                        data: td.find(':input').serialize() + "&user_formdata_UUID=<{$details->UUID}>"
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