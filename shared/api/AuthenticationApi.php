<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class AuthenticationApi extends AuthenticationController
{
    function loginAction($return = '') {
        $remember = isset($_POST['remember']);

        if (!empty($_POST) || isset($_COOKIE['_cookies'])) {
            if (!empty($_POST)) {
                $username = isset($_POST['username'])? $_POST['username'] : '';
                $password = isset($_POST['password'])? $_POST['password'] : '';

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
                $errors[] = 'The account is not enabled.';
            } elseif ($md5password != $member->PASSWORD) {
                $errors[] = 'Incorrect password. Please try again';
            }

            if (!empty($errors)) {
                self::secured_response(json_encode(array('success' => false, 'message' => $errors[0])));
            } else {
                if($remember){
                    setcookie('_cookies', base64_encode($username).'.'.base64_encode($md5password), time()+60*60*24, '/');
                }

                $date_time = date('Y-m-d H:i:s');

	            // Update
	    		$member->LATEST_LOGIN = $date_time;
	    		$member->update();

	            // User log
	            $ulm = new UserLogModel();

	            $ulm->IP = $_SERVER['REMOTE_ADDR'];
        		$ulm->ID_USER = $member->ID;
        		$ulm->DATE_TIME = $date_time;

                $ulm->insert();

	            // Force change password if needed
                if ($member->FORCE_PASSWORD_CHANGE) {
                	$_SESSION['_force_password_change_user'] = $member;

                    self::secured_response(json_encode(array('message' => $errors[0], 'cmd' => 'force_password_change')));
                } else {
		            // Store into session
	                $_SESSION['user'] = $member;

	                // Initialize user context
	                $auth = new AuthenticationController();
	                $auth->initializeUserContext($member->ID);

                    $_user = clone $member;
                    $_user->PASSWORD = null;
                    $_user->preferences = null;

                    $this->model_sanitize($_user);

                    self::secured_response(json_encode(array('success' => true, 'PHPSESSID' => session_id(), 'user' => $_user)));
				}
            }
        }
    }

    function initializeUserContext($id_user) {
        // Load access rights
        $acl = new AclController();
		$acl->loadAccessRights($id_user);

        // Load menu
        $model = new AdminMenuItemModel();
        $model->ID_ADMIN_MENU = 1;
        $model->IS_ENABLED = 1;
        $model->orderBy('PARENT, ORDERING');
        $model->find();

        $rows = array();
        while ($model->fetch()) {
            $rows[$model->ID] = clone $model;
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

        // Load user preferences
        $model = new UserPreferenceModel();
        $model->ID_USER = $_SESSION['user']->ID;

        $model->find();

        $preferences = new stdClass();
        if ($model->fetch()) {
            $preferences = clone $model;
        }

        $_SESSION['user']->preferences = $preferences;
    }

	function remindPasswordAction() {
        $email = isset($_REQUEST['email'])? $_REQUEST['email'] : '';

        if (!empty($email)) {
            $user = new UserModel();

            $user->EMAIL = $email;

            $user->find();

            if ($user->fetch()) {
                $new_password = $this->generate_random_password(8, false);
                $user->PASSWORD = md5($new_password);
                $user->update();

                // x. Send email
                $headers  = 'MIME-Version: 1.0' . "\r\n";
                $headers .= 'Content-type: text/html; charset=utf-8' . "\r\n";

                // Additional headers
                $headers .= 'From: The Taco Truck <noreply@thetacotruck.com>' . "\r\n";

                // Body
                $body = "Hello {$user->NAME},<br/>&nbsp;<br/>You have requested to reset your password.<br/>&nbsp;<br/>Your new password is: {$new_password}<br/>&nbsp;<br/>The Taco Truck";

                if (mail($email, 'Password reset', $body, $headers)) {
                    self::secured_response(json_encode(array('success' => true, 'message' => '')));

                    return true;
                }
            } else {
                self::secured_response(json_encode(array('success' => false, 'message' => 'There is no record associated to this email address')));

                return false;
            }
        }

        self::secured_response(json_encode(array('success' => false, 'message' => 'Invalid operation')));

        return false;
    }

	function generate_random_password($len = 8, $special = true) {
	    # Seed random number generator
	    # Only needed for PHP versions prior to 4.2
	    mt_srand( (double)microtime()*1000000 );

	    # Array of digits, lower and upper characters; empty passwd string
	    $passwd = '';
	    $chars = array(
	        'digits' => array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9),
	        'lower' => array(
	            'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
	            'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
	        ),
	        'upper' => array(
	            'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
	            'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'
	        )
	    );

	    # Add special chars to array, if permitted; adjust as desired
	    if ( $special ) $chars['special'] = array(
	        '!', '@', '#', '$', '%', '^', '&', '*', '_', '+'
	    );

	    # Array indices (ei- digits, lower, upper)
	    $charTypes = array_keys($chars);
	    # Array indice friendly number of char types
	    $numTypes = count($charTypes) - 1;

	    # Create random password
	    for ( $i=0; $i<$len; $i++ ) {

	        # Random char type
	        $charType = $charTypes[ mt_rand(0, $numTypes) ];
	        # Append random char to $passwd
	        $passwd .= $chars[$charType][
	            mt_rand(0, count( $chars[$charType] ) - 1 )
	        ];

	    }

	    return $passwd;
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

        self::secured_response(json_encode(array('redirect' => APPLICATION_URL)));
    }

    function secured_response($response) {
        if (isset($_SESSION['handshake.enabled']) && $_SESSION['handshake.enabled']) {
            if (isset($_SESSION['handshake.shared_secret_key']) && !empty($_SESSION['handshake.shared_secret_key'])) {
                $shared_secret_key = $_SESSION['handshake.shared_secret_key'];

                // x. Encrypt response data
                $encrypted_reponse = EncryptionHelper::rijndael_encrypt($response, $shared_secret_key);

                // x. Return
                echo $encrypted_reponse;
            } else {
                die("handshake.shared_secret_key missing");
            }
        } else {
            echo $response;
        }
    }
}