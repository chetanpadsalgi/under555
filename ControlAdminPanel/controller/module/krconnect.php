<?php
//require_once(DIR_SYSTEM . 'vendor/krconnect/krconnect.php');

class ControllerModuleKrconnect extends Controller {
	private $error = array(); 
	
	public function index() {   
		$this->language->load('module/krconnect');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			//echo "<pre>";print_r($_POST);exit;
                        $this->model_setting_setting->editSetting('krconnect', $this->request->post);		
                	//$this->session->data['success'] = $this->language->get('text_success');
						
			//$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
                        $this->data['success'] = $this->language->get('text_success');
                }
		if (isset($this->session->data['sync_updated_count'])) {
			$this->data['sync_updated_count'] = $this->session->data['sync_updated_count'];
			unset($this->session->data['sync_updated_count']);
		}
                
		if (isset($this->session->data['error_kr_message'])) {
			$this->data['error'] = $this->session->data['error_kr_message'];
			unset($this->session->data['error_kr_message']);
		}
                    
		$this->data['heading_title'] = $this->language->get('heading_title');
		$this->data['text_kartrocket_key'] = $this->language->get('text_kartrocket_key');
		$this->data['text_kartrocket_store_url'] = $this->language->get('text_kartrocket_store_url');
		$this->data['text_kartrocket_cat_map'] = $this->language->get('text_kartrocket_cat_map');
                $this->data['text_sync_from_date'] = $this->language->get('text_sync_from_date');
                $this->data['text_sync_to_date'] = $this->language->get('text_sync_to_date');
                
                $this->data['button_kartrocket_sync'] = $this->language->get('button_kartrocket_sync');                
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
                $this->data['url_sync'] = $this->url->link('module/krconnect/sync', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->load->model('localisation/language');
		$this->data['langs']  = $this->model_localisation_language->getLanguages();
		
 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
                
  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
       		'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_module'),
       		'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/krconnect', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = $this->url->link('module/krconnect', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		$this->data['module'] = array();
		
		if (isset($this->request->post['config_kr_key'])) {
			$this->data['config_kr_key'] = $this->request->post['config_kr_key']; 
		} else {
			$this->data['config_kr_key'] = $this->config->get('config_kr_key');
		}
                if (isset($this->request->post['config_kr_storeurl'])) {
			$this->data['config_kr_storeurl'] = $this->request->post['config_kr_storeurl']; 
		} else {
			$this->data['config_kr_storeurl'] = $this->config->get('config_kr_storeurl');
		}
                
                if (isset($this->request->post['config_kr_statusmapping'])) {
			$this->data['config_kr_statusmapping'] = $this->request->post['config_kr_statusmapping']; 
		} else {
			$this->data['config_kr_statusmapping'] = $this->config->get('config_kr_statusmapping');
		}	
		//echo "<pre>";                print_r($this->data['config_kr_statusmapping']);

                $this->load->model('catalog/krconnect');
                $this->data['kr_order_status'] =  $this->model_catalog_krconnect->getKRStatuses();

                $this->load->model('localisation/order_status');
                $this->data['oc_order_status'] =  $this->model_localisation_order_status->getOrderStatuses('');
                
                //echo "<pre>";                print_r($this->data['oc_order_status']);
                
		$this->load->model('design/layout');
		
		$this->data['layouts'] = $this->model_design_layout->getLayouts();
						
		$this->template = 'module/krconnect.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}
	
	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/krconnect')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}

        public function install() {
            ## Insert kr_order_id into order table.
            $this->db->query("
                 ALTER TABLE `" . DB_PREFIX . "order` ADD `kr_reference_id` varchar(20) NULL;
             ");
            ## for first time, map OC category to KR categories and set it in config variable.
            $this->load->model('catalog/krconnect');
            $catMap =  $this->model_catalog_krconnect->getDefaultMapping();
            
            $this->load->model('setting/setting');
            $this->model_setting_setting->editSetting('krconnect', array('config_kr_statusmapping'=>$catMap));
       }        
        public function uninstall() {
            ## remove kr reference from table.
            $this->db->query("
                 ALTER TABLE `" . DB_PREFIX . "order` DROP `kr_reference_id` ;
             ");        

            $this->load->model('setting/setting');
            $this->model_setting_setting->editSetting('krconnect', array('config_krconnect_status'=>0));
        }        
        
        public function sync(){
            $this->load->model('catalog/krconnect');
            
            if (isset($this->request->post['sync_from_date'])) {
                    $filter_date_from = $this->request->post['sync_from_date'];
            } else {
                    $filter_date_from = null;
            }

            if (isset($this->request->post['sync_to_date'])) {
                    $filter_date_to = $this->request->post['sync_to_date'];
            } else {
                    $filter_date_to = null;
            }

            $data = array(
			'filter_date_from'      => $filter_date_from,
			'filter_date_to'   => $filter_date_to,
		);
            
            $kr_orders = $this->getAllKrOrder($data);
            $updated_count = 0;
            $str = '';
			$log  = new LOG('kartrocketsync.'.date('ymd').'.log');
			$log->write("===================================");

            //echo "<pre>";print_r($kr_orders);//exit;
            if($kr_orders->num_rows){
				$log->write("No. of Orders: ".$kr_orders->num_rows);
				foreach($kr_orders->rows as $key => $oc_order){
                    $log->write("******************************************************************");
                    $order_id = $oc_order['order_id'];
					$log->write("Order id: ".$order_id);
                    //echo "<br>";
                    $kr_reference_id = $oc_order['kr_reference_id'];
                    $jsonSyncData = $this->model_catalog_krconnect->syncOrders($kr_reference_id);
                    $log->write("Response: ".$jsonSyncData);
					$syncDataArray = json_decode($jsonSyncData);
                    //echo "<pre>";
                    //print_r($syncDataArray);//exit;
                    if(isset($syncDataArray->success) && $syncDataArray->success){
                        ##process orders
                        if($syncDataArray->orders && count($syncDataArray->orders)){
                            ## kr mapping array is oc_cat_id askey => kr_categoryid as value
                            $kr_statusmapping = $this->config->get('config_kr_statusmapping');
                            ## reverse the mapping since we will get order status id from kr here and needs to map it to oc category
                            $oc_statusmapping = array_flip($kr_statusmapping);
                            $updatedOrdersStatus = array();

                            foreach($syncDataArray->orders as $key => $objOrder){
                                if($key > 0 ) break; ## This is in case multiple rows of order in response as per number of products.
								##first check whether kr_order_id exist. if not ignore so that we dont not mesh with current carts orders.
                                $kr_order_status_id = $objOrder->order_status_id;
                                $kr_order_status = $objOrder->order_status;
                                $str .= "<br>".$kr_order_status_id." ".$kr_order_status .": ".$oc_order['order_status_id']; 
                                if(isset($oc_statusmapping[$kr_order_status_id]) && $oc_statusmapping[$kr_order_status_id]!= $oc_order['order_status_id']){
                                    ## status are maps. 
                                    ## update order status and also add comment to order with courier and awb_number.
                                    //$order_id = $kr_order->row['order_id'];
                                    $order_status_id = $oc_statusmapping[$kr_order_status_id];
                                    $oc_comment = $oc_order['comment'];
                                    $str .=  " -- here";
                                    if($objOrder->courier != '' && $objOrder->awb_number != '' ){
                                        $order_comment = "Kartrocket Update: Courier: ".$objOrder->courier." , AWB Number: ".$objOrder->awb_number;
                                        ## add comment and status in order histroy.
                                        $this->db->query('INSERT INTO '.DB_PREFIX.'order_history (order_id,order_status_id,notify,comment,date_added) VALUES ('.(int)$order_id.', '.(int)$order_status_id.',0,"'.$this->db->escape($order_comment).'",now())');
                                        ##as well as update order status in order table.
                                        //$oc_comment .= " Courier: ".$objOrder->courier." , AWB Number: ".$objOrder->awb_number;
                                    }
                                    $this->db->query('UPDATE '.DB_PREFIX.'order set order_status_id= '.(int)$order_status_id.' , comment = "'.$this->db->escape($oc_comment).'" , date_modified = now() WHERE order_id = '.(int)$order_id.' LIMIT 1');
                                    $updated_count++;
                                  }
                                    //$updatedOrdersStatus['success'][$kr_reference_id]['message'] = 'Order updated successfully.';
                                //}else{
                                //    $updatedOrdersStatus['error'][$kr_reference_id]['message'] = 'Unable to map order status';
                                //    $updatedOrdersStatus['error'][$kr_reference_id]['kr_order_status_id'] = $kr_order_status_id;
                                //    $updatedOrdersStatus['error'][$kr_reference_id]['kr_order_status'] = $kr_order_status;  
                                //}
                            }
                        }
                        //$this->session->data['sync_success'] = $this->language->get('text_sync_success');
                    }else{
						//echo "<pre>";print_r($syncDataArray);exit;
						if(isset($syncDataArray->message)){
	                        $this->session->data['error_kr_message'] = $syncDataArray->message;
       						 $this->session->data['error_kr_code'] = $syncDataArray->code;
						}
						$this->session->data['error_sync'] = $this->language->get('text_sync_error');     
                    }
                }   
            }
            $this->session->data['sync_updated_count'] = $updated_count;
			$log->write("=====================================================");
            /*echo "<br> Debug Sync<br><pre>";
            if(isset($updatedOrdersStatus['success'])){
                foreach($updatedOrdersStatus['success'] as $key => $value){
                        echo "<br>". $key.":".$value['message']."<br>";
                        if(isset($value['kr_order_status'])){
                            echo "   >>>>> ".$value['kr_order_status']." = ".$value['kr_order_status_id']."<br>";
                        }
                }
            }
            if(isset($updatedOrdersStatus['error'])){
                foreach($updatedOrdersStatus['error'] as $key => $value){
                        echo "<br>". $key.":".$value['message']."<br>";
                        if(isset($value['kr_order_status'])){
                            echo "   >>>>> ".$value['kr_order_status']." = ".$value['kr_order_status_id']."<br>";
                        }
                }
            }*/
            //echo "<pre>";
           //print_r($updatedOrdersStatus);
            //exit;
            
            $this->redirect($this->url->link('module/krconnect', 'token=' . $this->session->data['token'], 'SSL'));
        }
        public function getKrOrder($kr_reference_id){
            $res = $this->db->query("SELECT * FROM `" . DB_PREFIX . "order` WHERE `kr_reference_id`= '".$kr_reference_id."' LIMIT 1");
            return $res;
        }
        public function getAllKrOrder($data = array()){
            $sql = '';
            //print_r($data);
            if (!empty($data['filter_date_from'])) {
                    $sql .= " AND DATE(o.date_added) >= DATE('" . $this->db->escape($data['filter_date_from']) . "')";
            }

            if (!empty($data['filter_date_to'])) {
                    $sql .= " AND DATE(o.date_added) <= DATE('" . $this->db->escape($data['filter_date_to']) . "')";
            }
            //echo $sql."<br>";
            $res = $this->db->query("SELECT * FROM `" . DB_PREFIX . "order` o WHERE o.kr_reference_id is NOT NULL $sql ");
            return $res;
        }        
}
?>