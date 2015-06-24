<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class AdminPackageController extends _AdminPackageController
{
    function uploadAction() {
        // x. Ensure additional data
        $this->ensure_additional_data(
            'Upload a Package',
            'PACKAGE_ZIP',
            'PACKAGE_ZIP',
            array(
                'Install' => APPLICATION_URL.'/adminpackage/upload'
            ),
            $formdata,
            array(
                'PACKAGE_ZIP' => new ColumnSettings('file', 'Package package file (.zip)', 'package-zip')
            )
        );

        if ($formdata['PACKAGE_ZIP']['error'] == 1) {
            die("File upload failed");
        }

        // x. Package file
        $tmp_name = $formdata['PACKAGE_ZIP']['tmp_name'];
    	$name = $formdata['PACKAGE_ZIP']['name'];

        // x. Installation
        $installer = new PackageInstaller();

        $package = $installer->get_temp_dir().'/'.basename($name);

        if (move_uploaded_file($tmp_name, $package)) {
            $installer->install($package, $error);
        } else {
            $error = "Cannot move uploaded file to $package";
        }

        if (!empty($error)) {
            echo('ERROR: '.$error);
        } else {
            ContextStack::back(0);
        }
    }
}