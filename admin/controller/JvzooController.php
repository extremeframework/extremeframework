<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
require_once('GetResponse/GetResponseApi.php');

define('JVZOO_TEST_MODE', false);

class JvzooController
{
    function indexAction() {
        // x. Get transaction information
        $ccustname = isset($_POST['ccustname'])? $_POST['ccustname'] : '';
        $ccuststate = isset($_POST['ccuststate'])? $_POST['ccuststate'] : '';
        $ccustcc = isset($_POST['ccustcc'])? $_POST['ccustcc'] : '';
        $ccustemail = isset($_POST['ccustemail'])? $_POST['ccustemail'] : '';
        $cproditem = isset($_POST['cproditem'])? $_POST['cproditem'] : '';
        $cprodtitle = isset($_POST['cprodtitle'])? $_POST['cprodtitle'] : '';
        $cprodtype = isset($_POST['cprodtype'])? $_POST['cprodtype'] : '';
        $ctransaction = isset($_POST['ctransaction'])? $_POST['ctransaction'] : '';
        $ctransaffiliate = isset($_POST['ctransaffiliate'])? $_POST['ctransaffiliate'] : '';
        $ctransamount = isset($_POST['ctransamount'])? $_POST['ctransamount'] : '';
        $ctranspaymentmethod = isset($_POST['ctranspaymentmethod'])? $_POST['ctranspaymentmethod'] : '';
        $ctransvendor = isset($_POST['ctransvendor'])? $_POST['ctransvendor'] : '';
        $ctransreceipt = isset($_POST['ctransreceipt'])? $_POST['ctransreceipt'] : '';
        $cupsellreceipt = isset($_POST['cupsellreceipt'])? $_POST['cupsellreceipt'] : '';
        $caffitid = isset($_POST['caffitid'])? $_POST['caffitid'] : '';
        $cvendthru = isset($_POST['cvendthru'])? $_POST['cvendthru'] : '';
        $cverify = isset($_POST['cverify'])? $_POST['cverify'] : '';
        $ctranstime = isset($_POST['ctranstime'])? $_POST['ctranstime'] : '';

        // x. Data verification
        if (!JVZOO_TEST_MODE) {
            if (!$this->jvzipnVerification()) {
                SystemLogController::addLog('JVZOO', 'Error', 'JVZoo verification error', json_encode($_POST));

                die('Error: JVZoo verification error');
            }
        }

        // x. Check if this transaction is already processed
        $jvzlm = new JvzooLogModel();

        $jvzlm->PRODUCT_ITEM = $cproditem;
        $jvzlm->ACTION = $ctransaction;
        $jvzlm->RECEIPT = $ctransreceipt;

        $jvzlm->find();
        $jvzlm->fetch();

        // If existing (ie. already processed)
        if ($jvzlm->ID > 0) {
            // x. Log this case
            SystemLogController::addLog('JVZOO', 'Notice', 'Duplicate transaction', json_encode($_POST));

            // x. Return a success code
            echo '200';

            // x. Stop processing
            return;
        }

        // x. Find if existing user
        $um = new UserModel();
        $um->LOGIN = $ccustemail;
        $um->find();
        $um->fetch();

        $exists = $um->ID > 0;

        // x. Get product information
        $pmxm = new ProductMixModel();

        $pmxm->selectAdd();
        $pmxm->selectAdd(TABLE_PREFIX.'PRODUCT_MIX.*');
        $pmxm->selectAdd(TABLE_PREFIX.'PRODUCT.NAME');

        $pmxm->joinAdd(new ProductModel());

        $pmxm->JVZOO_NUMBER = $cproditem;

        $pmxm->find();
        $pmxm->fetch();

        if (!$pmxm->ID || !$pmxm->ID_PRODUCT) {
            SystemLogController::addLog('JVZOO', 'Error', 'Product information not found', json_encode($_POST));

            die('Error: Product information not found');
        }

        // x. For some types of transactions (for example: RFND), some request parameters are not passed. Try to fill it if possible
        if (empty($ccustname)) {
            $ccustname = $um->NAME;
        }
        if (empty($cprodtitle)) {
            $cprodtitle = $pmxm->NAME;
        }

        // x. Get product membership information
        $pmm = new ProductMembershipModel();

        $pmm->ID_PRODUCT_MIX = $pmxm->ID;

        $pmm->find();

        $memberships = array();
        while ($pmm->fetch()) {
            $memberships[] = clone $pmm;
        }

        if (empty($memberships)) {
            SystemLogController::addLog('JVZOO', 'Notice', 'No product membership for '.$cprodtitle, json_encode($_POST));
        }

        // x. Process action
        switch ($ctransaction) {
            // The purchase of a standard product or the initial purchase of recurring billing product.
            case 'SALE':

            // A rebill for a recurring billing product.
            case 'BILL':

            // Reversing the cancellation of a recurring billing product.
            case 'UNCANCEL-REBILL':
                // x. Create new user if not existing
                if (!$exists) {
                    $password = $this->generatePassword(6, 2);

                    $um = new UserModel();

                    $um->NAME = $ccustname;
                    $um->EMAIL = $ccustemail;
                    $um->LOGIN = $ccustemail;
                    $um->PASSWORD = md5($password);
                    $um->FORCE_PASSWORD_CHANGE = false;
                    $um->IS_ENABLED = true;
                    $um->DATE_REGISTRATION = date('Y-m-d H:i:s');
                    $um->GUID = 1;

            		if (!$um->insert()) {
                        SystemLogController::addLog('JVZOO', 'Error', 'Account creation error', json_encode($_POST));

                        die('Error: Account creation error');
                    }
                } else {
                    // Just activate it to be sure
                    if (!$um->IS_ENABLED) {
                        $um->IS_ENABLED = true;
                        $um->update();

                        SystemLogController::addLog('JVZOO', 'Notice', 'Activate the account '.$um->EMAIL.' which is existing but not activated', json_encode($_POST));
                    }
                }

                // x. Add user to the user group corresponding to the purchased product
                foreach ($memberships as $membership) {
                    $valid_from = null;
                    $valid_until = null;

                    if ($membership->MAX_DAYS > 0) {
                        $valid_from = date('Y-m-d H:i:s');

                        if ($membership->MAX_DAYS == 1) {
                            $valid_until = date('Y-m-d H:i:s', strtotime("+1 day"));
                        } else {
                            $valid_until = date('Y-m-d H:i:s', strtotime("+{$membership->MAX_DAYS} days"));
                        }
                    }

        		    if (!UserMembershipController::addUserToGroup($um, $membership->ID_USER_GROUP, $valid_from, $valid_until)) {
                        SystemLogController::addLog('JVZOO', 'Error', 'Cannot initiate user membership', json_encode($_POST));

                        die('Error: Cannot initiate user membership');
                    }
                }

                // x. Insert a license purchase log
                $ulpm = new UserLicensePurchaseModel();

                $ulpm->ID_USER = $um->ID;
                $ulpm->ID_PRODUCT = $pmxm->ID_PRODUCT;
                $ulpm->ID_LICENSE_TYPE = $pmxm->ID_LICENSE_TYPE;
                $ulpm->ID_LICENSE_FEATURE = $pmxm->ID_LICENSE_FEATURE;
                $ulpm->NBR_LICENSES = $pmxm->NBR_LICENSES;
                $ulpm->RECEIPT = $ctransreceipt;
                $ulpm->DATE = date('Y-m-d H:i:s');
                $ulpm->GUID = $um->ID;

                $ulpm->insert();

                // x. Insert/update license limit information
                if ($pmxm->NBR_LICENSES > 0) {
                    // x. Get existing item
                    $ullm = new UserLicenseLimitModel();

                    $ullm->ID_USER = $um->ID;
                    $ullm->ID_PRODUCT = $pmxm->ID_PRODUCT;
                    $ullm->ID_LICENSE_TYPE = $pmxm->ID_LICENSE_TYPE;
                    $ullm->ID_LICENSE_FEATURE = $pmxm->ID_LICENSE_FEATURE;

                    $ullm->find();
                    $ullm->fetch();

                    // x. Insert if not existing
                    if (!$ullm->ID) {
                        $ullm->AVAIL_LICENCES = $pmxm->NBR_LICENSES;
                        $ullm->LATEST_RECEIPT = $ctransreceipt;
                        $ullm->DATE = date('Y-m-d H:i:s');
                        $ullm->GUID = $um->ID;

                        $ullm->insert();
                    } else {
                        // x. Just update in case of different latest receipt information
                        if ($ullm->LATEST_RECEIPT !== $ctransreceipt) {

                            $ullm->AVAIL_LICENCES += $pmxm->NBR_LICENSES;
                            $ullm->LATEST_RECEIPT = $ctransreceipt;
                            $ullm->DATE = date('Y-m-d H:i:s');

                            $ullm->update();
                        }
                    }
                }

                // x. Send notification email
                if (!$exists) {
                    // x. Send post-purchase instruction email (+account information)
                    $smarty = Framework::getSmarty();
                    $smarty->assign('name', $um->NAME);
                    $smarty->assign('email', $um->EMAIL);
                    $smarty->assign('username', $um->LOGIN);
                    $smarty->assign('password', $password);
                    $smarty->assign('product', $cprodtitle);
                    $smarty->assign('link', APPLICATION_URL);

                    $smarty->assign('ccustname', $ccustname);
                    $smarty->assign('ccustemail', $ccustemail);
                    $smarty->assign('cproditem', $cproditem);
                    $smarty->assign('cprodtitle', $cprodtitle);
                    $smarty->assign('cprodtype', $cprodtype);
                    $smarty->assign('ctransaction', $ctransaction);
                    $smarty->assign('ctransamount', $ctransamount);
                    $smarty->assign('ctransreceipt', $ctransreceipt);
                    $smarty->assign('ctranstime', date('M d, Y H:i:s', $ctranstime));

                    $content = $smarty->fetch('.email.jvzoo.first-purchase.tpl');

                    // x. Send an email to the subscriber
                    $headers  = 'MIME-Version: 1.0' . "\r\n";
                    $headers .= 'Content-type: text/html; charset=utf-8' . "\r\n";
                    $headers .= 'From: '.SUPPORT_NAME.' <'.SUPPORT_EMAIL.'>' . "\r\n";

                    if (JVZOO_TEST_MODE) {
                        echo $content;
                    } else {
                        if (!MailController::mail($um->EMAIL, "[Receipt] {$cprodtitle} - Login Information", nl2br($content), $headers)) {
                            SystemLogController::addLog('JVZOO', 'Error', 'Cannot send email to '.$um->EMAIL, $content);
                        }
                    }
                } else {
                    // x. Send post-purchase instruction email
                    $smarty = Framework::getSmarty();
                    $smarty->assign('name', $um->NAME);
                    $smarty->assign('email', $um->EMAIL);
                    $smarty->assign('username', $um->LOGIN);
                    $smarty->assign('product', $cprodtitle);
                    $smarty->assign('link', APPLICATION_URL);

                    $smarty->assign('ccustname', $ccustname);
                    $smarty->assign('ccustemail', $ccustemail);
                    $smarty->assign('cproditem', $cproditem);
                    $smarty->assign('cprodtitle', $cprodtitle);
                    $smarty->assign('cprodtype', $cprodtype);
                    $smarty->assign('ctransaction', $ctransaction);
                    $smarty->assign('ctransamount', $ctransamount);
                    $smarty->assign('ctransreceipt', $ctransreceipt);
                    $smarty->assign('ctranstime', date('M d, Y H:i:s', $ctranstime));

                    $content = $smarty->fetch('.email.jvzoo.existing-purchase.tpl');

                    // x. Send an email to the subscriber
                    $headers  = 'MIME-Version: 1.0' . "\r\n";
                    $headers .= 'Content-type: text/html; charset=utf-8' . "\r\n";
                    $headers .= 'From: '.SUPPORT_NAME.' <'.SUPPORT_EMAIL.'>' . "\r\n";

                    if (JVZOO_TEST_MODE) {
                        echo $content;
                    } else {
                        if (!MailController::mail($um->EMAIL, "[Receipt] {$cprodtitle} Purchase", nl2br($content), $headers)) {
                            SystemLogController::addLog('JVZOO', 'Error', 'Cannot send email to '.$um->EMAIL, $content);
                        }
                    }
                }

                break;

            // The refunding of a standard or recurring billing product. Recurring billing products that are refunded also result in a “CANCEL-REBILL” action.
            case 'RFND':

            // A chargeback for a standard or recurring product.
            case 'CGBK':

            // An eCheck chargeback for a standard or recurring product.
            case 'INSF':

            // The cancellation of a recurring billing product. Recurring billing products that are canceled do not result in any other action.
            case 'CANCEL-REBILL':
                if ($exists) {
                    // x. Disable membership corresponding to the product (NOTE: do not disable user account)
                    foreach ($memberships as $membership) {
            		    $umc = new UserMembershipController();

            		    if (!$umc->removeUserFromGroup($um, $membership->ID_USER_GROUP)) {
                            SystemLogController::addLog('JVZOO', 'Error', 'Cannot remove user membership', json_encode($_POST));

                            die('Error: Cannot remove user membership');
                        }
                    }

                    // x. Revoke license limit information
                    if ($pmxm->NBR_LICENSES > 0) {
                        // x. Get existing item
                        $ullm = new UserLicenseLimitModel();

                        $ullm->ID_USER = $um->ID;
                        $ullm->ID_PRODUCT = $pmxm->ID_PRODUCT;
                        $ullm->ID_LICENSE_TYPE = $pmxm->ID_LICENSE_TYPE;
                        $ullm->ID_LICENSE_FEATURE = $pmxm->ID_LICENSE_FEATURE;

                        $ullm->find();
                        $ullm->fetch();

                        // x. Just update in case of different latest receipt information
                        if ($ullm->ID > 0 && $ullm->LATEST_RECEIPT !== $ctransreceipt) {
                            $ullm->AVAIL_LICENCES -= $pmxm->NBR_LICENSES;

                            if ($ullm->AVAIL_LICENCES <= 0) {
                                SystemLogController::addLog('JVZOO', 'Error', 'System inconsistency :: negative AVAIL_LICENCES while revoking lincense information', json_encode($_POST));

                                $ullm->AVAIL_LICENCES = 0;
                            }

                            $ullm->LATEST_RECEIPT = $ctransreceipt;
                            $ullm->DATE = date('Y-m-d H:i:s');

                            $ullm->update();
                        }
                    }

                    // x. Disable the corresponding generated licenses
                    if ($pmxm->NBR_LICENSES > 0) {
                        $ulm = new UserLicenseModel();

                        $ulm->IS_DISABLED = true;

                        $ulm->whereAdd("ID_USER = {$um->ID} AND ID_PRODUCT = {$pmxm->ID_PRODUCT} AND ID_LICENSE_TYPE = {$pmxm->ID_LICENSE_TYPE} AND ID_LICENSE_FEATURE = {$pmxm->ID_LICENSE_FEATURE}");

                        $ulm->update(DB_DATAOBJECT_WHEREADD_ONLY);
                    }

                    // x. Send notification email
                    $smarty = Framework::getSmarty();
                    $smarty->assign('name', $um->NAME);
                    $smarty->assign('product', $cprodtitle);

                    $smarty->assign('ccustname', $ccustname);
                    $smarty->assign('ccustemail', $ccustemail);
                    $smarty->assign('cproditem', $cproditem);
                    $smarty->assign('cprodtitle', $cprodtitle);
                    $smarty->assign('cprodtype', $cprodtype);
                    $smarty->assign('ctransaction', $ctransaction);
                    $smarty->assign('ctransamount', $ctransamount);
                    $smarty->assign('ctransreceipt', $ctransreceipt);
                    $smarty->assign('ctranstime', date('M d, Y H:i:s', $ctranstime));

                    $content = $smarty->fetch('.email.jvzoo.membership-cancelled.tpl');

                    // x. Send an email to the subscriber
                    $headers  = 'MIME-Version: 1.0' . "\r\n";
                    $headers .= 'Content-type: text/html; charset=utf-8' . "\r\n";
                    $headers .= 'From: '.SUPPORT_NAME.' <'.SUPPORT_EMAIL.'>' . "\r\n";

                    if (JVZOO_TEST_MODE) {
                        echo $content;
                    } else {
                        if (!MailController::mail($um->EMAIL, "[Receipt] {$cprodtitle} Membership Cancelled", nl2br($content), $headers)) {
                            SystemLogController::addLog('JVZOO', 'Error', 'Cannot send email to '.$um->EMAIL, $content);
                        }
                    }
                } else {
                    SystemLogController::addLog('JVZOO', 'Error', 'System inconsistent :: payment cancelled, but corresponding user not found :: '.$ccustemail, json_encode($_POST));
                }

            default:
                break;

        }

        // x. Log JVZoo tracsaction record
        $jvzlm = new JvzooLogModel();

        $jvzlm->NAME = $ccustname;
        $jvzlm->EMAIL = $ccustemail;
        $jvzlm->PRODUCT_ITEM = $cproditem;
        $jvzlm->PRODUCT_TITLE = $cprodtitle;
        $jvzlm->PRODUCT_TYPE = $cprodtype;
        $jvzlm->ACTION = $ctransaction;
        $jvzlm->AFFILIATE = $ctransaffiliate;
        $jvzlm->AMOUNT = $ctransamount;
        $jvzlm->METHOD = $ctranspaymentmethod;
        $jvzlm->RECEIPT = $ctransreceipt;
        $jvzlm->TIME = date('Y-m-d H:i:s', $ctranstime);
        $jvzlm->DATE = date('Y-m-d H:i:s');
        $jvzlm->ID_USER = $um->ID;
        $jvzlm->GUID = $um->ID;

        if (!$jvzlm->insert()) {
            SystemLogController::addLog('JVZOO', 'Error', 'Cannot create JVZoo transaction log', json_encode($_POST));
        }

        // x. Return a success code
        echo '200';
    }

    function thankYouAction() {
        if (!$this->jvzValid()) {
            header('Location: '.APPLICATION_URL);

            exit(1);
        } else {
            $smarty = Framework::getSmarty();

            $smarty->display('jvzoo.thank-you.tpl');
        }
    }

    function jvzValid() {
        $secretKey = JVZOO_JVZIPN_SECRET_KEY;

        $rcpt = @$_REQUEST['cbreceipt'];
        $time = @$_REQUEST['time'];
        $item = @$_REQUEST['item'];
        $cbpop = @$_REQUEST['cbpop'];

        $xxpop = sha1("$secretKey|$rcpt|$time|$item");
        $xxpop = strtoupper(substr($xxpop,0,8));

        if ($cbpop == $xxpop) {
            return 1;
        } else {
            return 0;
        }
    }

    function jvzipnVerification() {
        $secretKey = JVZOO_JVZIPN_SECRET_KEY;
        $pop = "";
        $ipnFields = array();
        foreach ($_POST AS $key => $value) {
            if ($key == "cverify") {
                continue;
            }
            $ipnFields[] = $key;
        }
        sort($ipnFields);
        foreach ($ipnFields as $field) {
            // if Magic Quotes are enabled $_POST[$field] will need to be
            // un-escaped before being appended to $pop
            $pop = $pop . $_POST[$field] . "|";
        }
        $pop = $pop . $secretKey;
        $calcedVerify = sha1(mb_convert_encoding($pop, "UTF-8"));
        $calcedVerify = strtoupper(substr($calcedVerify,0,8));

        return isset($_POST["cverify"]) && ($calcedVerify == $_POST["cverify"]);
    }

    function generatePassword($numAlpha = 6, $numNonAlpha = 2) {
        $listAlpha    = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
        $listNonAlpha = '~!@#$%^&*()';
        return str_shuffle(substr(str_shuffle($listAlpha), 0, $numAlpha) . substr(str_shuffle($listNonAlpha), 0, $numNonAlpha));
    }
}