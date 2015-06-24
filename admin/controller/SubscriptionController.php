<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class SubscriptionController extends _SubscriptionController
{
    function subscribeAction() {
        if (!empty($_POST)) {
            // x. Data
            $model = new SubscriberModel();

            $model->NAME = isset($_REQUEST['NAME'])? $_REQUEST['NAME'] : '';
            $model->EMAIL = isset($_REQUEST['EMAIL'])? $_REQUEST['EMAIL'] : '';
            $model->ID_SUBSCRIPTION = isset($_REQUEST['ID_SUBSCRIPTION'])? $_REQUEST['ID_SUBSCRIPTION'] : '';

            // x. Data checking
            $message = '';

            if (empty($model->NAME)) {
                $message = 'Your name should not be empty';
            } elseif (empty($model->EMAIL)) {
                $message = 'Email address should not be empty';
            } elseif (!preg_match('/^([.0-9a-z_-]+)@(([0-9a-z-]+\.)+[0-9a-z]{2,4})$/i', $model->EMAIL)) {
                $message = 'Invalid email address';
            }

            // x. Check if subscription already exists
            if (empty($message)) {
                $sm = new SubscriberModel();
                $sm->ID_SUBSCRIPTION = $model->ID_SUBSCRIPTION;
                $sm->EMAIL = $model->EMAIL;
                $sm->find();
                if ($sm->fetch()) {
                    $message = 'Subscription already exists. Click <a href="'.APPLICATION_URL.'/subscription/resend/'.$sm->ID.'">here</a> to resend the subscription activation email.';
                }
            }

            // x. Create subscription
            if (empty($message)) {
        		$model->DATE_REGISTRATION = date('Y-m-d');
                $model->IS_ENABLED = false;

        		if (!$model->insert()) {
                    $message = 'Subscription error';
        		} else {
                    // Create activation link
                    $compound = $model->ID.','.$model->EMAIL;
                    $activation = APPLICATION_URL.'/subscription/activate?c='.base64_encode($compound);

                    // x. Activation email content
                    $smarty = Framework::getSmarty();
                    $smarty->assign('name', $model->NAME);
                    $smarty->assign('email', $model->EMAIL);
                    $smarty->assign('activation', $activation);
                    $content = $smarty->fetch('.email.subscription-created.tpl');

                    // x. Send an email to the subscriber
                    $headers  = 'MIME-Version: 1.0' . "\r\n";
                    $headers .= 'Content-type: text/html; charset=utf-8' . "\r\n";
                    $headers .= 'From: '.SUPPORT_NAME.' <'.SUPPORT_EMAIL.'>' . "\r\n";

                    if (!MailController::mail($model->EMAIL, 'Subscription Activation Required', nl2br($content), $headers)) {
                        $message = 'Cannot send notification email';
                    }
                }
            }

            if (!empty($message)) {
                $smarty = Framework::getSmarty();

                $smarty->assign('message', $message);
                $smarty->assign('details', $model);

                $smarty->display('subscription.subscribe.tpl');
            } else {
                $this->simple_page('A subsciption activation email has been sent to you. Please check your mailbox for instructions to activate the subscription.', 'Activation sent');
            }
        } else {
            $smarty = Framework::getSmarty();

            $smarty->display('subscription.subscribe.tpl');
        }
    }

    function activateAction() {
        $compound = isset($_REQUEST['c'])? $_REQUEST['c'] : '';

        if (!empty($compound)) {
            $compound = base64_decode($compound);

            if (preg_match('/.*,.*/i',$compound)) {
                list($id_user, $email) = explode(',', $compound);

                if ($this->activate($id_user, $email)) {
                    $this->simple_page('Your subscription has been activated.', 'Subscription activated');
                }
            }
        }

        $this->simple_page('The request is invalid or expired. Please check again.', 'Invalid request');
    }

    function activate($id_user, $email) {
		$model = new SubscriberModel();
		$model->ID_USER = $id_user;
		$model->EMAIL = $email;
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

        return true;
    }

    function unsubscribeAction() {
        $compound = isset($_REQUEST['c'])? $_REQUEST['c'] : '';

        if (!empty($compound)) {
            $compound = base64_decode($compound);

            if (preg_match('/.*,.*/i',$compound)) {
                list($id_user, $email) = explode(',', $compound);

                if ($this->unsubscribe($id_user, $email)) {
                    $this->simple_page('Your subscription has been removed.', 'Subscription removed');
                }
            }
        }

        $this->simple_page('The request is invalid or expired. Please check again.', 'Invalid request');
    }

    function unsubscribe($id_user, $email) {
		$model = new SubscriberModel();
		$model->ID_USER = $id_user;
		$model->EMAIL = $email;
        $model->find();

        if (!$model->fetch()) {
            return false;
        }

        // x. Disable the subscription
		$model->IS_ENABLED = false;

		if (!$model->update()) {
            return false;
		}

        return true;
    }

    function resendAction() {
        list($id_subscriber) = explode('/', $_REQUEST['args']);

        // x. Get subscription
        $model = new SubscriberModel();

        $model->ID = $id_subscriber;
        $model->find();

        if (!$model->fetch()) {
            $this->simple_page('The subscription associated with your request is not found. Please check again.', 'Subscription not found');
        }

        // x. Create activation link
        $compound = $model->ID.','.$model->EMAIL;
        $activation = APPLICATION_URL.'/subscription/activate?c='.base64_encode($compound);

        // x. Activation email content
        $smarty = Framework::getSmarty();
        $smarty->assign('name', $model->NAME);
        $smarty->assign('email', $model->EMAIL);
        $smarty->assign('activation', $activation);
        $content = $smarty->fetch('.email.subscription-created.tpl');

        // x. Send an email to the subscriber
        $headers  = 'MIME-Version: 1.0' . "\r\n";
        $headers .= 'Content-type: text/html; charset=utf-8' . "\r\n";
        $headers .= 'From: '.SUPPORT_NAME.' <'.SUPPORT_EMAIL.'>' . "\r\n";

        if (!MailController::mail($model->EMAIL, 'Subscription Activation Required', nl2br($content), $headers)) {
            $message = 'Cannot send notification email.';
        }

        if (!empty($message)) {
            $this->simple_page($message, 'Operation failed.');
        } else {
            $this->simple_page('Please check your mailbox for instructions to activate the subscription', 'Activation instruction sent');
        }
    }
}