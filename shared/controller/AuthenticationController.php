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

            AuthenticationController::loginAction($return);

            exit(0);
        }

        // Expire the session after 5 minutes of idle
        //setcookie(session_name(), $_COOKIE[session_name()], time()+300, '/');
    }

    static function loginAction($return = '') {
        if (isset($_SESSION['user'])) {
            if ($_SESSION['user']->ID == 1) {
                if (isset($_REQUEST['as'])) {
                    AuthenticationController::tryLoginAs($_REQUEST['as']);
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
                $errors[] = 'The account does not exist. Please check if the specified user name is correct.';
            } elseif (!$member->IS_ENABLED) {
                if (empty($member->LATEST_LOGIN)) {
                    $errors[] = 'The account is not activated.<br/>Click <a href="'.(APPLICATION_URL.'/user/resend').'">here</a> to receive an instruction email to activate it.';
                } else {
                    $errors[] = 'The account is disabled.';
                }
            } elseif ($md5password != $member->PASSWORD) {
                $errors[] = 'Incorrect password. Please try again';
            }

            if (!empty($errors)) {
                $smarty = Framework::getSmarty();

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

	                $smarty = Framework::getSmarty();

	                $smarty->assign('errors', $errors);

	                $smarty->display('.force_password_change.tpl');
                } else {
                    // Login
                    AuthenticationController::login($member);

	                if (!empty($return)) {
	                    Framework::redirect($return);
	                } else {
	                    Framework::redirect(APPLICATION_URL);
	                }
				}
            }
        } else {
            $smarty = Framework::getSmarty();

            $smarty->assign('controller', Framework::get('controller'));
            $smarty->assign('return', $return);

            $smarty->display('login.tpl');
        }
    }

    function tryLoginAs($username) {
        // Member
		$member = new UserModel();
		$member->LOGIN = $username;
		$member->find(1);

		if ($member->ID) {
            AuthenticationController::login($member);
        }
    }

    function login($user) {
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
        AuthenticationController::initializeUserContext($user->ID);
    }

    function initializeUserContext($id_user) {
        // Load access rights
        $acl = new AclController();
		$acl->loadAccessRights($id_user);

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

        // Menus
        if (Framework::hasModule('AdminMenu')) {
            // Load all menus
            $model = new AdminMenuModel();

            $model->IS_ENABLED = 1;
            $model->orderBy('ORDERING');

            $model->find();

            $rows = array();
            while ($model->fetch()) {
                $rows[] = clone $model;
            }

            $_SESSION['menus'] = $rows;

            // Load default menu
            AuthenticationController::loadMenu($preferences->ID_ADMIN_MENU);
        }

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

    function loadMenu($id_menu) {
        if (!Framework::hasModule('AdminMenu')) {
            return;
        }

        $acl = isset($_SESSION['acl'])? $_SESSION['acl'] : array();

        // Load menu
        $model = new AdminMenuItemModel();

        $model->ID_ADMIN_MENU = $id_menu;
        $model->whereAdd("ENABLE_LEFT = 1 OR ENABLE_TOP = 1 OR ENABLE_QUICK = 1 OR ENABLE_ALL = 1 OR ENABLE_SETTINGS = 1");
        $model->orderBy('PARENT, ORDERING');
        $model->find();

        $rows = array();
        while ($model->fetch()) {
            // Access right checking
            if (empty($model->MODULE) || Framework::hasModule($model->MODULE) && isset($acl[$model->MODULE]['menu']) && $acl[$model->MODULE]['menu']) {
                $model->IS_EXTERNAL_LINK = false;

                if (!empty($model->PATH)) {
                    if (preg_match('/^(http|www)/is', $model->PATH)) {
                        $model->LINK = $model->PATH;

                        $model->IS_EXTERNAL_LINK = true;
                    } else {
                        $model->LINK = APPLICATION_URL.'/'.$model->PATH;
                    }
                } else {
                    if (!empty($model->MODULE)) {
                        $model->LINK = APPLICATION_URL.'/'.$model->MODULE;
                    } else {
                        $model->LINK = '';
                    }
                }

                $rows[$model->ID] = clone $model;
            }
        }

        $_SESSION['flatmenu'] = $rows;

        $depth = 0;
        $orphan = true;
        $expectedparents = array();

        $menuitems = array();
        $cache = $rows;
        while ($orphan) {
            $orphan = false;
            $ids = array();

            foreach ($rows as $i => $row) {
                if (empty($row->PARENT) || isset($cache[$row->PARENT])) {
                    if (empty($expectedparents) && empty($row->PARENT) || !empty($expectedparents) && in_array($row->PARENT, $expectedparents)) {
                        $menuitems[$depth][$row->PARENT? $row->PARENT : 0][] = $row;
                        $ids[] = $row->ID;

                        unset($rows[$i]);
                    } else {
                        $orphan = true;
                    }
                } else {
                    unset($rows[$i]);
                }
            }

            $expectedparents = $ids;
            $depth += 1;
        }

        $_SESSION['menu'] = $menuitems;
        $_SESSION['menuid'] = $id_menu;
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
                $errors[] = 'Please specify both password and password confirmation';
            }

            if ($password != $confirmpassword) {
                $errors[] = 'Password and password confirmation mismatched';
            }

            if (md5($password) == $_SESSION['_force_password_change_user']->PASSWORD) {
                $errors[] = 'New password and old password should be different';
            }

            if (!empty($errors)) {
                $smarty = Framework::getSmarty();

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
        AuthenticationController::authenticate();

        $member = $_SESSION['user'];

        // Initialize user context
        AuthenticationController::initializeUserContext($member->ID);

        ContextStack::back(0);
    }

    function logoutAction() {
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

        Framework::redirect(APPLICATION_URL);
    }
}