<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class UserApi extends UserController
{
    var $module = 'user';
    var $type = 'api';

	function searchAction() {
	    AclApi::checkPermission('user', 'list');

		$keyword = isset($_REQUEST['keyword'])? $_REQUEST['keyword'] : '';

		$model = new UserModel();

		$model->selectAdd();
		$model->selectAdd('ID, NAME');

		if (!empty($keyword)) {
			$model->whereAdd("NAME LIKE '%$keyword%'");
		}

        $model->orderBy('NAME');
        $model->limit(10);

		$model->find();

		$rows = array();
		while ($model->fetch()) {
			$rows[] = $model->NAME;
		}

		echo json_encode($rows);
	}

    function listAction() {
	    AclApi::checkPermission('user', 'list');

        if (isset($_REQUEST['page'])) {
            $this->updatePageNumber($_REQUEST['page']);
        }

        if (!isset($_REQUEST['limit'])) {
            $_REQUEST['limit'] = '*';
        }

        $this->updatePageSize($_REQUEST['limit']);

        $this->updatePageNumber(1);

        if (isset($_REQUEST['sort'])) {
            $this->updateOrderBy(strtoupper($_REQUEST['sort']));
        }

        $orderby = $this->getRealOrderBy();
        $limit = $this->getPageSize();
        $page = $this->getPageNumber();

        $items = $this->getList($_REQUEST, array(), $orderby, $limit, $page, $pagination);

	    $result = array(
	        'success' => true,
	        'items' => $this->model_sanitize($items),
	        'pagination' => $pagination
	    );

		$this->json_response($result);
	}

    function saveAction() {
        AclApi::checkPermission('user', 'edit');

        $this->checkform($errors);

        if (!empty($errors)) {
            $this->json_response(array('success' => false, 'message' => $errors[0]));
        } else {
            $model = $this->saveform();

            $this->json_response(array('success' => true, 'data' => $this->model_sanitize($model)));
        }
    }

    function deleteAction() {
        AclApi::checkPermission('user', 'delete');

	    list($id) = explode('/', $_REQUEST['args']);

		$model = new UserModel();
		$model->UUID = $id;

		$model->delete();

		$this->json_response($id);
	}

    function viewAction() {
	    AclApi::checkPermission('user', 'view');

		@list($id) = explode('/', $_REQUEST['args']);

        $item = $this->getItem($id);

		$this->model_sanitize($item);

		$this->json_response($item);
	}

    function updateAction() {
	    AclApi::checkPermission('user', 'edit');

 		@list($id, $col, $val) = explode('/', $_REQUEST['args']);

		if (empty($id)) {
		    echo json_encode(array('success' => false, 'message' => 'Parameter missing'));

		    return;
        }

        if (!empty($col)) {
            $_REQUEST[$col] = $val;
        }

		$model = new UserModel();
		$model->UUID = $id;

        $updatable = false;

		foreach($_REQUEST as $key => $value) {
		    if (property_exists($model, $key) && strtoupper($key) != 'ID') {
		        $updatable = true;

    		    $value = $this->field_sanitize($key, $value);

                if (is_array($value)) {
                    $model->$key = implode(',', $value);
                } else {
                    $model->$key = trim($value);
                }
            }
		}

		if (!$updatable) {
		    echo json_encode(array('success' => false, 'message' => 'Parameter missing'));

		    return;
        }

        $this->save(array($model));

        echo json_encode(array('success' => true, 'message' => ''));
	}

    function registerAction() {
        require_once(dirname(__FILE__).'/../controller/SerialKeyHelper.php');

        // x. Get encrypted data from the request
        $k = isset($_REQUEST['k'])? $_REQUEST['k'] : '';

        if (empty($k)) {
            echo json_encode(array('success' => false, 'message' => 'Bad request'));

            return;
        }

        // x. Decrypt to get a post string
        $poststring = EncryptionHelper::utc_decrypt($k);

        if (empty($poststring)) {
            echo json_encode(array('success' => false, 'message' => 'Bad request'));

            return;
        }

        // x. Parse the post string
        parse_str($poststring, $_POST);
        $_REQUEST = $_POST;

        // x. Data
        $model = $this->form2model();

        if (empty($_POST) || empty($model)) {
            echo json_encode(array('success' => false, 'message' => 'Bad request'));

            return;
        }

        $model->PASSWORD2 = isset($_POST['PASSWORD2'])? $_POST['PASSWORD2'] : '';
        $accept_tos = isset($_POST['ACCEPT_TOS'])? $_POST['ACCEPT_TOS'] : 0;
        $accept_newsletter = isset($_POST['ACCEPT_NEWSLETTER'])? $_POST['ACCEPT_NEWSLETTER'] : 0;

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
        } elseif (!$accept_tos) {
            $message = 'You need to accept the Terms of service of '.ORGANIZATION_NAME_SHORT.' before continuing';
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
                    $smarty = Framework::getSmarty();
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
            echo json_encode(array('success' => false, 'message' => $message));
        } else {
            echo json_encode(array('success' => true, 'message' => 'Please check your mailbox for an account activation email.'));
        }
    }
}