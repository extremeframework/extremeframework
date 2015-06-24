<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class ModelHelper {
    static function sanitize($model) {
        if (!empty($model)) {
            if (is_object($model)) {
                if (!isset($vars)) {
                    $vars = array_keys(get_object_vars($model));
                }

                foreach ($vars as $var) {
                    if ($var[0] == '_') {
                        unset($model->$var);
                    }
                }
            } elseif (is_array($model)) {
                foreach ($model as &$m) {
                    ModelHelper::sanitize($m);
                }
            }
        }

        return $model;
    }

    static function onInsertSuccess($model) {
        if (in_array($model->_module, array('adminsequence', 'changelog', 'recyclebin', 'cloudsync', 'draft'))) {
            return;
        }

        // x. Change log
        if (Framework::hasModule('ChangeLog')) {
    		$clm = new ChangeLogModel();

    		$clm->ID_USER = $_SESSION['user']->ID;;
    		$clm->DATE_TIME = date('Y-m-d H:i:s');
    		$clm->MODULE = $model->_module;
    		$clm->ACTION = 'new';
    		$clm->ITEM = $model->name();

    		$clm->insert();
        }

        // x. Cloud sync
        if (CLOUD_SYNC_ENABLED && Framework::hasModule('CloudSync')) {
            $item = clone $model;
            $json = json_encode(ModelHelper::sanitize($item));

            $sync = new CloudSyncModel();

            $sync->KEY = $model->_module.'-'.$item->UUID;
            $sync->TIME = date('Y-m-d H:i:s');
            $sync->OPERATION = 'create';
            $sync->JSON = $json;

            $sync->insert();

            // Mark as dirty
            $_SESSION['cloudsync.dirty'] = true;
        }

		// To be overrided if necessary
        PluginManager::do_action("{$model->_module}_after_insert", $model);
    }

    static function onUpdateSuccess($model, $old) {
        if (in_array($model->_module, array('adminsequence', 'changelog', 'recyclebin', 'cloudsync', 'draft'))) {
            return;
        }

        if (Framework::hasModule('ChangeLog')) {
    		$diff = ModelHelper::diff($model, $old);

    		if (!empty($diff)) {
        		$clm = new ChangeLogModel();

        		$clm->ID_USER = $_SESSION['user']->ID;;
        		$clm->DATE_TIME = date('Y-m-d H:i:s');
        		$clm->MODULE = $model->_module;
        		$clm->ACTION = 'update';
        		$clm->ITEM = $model->name();
        		$clm->DETAILS = implode("\n", $diff);

        		$clm->insert();
            }
        }

        // x. Cloud sync
        if (CLOUD_SYNC_ENABLED && Framework::hasModule('CloudSync')) {
            $item = clone $model;
            $json = json_encode(ModelHelper::sanitize($item));

            $sync = new CloudSyncModel();

            $sync->KEY = $model->_module.'-'.$item->UUID;
            $sync->find();
            $sync->fetch();

            $sync->TIME = date('Y-m-d H:i:s');
            $sync->OPERATION = 'update';
            $sync->JSON = $json;

            if ($sync->ID > 0) {
                $sync->update();
            } else {
                $sync->insert();

                // Mark as dirty
                $_SESSION['cloudsync.dirty'] = true;
            }
        }

		// To be overrided if necessary
        PluginManager::do_action("{$model->_module}_after_update", $model);
    }

    static function onDeleteSuccess($model) {
        if (in_array($model->_module, array('adminsequence', 'changelog', 'recyclebin', 'cloudsync', 'draft'))) {
            return;
        }

        // x. Recycle bin
        if (Framework::hasModule('RecycleBin')) {
    		$rbm = new RecycleBinModel();

    		$rbm->ID_USER = $_SESSION['user']->ID;;
    		$rbm->DATE_TIME = date('Y-m-d H:i:s');
    		$rbm->MODULE = $model->_module;
    	    $rbm->ITEM = $model->name();
    	    $rbm->JSON = json_encode($model);

    		$rbm->insert();
        }

        // x. Change log
        if (Framework::hasModule('ChangeLog')) {
    		$clm = new ChangeLogModel();

    		$clm->ID_USER = $_SESSION['user']->ID;;
    		$clm->DATE_TIME = date('Y-m-d H:i:s');
    		$clm->MODULE = $model->_module;
    		$clm->ACTION = 'delete';
    	    $clm->ITEM = $model->name();

    		$clm->insert();
        }

        // x. Cloud sync
        if (CLOUD_SYNC_ENABLED && Framework::hasModule('CloudSync')) {
            $item = clone $model;
            $json = json_encode(ModelHelper::sanitize($item));

            $sync = new CloudSyncModel();

            $sync->KEY = $model->_module.'-'.$item->UUID;
            $sync->TIME = date('Y-m-d H:i:s');
            $sync->OPERATION = 'delete';
            $sync->JSON = $json;

            $sync->insert();

            // Mark as dirty
            $_SESSION['cloudsync.dirty'] = true;
        }

		// To be overrided if necessary
        PluginManager::do_action("{$model->_module}_after_delete", $model);
    }

    static function rebuildModel($module, $values) {
        $values = (array) $values;

        $modelname = $module.'Model';
        $model = new $modelname();

        foreach ($values as $key => $value) {
            $model->$key = $value;
        }

        return $model;
    }

    static function assignValues(&$model, $values) {
        foreach ($values as $key => $value) {
            if (property_exists($model, $key)) {
                if ($value != '__EMPTY__') {
                    $model->$key = $value;
                }
            }
        }
    }

    static function diff($model, $old) {
        $diff = array();

        $vars = array_keys(get_object_vars($old));

        foreach ($vars as $var) {
            if ($var[0] != '_' && $var != 'N') {
                if ($model->$var != $old->$var) {
                    $diff[] = "$var: ".ModelHelper::html_diff ($old->$var, $model->$var);
                }
            }
        }

        return $diff;
    }

    static function str_diff($old, $new) {
		$maxlen = 0;

    	foreach ($old as $oindex => $ovalue) {
    		$nkeys = array_keys($new, $ovalue);

    		foreach ($nkeys as $nindex) {
    			$matrix[$oindex][$nindex] = isset($matrix[$oindex - 1][$nindex - 1]) ? $matrix[$oindex - 1][$nindex - 1] + 1 : 1;

    			if ($matrix[$oindex][$nindex] > $maxlen) {
    				$maxlen = $matrix[$oindex][$nindex];
    				$omax = $oindex + 1 - $maxlen;
    				$nmax = $nindex + 1 - $maxlen;
    			}
    		}
    	}

    	if ($maxlen == 0) {
    	    return array(array('d' => $old, 'i' => $new));
        }

    	return array_merge(ModelHelper::str_diff(array_slice($old, 0, $omax), array_slice($new, 0, $nmax)), array_slice($new, $nmax, $maxlen), ModelHelper::str_diff(array_slice($old, $omax + $maxlen), array_slice($new, $nmax + $maxlen)));
    }

    static function html_diff($old, $new) {
    	$diff = ModelHelper::str_diff(explode(' ', $old), explode(' ', $new));

    	$ret = '';

    	foreach ($diff as $k) {
    		if (is_array($k)) {
    			$ret .= (!empty($k['d'])? "<del>".implode(' ',$k['d'])."</del> " : '').(!empty($k['i'])? "<ins>".implode(' ',$k['i'])."</ins> " : '');
            } else {
                $ret .= $k . ' ';
            }
    	}

    	return $ret;
    }
}