<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
require_once('google-api-php-client/src/Google/Client.php');

class GoogleController {
    function getGoogleClient() {
        static $client = null;

        if ($client == null) {
    	    $client_id = get_option('google-oauth2-client-id');
    	    $client_secret = get_option('google-oauth2-client-secret');
    	    $redirect_uri = APPLICATION_URL.'/google/oauth2callback';

            $client = new Google_Client();
            $client->setClientId($client_id);
            $client->setClientSecret($client_secret);
            $client->setRedirectUri($redirect_uri);

            $client->setScopes(array(
                "https://www.googleapis.com/auth/userinfo.email",
                "https://www.googleapis.com/auth/userinfo.profile"
            ));
        }

        return $client;
    }

    function loginAction() {
        $client = $this->getGoogleClient();

        $auth_url = $client->createAuthUrl();

        header('Location: ' . filter_var($auth_url, FILTER_SANITIZE_URL));
    }

    function oauth2callbackAction() {
        $returnUrl = isset($_REQUEST['returnUrl'])? $_REQUEST['returnUrl'] : '';

        $code = isset($_REQUEST['code'])? $_REQUEST['code'] : '';

        if (!empty($code)) {
            // x. Authenticate
            $client = $this->getGoogleClient();
            $client->authenticate($code);

            // x. Store access token in the session
            $_SESSION['access_token'] = $client->getAccessToken();

            // x. Get token data
            $token_data = $client->verifyIdToken()->getAttributes();

            // x. Extract information
            $id = $token_data['payload']['id'];
            $email = $token_data['payload']['email'];
            $email_verified = $token_data['payload']['email_verified'];

            // x. Ensure email available
            if (empty($email)) {
                Framework::redirect(APPLICATION_URL.'/authentication/login');
            }

            // x. Get further information
            $access_token_string = json_decode($client->getAccessToken())->access_token;

            $url = 'https://www.googleapis.com/oauth2/v1/userinfo?access_token='.$access_token_string;
            $content = file_get_contents($url);
            $json = json_decode($content, true);

            // x. Extract information
            $name = $json['name'];
            $given_name = $json['given_name'];
            $family_name = $json['family_name'];
            $link = $json['$link'];
            $picture = $json['picture'];
            $gender = $json['gender'];
            $locale = $json['locale'];

            // x. Check if user exists
            $model = new UserModel();

            $model->whereAdd("EMAIL = '$email'");

            $model->find();
            $model->fetch();

            $exists = ($model->ID > 0);

            // x. Set data
            $model->EMAIL = $email;
            $model->GOOGLE_ID = $id;
            $model->GOOGLE_OAUTH_ID = $id;
            $model->IS_EMAIL_VERIFIED = $email_verified;
            if (empty($model->PHOTO)) {
                $model->PHOTO = $picture;
            }
            if (empty($model->LOCALE)) {
                $model->LOCALE = $locale;
            }

            // x. Insert or update
            if ($exists) {
                if (empty($model->LOGIN)) {
                    $model->LOGIN = $email;
                }

                $model->update();
            } else {
                $uc = new UserController();

                $model->LOGIN = $email;
                $model->FIRST_NAME = $given_name;
                $model->LAST_NAME = $family_name;
                $model->GENDER = ($gender == 'male');
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
        }
    }
}