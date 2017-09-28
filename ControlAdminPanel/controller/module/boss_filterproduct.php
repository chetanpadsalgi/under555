<?php
class ControllerModuleBossFilterProduct extends Controller {
	private $error = array(); 
	
	public function index() {   
		$this->language->load('module/boss_filterproduct');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('boss_filterproduct', $this->request->post);		
			$this->cache->delete('boss_filterproduct');		
			$this->session->data['success'] = $this->language->get('text_success');
						
			$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}
		//load data
		
		
 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
		if (isset($this->error['category'])) {
			$this->data['error_category'] = $this->error['category'];
		} else {
			$this->data['error_category'] = array();
		}
		if (isset($this->error['numproduct'])) {
			$this->data['error_numproduct'] = $this->error['numproduct'];
		} else {
			$this->data['error_numproduct'] = array();
		}
		if (isset($this->error['image'])) {
			$this->data['error_image'] = $this->error['image'];
		} else {
			$this->data['error_image'] = array();
		}
		if (isset($this->error['scroll'])) {
			$this->data['error_scroll'] = $this->error['scroll'];
		} else {
			$this->data['error_scroll'] = array();
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
			'href'      => $this->url->link('module/boss_filterproduct', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = $this->url->link('module/boss_filterproduct', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['token'] = $this->session->data['token'];
		
		
		//button
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_remove'] = $this->language->get('button_remove');
		$this->data['button_add_module'] = $this->language->get('button_add_module');
		$this->data['button_add_tab'] = $this->language->get('button_add_tab');
		
		//module
		$this->data['module_stt'] = $this->language->get('module_stt');
		$this->data['module_setting'] = $this->language->get('module_setting');
		$this->data['module_tab'] = $this->language->get('module_tab');
		$this->data['text_module'] = $this->language->get('text_module');
		
		//entry 
		$this->data['entry_image'] = $this->language->get('entry_image');
		$this->data['entry_layout'] = $this->language->get('entry_layout');
		$this->data['entry_position'] = $this->language->get('entry_position');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$this->data['entry_width_column'] = $this->language->get('entry_width_column');
		$this->data['entry_limit'] = $this->language->get('entry_limit');
		$this->data['entry_scroll'] = $this->language->get('entry_scroll');
		$this->data['entry_use_scrolling_panel'] = $this->language->get('entry_use_scrolling_panel');
		$this->data['entry_tab'] = $this->language->get('entry_tab');
		$this->data['entry_store'] = $this->language->get('entry_store');
		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_default'] = $this->language->get('text_default');
		$this->data['entry_description'] = $this->language->get('entry_description');
		
		//tab  
		$this->data['tab_stt'] = $this->language->get('tab_stt');
		$this->data['tab_title'] = $this->language->get('tab_title');
		$this->data['tab_get_product'] = $this->language->get('tab_get_product');
		
		
		//load text type filter
		$this->data['filter_types'] = array(
					"popular" =>$this->language->get('tab_popular_products'),
					"special" =>$this->language->get('tab_special_products'),
					"best_seller" =>$this->language->get('tab_best_seller_products'),
					"latest" =>$this->language->get('tab_latest_products'),
					"category" =>$this->language->get('tab_choose_a_category')
					);
		//load text position
		$this->data['text_content_top'] = $this->language->get('text_content_top');
		$this->data['text_content_bottom'] = $this->language->get('text_content_bottom');
		$this->data['text_column_left'] = $this->language->get('text_column_left');
		$this->data['text_column_right'] = $this->language->get('text_column_right');
		
		//load modules
		$this->data['modules'] = array();
		if (isset($this->request->post['boss_filterproduct_module'])) {
			$this->data['modules'] = $this->request->post['boss_filterproduct_module'];
		} elseif ($this->config->get('boss_filterproduct_module')) { 
			$this->data['modules'] = $this->config->get('boss_filterproduct_module');
		}
		
		$this->data['heading_title'] = $this->language->get('heading_title');
		
		//load languages
		$this->load->model('localisation/language');
		$this->data['languages'] = $this->model_localisation_language->getLanguages();
		
		//load layout
		$this->load->model('design/layout');
		
		$this->data['layouts'] = $this->model_design_layout->getLayouts();

		//load store
		$this->load->model('setting/store');
		
		$this->data['stores'] = $this->model_setting_store->getStores();
		
		//load categories
		$this->load->model('catalog/category');
		$this->data['categories'] = $this->model_catalog_category->getCategories(0);
		
		$this->template = 'module/boss_filterproduct.tpl';
		$this->children = array(
            'common/header',
			'common/footer'
		);
		$this->response->setOutput($this->render());
	}

	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/boss_filterproduct')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (isset($this->request->post['boss_filterproduct_module'])) {
			foreach($this->request->post['boss_filterproduct_module'] as $moduleItem => $value)
			{
				if(isset($value['tabs']))
				{
					foreach ($value['tabs'] as $key => $valuetab) {
						if ($valuetab['type_product'] == 'category' && !isset($valuetab['filter_type_category'])) {
							$this->error['category'][$key] = $this->language->get('error_category');
							$this->error['warning'] = $this->language->get('error_category');
						}
					}
				}
				
				if (!$value['limit']) {
					$this->error['numproduct'][$moduleItem] = $this->language->get('error_numproduct');
				}
				if (!$value['image_width'] || !$value['image_height']) {
					$this->error['image'][$moduleItem] = $this->language->get('error_image');
					$this->error['warning'] = $this->language->get('error_image');
				}
				
			}
		}
				
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}

	private function getIdLayout($layout_name) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "layout WHERE LOWER(name) = LOWER('".$layout_name."')");
		return (int)$query->row['layout_id'];
	}

	public function install() {
		$this->load->model('setting/setting');
		
		$this->load->model('localisation/language');
			
		$languages = $this->model_localisation_language->getLanguages();
		
		$title1 = array();
		$title2 = array();
		$title3 = array();
		$title4 = array();
		$title5 = array();
		$title6 = array();
		$title7 = array();
		
		foreach($languages as $language){
			$title1{$language['language_id']} = 'New Arrival';
			$title2{$language['language_id']} = 'Best Sellers';
			$title3{$language['language_id']} = 'Popular';
			$title4{$language['language_id']} = 'Special';
			$title5{$language['language_id']} = 'This months favourites';
			$title6{$language['language_id']} = 'On sale products';
			$title7{$language['language_id']} = 'Best seller';
		}
		
		$data = array(
			'boss_filterproduct_module' 	=> array(
				1 => array(
					'image_width'	=>	210,
					'image_height'	=>	210,
					'limit'	=>	6,
					'use_tab'	=>	1,
					'layout_id'	=>	$this->getIdLayout("home"),
					'position'	=>	'content_top',
					'status'	=>	1,
					'sort_order'	=>	4,
					'width_column'  => 24,
					'store_id'	=>	array(0=>0),
					'tabs'	=>	array(
						0 => array('title' => $title1,'type_product' => 'latest'),
						1 => array('title' => $title2,'type_product' => 'best_seller'),
						2 => array('title' => $title3,'type_product' => 'popular'),
						3 => array('title' => $title4,'type_product' => 'special')
					)
				),
				2 => array(
					'image_width'	=>	70,
					'image_height'	=>	70,
					'limit'	=>	4,
					'use_tab'	=>	0,
					'layout_id'	=>	$this->getIdLayout("home"),
					'position'	=>	'content_top',
					'status'	=>	1,
					'sort_order'	=>	6,
					'width_column'  => 24,
					'store_id'	=>	array(0=>0),
					'tabs'	=>	array(
						0 => array('title' => $title5,'type_product' => 'latest'),
						1 => array('title' => $title6,'type_product' => 'special'),
						2 => array('title' => $title7,'type_product' => 'popular')
					)
				)
			)
		);

		$this->model_setting_setting->editSetting('boss_filterproduct', $data);		
	}
}
?>