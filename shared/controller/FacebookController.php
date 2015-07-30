<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
require_once(LIBRARY_DIR.'/external/facebook-php-sdk/autoload.php');

class FacebookController {
    function __construct() {
        Facebook\FacebookSession::setDefaultApplication(get_option('facebook-oauth2-app-id'), get_option('facebook-oauth2-app-secret'));
    }

    function loginAction() {
        $helper = new Facebook\FacebookRedirectLoginHelper(APPLICATION_URL.'/facebook/oauth2callback');

        header('Location:'.$helper->getLoginUrl());
    }

    // Support callback from PHP SDK
    function oauth2callbackAction() {
        $helper = new Facebook\FacebookRedirectLoginHelper(APPLICATION_URL.'/facebook/oauth2callback');

        try {
            $session = $helper->getSessionFromRedirect();
        } catch(FacebookRequestException $ex) {
            $this->onError();
        } catch(\Exception $ex) {
            $this->onError();
        }

        // x. If session ok
        if ($session) {
            $this->onSessionData($session);
        }
    }

    // Support callback from Javascript SDK
    function callbackAction() {
        $helper = new Facebook\FacebookJavaScriptLoginHelper();

        // x. Get Facebook session
        try {
            $session = $helper->getSession();
        } catch(FacebookRequestException $ex) {
            $this->onError();
        } catch(\Exception $ex) {
            $this->onError();
        }

        // x. If session ok
        if ($session) {
            $this->onSessionData($session);
        }
    }

    function onError() {
        Framework::redirect(APPLICATION_URL.'/authentication/login');
    }

    function onSessionData($session) {
        // Get graph data
        $request = new Facebook\FacebookRequest($session, 'GET', '/me?fields=id,name,email,first_name,middle_name,last_name,gender,link,verified,locale,currency,birthday');
        $response = $request->execute();
        $graph_object = $response->getGraphObject();

        // x. Extract information
        $id = $graph_object->getProperty('id');
        $email = $graph_object->getProperty('email');
        $first_name = $graph_object->getProperty('first_name');
        $middle_name = $graph_object->getProperty('middle_name');
        $last_name = $graph_object->getProperty('last_name');
        $gender = $graph_object->getProperty('gender');
        $link = $graph_object->getProperty('link');
        $verified = $graph_object->getProperty('verified');

        $locale = $graph_object->getProperty('locale');
        $currency = $graph_object->getProperty('currency');
        $birthday = $graph_object->getProperty('birthday');

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
        }

        // x. Login
        AuthenticationController::login($model);

        // x. Redirect to a target page
        Framework::redirect(APPLICATION_URL);
    }
}