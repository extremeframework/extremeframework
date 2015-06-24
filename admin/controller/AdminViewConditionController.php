<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class AdminViewConditionController extends _AdminViewConditionController
{
    function initListModel(&$model) {
        $model->selectAdd();
        $model->selectAdd('`ADMIN_VIEW_CONDITION`.*');
        $model->selectAdd('reftable_ID_ADMIN_VIEW.NAME as reftext_ID_ADMIN_VIEW');
        $model->selectAdd('reftable_ID_FIELD.NAME as reftext_ID_FIELD');
        $model->selectAdd('reftable_ID_FIELD.COLUMN as reftext_FIELD_COLUMN');
        $model->selectAdd('reftable_ID_VALUE_OPERATOR.NAME as reftext_ID_VALUE_OPERATOR');
        $model->selectAdd('reftable_ID_VALUE_OPERATOR.OPERATOR as reftext_VALUE_OPERATOR_OPERATOR');
        $model->selectAdd('reftable_ID_CONDITION_OPERATOR.NAME as reftext_ID_CONDITION_OPERATOR');
        $model->selectAdd('reftable_ID_CONDITION_OPERATOR.OPERATOR as reftext_CONDITION_OPERATOR_OPERATOR');

        $model->joinAdd(array('ID_ADMIN_VIEW','ADMIN_VIEW:ID'), 'LEFT', 'reftable_ID_ADMIN_VIEW');
        $model->joinAdd(array('ID_FIELD','FIELD:ID'), 'LEFT', 'reftable_ID_FIELD');
        $model->joinAdd(array('ID_VALUE_OPERATOR','VALUE_OPERATOR:ID'), 'LEFT', 'reftable_ID_VALUE_OPERATOR');
        $model->joinAdd(array('ID_CONDITION_OPERATOR','CONDITION_OPERATOR:ID'), 'LEFT', 'reftable_ID_CONDITION_OPERATOR');
    }
}