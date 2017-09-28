<?php
class ControllerModuleBossEditorthemes extends Controller {
	private $error = array(); 
	private $moduleName = 'boss_editorthemes';
	public function tabModules() {
		$this->data['elayout_default'] = 1;
		if( isset($this->request->get['elayout_id']) ){
			$this->data['elayout_default'] = $this->request->get['elayout_id'];	
		}
		$this->data['layout_modules'] = $this->getModules( $this->data['elayout_default'] );
	}
	
	public function getModules( $layout_id ){
		
		$this->load->model('bossthemes/boss_editorthemes');
		$extensions = $this->model_bossthemes_boss_editorthemes->getExtensions('module');		
		$module_data = array();
		foreach ($extensions as $extension) {
			$modules = $this->config->get($extension['code'] . '_module');
			$this->language->load('module/'.$extension['code']);	
			if ($modules) {
				foreach ($modules as $index => $module) {  
					if( $module['layout_id'] == $layout_id || $module['layout_id'] == 9999){
						$module_data[$module['position']][] = array(
							'title'      => ($this->language->get('heading_title')),
							'code'       => $extension['code'],
							'setting'    => $module,
							'sort_order' => $module['sort_order'],
							'status'     => $module['status'],
							'index'      => $index
						);				
					}
				}
			}
		}
		foreach( $module_data as $position => $modules ){
			$sort_order = array(); 
			foreach ($modules as $key => $value) {
			
				$sort_order[$key] = $value['sort_order'];
			}
			array_multisort($sort_order, SORT_ASC, $module_data[$position]);
		}
		return $module_data;
		
		//
	}
	
	public function getLang( $key ){
		return $this->language->get( $key ); 
	}
	
	public function ajaxsave(){
		$this->load->model('setting/setting');
		if( isset($this->request->post['modules']) ){
			$modules = $this->request->post['modules'];
			
			foreach( $modules  as $position => $mods ){	
				echo $position."<br>";
				foreach( $mods as $index => $module ){
					$tmp = explode("-",$module);
					if( count($tmp)== 2 ){
						$code = $tmp[0];
						$modindex = $tmp[1];
						$data = array();
						$dbmods = $this->config->get( $code  . '_module');
						if( is_array($dbmods ) ) {
						
							foreach( $dbmods as $dbidx => $dbmod ){
								
								if( $dbidx == $modindex ){
									$dbmod['position'] = $position;
									$dbmod['sort_order'] = $index+1;
									$dbmods[$dbidx] = $dbmod ;
									break;
								}
							}
							$data = $this->model_setting_setting->getSetting( $code );
							if(  is_array($data) ){
								$data[$code."_module"] = $dbmods;
								$this->model_setting_setting->editSetting( $code, $data );	 
							}
						}
					}
				}
			}
		}
	}
	
	public function index() {   
		$this->language->load('module/boss_editorthemes');
		
		$this->document->setTitle($this->language->get('title'));
		
		$this->load->model('setting/setting');
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('boss_editorthemes', $this->request->post);	

			$this->cache->delete('boss_editorthemes');
			
			$this->session->data['success'] = $this->language->get('text_success');
						
			$this->redirect($this->url->link('module/boss_editorthemes', 'token=' . $this->session->data['token'], 'SSL'));
		}
				
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_browse'] = $this->language->get('text_browse');
        $this->data['text_clear'] = $this->language->get('text_clear');
        $this->data['text_image_manager'] = $this->language->get('text_image_manager');
		
		$this->data['text_list'] = $this->language->get('text_list');
        $this->data['text_grid'] = $this->language->get('text_grid');
		$this->data['text_menu_default'] = $this->language->get('text_menu_default');
        $this->data['text_menu_mega'] = $this->language->get('text_menu_mega');
		$this->data['text_extra'] = $this->language->get('text_extra');
        $this->data['text_large'] = $this->language->get('text_large');
		$this->data['text_medium1'] = $this->language->get('text_medium1');
        $this->data['text_medium2'] = $this->language->get('text_medium2');
		$this->data['text_small'] = $this->language->get('text_small');
		$this->data['text_custom'] = $this->language->get('text_custom');
		$this->data['text_upload_image'] = $this->language->get('text_upload_image');
		$this->data['text_repeat'] = $this->language->get('text_repeat');
		$this->data['text_no_repeat'] = $this->language->get('text_no_repeat');
		$this->data['text_repeat_x'] = $this->language->get('text_repeat_x');
		$this->data['text_repeat_y'] = $this->language->get('text_repeat_y');
		$this->data['text_left_top'] = $this->language->get('text_left_top');
		$this->data['text_right_top'] = $this->language->get('text_right_top');
		$this->data['text_center_top'] = $this->language->get('text_center_top');
		$this->data['text_center_center'] = $this->language->get('text_center_center');
		$this->data['text_color'] = $this->language->get('text_color');
		$this->data['text_link_color'] = $this->language->get('text_link_color');
		$this->data['text_normal'] = $this->language->get('text_normal');
		$this->data['text_hover'] = $this->language->get('text_hover');
		$this->data['text_border_color'] = $this->language->get('text_border_color');
		$this->data['text_color_g_1'] = $this->language->get('text_color_g_1');
		$this->data['text_color_g_2'] = $this->language->get('text_color_g_2');
		$this->data['text_color_g_3'] = $this->language->get('text_color_g_3');
		$this->data['text_color_h_1'] = $this->language->get('text_color_h_1');
		$this->data['text_color_h_2'] = $this->language->get('text_color_h_2');
		$this->data['text_color_h_3'] = $this->language->get('text_color_h_3');
		$this->data['text_color_f_1'] = $this->language->get('text_color_f_1');
		$this->data['text_color_f_2'] = $this->language->get('text_color_f_2');
		$this->data['text_color_f_3'] = $this->language->get('text_color_f_3');
		$this->data['text_color_m_1'] = $this->language->get('text_color_m_1');
		$this->data['text_color_m_2'] = $this->language->get('text_color_m_2');
		$this->data['text_button_color'] = $this->language->get('text_button_color');
		$this->data['text_color_s_1'] = $this->language->get('text_color_s_1');
		$this->data['text_color_s_2'] = $this->language->get('text_color_s_2');
		$this->data['text_color_s_3'] = $this->language->get('text_color_s_3');
		$this->data['text_reset'] = $this->language->get('text_reset');
		$this->data['text_default'] = $this->language->get('text_default');
		$this->data['text_font_style'] = $this->language->get('text_font_style');
		$this->data['text_font_size'] = $this->language->get('text_font_size');
		$this->data['text_font_weight'] = $this->language->get('text_font_weight');
		$this->data['text_transform'] = $this->language->get('text_transform');
		$this->data['text_test'] = $this->language->get('text_test');
		
		//entry
		$this->data['entry_show'] = $this->language->get('entry_show');
		$this->data['entry_modecss'] = $this->language->get('entry_modecss');
		$this->data['entry_modecss_set'] = $this->language->get('entry_modecss_set');
        $this->data['entry_box'] = $this->language->get('entry_box');
        $this->data['entry_wide'] = $this->language->get('entry_wide');
		$this->data['entry_respon_set'] = $this->language->get('entry_respon_set');
        $this->data['entry_respon_allow'] = $this->language->get('entry_respon_allow');
		$this->data['entry_product_set'] = $this->language->get('entry_product_set');
        $this->data['entry_product_allow'] = $this->language->get('entry_product_allow');
		$this->data['entry_menu_set'] = $this->language->get('entry_menu_set');
        $this->data['entry_menu_allow'] = $this->language->get('entry_menu_allow');
		$this->data['entry_layout_set'] = $this->language->get('entry_layout_set');
        $this->data['entry_product_view'] = $this->language->get('entry_product_view');
		$this->data['entry_template_set'] = $this->language->get('entry_template_set');
        $this->data['entry_template'] = $this->language->get('entry_template');
		$this->data['entry_g_color'] = $this->language->get('entry_g_color');
		$this->data['entry_back_color'] = $this->language->get('entry_back_color');
        $this->data['entry_back_image'] = $this->language->get('entry_back_image');
		$this->data['entry_repeat'] = $this->language->get('entry_repeat');
		$this->data['entry_position_image'] = $this->language->get('entry_position_image');
		$this->data['entry_h_color'] = $this->language->get('entry_h_color');
		$this->data['entry_f_color'] = $this->language->get('entry_f_color');
		$this->data['entry_m_color'] = $this->language->get('entry_m_color');
		$this->data['entry_back_color_drop'] = $this->language->get('entry_back_color_drop');
		$this->data['entry_back_image_drop'] = $this->language->get('entry_back_image_drop');
		$this->data['entry_s_color'] = $this->language->get('entry_s_color');
		$this->data['entry_p_color'] = $this->language->get('entry_p_color');
		$this->data['entry_p_name_color'] = $this->language->get('entry_p_name_color');
		$this->data['entry_p_des_color'] = $this->language->get('entry_p_des_color');
		$this->data['entry_p_price_color'] = $this->language->get('entry_p_price_color');
		$this->data['entry_p_text_price_color'] = $this->language->get('entry_p_text_price_color');
		$this->data['entry_p_spec_price_color'] = $this->language->get('entry_p_spec_price_color');
		$this->data['entry_p_text_spec_price_color'] = $this->language->get('entry_p_text_spec_price_color');
		$this->data['entry_p_button_color'] = $this->language->get('entry_p_button_color');
		$this->data['entry_p_text_button_color'] = $this->language->get('entry_p_text_button_color');
		$this->data['entry_t_color'] = $this->language->get('entry_t_color');
		$this->data['entry_t_page_color'] = $this->language->get('entry_t_page_color');
		$this->data['entry_t_block_color'] = $this->language->get('entry_t_block_color');
		$this->data['entry_t_bread_color'] = $this->language->get('entry_t_bread_color');
		$this->data['entry_t_bread_1_color'] = $this->language->get('entry_t_bread_1_color');
		$this->data['entry_t_bread_2_color'] = $this->language->get('entry_t_bread_2_color');
		$this->data['entry_g_font'] = $this->language->get('entry_g_font');
		$this->data['entry_h_font'] = $this->language->get('entry_h_font');
		$this->data['entry_h_font_1'] = $this->language->get('entry_h_font_1');
		$this->data['entry_h_font_2'] = $this->language->get('entry_h_font_2');
		$this->data['entry_f_font'] = $this->language->get('entry_f_font');
		$this->data['entry_f_font_1'] = $this->language->get('entry_f_font_1');
		$this->data['entry_f_font_2'] = $this->language->get('entry_f_font_2');
		$this->data['entry_m_font'] = $this->language->get('entry_m_font');
		$this->data['entry_m_font_1'] = $this->language->get('entry_m_font_1');
		$this->data['entry_m_font_2'] = $this->language->get('entry_m_font_2');
		$this->data['entry_s_font'] = $this->language->get('entry_s_font');
		$this->data['entry_s_font_1'] = $this->language->get('entry_s_font_1');
		$this->data['entry_s_font_2'] = $this->language->get('entry_s_font_2');
		$this->data['entry_p_font'] = $this->language->get('entry_p_font');
		$this->data['entry_p_font_name'] = $this->language->get('entry_p_font_name');
		$this->data['entry_p_font_des'] = $this->language->get('entry_p_font_des');
		$this->data['entry_p_font_price'] = $this->language->get('entry_p_font_price');
		$this->data['entry_p_font_cart'] = $this->language->get('entry_p_font_cart');
		$this->data['entry_t_font'] = $this->language->get('entry_t_font');
		$this->data['entry_t_font_page'] = $this->language->get('entry_t_font_page');
		$this->data['entry_t_font_block'] = $this->language->get('entry_t_font_block');
		$this->data['entry_t_font_bread'] = $this->language->get('entry_t_font_bread');
		$this->data['entry_custom_css'] = $this->language->get('entry_custom_css');
		$this->data['entry_custom_java'] = $this->language->get('entry_custom_java');
		$this->data['entry_show_animate'] = $this->language->get('entry_show_animate');
		
		//tab
		$this->data['tab_setting'] = $this->language->get('tab_setting');
		$this->data['tab_font'] = $this->language->get('tab_font');
		$this->data['tab_css'] = $this->language->get('tab_css');
		$this->data['tab_custom_css'] = $this->language->get('tab_custom_css');
		$this->data['tab_custom_java'] = $this->language->get('tab_custom_java');
		$this->data['tab_color'] = $this->language->get('tab_color');
		$this->data['tab_g_setting'] = $this->language->get('tab_g_setting');
		$this->data['tab_g_layout'] = $this->language->get('tab_g_layout');
		$this->data['tab_general_color'] = $this->language->get('tab_general_color');
		$this->data['tab_header_color'] = $this->language->get('tab_header_color');
		$this->data['tab_footer_color'] = $this->language->get('tab_footer_color');
		$this->data['tab_menu_color'] = $this->language->get('tab_menu_color');
		$this->data['tab_slide_color'] = $this->language->get('tab_slide_color');
		$this->data['tab_product_color'] = $this->language->get('tab_product_color');
		$this->data['tab_title_color'] = $this->language->get('tab_title_color');
		$this->data['tab_general_font'] = $this->language->get('tab_general_font');
		$this->data['tab_header_font'] = $this->language->get('tab_header_font');
		$this->data['tab_footer_font'] = $this->language->get('tab_footer_font');
		$this->data['tab_menu_font'] = $this->language->get('tab_menu_font');
		$this->data['tab_slide_font'] = $this->language->get('tab_slide_font');
		$this->data['tab_product_font'] = $this->language->get('tab_product_font');
		$this->data['tab_title_font'] = $this->language->get('tab_title_font');
		$this->data['tab_layout'] = $this->language->get('tab_layout');
		
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_add_module'] = $this->language->get('button_add_module');
		$this->data['button_remove'] = $this->language->get('button_remove');
		
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
			'href'      => $this->url->link('module/boss_editorthemes', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['module'] = array(
						'block_footer_top'=>'',
						'block_footer_center' => '',
						'block_footer_bottom'=>''					
		);
		
		$this->data['action'] = $this->url->link('module/boss_editorthemes', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['ajax_modules_position'] = $this->url->link('module/'.$this->moduleName."/ajaxsave", 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['token'] = $this->session->data['token'];
		
		$this->load->model('localisation/language');
		
		$this->data['languages'] = $this->model_localisation_language->getLanguages();
		
		$this->load->model('bossthemes/boss_editorthemes');
		
		$this->data['bg_images'] = $this->model_bossthemes_boss_editorthemes->getBackgrounds();
		
		$this->data['temp_setting_arr'] = $this->model_bossthemes_boss_editorthemes->getColorThemes();
        
        $this->data['temp_name_arr'] = $this->model_bossthemes_boss_editorthemes->getThemeNames();
        
        $colors_data = $this->data['temp_setting_arr'];
        
        $this->data['colors_data'] = json_encode($colors_data);
		
		$this->load->model('tool/image');
		
		$this->data['no_image'] = $this->model_tool_image->resize('no_image.jpg', 50, 50);
		
		$this->data['b_Color_Data'] = array();
		
		if (isset($this->request->post['b_Color_Data'])) {
            $b_Color_Data = $this->request->post['b_Color_Data'];
		} elseif ($this->config->get('b_Color_Data')) { 
            $b_Color_Data = $this->config->get('b_Color_Data');
		} else{
			$b_Color_Data = '';
		}
		
		$this->data['b_Color_Data'] = $b_Color_Data;
		
		$this->data['b_Font_Data'] = array();
		
		if (isset($this->request->post['b_Font_Data'])) {
            $b_Font_Data = $this->request->post['b_Font_Data'];
		} elseif ($this->config->get('b_Font_Data')) { 
            $b_Font_Data = $this->config->get('b_Font_Data');
		} else{
			$b_Font_Data = '';
		}
		
		$this->data['b_Font_Data'] = $b_Font_Data;
		
		$this->data['b_Setting'] = array();
		
		if (isset($this->request->post['b_Setting'])) {
            $b_Setting = $this->request->post['b_Setting'];
		} elseif ($this->config->get('b_Setting')) { 
            $b_Setting = $this->config->get('b_Setting');
		} else{
			$b_Setting = '';
		}
		
		$this->data['b_Setting'] = $b_Setting;
		
		$this->data['customcode'] = array();
		
		if (isset($this->request->post['customcode'])) {
            $customcode = $this->request->post['customcode'];
		} elseif ($this->config->get('customcode')) { 
            $customcode = $this->config->get('customcode');
		} else{
			$customcode = '';
		}
		
		$this->data['customcode'] = $customcode;
		
		if (isset($this->request->post['b_General_Show'])) {
			$this->data['b_General_Show'] = $this->request->post['b_General_Show'];
		} else {
			$this->data['b_General_Show'] = $this->config->get('b_General_Show');
		}
		
		if (isset($this->request->post['b_General_P_Display'])) {
			$this->data['b_General_P_Display'] = $this->request->post['b_General_P_Display'];
		} else {
			$this->data['b_General_P_Display'] = $this->config->get('b_General_P_Display');
		}
		
		if (isset($this->request->post['b_General_Menu'])) {
			$this->data['b_General_Menu'] = $this->request->post['b_General_Menu'];
		} else {
			$this->data['b_General_Menu'] = $this->config->get('b_General_Menu');
		}
		
		if (isset($this->request->post['b_show_animate'])) {
			$this->data['b_show_animate'] = $this->request->post['b_show_animate'];
		} else {
			$this->data['b_show_animate'] = $this->config->get('b_show_animate');
		}
		
		if (isset($this->request->post['b_Layout_Setting'])) {
			$this->data['b_Layout_Setting'] = $this->request->post['b_Layout_Setting'];
		} else {
			$this->data['b_Layout_Setting'] = $this->config->get('b_Layout_Setting');
		}
		
		if (isset($this->request->post['b_Layout_Setting'])) {
			$b_Layout_Settings = explode(',', $this->request->post['b_Layout_Setting']);
		} else {		
			$b_Layout_Settings = explode(',', $this->config->get('b_Layout_Setting'));
		}
		
		$this->data['footer_about'] = array();
		
		if (isset($this->request->post['footer_about'])) {
            $this->data['footer_about'] = $this->request->post['footer_about'];
		} elseif($this->config->get('footer_about')) { 
            $this->data['footer_about'] = $this->config->get('footer_about');
		}
		
		if (isset($this->request->post['footer_setting_status'])) {
            $this->data['footer_setting_status'] = $this->request->post['footer_setting_status'];
		} elseif($this->config->get('footer_setting_status')) { 
            $this->data['footer_setting_status'] = $this->config->get('footer_setting_status');
		}
		
		$footer_about = $this->data['footer_about'];
		
		if (isset($footer_about['image_link']) && file_exists(DIR_IMAGE . $footer_about['image_link'])) {
			$this->data['about_image'] = $this->model_tool_image->resize($footer_about['image_link'], 100, 100);
		} else {
			$this->data['about_image'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		}
		
		$this->data['footer_link'] = array();
		
		if (isset($this->request->post['footer_link'])) {
            $this->data['footer_link'] = $this->request->post['footer_link'];
		} elseif($this->config->get('footer_link')) { 
            $this->data['footer_link'] = $this->config->get('footer_link');
		}
		
		$this->data['footer_contact'] = array();
		
		if (isset($this->request->post['footer_contact'])) {
            $this->data['footer_contact'] = $this->request->post['footer_contact'];
		} elseif($this->config->get('footer_contact')) { 
            $this->data['footer_contact'] = $this->config->get('footer_contact');
		}
		
		$this->data['footer_powered'] = array();
		
		if (isset($this->request->post['footer_powered'])) {
            $this->data['footer_powered'] = $this->request->post['footer_powered'];
		} elseif($this->config->get('footer_powered')) { 
            $this->data['footer_powered'] = $this->config->get('footer_powered');
		}
		
		$this->data['footer_payment'] = array();
		
		if (isset($this->request->post['footer_payment'])) {
            $this->data['footer_payment'] = $this->request->post['footer_payment'];
		} elseif($this->config->get('footer_payment')) { 
            $this->data['footer_payment'] = $this->config->get('footer_payment');
		}
		
		$footer_payment = $this->data['footer_payment'];
		
		if (isset($footer_payment['new_image']) && file_exists(DIR_IMAGE . $footer_payment['new_image'])) {
			$this->data['payment_image'] = $this->model_tool_image->resize($footer_payment['new_image'], 50, 50);
		} else {
			$this->data['payment_image'] = $this->model_tool_image->resize('no_image.jpg', 50, 50);
		}
		
		$this->data['footer_social'] = array();
		
		if (isset($this->request->post['footer_social'])) {
            $this->data['footer_social'] = $this->request->post['footer_social'];
		} elseif($this->config->get('footer_social')) { 
            $this->data['footer_social'] = $this->config->get('footer_social');
		}
		
		$this->data['modules'] = array();
		
		if (isset($this->request->post['boss_editorthemes_module'])) {
			$this->data['modules'] = $this->request->post['boss_editorthemes_module'];
		} elseif ($this->config->get('boss_editorthemes_module')) { 
			$this->data['modules'] = $this->config->get('boss_editorthemes_module');
		}	
		
		$this->load->model('design/layout');
		
		$this->data['layouts'] = $this->model_design_layout->getLayouts();
		$this->tabModules();
		
		$this->load->model('localisation/language');
		
		$this->data['languages'] = $this->model_localisation_language->getLanguages();
						
		$this->template = 'module/boss_editorthemes.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}
	
	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/boss_editorthemes')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
	
	public function install() {
		$this->load->model('localisation/language');
			
		$languages = $this->model_localisation_language->getLanguages();
		
		$about_title = array();
		$about_content = array();
		$contact_title = array();
		$contact_content = array();
		$social_title = array();
		$footer_powered = array();
		$footer_link = array();
		$link_title = array();
		
		foreach($languages as $language){
			$about_title{$language['language_id']} = 'About Store';
			$about_content{$language['language_id']} = '&lt;div class=&quot;about-store not-animated&quot; data-animate=&quot;fadeInUp&quot; data-delay=&quot;300&quot;&gt;
&lt;p&gt;Fusce ligula sapien, rutrum vel euismod id, viverra ut massa. Suspendisse potenti. Quisque a magna est, id interdum nunc. Suspendisse lobortis augue viverra dui posuere dictum.&lt;/p&gt;

&lt;p&gt;Suspendisse lobortis augue viverra dui posuere dictum. Cras facilisis ultries orci at pharetra In hac habitasse platea dictumst.&lt;/p&gt;
&lt;/div&gt;';
			$contact_title{$language['language_id']} = 'Customer Support';
			$contact_content{$language['language_id']} = '&lt;div class=&quot;contact-us not-animated&quot; data-animate=&quot;fadeInUp&quot; data-delay=&quot;300&quot;&gt;&lt;span&gt;1-800-000-OUTSIDE&lt;/span&gt;
&lt;p&gt;Fusce luctus dictum lacus in aliquam libero maecenas&lt;/p&gt;
&lt;/div&gt;';
$link_title{$language['language_id']} = 'Quick Link';
$footer_link{$language['language_id']} = '&lt;div class=&quot;quick-link&quot;&gt;
&lt;ul&gt;
	&lt;li&gt;&lt;a href=&quot;#&quot;&gt;Lorem ipsum&lt;/a&gt;&lt;/li&gt;
	&lt;li&gt;&lt;a href=&quot;#&quot;&gt;Dolor sit amet&lt;/a&gt;&lt;/li&gt;
	&lt;li&gt;&lt;a href=&quot;#&quot;&gt;Consectetur&lt;/a&gt;&lt;/li&gt;
	&lt;li&gt;&lt;a href=&quot;#&quot;&gt;Adipiscing elit &lt;/a&gt;&lt;/li&gt;
	&lt;li&gt;&lt;a href=&quot;#&quot;&gt;Pellentesque varius&lt;/a&gt;&lt;/li&gt;
	&lt;li&gt;&lt;a href=&quot;#&quot;&gt;Arcu at felis&lt;/a&gt;&lt;/li&gt;
	&lt;li&gt;&lt;a href=&quot;#&quot;&gt;Lobortis posuere&lt;/a&gt;&lt;/li&gt;
	&lt;li&gt;&lt;a href=&quot;#&quot;&gt;Nunc tincidunt &lt;/a&gt;&lt;/li&gt;
	&lt;li&gt;&lt;a href=&quot;#&quot;&gt;Imperdiet volutpat&lt;/a&gt;&lt;/li&gt;
	&lt;li&gt;&lt;a href=&quot;#&quot;&gt;Pellentesque varius&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;

&lt;ul&gt;
	&lt;li&gt;&lt;a href=&quot;#&quot;&gt;Suspendisse posuere&lt;/a&gt;&lt;/li&gt;
	&lt;li&gt;&lt;a href=&quot;#&quot;&gt;Dolor mauris&lt;/a&gt;&lt;/li&gt;
	&lt;li&gt;&lt;a href=&quot;#&quot;&gt;Lobortis quis&lt;/a&gt;&lt;/li&gt;
	&lt;li&gt;&lt;a href=&quot;#&quot;&gt;Facilisis velit sodales&lt;/a&gt;&lt;/li&gt;
	&lt;li&gt;&lt;a href=&quot;#&quot;&gt;Sed euismod &lt;/a&gt;&lt;/li&gt;
	&lt;li&gt;&lt;a href=&quot;#&quot;&gt;Risus dolor &lt;/a&gt;&lt;/li&gt;
	&lt;li&gt;&lt;a href=&quot;#&quot;&gt;Consectetur &lt;/a&gt;&lt;/li&gt;
	&lt;li&gt;&lt;a href=&quot;#&quot;&gt;Elementum &lt;/a&gt;&lt;/li&gt;
	&lt;li&gt;&lt;a href=&quot;#&quot;&gt;Fringilla &lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;
&lt;/div&gt;';
			$social_title{$language['language_id']} = 'Follow us';
			$footer_powered{$language['language_id']} = '&lt;div id=&quot;powered&quot;&gt;
&lt;p&gt;Copyright &copy; 2014 Outside Store. All rights Reserved.&lt;span&gt;Opencart Themes by &lt;a href=&quot;http://www.bossthemes.com&quot;&gt;Bossthemes.com.&lt;/a&gt;&lt;/span&gt;&lt;/p&gt;

&lt;p&gt;Powered By &lt;a href=&quot;http://www.opencart.com&quot;&gt;OpenCart&lt;/a&gt;&lt;/p&gt;
&lt;/div&gt;';
		}
		
        $data = array(
			'b_General_Show'  => 0,
			'b_show_animate' => 1,
            'b_General_P_Display'   =>'grid',
            'b_General_Menu'  =>1,
			'b_Layout_Setting' => '6,24-18-12,6-8-12',
            'b_Setting'   => Array ('temp_setting' => 'custom' ),
			'b_Color_Data' => Array (
				'g_bg_image' => 'default',
				'g_upload_bg_image' => '',
				'g_bg_image_repeat' => 'repeat',
				'g_bg_image_position' => 'left top',
				'h_bg_image' => 'default',
				'h_upload_bg_image' =>'',
				'h_bg_image_repeat' => 'repeat',
				'h_bg_image_position' => 'left top',
				'f_bg_image' => 'default',
				'f_upload_bg_image' => '',
				'f_bg_image_repeat' => 'repeat',
				'f_bg_image_position' => 'left top',
				'm_bg_image' => 'default',
				'm_upload_bg_image' => '',
				'm_bg_image_repeat' => 'repeat',
				'm_bg_image_position' => 'left top',
				'mdrop_bg_image' => 'default',
				'mdrop_upload_bg_image' => '',
				'mdrop_bg_image_repeat' => 'repeat',
				'mdrop_bg_image_position' => 'left top',
				's_bg_image' => 'default',
				's_upload_bg_image' => '',
				's_bg_image_repeat' => 'repeat',
				's_bg_image_position' => 'left top' ),
			'boss_editorthemes_module' => array(0 => array ('layout_id' => 9999, 'position' => 'footer', 'status' => 1, 'sort_order' => 0)),
			'footer_about'   => Array ('status' => 1, 'image_status' => 0, 'image_link' => 'data/no_image.jpg', 'image_url' => '#', 'about_title' => $about_title, 'about_content' => $about_content),
			'footer_contact'   => Array ('status' => 1, 'contact_title' => $contact_title, 'about_content' => $contact_content),
			'footer_link'   => Array ('status' => 1, 'link_title' => $link_title, 'link_content' => $footer_link),
			'footer_social'   => Array ('status' => 1, 'title' => $social_title, 'face_url' => 'facebook.com','twitter_url' => 'twitter.com','google_url' => '#', 'pinterest_url' => 'pinterest.com', 'vimeo_url' => '#', 'rss_url' => '#'),
			'footer_payment'   => Array ('status' => 1, 'visa_status' => 1, 'visa_link' => '#','master_status' => 1, 'master_link' => '#', 'merican_status' => 1, 'merican_link' => '#', 'paypal_status' => 1, 'paypal_link' => '#', 'skrill_status' => 1, 'skrill_link' => '#'),
			'footer_powered' => $footer_powered
			
        );
        
        $this->load->model('setting/setting');
        
        $this->model_setting_setting->editSetting('boss_editorthemes', $data);
 	}
}
?>