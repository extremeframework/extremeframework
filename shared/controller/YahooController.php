<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
require_once('lightopenid/openid.php');

class YahooController {
    function getYahooClient() {
        static $client = null;

        if ($client == null) {
            $client = new LightOpenID($_SERVER['HTTP_HOST']);
        }

        return $client;
    }

    function loginAction() {
        $returnUrl = isset($_REQUEST['returnUrl'])? $_REQUEST['returnUrl'] : '';

        $client = $this->getYahooClient();

        if (!$client->mode) {
            $client->identity = 'https://me.yahoo.com';
            $client->required = array('contact/email' , 'namePerson/first' , 'namePerson/last' , 'pref/language' , 'contact/country/home', 'namePerson', 'namePerson/friendly', 'contact/email');
            $client->returnUrl = APPLICATION_URL.'/yahoo/callback'.(!empty($returnUrl)? '?returnUrl='.$returnUrl : '');

            header('Location: ' . $client->authUrl());
        }
    }

    function callbackAction() {
        $returnUrl = isset($_REQUEST['returnUrl'])? $_REQUEST['returnUrl'] : '';

        $client = $this->getYahooClient();

        if (!$client->mode || $client->mode == 'cancel') {
            Framework::redirect(APPLICATION_URL.'/authentication/login');
        } else {
            if ($client->validate()) {
                // x. Get data
                $data = $client->getAttributes();

                // x. Extract information
                $email = $data['contact/email'];
                $name = $data['namePerson'];

                $parts = explode(' ', $name);

                $first_name = array_shift($parts);
                $last_name = implode (' ', $parts);

                // x. Ensure email available
                if (empty($email)) {
                    Framework::redirect(APPLICATION_URL.'/authentication/login');
                }

                // x. Check if user exists
                $model = new UserModel();

                $model->whereAdd("EMAIL = '$email'");

                $model->find();
                $model->fetch();

                $exists = ($model->ID > 0);

                // x. Set data
                $model->YAHOO_ID = $email;
                $model->IS_EMAIL_VERIFIED = true;

                // x. Insert or update
                if ($exists) {
                    if (empty($model->LOGIN)) {
                        $model->LOGIN = $email;
                    }

                    $model->update();
                } else {
                    $uc = new UserController();

                    $model->LOGIN = $email;
                    $model->FIRST_NAME = $first_name;
                    $model->LAST_NAME = $last_name;
                    $model->IS_ENABLED = true;
                    $model->CREATION_DATE = date('Y-m-d H:i:s');

                    $model->insert();

                    // x. Update
                    $model->UDID = $model->ID;
                    $model->GUID = $model->ID;

                    $model->update();

                    // x. Add to the Base User group
            	    $umc = new UserMembershipController();
            	    $umc->addUserToGroup($model, DEFAULT_USER_GROUP);
                }

                // x. Login
                AuthenticationController::login($model);

                // x. Redirect to a target page
                $html = '<script type="text/javascript">';

                $html .= 'if (opener != null) {';

                if (!empty($returnUrl)) {
                    $html .= 'opener.location.href="'.$returnUrl.'";';
                } else {
                    $html .= 'opener.location.reload(true);';
                }

                $html .= '}';

                $html .= 'self.close();';
                $html .= '</script>';

                echo $html;
            } else {
                Framework::redirect(APPLICATION_URL.'/authentication/login');
            }
        }
    }
}