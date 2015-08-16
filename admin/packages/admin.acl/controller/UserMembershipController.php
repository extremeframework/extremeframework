<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
require_once('GetResponse/GetResponseApi.php');

class UserMembershipController extends _UserMembershipController
{
    function addUserToGroup($user, $id_user_group, $id_user_role = null, $valid_from = null, $valid_until = null) {
        // x. Get user group information
        $ugm = new UserGroupModel();

        $ugm->ID = $id_user_group;

        $ugm->find();

        if (!$ugm->fetch()) {
            return false;
        }

        // x. Default dashboard
        $id_dashboard = $ugm->DEFAULT_ID_DASHBOARD;

        // x. Add user to the group
        $umm = new UserMembershipModel();

        $umm->ID_USER = $user->ID;
        $umm->ID_USER_GROUP = $id_user_group;
        $umm->ID_USER_ROLE = $id_user_role;
        $umm->VALID_FROM = $valid_from;
        $umm->VALID_UNTIL = $valid_until;
        $umm->GUID = $user->ID;
        $umm->UDID = $user->ID;

        $umm->insert(false);

        // x. Get GetResponse's mailing lists corresponding to the user group
        if (class_exists('GetResponseCampaignModel')) {
            $grcm = new GetResponseCampaignModel();

            $grcm->ID_USER_GROUP = $id_user_group;

            $grcm->find();

            $campaigns = array();
            while ($grcm->fetch()) {
                $campaigns[] = $grcm->CAMPAIGN_CODE;
            }

            if (!empty($campaigns)) {
                // x. Add user to the mailing lists
                $getresponse = new GetResponseApi(GETRESPONSE_API_KEY);

                foreach ($campaigns as $campaign_code) {
                    try {
                        $result = $getresponse->add_contact($campaign_code, $user->NAME, $user->EMAIL);

                        if (!isset($result['queued']) || $result['queued'] != 1) {
                            SystemLogController::addLog('UserMembership::GetResponse', 'Error', 'Cannot add contact :: '.$user->EMAIL);
                        }
                    } catch (Exception $ex) {
                        SystemLogController::addLog('UserMembership::GetResponse', 'Error', $ex->getMessage());
                    }
                }
            }
        }

        // x. Set default dashboard for the user
        $upm = new UserPreferenceModel();

        $upm->ID_USER = $user->ID;
        $upm->ID_DASHBOARD = $id_dashboard;
        $upm->GUID = $user->ID;
        $upm->UDID = $user->ID;

        $upm->insert(false);

        return true;
    }

    function removeUserFromGroup($user, $id_user_group) {
        // x. Remove user to the group
        $umm = new UserMembershipModel();

        $umm->whereAdd("ID_USER = '{$user->ID}'");
        $umm->whereAdd("ID_USER_GROUP = '{$id_user_group}'");

        $umm->delete(true);

        return true;
    }
}