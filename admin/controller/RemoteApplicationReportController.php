<?php
class RemoteApplicationReportController {
    function exceptionAction() {
        // x. Get encrypted data from the request
        $k = isset($_REQUEST['k'])? $_REQUEST['k'] : '';

        if (empty($k)) {
            return;
        }

        // x. Decrypt to get a post string
        $post_string = EncryptionHelper::utc_decrypt($k);

        if (empty($post_string)) {
            return;
        }

        // x. Parse the post string
        parse_str($post_string, $params);

        // x. Extract request parameters
        $id_product = isset($params['appid'])? $params['appid'] : '';
        $serial_key = isset($params['license'])? $params['license'] : '';
        $message = isset($params['message'])? $params['message'] : '';
        $source = isset($params['source'])? $params['source'] : '';
        $target = isset($params['target'])? $params['target'] : '';
        $stacktrace = isset($params['stacktrace'])? $params['stacktrace'] : '';
        $version = isset($params['version'])? $params['version'] : '';
        $os = isset($params['os'])? $params['os'] : '';

        if (empty($id_product)) {
            return;
        }

        // x. Check if the right serial key
        $ulm = new UserLicenseModel();

        $ulm->ID_PRODUCT = $id_product;
        $ulm->SERIAL_KEY = $serial_key;

        $ulm->find();
        $ulm->fetch();

        if (!$ulm->ID) {
			$serial_key .= !empty($serial_key)? ' <Unknown>' : '<None>';
        }

        // x. Record the error report
        $erlm = new ErrorReportLogModel();

        $erlm->IP = $_SERVER['REMOTE_ADDR'];
        $erlm->ID_PRODUCT = $id_product;
        $erlm->SERIAL_KEY = "$serial_key, version $version, $os";
        $erlm->MESSAGE = $message;
        $erlm->SOURCE = $source;
        $erlm->TARGET = $target;
        $erlm->STACK_TRACE = $stacktrace;
        $erlm->DATE = date('Y-m-d H:i:s');
        $erlm->ID_USER = $ulm->ID_USER;
        $erlm->GUID = 1;

        $erlm->insert();
    }
}