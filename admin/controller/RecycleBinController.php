<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class RecycleBinController extends _RecycleBinController
{
    function restoreAction() {
	    list($id) = explode('/', $_REQUEST['args']);

	    if (!empty($id)) {
	        $selection = array($id);
        } else {
			$selectall = isset($_REQUEST['recyclebinlist_selection_selectall']) && $_REQUEST['recyclebinlist_selection_selectall'];

			if ($selectall) {
				if (isset($_SESSION['recyclebin.list.model']) && is_object($_SESSION['recyclebin.list.model'])) {
					$model = clone $_SESSION['recyclebin.list.model'];
				} else {
		        	$model = new RecycleBinModel();
				}

				$model->find();

				$selection = array();
		        while ($model->fetch()) {
		        	$selection[] = $model->ID;
		        }
			} else {
    			$selection = isset($_REQUEST['recyclebinlist_selection'])? $_REQUEST['recyclebinlist_selection'] : '';
			}
        }

		if (!empty($selection)) {
    		$model = new RecycleBinModel();

    		$model->whereAdd('UUID = "'.implode('" or UUID = "', $selection).'"');

            $model->find();

            while($model->fetch()) {
                $object = ModelHelper::rebuildModel($model->MODULE, json_decode($model->JSON));
                $object->insert(false);

        		$clm = new ChangeLogModel();
        		$clm->ID_USER = $_SESSION['user']->ID;;
        		$clm->DATE_TIME = date('Y-m-d H:i:s');
        		$clm->MODULE = $model->MODULE;
        		$clm->ACTION = 'restore';
        		$clm->ITEM = $model->ITEM;
        		$clm->insert();
    		}

            $model = new RecycleBinModel();
    		$model->whereAdd('UUID = "'.implode('" or UUID = "', $selection).'"');
    		$model->delete();
        }

	    ContextStack::back(0);
    }
}