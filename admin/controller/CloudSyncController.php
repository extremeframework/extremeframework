<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
require_once('pCURL.php');

set_time_limit(0);

class CloudSyncController extends _CloudSyncController
{
    function uAction() {
        $this->_upsync();
    }

    function dAction() {
        $this->_downsync();
    }

    function clientStartUpSyncService() {
        if (!isset($_SESSION['cloudsync.upsync.stopnow'])) {
            $_SESSION['cloudsync.upsync.stopnow'] = false;
        }

        if (!isset($_SESSION['cloudsync.upsync.started'])) {
            $_SESSION['cloudsync.upsync.started'] = false;
        }

        if ($_SESSION['cloudsync.upsync.started'] && !$_SESSION['cloudsync.upsync.stopnow']) {
            die('Upsync service is already started');
        }

        while (!$_SESSION['cloudsync.upsync.stopnow']) {
            $this->_upsync();
        }

        $_SESSION['cloudsync.upsync.started'] = false;
        $_SESSION['cloudsync.upsync.stopnow'] = false;
    }

    function _upsync() {
        $_SESSION['cloudsync.dirty'] = false;
        $_SESSION['cloudsync.upsync.started'] = true;

        $synctime = date('Y-m-d H:i:s');
        $items = $this->clientGetUpSyncItems();

        if (!empty($items)) {
            foreach ($items as $item) {
                $ok = $this->syncToCloud($item);

                if ($ok) {
                    $item->delete();
                } else {
                    // ???
                }
            }
        } else {
            if (!$_SESSION['cloudsync.dirty']) {
                sleep(10);
            }
        }

        $this->clientSetLatestUpSyncTimestamp($synctime);

        file_put_contents(UPLOAD_DIR.'/.upsync.heartbeat', date('Y-m-d H:i:s'));
    }

    function clientGetUpSyncItems() {
        $model = new CloudSyncModel();

        $model->find();

        $models = array();

        while ($model->fetch()) {
            $models[] = clone $model;
        }

        return $models;
    }

    function clientGetLatestUpSyncTimestamp() {
        $filepath = UPLOAD_DIR.'/.upsync.latest';

        return file_exists($filepath)? file_get_contents($filepath) : '';
    }

    function clientSetLatestUpSyncTimestamp($time) {
        file_put_contents(UPLOAD_DIR.'/.upsync.latest', $time);
    }

    function clientGetLatestDownSyncTimestamp() {
        $filepath = UPLOAD_DIR.'/.downsync.latest';

        return file_exists($filepath)? file_get_contents($filepath) : '';
    }

    function clientSetLatestDownSyncTimestamp($time) {
        file_put_contents(UPLOAD_DIR.'/.downsync.latest', $time);
    }

    function clientGetDownSyncItems() {
        $latest = $this->clientGetLatestDownSyncTimestamp();

        $content = pCURL::download(CLOUD_SYNC_URL.'/downsync', "time=$latest");

        $items = json_decode($content);

        return $items;
    }

    function downsyncAction() {
        $time = isset($_REQUEST['time'])? $_REQUEST['time'] : '';

        $model = new CloudSyncModel();

        $model->whereAdd("TIME >= '$time'");
        $model->find();

        $items = array();

        while ($model->fetch()) {
            $items[] = clone $model;
        }

        foreach ($items as $i => $item) {
            $items[$i] = $this->model_sanitize($item);
        }

        echo json_encode($items);
    }

    function syncToCloud($model) {
        $item = clone $model;
        $json = json_encode($this->model_sanitize($item));

        $poststring = "data=".base64_encode($json);
//die('xxx '.CLOUD_SYNC_URL.'/sync?'.$poststring);
        $content = pCURL::download(CLOUD_SYNC_URL.'/sync', $poststring);

        $json = json_decode($content);

        return isset($json->success) && $json->success;
    }

    function syncToLocal($item, &$error) {
        $error = '';

        $model = $this->extractCloudSyncModel($item);

        $class = get_class ($model);

        $existing = new $class();
        $existing->UUID = $model->UUID;
        $existing->find();
        $existing->fetch();

        switch ($item->OPERATION) {
            case 'create':
                if (!($existing->ID > 0)) {
                    $model->ID = 0;
                    $model->insert();
                }
                break;

            case 'update':
                if ($existing->ID > 0) {
                    $model->ID = $existing->ID;
                    $model->update();
                }
                break;

            case 'delete':
                if ($existing->ID > 0) {
                    $model->ID = $existing->ID;
                    $model->delete();
                }
                break;

            default:
                break;
        }

        return true;
    }

    function clientStartDownSyncService() {
        if (!isset($_SESSION['cloudsync.downsync.stopnow'])) {
            $_SESSION['cloudsync.downsync.stopnow'] = false;
        }

        if (!isset($_SESSION['cloudsync.downsync.started'])) {
            $_SESSION['cloudsync.downsync.started'] = false;
        }

        if ($_SESSION['cloudsync.downsync.started'] && !$_SESSION['cloudsync.downsync.stopnow']) {
            die('Downsync service is already started');
        }

        while (!$_SESSION['cloudsync.downsync.stopnow']) {
            $this->_downsync();
        }

        $_SESSION['cloudsync.downsync.started'] = false;
        $_SESSION['cloudsync.downsync.stopnow'] = false;
    }

    function _downsync() {
        $_SESSION['cloudsync.downsync.started'] = true;

        $synctime = date('Y-m-d H:i:s');
        $items = $this->clientGetDownSyncItems();

        if (!empty($items)) {
            foreach ($items as $item) {
                $ok = $this->syncToLocal($item, $error);

                if ($ok) {
                    $this->clientAckSyncSuccess($item->KEY);
                } else {
                    // ???
                }
            }
        } else {
            sleep(60);
        }

        $this->clientSetLatestUpSyncTimestamp($synctime);

        file_put_contents(UPLOAD_DIR.'/.downsync.heartbeat', date('Y-m-d H:i:s'));
    }

    function clientAckSyncSuccess($itemkey) {
        pCURL::download(CLOUD_SYNC_URL.'/ack', "key=$itemkey");
    }

    function syncAction() {
        $data = isset($_REQUEST['data'])? $_REQUEST['data'] : '';

        $decoded = base64_decode($data);

        $item = json_decode($decoded);

        $ok = $this->syncToLocal($item, $error);

		echo json_encode(array('success' => $ok, 'message' => $error));
    }

    function ackAction() {
        $key = isset($_REQUEST['key'])? $_REQUEST['key'] : '';

        $model = new CloudSyncModel();

        $model->query("DELETE FROM CLOUD_SYNC WHERE `KEY` = '$key'");
    }

    function extractCloudSyncModel($item) {
        $key = $item->KEY;

        if (!preg_match('/^([a-z]+)-(.+)$/i', $key, $match)) {
            die('extractCloudSyncModel:invalid parameter');
        }

        $module = $match[1];

        $class = $module.'Model';
        $model = new $class();

        $vars = get_object_vars(json_decode($item->JSON));

        foreach ($vars as $property => $value) {
            $model->$property = $value;
        }

        return $model;
    }
}