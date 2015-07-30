<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
require_once(LIBRARY_DIR.'/external/facebook-php-sdk-v4-5.0/autoload.php');

class FacebookController {
    function getFacebookInstance() {
        $fb = new Facebook\Facebook([
            'app_id' => get_option('facebook-oauth2-app-id'),
            'app_secret' => get_option('facebook-oauth2-app-secret'),
            'default_graph_version' => 'v2.2',
        ]);

        return $fb;
    }

    function loginAction() {
        $fb = $this->getFacebookInstance();

        $helper = $fb->getRedirectLoginHelper();
        $permissions = ['email']; // optional
        $loginUrl = $helper->getLoginUrl(APPLICATION_URL.'/facebook/oauth2callback', $permissions);

        header('Location:'.$loginUrl);
    }

    // Support callback from PHP SDK
    function oauth2callbackAction() {
        $fb = $this->getFacebookInstance();

        $helper = $fb->getRedirectLoginHelper();

        try {
            $accessToken = $helper->getAccessToken();

            $this->onAccessToken($accessToken);
        } catch(Exception $e) {
            $this->onError($e->getMessage());
        }
    }

    // Support callback from Javascript SDK
    function callbackAction() {
        $accessToken = isset($_REQUEST['token'])? $_REQUEST['token'] : '';

        if (empty($accessToken)) {
            $this->onError();
        }

        $this->onAccessToken($accessToken);
    }

    function onAccessToken($accessToken) {
        $fb = $this->getFacebookInstance();

        // Exchanges a short-lived access token for a long-lived one
        $oAuth2Client = $fb->getOAuth2Client();
        $accessToken = $oAuth2Client->getLongLivedAccessToken($accessToken);

        // Set default access token for subsequence requests
        $fb->setDefaultAccessToken($accessToken);

        try {
            $response = $fb->get('/me?fields=id,name,email,first_name,middle_name,last_name,gender,link,verified,cover,work,website,timezone,relationship_status,locale,location,languages,education,currency,birthday,address,age_range,about');

            $gu = $response->getGraphUser();

            $this->onGraphUser($gu);
        } catch(Exception $e) {
            $this->onError($e->getMessage());
        }
    }

    function onGraphUser($gu) {
        // x. Extract information
        $id = $gu->getProperty('id');
        $email = $gu->getProperty('email');
        $first_name = $gu->getProperty('first_name');
        $middle_name = $gu->getProperty('middle_name');
        $last_name = $gu->getProperty('last_name');
        $gender = $gu->getProperty('gender');
        $link = $gu->getProperty('link');
        $verified = $gu->getProperty('verified');

        $locale = $gu->getProperty('locale');
        $currency = $gu->getProperty('currency');
        $birthday = $gu->getProperty('birthday');

        if (is_array($currency) && isset($currency['user_currency'])) {
            $currency = $currency['user_currency'];
        }

        // x. Ensure email available
        if (empty($email)) {
            $this->onError();
        }

        // x. Check if user exists
        $model = new UserModel();

        $model->whereAdd("EMAIL = '$email'");

        $model->find();
        $model->fetch();

        $exists = ($model->ID > 0);

        // x. Set data
        $model->EMAIL = $email;
        $model->FACEBOOK_ID = $id;
        $model->FACEBOOK_OAUTH_ID = $id;
        $model->IS_EMAIL_VERIFIED = $verified;
        if (empty($model->PHOTO)) {
            $model->PHOTO = "http://graph.facebook.com/{$id}/picture";
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
            $model->FIRST_NAME = $first_name;
            $model->LAST_NAME = ($middle_name? $middle_name.' ' : '').$last_name;
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

    	    // x. Send email confirmation
    	    UserController::sendEmailConfirmation($model);
        }

        // x. Set language
        list($lang) = explode('_', $model->LOCALE);

        if (!empty($lang)) {
            $_SESSION['lang'] = $lang;
        }

        // x. Login
        AuthenticationController::login($model);

        // x. Redirect to a target page
        Framework::redirect(APPLICATION_URL);
    }

    function onError($message = '') {
        Framework::redirect(APPLICATION_URL.'/authentication/login');
    }
}