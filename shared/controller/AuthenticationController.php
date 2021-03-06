<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class AuthenticationController extends __AppController
{
    static function authenticate() {
        if (!isset($_SESSION['user'])) {
            $return = isset($_SERVER['REQUEST_URI'])? $_SERVER['REQUEST_URI'] : '';

            self::loginAction($return);

            exit(0);
        }

        // Expire the session after 5 minutes of idle
        //setcookie(session_name(), $_COOKIE[session_name()], time()+300, '/');
    }

    static function loginAction($return = '') {
        if (isset($_SESSION['user'])) {
            if ($_SESSION['user']->ID == 1) {
                if (isset($_REQUEST['as'])) {
                    self::tryLoginAs($_REQUEST['as']);
                }
            }

            Framework::redirect(APPLICATION_URL);
            return true;
        }

        $remember = isset($_POST['remember']);

        if (!empty($_POST) || isset($_COOKIE['_cookies'])) {
            if (!empty($_POST)) {
                $username = isset($_POST['username'])? $_POST['username'] : '';
                $password = isset($_POST['password'])? $_POST['password'] : '';
                $return = isset($_REQUEST['return'])? $_REQUEST['return'] : '';

                // Validate
                $errors = array();
                if (empty($username) || empty($password)) {
                    $errors[] = 'Please specify both username and password';
                }

                $md5password = md5($password);
            } else {
                $cookies = $_COOKIE['_cookies'];

                list($username, $md5password) = explode('.', $cookies);

                $username = base64_decode($username);
                $md5password = base64_decode($md5password);
            }

            // Member
    		$member = new UserModel();
    		$member->LOGIN = $username;
    		$member->find(1);

            if (empty($member) || !$member->ID) {
                $errors[] = _t('The account does not exist. Please check if the specified user name is correct.');
            } elseif (!$member->IS_ENABLED) {
                if (empty($member->LATEST_LOGIN)) {
                    $errors[] = _t('The account is not activated.<br/>Click <a href="'.(APPLICATION_URL.'/user/resend').'">here</a> to receive an instruction email to activate it.');
                } else {
                    $errors[] = _t('The account is disabled.');
                }
            } elseif ($md5password != $member->PASSWORD) {
                $errors[] = _t('Incorrect password. Please try again');
            }

            if (!empty($errors)) {
                $smarty = Framework::getSmarty(__FILE__);

                $smarty->assign('controller', Framework::get('controller'));
                $smarty->assign('errors', $errors);
                $smarty->assign('return', $return);

                $smarty->display('login.tpl');
            } else {
                if($remember){
                    setcookie('_cookies', base64_encode($username).'.'.base64_encode($md5password), time()+60*60*24, '/');
                }

	            // Force change password if needed
                if ($member->FORCE_PASSWORD_CHANGE) {
                	$_SESSION['_force_password_change_user'] = $member;

	                $smarty = Framework::getSmarty(__FILE__);

	                $smarty->assign('errors', $errors);

	                $smarty->display('.force_password_change.tpl');
                } else {
                    // Login
                    self::login($member);

	                if (!empty($return)) {
	                    Framework::redirect($return);
	                } else {
	                    Framework::redirect(APPLICATION_URL);
	                }
				}
            }
        } else {
            $smarty = Framework::getSmarty(__FILE__);

            $smarty->assign('controller', Framework::get('controller'));
            $smarty->assign('return', $return);

            $smarty->display('login.tpl');
        }
    }

    static function tryLoginAs($username) {
        // Member
		$member = new UserModel();
		$member->LOGIN = $username;
		$member->find(1);

		if ($member->ID) {
            self::login($member);
        }
    }

    static function login($user) {
        $date_time = date('Y-m-d H:i:s');

        // Store into session
        $_SESSION['user'] = $user;

        // Update
		$user->LATEST_LOGIN = $date_time;
		$user->update();

        // User log
        if (Framework::hasModule('UserLog')) {
            $ulm = new UserLogModel();

            $ulm->IP = $_SERVER['REMOTE_ADDR'];
    		$ulm->ID_USER = $user->ID;
    		$ulm->DATE_TIME = $date_time;

            $ulm->insert();
        }

        // Initialize user context
        self::initializeUserContext($user);
    }

    static function initializeUserContext($user) {
        $id_user = $user->ID;

        // Load access rights
        $acl = new AclController();
		$acl->loadAccessRights($user);

        // Load user quota
		$acl->loadUserQuota($id_user);

        // Load user preferences
        if (Framework::hasModule('UserPreference')) {
            $model = new UserPreferenceModel();

            $model->joinAdd(new DashboardModel());
            $model->ID_USER = $_SESSION['user']->ID;

            $model->find();
            $model->fetch();

            $preferences = clone $model;

            $_SESSION['user']->preferences = $preferences;

            $_SESSION['user.preferences.style'] = $preferences->ID_ADMIN_STYLE;
            $_SESSION['user.preferences.wallpaper'] = $preferences->ID_WALLPAPER;
        }

        // Load default menu
        self::loadMenu($preferences->ID_ADMIN_MENU);

        // Load user message
        if (Framework::hasModule('UserMessage')) {
            $model = new UserMessageModel();
            $model->ID_USER = $_SESSION['user']->ID;

            $model->find();

            if ($model->fetch()) {
                $_SESSION['user_message'] = $model->MESSAGE;
            } else {
                unset($_SESSION['user_message']);
            }
        }
    }

    static function loadMenu($id_menu) {
        if (AdminMenuHelper::getMenuStructure($id_menu, $flatmenu, $menutree)) {
            $_SESSION['menuid'] = $id_menu;
            $_SESSION['flatmenu'] = $flatmenu;
            $_SESSION['menu'] = $menutree;
        }
    }

	function changePasswordAction() {
        if (!isset($_SESSION['_force_password_change_user'])) {
            Framework::redirect(APPLICATION_URL);

            return false;
        }

        if (!empty($_POST)) {
            $password = $_POST['password'];
            $confirmpassword = $_POST['confirmpassword'];

            $errors = array();

            if (empty($password) || empty($confirmpassword)) {
                $errors[] = _t('Please specify both password and password confirmation');
            }

            if ($password != $confirmpassword) {
                $errors[] = _t('Password and password confirmation mismatched');
            }

            if (md5($password) == $_SESSION['_force_password_change_user']->PASSWORD) {
                $errors[] = _t('New password and old password should be different');
            }

            if (!empty($errors)) {
                $smarty = Framework::getSmarty(__FILE__);

                $smarty->assign('errors', $errors);

                $smarty->display('.force_password_change.tpl');
            } else {
	            // Change password
	    		$member = new UserModel();

	    		$member->ID = $_SESSION['_force_password_change_user']->ID;
	    		$member->PASSWORD = md5($password);
	    		$member->FORCE_PASSWORD_CHANGE = 0;

	    		$member->update();

				// Unset
				unset($_SESSION['_force_password_change_user']);

	    		// Redirect to the login screen
	    		Framework::redirect(APPLICATION_URL);
			}
		}
	}

    function refreshAction() {
        self::refresh();

        ContextStack::back(0);
    }

    static function refresh() {
        self::authenticate();

        $user = $_SESSION['user'];

        // Initialize user context
        self::initializeUserContext($user);
    }

    function logoutAction() {
        self::logout();

        Framework::redirect(APPLICATION_URL);
    }

    static function logout() {
        if (isset($_COOKIE['_cookies'])){
           setcookie('_cookies', '', time()-60*60*24, '/');
        }

        // If it's desired to kill the session, also delete the session cookie.
        // Note: This will destroy the session, and not just the session data!
        if (isset($_COOKIE[session_name()])) {
           setcookie(session_name(), '', time()-42000, '/');
        }

        // Finally, destroy the session.
        session_destroy();
    }
}