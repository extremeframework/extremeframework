<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class EditableFileController extends _EditableFileController
{
    function editFileAction() {
        AclController::checkPermission('editablefile', 'edit');

		list($id) = explode('/', $_REQUEST['args']);

		if (empty($id)) {
		    $this->pagenotfound();
		}

        $this->checkPermission($id, 'edit');

		ContextStack::register(APPLICATION_URL.'/editablefile/editfile/'.$id);

		$model = new EditableFileModel();

        if ($id > 0) {
    		$model->ID = $id;
    		$model->find();

         	if (!$model->fetch()) {
    		    $this->pagenotfound();
         	}
        }

        if (file_exists($model->FILE_PATH)) {
            $filepath = $model->FILE_PATH;
        } else {
            $filepath = APPLICATION_DIR.'/'.$model->FILE_PATH;
        }

        $content = file_get_contents($filepath);

		$messages = $this->getMessages();

		$smarty = Framework::getSmarty();

		$smarty->assign('details', $model);
		$smarty->assign('messages', $messages);
		$smarty->assign('module', 'editablefile');
		$smarty->assign('content', $content);

        if ($this->caller == 'ajax') {
		    $content = $smarty->fetch('editor.editablefile.tpl');

            if (($beginpos = strpos($content, '<!--:'.$this->return.'begin:-->')) && ($endpos = strpos($content, '<!--:'.$this->return.'end:-->'))) {
                $content = substr($content, $beginpos, $endpos - $beginpos);

    		    echo $content;
            } else {
                echo 'An unexpected error has been encountered. Please report this problem to your system administrator.';
            }
        } else {
    	    $smarty->display('editor.editablefile.tpl');
        }
	}

    function saveFileAction() {
        $prefix = null;
        $model = $this->form2model($prefix);

        $content = $_REQUEST['editablefile_formdata_CONTENT'];

        if (file_exists($model->FILE_PATH)) {
            $filepath = $model->FILE_PATH;
        } else {
            $filepath = APPLICATION_DIR.'/'.$model->FILE_PATH;
        }

        file_put_contents($filepath, $content);

        ContextStack::back(0);
    }
}