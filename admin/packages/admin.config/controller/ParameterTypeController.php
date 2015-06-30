<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class ParameterTypeController extends _ParameterTypeController
{
	function getListOptionsAction() {
		list($id, $selectedvalue) = explode('/', $_REQUEST['args']);

		$model = new ParameterTypeModel();

		$model->ID = $id;
		$model->find();

     	if (!$model->fetch()) {
			return false;
		}

		$btype = $model->BASE_TYPE_CODE;
		$extra = $model->EXTRA;

		switch ($btype) {
			case 'listsimple':
				$items = explode(',', $extra);

				foreach ($items as $item) {
					list($value, $title) = explode('|', trim($item));

					echo '<option value="'.trim($value).'"'.(trim($value) == $selectedvalue? ' selected' : '').'>'.trim($title).'</option>';
				}

				break;

			case 'listsql':
				$model->query($extra);

				while ($model->fetch()) {
					$value = $model->VALUE;
					$title = $model->TITLE;

					echo '<option value="'.trim($value).'"'.(trim($value) == $selectedvalue? ' selected' : '').'>'.trim($title).'</option>';
				}

				break;

			case 'listref':
				require_once('Smarty/libs/plugins/function.html_ref_select.php');

				$params = json_decode(html_entity_decode($extra), true);
				$params['value'] = $selectedvalue;

				$smarty = self::getSmarty();
				$html = smarty_function_html_ref_select($params, $smarty);

				if (preg_match('/(<option.*)<\/select>/is', $html, $matches)) {
					echo $matches[1];
				}

				break;

			case 'listws':
				break;

			default:
				break;
		}
	}
}