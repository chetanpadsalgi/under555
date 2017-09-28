<?php

if (!function_exists('curl_init')) {
  throw new Exception('Krconnect needs the CURL PHP extension.');
}
if (!function_exists('json_decode')) {
  throw new Exception('Krconnect needs the JSON PHP extension.');
}

final class KartrocketAPI{

    public static $CURL_OPTS = array(
      CURLOPT_CONNECTTIMEOUT => 10,
      CURLOPT_RETURNTRANSFER => true,
      CURLOPT_TIMEOUT        => 60,
      CURLOPT_USERAGENT      => 'facebook-php-3.2',
    );    
     
  public function makeRequest($url, $params, $ch=null) {
    
    if (!$ch) {
      $ch = curl_init();
    }
    //echo $url;
    $opts = self::$CURL_OPTS;
    $opts[CURLOPT_POSTFIELDS] = $params;
    $opts[CURLOPT_URL] = $url;

    // disable the 'Expect: 100-continue' behaviour. This causes CURL to wait
    // for 2 seconds if the server does not support this header.
    if (isset($opts[CURLOPT_HTTPHEADER])) {
      $existing_headers = $opts[CURLOPT_HTTPHEADER];
      $existing_headers[] = 'Expect:';
      $opts[CURLOPT_HTTPHEADER] = $existing_headers;
    } else {
      $opts[CURLOPT_HTTPHEADER] = array('Expect:');
    }

    curl_setopt_array($ch, $opts);
    $result = curl_exec($ch);

    if (curl_errno($ch) == 60) { // CURLE_SSL_CACERT
      self::errorLog('Invalid or no certificate authority found, '.
                     'using bundled information');
      curl_setopt($ch, CURLOPT_CAINFO,
                  dirname(__FILE__) . '/fb_ca_chain_bundle.crt');
      $result = curl_exec($ch);
    }

    // With dual stacked DNS responses, it's possible for a server to
    // have IPv6 enabled but not have IPv6 connectivity.  If this is
    // the case, curl will try IPv4 first and if that fails, then it will
    // fall back to IPv6 and the error EHOSTUNREACH is returned by the
    // operating system.
    if ($result === false && empty($opts[CURLOPT_IPRESOLVE])) {
        $matches = array();
        $regex = '/Failed to connect to ([^:].*): Network is unreachable/';
        if (preg_match($regex, curl_error($ch), $matches)) {
          if (strlen(@inet_pton($matches[1])) === 16) {
            self::errorLog('Invalid IPv6 configuration on server, '.
                           'Please disable or get native IPv6 on your server.');
            self::$CURL_OPTS[CURLOPT_IPRESOLVE] = CURL_IPRESOLVE_V4;
            curl_setopt($ch, CURLOPT_IPRESOLVE, CURL_IPRESOLVE_V4);
            $result = curl_exec($ch);
          }
        }
    }

    if ($result === false) {
        /*$e = new FacebookApiException(array(
          'error_code' => curl_errno($ch),
          'error' => array(
          'message' => curl_error($ch),
          'type' => 'CurlException',
          ),
        ));*/
      print_r(curl_error($ch));  
      curl_close($ch);
      return false;
    }
    curl_close($ch);
    return $result;
  }
    
}

?>
