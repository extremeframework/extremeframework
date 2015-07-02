<?php
return array(
    /**
     * Default cache store
     */
    'defaultstore' => 'session',

    /**
     * Available cache stores (supported drivers: 'apc', 'array', 'session', 'memcache')
     */
    'stores' => array(
        'apc' => array(
            'driver' => 'apc'
        ),
        'array' => array(
            'driver' => 'array'
        ),
        'session' => array(
            'driver' => 'session'
        ),
        'memcache' => array(
            'driver' => 'memcache',
            'host' => 'localhost',
            'port' => '11211'
        )
    )
);