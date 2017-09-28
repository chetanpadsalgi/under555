<?php

class ModelCatalogKrconnect extends Model{
         
    public function getDefaultMapping(){
	return $krOrder_mapping = array('1' =>'1',
                                '2' =>'1',
                                '3'=>'3',
                                '5'=>'27',
                                '7'=>'7',
                                '8'=>'10',
                                '9'=>'7',
                                '10'=>'10',
                                '11'=>'20',
                                '12'=>'20',
                                '13'=>'10',
                                '14'=>'10',
                                '15'=>'1',
                                '16'=>'7');
    }

    public function getKRStatuses(){
	return $krOrder_status = array('1' =>'Pending',
                                '3' =>'Shipped',
                                '5'=>'Complete',
                                '7'=>'Canceled',
                                '10'=>'Failed CC',
                                '17'=>'Pending-COD Confirmed',
                                '18'=>'Ready to Dispatch',
                                '19'=>'Pending-CC Confirmed',
                                '20'=>'Returned',
                                '21'=>'Cancelled Against New',
                                '22'=>'RTO Initiated-Logistics Partner',
                                '23'=>'RTO Initiated-Customer',
                                '24'=>'RTO Received-Logisitics Partner',
                                '25'=>'RTO Received-Customer',
                                '26'=>'Lost/Stolen',
                                '27'=>'Delivered');
    }

    public function syncOrders($kr_reference_id=''){
        $key = $this->config->get('config_kr_key');
        $store_url = $this->config->get('config_kr_storeurl');
        $store_url = str_replace('http://','',$store_url);
        $url = "http://".$store_url.'/index.php?route=feed/web_api/orders&key='.$key;
        if($kr_reference_id){
            $url .= '&order_id='.$kr_reference_id; 
        }
        require_once(DIR_SYSTEM . 'vendor/krconnect/krconnectapi.php');
        $krconnect = new KartrocketAPI();
        $orders = $krconnect->makeRequest($url, array()); 
        //print_r($orders);exit;
        return $orders;
    }    

}

?>
