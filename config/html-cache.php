<?php
return array(
    /**
     * Specify if HTML cache is enabled
     */
    'enabled' => true,

    /**
     * Don't use cache for the following link patterns
     */
    'excludes' => array(
        '^(thumb|opcache|notification)',
        '.*\/(sort)',
    )
);