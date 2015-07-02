<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class UserController
{
    function registerAction() {
        require_once('recaptcha/recaptchalib.php');

        $publickey = '6Ld1Dt4SAAAAAIs41HNVwTSACr0hf03n1DepuhNd';
        $privatekey = '6Ld1Dt4SAAAAAHVyHrNEPX2BFNi0_Nwz0BGmum9-';

        $captcha_resp = null;
        $captcha_error = null;

        if (!empty($_POST)) {
            // x. Data
            $model = $this->form2model();
            $model->PASSWORD2 = isset($_REQUEST['PASSWORD2'])? $_REQUEST['PASSWORD2'] : '';
            $accept_tos = isset($_REQUEST['ACCEPT_TOS'])? $_REQUEST['ACCEPT_TOS'] : 0;
            $accept_newsletter = isset($_REQUEST['ACCEPT_NEWSLETTER'])? $_REQUEST['ACCEPT_NEWSLETTER'] : 0;

            // x. Data checking
            $message = '';

            if (empty($model->NAME)) {
                $message = 'Full Name should not be empty';
            } elseif (empty($model->EMAIL)) {
                $message = 'Email Address should not be empty';
            } elseif (!preg_match('/^([.0-9a-z_-]+)@(([0-9a-z-]+\.)+[0-9a-z]{2,4})$/i', $model->EMAIL)) {
                $message = 'Invalid email address';
            } elseif (empty($model->PASSWORD) || strlen(trim($model->PASSWORD)) < 6) {
                $message = 'Password should be at least 6 characters and contains no spaces';
            } elseif (empty($model->PASSWORD2)) {
                $message = 'Password confirmation should not be empty';
            } elseif ($model->PASSWORD != $model->PASSWORD2) {
                $message = 'Password confirmation mismatch';
            } elseif (empty($_POST["recaptcha_response_field"])) {
                $message = 'Please type the text displayed in the verification image';
            } elseif (!$accept_tos) {
                $message = 'You need to accept the Terms of service of '.ORGANIZATION_NAME_SHORT.' before continuing';
            }

            // x. Captcha checking
            if (empty($message)) {
                $captcha_resp = recaptcha_check_answer($privatekey, $_SERVER["REMOTE_ADDR"], $_POST["recaptcha_challenge_field"], $_POST["recaptcha_response_field"]);

                if (!$captcha_resp->is_valid) {
                    $captcha_error = $captcha_resp->error;

                    if ($captcha_error == 'incorrect-captcha-sol') {
                        $message = "Incorrect captcha verification.";
                    } else {
                        $message = "Captcha verification error.";
                    }
                }
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
                $model->IS_ENABLED = false;
                $model->DATE_REGISTRATION = date('Y-m-d H:i:s');

        		if (!$model->insert()) {
                    $message = 'Account registration error';
        		} else {
        		    // x. Update newsletter subsciption
        		    if ($accept_newsletter) {
            		    $sm = new SubscriberModel();

            		    $sm->NAME = $model->NAME;
            		    $sm->EMAIL = $model->EMAIL;
            		    $sm->ID_SUBSCRIPTION = 1;
            		    $sm->DATE_REGISTRATION = date('Y-m-d');
            		    $sm->IS_ENABLED = false;

                		$sm->insert();
                	}

        		    // x. Add to the SML Subscribers user group
        		    $umc = new UserMembershipController();
        		    if (!$umc->addUserToGroup($model, DEFAULT_USER_GROUP)) {
                        $message = 'Account registration error';
                    } else {
                        // Create activation link
                        $compound = $model->ID.','.$model->PASSWORD;

                        if (isset($_SESSION['referral_user']) && !empty($_SESSION['referral_user'])) {
                            $ru = $_SESSION['referral_user'];

                            $compound .= ','.$ru->ID_USER.','.$ru->ID_REFERRAL;
                        }

                        $activation = APPLICATION_URL.'/user/activate?c='.base64_encode($compound);

                        // x. Activation email content
                        $smarty = Framework::getSmarty(__FILE__);
                        $smarty->assign('name', $model->NAME);
                        $smarty->assign('email', $model->EMAIL);
                        $smarty->assign('username', $model->LOGIN);
                        $smarty->assign('password', $password);
                        $smarty->assign('activation', $activation);
                        $content = $smarty->fetch('.email.account-created.tpl');

                        // x. Send an email to the subscriber
                        $headers  = 'MIME-Version: 1.0' . "\r\n";
                        $headers .= 'Content-type: text/html; charset=utf-8' . "\r\n";
                        $headers .= 'From: '.SUPPORT_NAME.' <'.SUPPORT_EMAIL.'>' . "\r\n";

                        if (!MailController::mail($model->EMAIL, 'Account Information', nl2br($content), $headers)) {
                            $message = 'Cannot send notification email';
                        }
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
                $smarty->assign('captcha', html_entity_decode(recaptcha_get_html($publickey, $captcha_error)));

                $smarty->display('user.register.tpl');
            } else {
                $smarty = Framework::getSmarty(__FILE__);

                $smarty->display('user.activation-sent.tpl');
            }
        } else {
            $smarty = Framework::getSmarty(__FILE__);

            $smarty->assign('captcha', html_entity_decode(recaptcha_get_html($publickey, $captcha_error)));

            $smarty->display('user.register.tpl');
        }
    }

    function forgotAction() {
        if (empty($_POST)) {
            $smarty = Framework::getSmarty(__FILE__);
            $smarty->display('user.forgot-password.tpl');
        } else {
            // x. Get data
            $email = isset($_POST['email'])? $_POST['email'] : '';

            // x. Check data
            $error = '';

            if (empty($email)) {
                $error = 'Email Address should not be empty';
            } elseif (!preg_match('/^([.0-9a-z_-]+)@(([0-9a-z-]+\.)+[0-9a-z]{2,4})$/i', $email)) {
                $error = 'Invalid email address';
            } else {
                // x. Get account information
                $um = new UserModel();
                $um->EMAIL = $email;
                $um->find();
                if (!$um->fetch()) {
                    $error = 'There is no account associated with the given email address';
                }
            }

            if (empty($error)) {
                // x. Build password reset link
                $compound = $um->EMAIL.','.$um->PASSWORD;
                $password_reset_link = APPLICATION_URL.'/user/reset?c='.base64_encode($compound);

                // x. Build email
                $smarty = Framework::getSmarty(__FILE__);
                $smarty->assign('name', $um->NAME);
                $smarty->assign('password_reset_link', $password_reset_link);
                $content = $smarty->fetch('.email.forgot-password.tpl');

                // x. Send email
                $headers  = 'MIME-Version: 1.0' . "\r\n";
                $headers .= 'Content-type: text/html; charset=utf-8' . "\r\n";
                $headers .= 'From: '.SUPPORT_NAME.' <'.SUPPORT_EMAIL.'>' . "\r\n";

                if (!MailController::mail($email, 'Reset Password', nl2br($content), $headers)) {
                    $error = 'Cannot send notification email';
                }
            }

            // x. Display
            if (!empty($error)) {
                $smarty = Framework::getSmarty(__FILE__);

                $smarty->assign('message', $error);
                $smarty->assign('email', $email);

                $smarty->display('user.forgot-password.tpl');
            } else {
                $smarty = Framework::getSmarty(__FILE__);

                $smarty->display('user.forgot-password-sent.tpl');
            }
        }
    }

    function resendAction() {
        if (empty($_POST)) {
            $smarty = Framework::getSmarty(__FILE__);
            $smarty->display('user.resend-activation.tpl');
        } else {
            // x. Get data
            $email = $_POST['email'];

            // x. Check data
            $error = '';

            if (empty($email)) {
                $error = 'Email Address should not be empty';
            } elseif (!preg_match('/^([.0-9a-z_-]+)@(([0-9a-z-]+\.)+[0-9a-z]{2,4})$/i', $email)) {
                $error = 'Invalid email address';
            } else {
                // x. Get account information
                $model = new UserModel();
                $model->EMAIL = $email;
                $model->find();
                if (!$model->fetch()) {
                    $error = 'There is no account associated with the given email address';
                }

                // x. Check if inactivated
                if ($model->IS_ENABLED) {
                    header('Location:'.APPLICATION_URL);

                    exit(1);
                }
            }

            if (empty($error)) {
                // x. Create activation link
                $compound = $model->ID.','.$model->PASSWORD;
                $activation = APPLICATION_URL.'/user/activate?c='.base64_encode($compound);

                // x. Activation email content
                $smarty = Framework::getSmarty(__FILE__);
                $smarty->assign('name', $model->NAME);
                $smarty->assign('activation', $activation);
                $content = $smarty->fetch('.email.resend-activation.tpl');

                // x. Send email
                $headers  = 'MIME-Version: 1.0' . "\r\n";
                $headers .= 'Content-type: text/html; charset=utf-8' . "\r\n";
                $headers .= 'From: '.SUPPORT_NAME.' <'.SUPPORT_EMAIL.'>' . "\r\n";

                if (!MailController::mail($model->EMAIL, 'Account Activation', nl2br($content), $headers)) {
                    $error = 'Cannot send account activation email';
                }
            }

            // x. Display
            if (!empty($error)) {
                $smarty = Framework::getSmarty(__FILE__);

                $smarty->assign('message', $error);
                $smarty->assign('email', $email);

                $smarty->display('user.resend-activation.tpl');
            } else {
                $smarty = Framework::getSmarty(__FILE__);

                $smarty->display('user.resend-activation-sent.tpl');
            }
        }
    }

    function activateAction() {
        $compound = isset($_REQUEST['c'])? $_REQUEST['c'] : '';

        if (!empty($compound)) {
            $compound = base64_decode($compound);

            if (preg_match('/.*,.*/i',$compound)) {
                @list($id_user, $activation, $referral_user, $referral_id) = explode(',', $compound);

                if ($this->activate($id_user, $activation, $referral_user, $referral_id)) {
                    $smarty = Framework::getSmarty(__FILE__);
                    $smarty->display('user.activation-done.tpl');

                    return;
                }
            }
        }

        $smarty = Framework::getSmarty(__FILE__);
        $smarty->display('user.activation-failed.tpl');
    }

    function activate($id_user, $activation, $referral_user = null, $referral_id = null) {
		$model = new UserModel();
		$model->ID = $id_user;
		$model->PASSWORD = $activation;
        $model->find();

        if (!$model->fetch()) {
            return false;
        }

        if ($model->IS_ENABLED) {
            return true;
        }

        // x. Activate the account
		$model->IS_ENABLED = true;

		if (!$model->update()) {
            return false;
		}

        // x. Activate newsletter subscription if any
		$sm = new SubscriberModel();

		$sm->IS_ENABLED = true;
		$sm->DATE_ACTIVATION = date('Y-m-d');

        $sm->whereAdd("ID_SUBSCRIPTION = 1 AND EMAIL = '{$model->EMAIL}'");
        $sm->update(DB_DATAOBJECT_WHEREADD_ONLY);

        // x. Log registered referral information
        if (!empty($referral_user) && !empty($referral_id)) {
            $rrlm = new ReferralRegLogModel();

            $rrlm->ID_USER = $referral_user;
            $rrlm->ID_REFERRAL = $referral_id;
            $rrlm->CREATED_ID_USER = $id_user;
            $rrlm->DATE_ACTIVATION = date('Y-m-d');

            $rrlm->insert();
        }

        return true;
    }

    function resetAction() {
        if (!empty($_POST)) {
            $this->processResetPasswordRequest();

            return;
        }

        $compound = isset($_REQUEST['c'])? $_REQUEST['c'] : '';

        $found = false;
        if (!empty($compound)) {
            $compound = base64_decode($compound);

            if (preg_match('/.*,.*/i',$compound)) {
                list($email, $password) = explode(',', $compound);

                // x. Find the user
        		$model = new UserModel();
        		$model->EMAIL = $email;
        		$model->PASSWORD = $password;
                $model->find();

                if ($model->fetch()) {
                    $found = true;
                }
            }
        }

        if ($found) {
            $smarty = Framework::getSmarty(__FILE__);

            $smarty->assign('compound', $_REQUEST['c']);

            $smarty->display('user.reset-password.tpl');
        } else {
            $smarty = Framework::getSmarty(__FILE__);
            $smarty->assign('error', 'Invalid request.');
            $smarty->display('error.tpl');
        }
    }

    function processResetPasswordRequest() {
        $compound = isset($_REQUEST['c'])? $_REQUEST['c'] : '';

        $found = false;
        if (!empty($compound)) {
            $compound = base64_decode($compound);

            if (preg_match('/.*,.*/i',$compound)) {
                list($email, $password) = explode(',', $compound);

                // x. Find the user
        		$model = new UserModel();
        		$model->EMAIL = $email;
        		$model->PASSWORD = $password;
                $model->find();

                if ($model->fetch()) {
                    $found = true;
                }
            }
        }

        if ($found) {
            $password = isset($_REQUEST['PASSWORD'])? $_REQUEST['PASSWORD'] : '';
            $password2 = isset($_REQUEST['PASSWORD2'])? $_REQUEST['PASSWORD2'] : '';

            $error = '';
            if (empty($password) || strlen(trim($password)) < 6) {
                $error = 'Password should be at least 6 characters and contains no spaces';
            } elseif (empty($password2)) {
                $error = 'Password confirmation should not be empty';
            } elseif ($password != $password2) {
                $error = 'Password confirmation mismatch';
            }

            if (empty($error)) {
                // Reset password
                $model->PASSWORD = md5($password);

                $model->update();
            }

            if (empty($error)) {
                $smarty = Framework::getSmarty(__FILE__);

                $smarty->display('user.reset-password-done.tpl');
            } else {
                $smarty = Framework::getSmarty(__FILE__);

                $smarty->assign('message', $error);
                $smarty->assign('compound', $_REQUEST['c']);

                $smarty->display('user.reset-password.tpl');
            }
        } else {
            $smarty = Framework::getSmarty(__FILE__);
            $smarty->assign('error', 'Invalid request.');
            $smarty->display('error.tpl');
        }
    }
}