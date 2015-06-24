<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class pCURL {
 	private static $instance;

	private $mh = null;

	private $cookies_dir = null;

	private $all = null;

	private $pending = null;
	private $processing = null;

	public $maxcount = 10;

	public $callback_finalize = null;

	public $start_time = null;
	public $end_time = null;

	private $check_duplicate = true;

	private $proxy = null;

	private $proxy_rotator = null;

	private $proxy_test_string = null;
	private $proxy_prohibited_string = null;

	private $sleep_time = null;

	private $time_limit = 30;

	private $retry = 3;
	private $retries = array();

	private function __construct() {
		$this->cookies_dir = dirname(__FILE__);

		$this->mh = curl_multi_init();

		$this->pending = array();

		$this->start_time = time();
	}

	function __destruct() {
		// IMPORTANT
		$this->finalize();

        // Call the callback function
        if (!empty($this->callback_finalize)) {
			call_user_func($this->callback_finalize);
		}

		$this->end_time = time();

		//LogHelper::info("Total ellapsed time = ".($this->end_time - $this->start_time)." seconds");
	}

	public static function getInstance() {
	 	if (!self::$instance) {
	        self::$instance = new pCURL();
	    }

	    return self::$instance;
	}

	private function &curl($url, $poststring = null, $proxy = null, $saveto = null, $headeronly = false) {
	    // create a new curl resource
	    $ch = curl_init();

	    // set URL
	    curl_setopt($ch, CURLOPT_URL, $url);

		if (!empty($saveto)) {
			curl_setopt($ch, CURLOPT_FILE, fopen($saveto, 'w'));
		} else {
			curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
		}

		// set proxy
		if (!empty($proxy)) {
			if (preg_match('/([^:]*):([^:]*):([^:]*):([^:]*)/is', $proxy, $matches)) {
				$_proxy = $matches[1].':'.$matches[2];
				$_user = $matches[3].':'.$matches[4];

				curl_setopt($ch, CURLOPT_PROXY, $_proxy);
				curl_setopt($ch, CURLOPT_PROXYUSERPWD, $_user);
			} else {
				curl_setopt($ch, CURLOPT_PROXY, $proxy);
			}
			curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, $this->time_limit);
			curl_setopt($ch, CURLOPT_TIMEOUT, $this->time_limit);
		} else {
			curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, $this->time_limit);
			curl_setopt($ch, CURLOPT_TIMEOUT, $this->time_limit);
		}

		// header only
	    if ($headeronly) {
   			curl_setopt($ch, CURLOPT_HEADER, true);
      		curl_setopt($ch, CURLOPT_NOBODY, true);
	    } else {
		    curl_setopt($ch, CURLOPT_HEADER, false);
      		curl_setopt($ch, CURLOPT_NOBODY, false);
		}

		curl_setopt($ch, CURLOPT_REFERER, $url); // Important
	    curl_setopt($ch, CURLOPT_USERAGENT, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.142 Safari/535.19');
	    curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);

	    // Cookie
	    $cookiefile = $this->get_cookie_file($proxy);

	    curl_setopt($ch, CURLOPT_COOKIEFILE, $cookiefile);
	    curl_setopt($ch, CURLOPT_COOKIEJAR, $cookiefile);

		// Accept compressed content
	    curl_setopt($ch, CURLOPT_ENCODING, true);

	    // SSL
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);

	    // POST method
	    if (!empty($poststring)) {
	    	if (is_array($poststring)) {

	    		$a = array();
	    		foreach ($poststring as $key => $value) {
					$a[] = $key.'='.urlencode($value);
	    		}

	    		$poststring = implode('&', $a);
	    	}

	        curl_setopt($ch, CURLOPT_POST, 1);
	        curl_setopt($ch, CURLOPT_POSTFIELDS, $poststring);
	    }

		return $ch;
	}

	public static function set_proxy($proxy) {
		$instance = self::getInstance();

		$instance->proxy = $proxy;
	}

	public static function set_proxy_rotator($proxy_rotator) {
		$instance = self::getInstance();

		$instance->proxy_rotator = $proxy_rotator;
	}

	public static function set_proxy_test_string($proxy_test_string) {
		$instance = self::getInstance();

		$instance->proxy_test_string = $proxy_test_string;
	}

	public static function set_proxy_prohibited_string($proxy_prohibited_string) {
		$instance = self::getInstance();

		$instance->proxy_prohibited_string = $proxy_prohibited_string;
	}

	public static function set_sleep_time($sleep_time) {
		$instance = self::getInstance();

		$instance->sleep_time = $sleep_time;
	}

	public static function set_time_limit($time_limit) {
		$instance = self::getInstance();

		$instance->time_limit = $time_limit;
	}

	public static function set_retry_limit($retry_limit) {
		$instance = self::getInstance();

		$instance->retry = $retry_limit;
	}

	public static function download($url, $poststring = null, $proxy = null, $saveto = null, $headeronly = false, &$info = null) {
		$instance = self::getInstance();

		$ch = $instance->curl($url, $poststring, $proxy, $saveto, $headeronly);

	    // grab URL and pass it to the browser
	    $text = curl_exec($ch);

		// info
		$info = curl_getinfo($ch);

	    // close curl resource, and free up system resources
	    curl_close($ch);

	    return $text;
	}

	function readInput($message = NULL) {
		print $message;

		$stdin = fopen('php://stdin', 'r');
		$line = fgets($stdin);
		fclose($stdin);

		return trim($line);
	}

	public static function set_num_threads($numthreads) {
		$instance = self::getInstance();

		$instance->maxcount = $numthreads;
	}

	public static function set_cookies_dir($directory) {
		if (!file_exists($directory) || !is_dir($directory)) {
			mkdir($directory);
		}

		$instance = self::getInstance();

		$instance->cookies_dir = $directory;
	}

	public static function on_finalize($callback) {
		$instance = self::getInstance();

		$instance->callback_finalize = $callback;
	}

	public static function check_duplicate($flag) {
		$instance = self::getInstance();

		$instance->check_duplicate = $flag;
	}

	public static function retry($url, $callback, $poststring = null, $proxy = null, $userdata = null, $signature = null) {
		$instance = self::getInstance();

		$old = $instance->check_duplicate;
		$instance->check_duplicate = false;

		$instance->add($url, $callback, $poststring, $proxy, $userdata, $signature);

		$instance->check_duplicate = $old;
	}

	public static function add($url, $callback, $poststring = null, $proxy = null, $userdata = null, $signature = null) {
		if (trim($signature) == '') {
			$signature = $url;
		}

		$instance = self::getInstance();

		if (empty($url) || empty($callback)) {
			die("[ERROR] Missing parameter (pCURL::add)\n");
		}

		if (!$instance->check_duplicate || !isset($instance->all[$signature])) {
			if (empty($proxy) && !empty($instance->proxy_rotator)) {
				$proxy = $instance->proxy_rotator->next();

				if (empty($proxy)) {
					die("[ERROR] Unexpected empty return from proxy rotator\n");
				}
			}

	    	$instance->pending[] = array('url' => $url, 'callback' => $callback, 'poststring' => $poststring, 'userdata' => $userdata, 'signature' => $signature, 'proxy' => $proxy);

	    	$instance->all[$signature] = 1;
		} else {
			//LogHelper::notice('Duplicate URL --> '.$url);
		}
	}

	public static function remove($url, $signature = null) {
		if (trim($signature) == '') {
			$signature = $url;
		}

		$instance = self::getInstance();

		unset($instance->all[$signature]);
	}

	public static function get_queue_size() {
		$instance = self::getInstance();

		return count($instance->pending);
	}

	private function get_cookie_file($proxy = null) {
	    $cookiefile = $this->cookies_dir.'/.cookies'.(!empty($proxy)? '.'.str_replace(':', '.', $proxy) : '');

		if (!file_exists($cookiefile)) {
			file_put_contents($cookiefile, '');
		}

	    return $cookiefile;
	}

	private function fetch2execute() {
		while (!empty($this->pending) && count($this->processing) < $this->maxcount) {
			$block = array_shift($this->pending);

			$ch = $this->curl($block['url'], $block['poststring'], $block['proxy']);

		    curl_multi_add_handle($this->mh, $ch);
		    $this->processing[(int)$ch] = $block;
		}
	}

	private function finalize() {
	    if ($this->mh == null) {
	        return;
	    }

		if (!empty($this->pending) && count($this->processing) < $this->maxcount) {
		    $this->fetch2execute();
		}

		do {
		    $status = curl_multi_exec($this->mh, $active);

	        //////////////////////////////////////////
	        // x. Check for completed requests to process
		    $info = curl_multi_info_read($this->mh);
		    if (false !== $info) {
		    	$ch = $info['handle'];

		        // The corresonding controlling data
				$block = $this->processing[(int)$ch];

		        // Get content
		    	$content = curl_multi_getcontent($ch);

				// CURL info
				$info = curl_getinfo($ch);
				$info['proxy'] = $block['proxy'];

		        // Check for good/bad proxy
		        $good = true;

	        	if (empty($content) || (!empty($this->proxy_test_string) && stripos($content, $this->proxy_test_string) === false)) {
					$good = false;

	        		if ($this->retry && (!isset($this->retries[$block['signature']]) || $this->retries[$block['signature']] < $this->retry)) {
						$this->retry($block['url'], $block['callback'], $block['poststring'], $block['proxy'], $block['userdata'], $block['signature']);

						if (!isset($this->retries[$block['signature']])) {
				        	$this->retries[$block['signature']] = 1;
						} else {
							$this->retries[$block['signature']] += 1;
						}

						//LogHelper::notice("Retry <-- {$block['url']}, proxy = {$block['proxy']}, retry count = ".$this->retries[$block['signature']]);
	        		} else {
	        			// Bad proxy
						//LogHelper::notice("Bad proxy <-- ".$block['proxy']);

						if (is_object($this->proxy_rotator)) {
		        			$this->proxy_rotator->report_bad_proxy($info['proxy']);
						}

				        // Call the callback function
						call_user_func($block['callback'], $content, $block['url'], $block['userdata'], $info);
	        		}
				}

				if ($good) {
					if (is_object($this->proxy_rotator)) {
						$this->proxy_rotator->report_good_proxy($info['proxy']);
					}

			        // Call the callback function
					call_user_func($block['callback'], $content, $block['url'], $block['userdata'], $info);
				}

		        // Remove it
				curl_multi_remove_handle($this->mh, $ch);

				unset($this->processing[(int)$ch]);

				$cookiefile = $this->get_cookie_file($info['proxy']);
				if (file_exists($cookiefile)) {
					$_content = file_get_contents($cookiefile);

					curl_close($ch);

					file_put_contents($cookiefile, $_content);
				} else {
					curl_close($ch);
				}

		        // Sleep if neccessary
		        if ($this->sleep_time) {
		        	//LogHelper::info ("Sleep for {$this->sleep_time} seconds...");

		        	sleep($this->sleep_time);
		        }

		        // Continue with another request
		        $this->fetch2execute();
		    }
		} while ($status === CURLM_CALL_MULTI_PERFORM || $active || count($this->pending) || count($this->processing));
	}
}
