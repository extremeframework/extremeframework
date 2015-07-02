<?php
$groups = array();

$groups[] = array(
    'title' => 'PayPal API',
    'description' => '',
    'options' => array(
        array(
            'title' => 'API enpoint',
            'code' => 'PAYPAL_API_URL',
            'type' => 'text',
            'default' => 'https://api-3t.sandbox.paypal.com/nvp'
        ),
        array(
            'title' => 'Web URL',
            'code' => 'PAYPAL_WEB_URL',
            'type' => 'text',
            'default' => 'https://www.sandbox.paypal.com'
        ),
        array(
            'title' => 'API version',
            'code' => 'PAYPAL_VERSION',
            'type' => 'text',
            'default' => '93'
        )
    )
);

$groups[] = array(
    'title' => 'PayPal API User',
    'description' => '',
    'options' => array(
        array(
            'title' => 'Username',
            'code' => 'PAYPAL_USERNAME',
            'type' => 'text',
            'default' => ''
        ),
        array(
            'title' => 'Password',
            'code' => 'PAYPAL_PASSWORD',
            'type' => 'text',
            'default' => ''
        ),
        array(
            'title' => 'Signature',
            'code' => 'PAYPAL_SIGNATURE',
            'type' => 'text',
            'default' => ''
        )
    )
);

return $groups;