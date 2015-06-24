<?php
require_once 'jsonRPCClient.php';

class GetResponseApi {
    var $client = null;

    var $api_key = null;
    var $api_url = 'http://api2.getresponse.com';

    function __construct($api_key) {
        $this->api_key = $api_key;

        $this->client = new jsonRPCClient($this->api_url);
    }

    function get_campaigns_by_name($campaign_name) {
        $campaigns = $this->client->get_campaigns(
        	$this->api_key,
            array (
                'name' => array ( 'EQUALS' => $campaign_name )
        	)
        );

        return $campaigns;
    }

    function add_contact($id_campaign, $name, $email) {
        try {
            $result = $this->client->add_contact(
            	$this->api_key,
            	array (
            		'campaign'  => $id_campaign,
            		'name'      => $name,
                	'email'     => $email,

    //        		# custom fields
    //        		'customs' => array(
    //        	        array(
    //        	            'name'       => 'likes_to_drink',
    //        	            'content'    => 'tea'
    //        	        ),
    //        			array(
    //        	            'name'       => 'likes_to_eat',
    //        	            'content'    => 'steak'
    //        	        )
    //        	    )
            	)
            );

            return $result;
        } catch (Exception $e) {
        }
    }
}