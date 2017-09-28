<?php   
class ControllerCommonpincode extends Controller {   
	public function index() {
    	$this->language->load('common/pincode');
	 
		$this->document->setTitle($this->language->get('heading_title'));
		
    	$this->data['heading_title'] = $this->language->get('heading_title');
		
		$this->template = 'common/pincode.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
		
		$this->language->load('common/pincode');
		$this->load->model('catalog/pincode');
		
		
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
			} else {
			$page = 1;
		}
		$data = array(
			'start' => ($page - 1) * $this->config->get('config_admin_limit'),
			'limit' => $this->config->get('config_admin_limit')
		);
		
		$url = '';
		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}
		
		$select = "";
		if(isset($_GET['myselect'])){
			$select = "WHERE service_available =".$_GET['myselect'];
			$downloadcsv = $this->url->link('common/pincode/download', 'token=' . $this->session->data['token']."&myselect=".$_GET['myselect']. $url, 'SSL');
		}
		else{
			$downloadcsv = $this->url->link('common/pincode/download', 'token=' . $this->session->data['token']. $url, 'SSL');
		}
		$this->data['downloadcsv']= $downloadcsv;
		$picodes = $this->model_catalog_pincode->getmypin($data,$select);
		$count = $this->model_catalog_pincode->pincount($select);
		
		
		$no_rows[] = $count;
		$pin_code[] = $picodes;
		$this->data['pincode'] = $pin_code;
		$this->data['count'] = $no_rows;
		$pins = array();
		
		foreach ($picodes as $result) {
			$this->data['pincodes'][] = array(
				'pin' => $result['pincode'],
				'service' => $result['service_available'],
				'id'  => $result['id'],
			);
		}
		
		if(isset($_GET['editpin'])){
			$pinid = $_GET['editpin'];
			$pin_cod = $this->model_catalog_pincode->editmypin($pinid);
			$pins[] = $pin_cod;
			$this->data['pin_code'] = $pins;
		}
		
		$pagination = new Pagination();
		$pagination->total = $no_rows[0]['count(*)'];
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_admin_limit');
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('common/pincode', 'token=' . $this->session->data['token'] . '&allpin=1&page={page}', 'SSL');
                 if(isset($_GET['myselect'])){
                      $pagination->url = $this->url->link('common/pincode', 'token=' . $this->session->data['token'] . '&allpin=1&myselect='.$_GET['myselect'].'&page={page}', 'SSL');
                 }
                 else{
                         $pagination->url = $this->url->link('common/pincode', 'token=' . $this->session->data['token'] . '&allpin=1&page={page}', 'SSL');
                 }
		$this->data['pagination'] = $pagination->render();
		
		$this->template = 'common/pincode.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
		if(isset($_POST['pincode_checkout_status'])){
			$this->load->model('setting/setting');
			$this->model_setting_setting->editSetting('pcheckout', $this->request->post);
			$this->redirect($this->url->link('common/pincode', 'token=' . $this->session->data['token']."&setting=1". $url, 'SSL')); 
		
		}
		$this->response->setOutput($this->render());
  	}
	public function insert(){
		$this->language->load('common/pincode');
		$this->load->model('catalog/pincode');
		if($this->request->post){
			foreach($this->request->post['data'] as $data){
				$count = $this->model_catalog_pincode->checkmypin($data['pin']);
				if($count['count(*)'] == 0){
					$this->model_catalog_pincode->putmypin($data['pin'],$data['service']);
				}
			}
			$this->redirect($this->url->link('common/pincode', 'token=' . $this->session->data['token']."&allpin=1", 'SSL')); 
		}
	}
	public function delete(){ 
		$this->language->load('common/pincode');
		$this->load->model('catalog/pincode');
		if (isset($this->request->post['selected'])){
			foreach ($this->request->post['selected'] as $id){
				$this->model_catalog_pincode->deletemypin($id);
			}
			$this->redirect($this->url->link('common/pincode', 'token=' . $this->session->data['token']."&allpin=1", 'SSL')); 
		}
	}
	public function update() {
		$this->load->model('catalog/pincode');
		if($this->request->post){
			$id = $_POST['id'];
			$epincode = $_POST['e_pin'];
			$eservice = $_POST['e_service'];
			$this->model_catalog_pincode->updatemypin($epincode,$eservice,$id);
		}
		$this->redirect($this->url->link('common/pincode', 'token=' . $this->session->data['token']."&allpin=1", 'SSL')); 
		}
	 public function upload(){
		$this->language->load('common/pincode');
		$this->load->model('catalog/pincode');
		
		if(isset($this->request->post)){
			if ($_FILES["file_up"]["error"] > 0){
			  $this->data['warning2'] = $this->language->get('error_warning2');
			} 
			$type = $_FILES["file_up"]["type"];
			$upload_service = $_POST['upload_service'];
			//if($type == 'application/vnd.ms-excel'){
				$csv_file = $_FILES["file_up"]["tmp_name"];
				if (($getfile = fopen($csv_file, "r")) !== FALSE) {
					$data = fgetcsv($getfile, 1000, ",");
					while (($data = fgetcsv($getfile, 1000, ",")) !== FALSE) {
						for ($c=0; $c < 1; $c++) {
							$result = $data;
							$str = implode(",", $result);
							$slice = explode(",", $str);
						
							$col1 = $slice[0];
							$count = $this->model_catalog_pincode->checkmypin($col1);
							if($count['count(*)'] == 0){
								$this->model_catalog_pincode->uploadfile($col1,$upload_service);
								$this->data['success1'] = $this->language->get('text_success1');
							}
							else{
								$this->model_catalog_pincode->updateuploadpin($col1,$upload_service);
								$this->data['success1'] = $this->language->get('text_success1');
								
							}
						}
					}
				}
			//}
		}
		$this->redirect($this->url->link('common/pincode', 'token=' . $this->session->data['token']."&allpin=1", 'SSL')); 
	}
	
	public function install() {
		$this->load->model('module/pincode');
		$this->model_feed_pincode->createTable(); 
		$this->load->model('setting/setting');
		$this->model_setting_setting->editSetting('pincode', array('pincode_status'=>1));
	}
	
	public function download() {
		$select = "";
		if(isset($_GET['myselect'])){
			$select = "WHERE service_available =".$_GET['myselect'];
		}
		$this->load->model('catalog/pincode');
		$item=$this->model_catalog_pincode->download_csv($select); 
		header('Content-Type: text/csv; charset=utf-8');
		header("Content-Transfer-Encoding: UTF-8");
		header('Content-Disposition: attachment; filename=Pincode.csv');
		header("Pragma: no-cache");
		header("Expires: 0");
		$output = fopen("php://output", "w");
		fputcsv($output,array('Pincode'));
		foreach ($item as $row) {
			fputcsv($output, $row);
		}
		fclose($output);
		exit();
	}

}
?>