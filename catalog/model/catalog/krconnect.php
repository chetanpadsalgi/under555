<?php

class ModelCatalogKrconnect extends Model{

    public function addOrder($order_id){
        $key = $this->config->get('config_kr_key');
        $store_url = $this->config->get('config_kr_storeurl');
        $store_url = str_replace('http://','',$store_url);
        $url = "http://".$store_url.'/index.php?route=feed/web_api/addorder&key='.$key;
        $param = array();
        $this->load->model('checkout/order');
        ##just to be sure, first check whether this order id is already been added to kartrocket or not.
        $order = $this->getKrReferenceID($order_id);
        if(trim($order->row['kr_reference_id'] == '')  || is_nan($order->row['kr_reference_id'])){
            $orderDetails = $this->model_checkout_order->getOrder($order_id);
            //echo "<pre>";print_r($orderDetails);
        $paramsdata = array(
                "import_order_id"=>$orderDetails['order_id'], #Reference Order Id, Not Required.
                "firstname"=>$orderDetails['shipping_firstname'],
                "lastname"=>$orderDetails['shipping_lastname'],
                "email"=>$orderDetails['email'],
                "company"=>$orderDetails['shipping_company'],
                "address_1"=>$orderDetails['shipping_address_1'],
                "address_2"=>$orderDetails['shipping_address_2'],
                "city"=>$orderDetails['shipping_city'],
                "postcode"=>$orderDetails['shipping_postcode'],
                "state"=>$orderDetails['shipping_zone'],
                "country_code"=>$orderDetails['shipping_iso_code_2'],
                "telephone"=>$orderDetails['telephone'],
                "mobile"=>(int)$orderDetails['telephone'],
                "fax"=>$orderDetails['fax'],
                "payment_method"=>$orderDetails['payment_method'],
                "payment_code"=>$orderDetails['payment_code'],
                "shipping_method"=>$orderDetails['shipping_method'],
                "shipping_code" =>$orderDetails['shipping_code'],
                "comment"       =>$orderDetails['comment'],
                "total"         => $orderDetails['total'],
                "weight"        => 0
                );
            $orderProducts = array();
            $products = $this->db->query("SELECT op.*,p.subtract,p.points,p.weight,p.sku FROM " . DB_PREFIX . "order_product op left join " . DB_PREFIX . "product p on op.order_product_id=p.product_id WHERE order_id = '" . (int)$order_id . "'");
            foreach ($products->rows as $product) {
                $orderProducts[] = array(
                    'name'      => $product['name'],
                    'model'     => $product['model'],
                    'sku'       => $product['sku'],
                    'quantity'  => $product['quantity'],
                    'subtract'  => $product['subtract'],
                    'price'     => $product['price'] ,
                    'total'     => $product['total'],
                    'tax'       => $product['tax'],
                    'reward'    => $product['points']
                );
                $paramsdata['weight'] += round($product['weight'],2);
            }
            $paramsdata['products'] = $orderProducts;
			
			// KartRocket Connect 1.3 Changes
			$totals = $this->db->query("SELECT ot.* FROM " . DB_PREFIX . "order_total ot WHERE order_id = '" . (int)$order_id . "'");
			
			foreach($totals->rows as $total){
				$paramsdata['totals'][$total['code']] = (float) $total['value'];
			}
			/*
			$paramsdata['totals'] =array(
                "handling"=>'',
                "low_order_fee"=>'',
                "sub_total"=>(int)$orderDetails['total'],
                "tax"=> (int)$orderDetails['payment_tax_id'],
                "total"=>(int)$orderDetails['total']
            );
			*/
            $params['data'] = json_encode($paramsdata);
            //print_r($params);echo "<br>";//exit;
            require_once(DIR_SYSTEM . 'vendor/krconnect/krconnectapi.php');
            $krconnect = new KartrocketAPI();
            $jsonResponse = $krconnect->makeRequest($url,$params ); 
            $responseData = json_decode($jsonResponse);
			$log  = new LOG('kartrocket.log');
			$log->write($jsonResponse);
			$this->session->data['kr_response'] = $jsonResponse;
            if(isset($responseData->success) && $responseData->success){
                $kr_reference_id = $responseData->order_added->order_id;
                $this->db->query('UPDATE '.DB_PREFIX.'order set kr_reference_id= "'.$kr_reference_id.'" WHERE order_id = '.(int)$order_id.' LIMIT 1');
                return $kr_reference_id;
            }else{
                if(isset($responseData->message)){
                        $this->session->data['error_kr_message'] = $responseData->message;
                         $this->session->data['error_kr_code'] = $responseData->code;
                }
                return 0;
            }
            exit;
        }else{
            ## kr_reference_id already exists.
            //echo "already exists";
            return 0;
        }
    }
    
    public function getKrReferenceID($order_id){
        $res = $this->db->query("SELECT kr_reference_id FROM `" . DB_PREFIX . "order` WHERE `order_id`= '".(int)$order_id."' LIMIT 1");
        return $res;
    }

}

?>
