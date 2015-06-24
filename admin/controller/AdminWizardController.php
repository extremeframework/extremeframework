<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class AdminWizardController extends _AdminWizardController
{
    function beginAction() {
		@list($code) = explode('/', $_REQUEST['args']);

		if (empty($code)) {
		    $this->pagenotfound();
		}

        // x. Wizard
        $wizard = $this->getItem(array('CODE' => $code));

		if (empty($wizard)) {
		    $this->pagenotfound();
		}

        // x. Wizard steps
        $wizard_steps = (new AdminWizardStepController())->getList(false, array('ID_ADMIN_WIZARD' => $wizard->ID), array(), 'ORDERING ASC');

        // x. Set wizard info to the session
        $_SESSION['system.wizard'] = $wizard;
        $_SESSION['system.wizard.steps'] = $wizard_steps;
        $_SESSION['system.wizard.current'] = 0;

        // x. Begin with the first step
        $step = $wizard_steps[0];

        $this->initStep($step);
    }

    function initStep($step) {
        if (!empty($step->INIT_SCREEN_PATH)) {
            $path = APPLICATION_URL.'/'.$step->INIT_SCREEN_PATH;

    		application_route($path);
        } else {
            ContextStack::back(0);
        }
    }

    function restartStepAction() {
        if (!isset($_SESSION['system.wizard'])) {
            ContextStack::back(0);
        }

        $cur = $_SESSION['system.wizard.current'];
        $step = $_SESSION['system.wizard.steps'][$cur];

        $this->initStep($step);
    }

    function nextAction() {
        if (!isset($_SESSION['system.wizard'])) {
            ContextStack::back(0);
        }

        $cur = $_SESSION['system.wizard.current'];

        if ($cur < count($_SESSION['system.wizard.steps']) - 1) {
            $cur += 1;

            $_SESSION['system.wizard.current'] = $cur;

            $step = $_SESSION['system.wizard.steps'][$cur];

            $this->initStep($step);
        } else {
            $this->endAction();
        }
    }

    function endAction() {
        // x. Clear wizard info from the session
        if (isset($_SESSION['system.wizard'])) {
            unset($_SESSION['system.wizard']);
            unset($_SESSION['system.wizard.steps']);
            unset($_SESSION['system.wizard.current']);
        }

        ContextStack::back(0);
    }

    static function getCurrentWizardHtml() {
        if (!isset($_SESSION['system.wizard'])) {
            return;
        }

        $wizard = $_SESSION['system.wizard'];
        $steps = $_SESSION['system.wizard.steps'];
        $current = $_SESSION['system.wizard.current'];

        $smarty = Framework::getSmarty();

        $smarty->assign('wizard', $wizard);
		$smarty->assign('steps', $steps);
		$smarty->assign('current', $current);
		$smarty->assign('is_last_step', $current == count($steps) - 1);

        return $smarty->fetch('live.adminwizard.tpl');
    }
}