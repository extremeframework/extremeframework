<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class DebugController extends __AppController
{
    function indexAction() {
        echo "<pre>Memberships:";
        print_r($_SESSION['memberships']);
        echo "</pre>";

        echo "<pre>Groups:";
        print_r($_SESSION['memberships.groups']);
        echo "</pre>";

        echo "<pre>Roles:";
        print_r($_SESSION['memberships.roles']);
        echo "</pre>";

        echo "<pre>Udids:";
        print_r($_SESSION['memberships.udids']);
        echo "</pre>";

        echo "<pre>Quota:";
        print_r($_SESSION['user.quotas']);
        echo "</pre>";

        echo "<pre>ACL:";
        print_r($_SESSION['acl']);
        echo "</pre>";
    }
}