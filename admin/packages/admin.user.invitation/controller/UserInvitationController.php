<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
defined('APPLICATION_DIR') OR exit();

class UserInvitationController extends _UserInvitationController
{
    function onInsertSuccess($model) {
        parent::onInsertSuccess($model);

        // x. Send invitation email
        $error = $this->sendInvitationEmail($model);
    }

    function sendAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('userinvitation');

        AclController::checkPermission('userinvitation', 'new');

		list($id) = explode('/', $_REQUEST['args']);

        if (empty($id)) {
            $this->pagenotfound();
        }

        $model = new UserInvitationModel();

        $mode->UUID = $id;
        $model->find();

		if (!$model->fetch()) {
		    $this->pagenotfound();
		}

        // x. Send invitation email
        $error = $this->sendInvitationEmail($model);

        ContextStack::back(0);
    }

    function acceptAction() {
        $compound = isset($_REQUEST['c'])? $_REQUEST['c'] : '';

        if (!empty($compound)) {
            $compound = base64_decode($compound);

            if (preg_match('/.*,.*/i',$compound)) {
                @list($uuid, $email, $udid) = explode(',', $compound);

        		if (empty($uuid) || empty($email) || trim($udid) == '') {
        		    $this->pagenotfound();
        		}

                // x. Add domain of the invitation so that subsequence queries can work
                AclController::addUDID($udid);

                // x. Check if invalid invitation
                $model = new UserInvitationModel();

                $model->UUID = $uuid;
                $model->INVITEE_EMAIL = $email;
                $model->find();

        		if (!$model->fetch()) {
        		    $this->pagenotfound();
        		}

                // x. Check if the invitation is already accepted
                if ($model->ID_USER_INVITATION_STATUS == 'accepted') {
                    header('Location:'.APPLICATION_URL);
                }

                // x. Check if user exists
                $exists = $this->userExists($email);

                // x. If user doesn't exist, show sign-up page
                if (!$exists) {
                    $return = APPLICATION_URL.'/userinvitation/accept?c='.base64_encode($compound);

                    $this->showSignUpPage($model->INVITEE_NAME, $email, $return);

                    return;
                } else {
                    // x. Accept the invitation
                    $this->acceptInvitation($model);
                }
            }
        }
    }

    function signupAction() {
        if (empty($_POST)) {
            $this->pagenotfound();
        }

        // x. Data
        $params = RequestHelper::filter('user_formdata_');

        $model = new UserModel();

        $model->setFrom($params);

        $model->PASSWORD2 = isset($_REQUEST['PASSWORD2'])? $_REQUEST['PASSWORD2'] : '';
        $accept_tos = isset($_REQUEST['ACCEPT_TOS'])? $_REQUEST['ACCEPT_TOS'] : 0;
        $accept_newsletter = isset($_REQUEST['ACCEPT_NEWSLETTER'])? $_REQUEST['ACCEPT_NEWSLETTER'] : 0;
        $return = isset($_REQUEST['return'])? $_REQUEST['return'] : '';

        // x. Data checking
        $message = '';

        if (empty($model->FIRST_NAME)) {
            $message = _t('First name should not be empty');
        } elseif (empty($model->LAST_NAME)) {
            $message = _t('Last name should not be empty');
        } elseif (empty($model->EMAIL)) {
            $message = _t('Email address should not be empty');
        } elseif (!preg_match('/^([.0-9a-z_-]+)@(([0-9a-z-]+\.)+[0-9a-z]{2,4})$/i', $model->EMAIL)) {
            $message = _t('Invalid email address');
        } elseif (empty($model->PASSWORD) || strlen(trim($model->PASSWORD)) < 6) {
            $message = _t('Password should be at least 6 characters and contains no spaces');
        } elseif (empty($model->PASSWORD2)) {
            $message = _t('Password confirmation should not be empty');
        } elseif ($model->PASSWORD != $model->PASSWORD2) {
            $message = _t('Password confirmation mismatch');
        } elseif (!$accept_tos) {
            $message = _t('You need to accept the Terms of service of ').ORGANIZATION_NAME_SHORT.' '._t('before continuing');
        }

        // x. Check if account already exists
        if (empty($message)) {
            $um = new UserModel();
            $um->EMAIL = $model->EMAIL;
            $um->find();
            if ($um->fetch()) {
                $message = 'An account with the provided email already exists. Click <a href="'.APPLICATION_URL.'/user/forgot">here</a> if you own the account but forgot its password';
            }
        }

        // x. Create account
        if (empty($message)) {
            $password = $model->PASSWORD;

    		$model->LOGIN = $model->EMAIL;
    		$model->PASSWORD = md5($password);
            $model->FORCE_PASSWORD_CHANGE = false;
            $model->IS_EMAIL_VERIFIED = true;
            $model->IS_ENABLED = true;
            $model->CREATION_DATE = date('Y-m-d H:i:s');

    		if (!$model->insert()) {
                $message = _t('Account registration error');
    		} else {
                // x. Update user domain id
                $model->UDID = $model->ID;
                $model->GUID = $model->ID;

                $model->update();

    		    // x. Add to the Base User group
    		    $umc = new UserMembershipController();
    		    if (!$umc->addUserToGroup($model, DEFAULT_USER_GROUP)) {
                    $message = _t('Account registration error');
                } else {
            	    // x. Send email confirmation
        	        UserController::sendEmailConfirmation($model);
                }
            }
        }

        if (!empty($message)) {
            // Correction
            if (isset($password)) {
                $model->PASSWORD = $password;
            }

            $smarty = Framework::getSmarty(__FILE__);

            $smarty->assign('message', $message);
            $smarty->assign('details', $model);
            $smarty->assign('return', $return);

            $this->display($smarty, 'user.signup-via-invitation.tpl');
        } else {
            // x. Login
            AuthenticationController::login($model);

            // x. Return
            if (!empty($return)) {
                Framework::redirect($return);
            } else {
                Framework::redirect(APPLICATION_URL);
            }
        }
    }

    function userExists($email) {
        $model = new UserModel();

        $model->EMAIL = $email;

        $model->find();

        return $model->fetch();
    }

    function showSignUpPage($name, $email, $return) {
        // x. Ensure logout
        AuthenticationController::logout();

        // x. Show sign up page
        $details = new stdClass();

        if (preg_match('/([a-z\-]+)\s+(.*)/is', $name, $match)) {
            $details->FIRST_NAME = $match[1];
            $details->LAST_NAME = $match[2];
        } else {
            $details->FIRST_NAME = $name;
        }

        $details->EMAIL = $email;

        $smarty = Framework::getSmarty(__FILE__);

        $smarty->assign('details', $details);
        $smarty->assign('return', $return);

        $this->display($smarty, 'user.signup-via-invitation.tpl');
    }

    function acceptInvitation($model) {
        // x. Check if the current user is the targeted invitee
        AuthenticationController::authenticate(); // IMPORTANT

        $valid = ($_SESSION['user']->EMAIL == $model->INVITEE_EMAIL);

        // x. If not valid
        if (!$valid) {
            MessageHelper::setAppMessage(_t("You need to sign in as")." ".$model->INVITEE_EMAIL." "._t("to accept the invitation"));

            Framework::redirect(APPLICATION_URL);
        }

        // x. The current user is a valid invitee. Now, add it to the inviter domain (~ the invitation domain)
        $extra = new UserExtraDomainModel();

        $extra->ID_USER = $_SESSION['user']->ID;
        $extra->EXTRA_UDID = (int)$model->UDID."";
        $extra->VALID_FROM = $model->VALID_FROM;
        $extra->VALID_UNTIL = $model->VALID_UNTIL;

        $extra->insert(false);

        // x. Add user group and user role
	    $umc = new UserMembershipController();
	    $umc->addUserToGroup($_SESSION['user'], $model->ID_USER_GROUP, $model->ID_USER_ROLE, $model->VALID_FROM, $model->VALID_UNTIL);

        // x. Update the invitation
        $model->ID_USER_INVITATION_STATUS = 'accepted';
        $model->DATE_ACCEPTED = date('Y-m-d H:i:s');

        $model->update();

        // x. Redirect
        Framework::redirect(APPLICATION_URL);
    }

    function sendInvitationEmail($model) {
        // Create activation link
        $compound = $model->UUID.','.$model->INVITEE_EMAIL.','.$model->UDID;
        $activation = APPLICATION_URL.'/userinvitation/accept?c='.base64_encode($compound);

        // x. Activation email content
        $smarty = Framework::getSmarty(__FILE__);
        $smarty->assign('inviter', $_SESSION['user']);
        $smarty->assign('invitation', $model);
        $smarty->assign('activation', $activation);
        $content = $smarty->fetch('.email.user-invitation.tpl');

        // x. Send an email to the subscriber
        $headers  = 'MIME-Version: 1.0' . "\r\n";
        $headers .= 'Content-type: text/html; charset=utf-8' . "\r\n";
        $headers .= 'From: '.SUPPORT_NAME.' <'.SUPPORT_EMAIL.'>' . "\r\n";

        if (!MailController::mail($model->INVITEE_EMAIL, 'Account Invitation', nl2br($content), $headers)) {
            return _t('Cannot send invitation email');
        }

        // x. Update invitation status
        $model->ID_USER_INVITATION_STATUS = empty($model->ID_INVITATION_STATUS)? 'sent' : 'resent';
        $model->DATE_SENT = date('Y-m-d H:i:s');

        $model->update();
    }

    function setupAdditionalViewButtons($model) {
        $buttons = parent::setupAdditionalViewButtons($model);

        if (empty($model->ID_USER_INVITATION_STATUS)) {
            $sendaction = array(
                'code' => 'send',
                'title' => 'Send invitation',
                'link' => APPLICATION_URL.'/userinvitation/send/'.$model->UUID
            );

            $buttons[] = $sendaction;
        } else if (in_array($model->ID_USER_INVITATION_STATUS, array('sent', 'resent'))) {
            $resendaction = array(
                'code' => 'resend',
                'title' => 'Resend invitation',
                'link' => APPLICATION_URL.'/userinvitation/send/'.$model->UUID
            );

            $buttons[] = $resendaction;
        }

        return $buttons;
    }
}