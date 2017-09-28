<?php
class ControllerModuleBossStaticblock extends Controller {
	private $error = array(); 
	
	public function index() {   
		$this->language->load('module/boss_staticblock');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('boss_staticblock', $this->request->post);		
					
			$this->session->data['success'] = $this->language->get('text_success');
						
			$this->redirect($this->url->link('module/boss_staticblock', 'token=' . $this->session->data['token'], 'SSL'));
		}
				
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_browse'] = $this->language->get('text_browse');
        $this->data['text_clear'] = $this->language->get('text_clear');
        $this->data['text_image_manager'] = $this->language->get('text_image_manager');
		$this->data['text_content_top'] = $this->language->get('text_content_top');
		$this->data['text_content_bottom'] = $this->language->get('text_content_bottom');
		$this->data['text_header'] = $this->language->get('text_header');
		$this->data['text_slideshow'] = $this->language->get('text_slideshow');
		$this->data['text_footer'] = $this->language->get('text_footer');		
		$this->data['text_column_left'] = $this->language->get('text_column_left');
		$this->data['text_column_right'] = $this->language->get('text_column_right');
		$this->data['text_default'] = $this->language->get('text_default');
		$this->data['text_all'] = $this->language->get('text_all');
		
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_add_module'] = $this->language->get('button_add_module');
		$this->data['button_remove'] = $this->language->get('button_remove');
		$this->data['button_add_new_block'] = $this->language->get('button_add_new_block');
		
		$this->data['entry_content'] = $this->language->get('entry_content');
		$this->data['entry_layout'] = $this->language->get('entry_layout');
		$this->data['entry_store'] = $this->language->get('entry_store');
		$this->data['entry_position'] = $this->language->get('entry_position');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
		
		//tab
		$this->data['tab_content'] = $this->language->get('tab_content');
		$this->data['tab_header'] = $this->language->get('tab_header');
		$this->data['tab_footer'] = $this->language->get('tab_footer');
		$this->data['tab_header_top'] = $this->language->get('tab_header_top');
		$this->data['tab_header_bottom'] = $this->language->get('tab_header_bottom');
		$this->data['tab_footer_1'] = $this->language->get('tab_footer_1');
		$this->data['tab_footer_2'] = $this->language->get('tab_footer_2');
		$this->data['tab_footer_3'] = $this->language->get('tab_footer_3');
		
		$this->data['tab_block'] = $this->language->get('tab_block');
		
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
			'href'      => $this->url->link('module/boss_staticblock', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = $this->url->link('module/boss_staticblock', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['token'] = $this->session->data['token'];
		
		$this->load->model('localisation/language');
		
		$this->data['languages'] = $this->model_localisation_language->getLanguages();

		$this->data['modules'] = array();
		
		if (isset($this->request->post['boss_staticblock_module'])) {
			$this->data['modules'] = $this->request->post['boss_staticblock_module'];
		} elseif ($this->config->get('boss_staticblock_module')) { 
			$this->data['modules'] = $this->config->get('boss_staticblock_module');
		}	
		
		$this->load->model('design/layout');
		
		$this->data['layouts'] = $this->model_design_layout->getLayouts();
		
		$this->load->model('setting/store');
		
		$this->data['stores'] = $this->model_setting_store->getStores();
		
		$this->load->model('localisation/language');
		
		$this->data['languages'] = $this->model_localisation_language->getLanguages();
						
		$this->template = 'module/boss_staticblock.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}
	
	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/boss_staticblock')) {
			$this->error['warning'] = $this->language->get('error_permission');
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

	public function install(){
		$this->load->model('setting/setting');
		
		$this->load->model('localisation/language');
			
		$languages = $this->model_localisation_language->getLanguages();
		
		$block_content1 = array();
		$block_content2 = array();
		$block_content3 = array();
		$block_content4 = array();
		$block_content5 = array();
		$block_content6 = array();
		$block_content7 = array();
		$block_content8 = array();
						
		foreach($languages as $language){
			$block_content1{$language['language_id']} = '&lt;div class=&quot;staticblock-footer not-animated&quot; data-animate=&quot;fadeInUp&quot; data-delay=&quot;100&quot;&gt;
&lt;div class=&quot;heading&quot;&gt;
&lt;h3&gt;From our Blog&lt;/h3&gt;

&lt;p&gt;Quisque justo turpis, sodales sit amet consectetur - &lt;a href=&quot;#&quot;&gt;Go to Blog&lt;/a&gt;&lt;/p&gt;
&lt;/div&gt;

&lt;div class=&quot;static_column&quot;&gt;
&lt;div class=&quot;column-1 col-lg-8 col-md-8 col-sm-8 col-xs-24&quot;&gt;
&lt;div class=&quot;image&quot;&gt;&lt;a href=&quot;#&quot; title=&quot;bosstheme static block&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://demo.bossthemes.com/outside/image/data/bt_outside/static1.jpg&quot; /&gt;&lt;/a&gt;&lt;/div&gt;

&lt;div class=&quot;name&quot;&gt;&lt;a&gt;Bellentesque habitant morbi tristique&lt;/a&gt;&lt;/div&gt;

&lt;div class=&quot;description&quot;&gt;
&lt;p&gt;Maecenas a sapien tortor quis tincidunt lectus. Donec ullamcorper dui sit amet lorem ultrices sed porttitor massa&lt;/p&gt;
&lt;/div&gt;

&lt;p class=&quot;readmore&quot;&gt;&lt;a href=&quot;#&quot; title=&quot;Read more&quot;&gt;Read more&lt;/a&gt;&lt;/p&gt;
&lt;/div&gt;

&lt;div class=&quot;column-1 col-lg-8 col-md-8 col-sm-8 col-xs-24&quot;&gt;
&lt;div class=&quot;image&quot;&gt;&lt;a href=&quot;#&quot; title=&quot;bosstheme static block&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://demo.bossthemes.com/outside/image/data/bt_outside/static2.jpg&quot; /&gt;&lt;/a&gt;&lt;/div&gt;

&lt;div class=&quot;name&quot;&gt;&lt;a&gt;Class aptent taciti sociosqus&lt;/a&gt;&lt;/div&gt;

&lt;div class=&quot;description&quot;&gt;
&lt;p&gt;Maecenas a sapien tortor quis tincidunt lectus. Donec ullamcorper dui sit amet lorem ultrices sed porttitor massa eu dui scelerisque&lt;/p&gt;
&lt;/div&gt;

&lt;p class=&quot;readmore&quot;&gt;&lt;a href=&quot;#&quot; title=&quot;Read more&quot;&gt;Read more&lt;/a&gt;&lt;/p&gt;
&lt;/div&gt;

&lt;div class=&quot;column-1 col-lg-8 col-md-8 col-sm-8 col-xs-24&quot;&gt;
&lt;div class=&quot;image&quot;&gt;&lt;a href=&quot;#&quot; title=&quot;bosstheme static block&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://demo.bossthemes.com/outside/image/data/bt_outside/static3.jpg&quot; /&gt;&lt;/a&gt;&lt;/div&gt;

&lt;div class=&quot;name&quot;&gt;&lt;a&gt;Pellentesque purus eu turpis&lt;/a&gt;&lt;/div&gt;

&lt;div class=&quot;description&quot;&gt;
&lt;p&gt;Maecenas a sapien tortor quis tincidunt lectus. Donec ullamcorper dui sit amet lorem ultrices sed porttitor massa scelerisque&lt;/p&gt;
&lt;/div&gt;

&lt;p class=&quot;readmore&quot;&gt;&lt;a href=&quot;#&quot; title=&quot;Read more&quot;&gt;Read more&lt;/a&gt;&lt;/p&gt;
&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;';
			$block_content2{$language['language_id']} = '&lt;div class=&quot;block-support&quot;&gt;&lt;span class=&quot;title&quot;&gt;Customer Support&lt;/span&gt;&lt;span&gt;1800-000-Outside&lt;/span&gt; &lt;a href=&quot;#&quot;&gt;Chat with us&lt;/a&gt;&lt;/div&gt;';
			$block_content3{$language['language_id']} = '&lt;div class=&quot;block-home-custom not-animated&quot; data-animate=&quot;fadeInUp&quot; data-delay=&quot;100&quot;&gt;
&lt;div class=&quot;block-1 col-lg-8 col-md-8 col-sm-8 col-xs-24&quot;&gt;
&lt;div class=&quot;row&quot;&gt;
&lt;div class=&quot;col-md-12&quot;&gt;&lt;a href=&quot;#&quot; title=&quot;kinect&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://demo.bossthemes.com/outside/image/data/bt_outside/item1.jpg&quot; /&gt;&lt;/a&gt;&lt;/div&gt;

&lt;div class=&quot;col-md-12 shopkinect&quot;&gt;&lt;a href=&quot;#&quot; title=&quot;shopkinect&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://demo.bossthemes.com/outside/image/data/bt_outside/flatform_button1.png&quot; /&gt;&lt;/a&gt;&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;

&lt;div class=&quot;block-2 col-lg-8 col-md-8 col-sm-8 col-xs-24&quot;&gt;
&lt;div class=&quot;row&quot;&gt;
&lt;div class=&quot;col-md-12&quot;&gt;&lt;a href=&quot;#&quot; title=&quot;move&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://demo.bossthemes.com/outside/image/data/bt_outside/item2.jpg&quot; /&gt;&lt;/a&gt;&lt;/div&gt;

&lt;div class=&quot;col-md-12 shopkinect&quot;&gt;&lt;a href=&quot;#&quot; title=&quot;shopmove&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://demo.bossthemes.com/outside/image/data/bt_outside/flatform_button2.png&quot; /&gt;&lt;/a&gt;&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;

&lt;div class=&quot;block-3 col-lg-8 col-md-8 col-sm-8 col-xs-24&quot;&gt;
&lt;div class=&quot;row&quot;&gt;
&lt;div class=&quot;col-md-12&quot;&gt;&lt;a href=&quot;#&quot; title=&quot;plus&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://demo.bossthemes.com/outside/image/data/bt_outside/item3.jpg&quot; /&gt;&lt;/a&gt;&lt;/div&gt;

&lt;div class=&quot;col-md-12 shopkinect&quot;&gt;&lt;a href=&quot;#&quot; title=&quot;shopplus&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://demo.bossthemes.com/outside/image/data/bt_outside/flatform_button3.png&quot; /&gt;&lt;/a&gt;&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;';
			$block_content4{$language['language_id']} = '&lt;div class=&quot;block-home-featured not-animated&quot; data-animate=&quot;fadeInUp&quot; data-delay=&quot;100&quot;&gt;
&lt;div class=&quot;feature_heading&quot;&gt;&lt;span class=&quot;title&quot;&gt;More Way To Shopping&lt;/span&gt;&lt;span class=&quot;text_tt&quot;&gt;Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas&lt;span&gt; - Buy this theme&lt;/span&gt;&lt;/span&gt;&lt;/div&gt;

&lt;div class=&quot;feature_content&quot;&gt;
&lt;div class=&quot;row&quot;&gt;
&lt;div class=&quot;block-1 block col-lg-8 col-md-8 col-sm-8 col-xs-24&quot;&gt;
&lt;div class=&quot;heading-title&quot;&gt;
&lt;h3&gt;Swimwear, Accessories &amp;amp; More&lt;/h3&gt;
&lt;a href=&quot;#&quot;&gt;Shop all&lt;/a&gt;&lt;/div&gt;

&lt;div class=&quot;one-product&quot;&gt;
&lt;div class=&quot;row&quot;&gt;
&lt;div class=&quot;image col-md-12 col-xs-24&quot;&gt;&lt;a href=&quot;#&quot; title=&quot;Nunc non ipsum&quot;&gt;&lt;img alt=&quot;Nunc non ipsum&quot; src=&quot;http://demo.bossthemes.com/outside/image/data/bt_outside/f1.jpg&quot; /&gt;&lt;/a&gt;&lt;/div&gt;

&lt;div class=&quot;description col-md-12 col-xs-24&quot;&gt;&lt;span&gt;From&lt;/span&gt;

&lt;div class=&quot;price&quot;&gt;$236.99&lt;/div&gt;

&lt;p&gt;Microsoft Refurbished&lt;/p&gt;

&lt;div class=&quot;shop-platform&quot;&gt;&lt;a class=&quot;btn&quot; href=&quot;&quot;&gt;&lt;span&gt;Shop Platforms&lt;/span&gt;&lt;/a&gt;&lt;/div&gt;

&lt;div class=&quot;shop-accessories&quot;&gt;&lt;a class=&quot;btn btn_black&quot; href=&quot;&quot;&gt;&lt;span&gt;Shop Accessories&lt;/span&gt;&lt;/a&gt;&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;

&lt;div class=&quot;block-2 block col-lg-8 col-md-8 col-sm-8 col-xs-24&quot;&gt;
&lt;div class=&quot;heading-title&quot;&gt;
&lt;h3&gt;Performance Footwear &amp;amp; Apparel&lt;/h3&gt;
&lt;a href=&quot;#&quot;&gt;Shop all&lt;/a&gt;&lt;/div&gt;

&lt;div class=&quot;one-product&quot;&gt;
&lt;div class=&quot;row&quot;&gt;
&lt;div class=&quot;image col-md-12 col-xs-24&quot;&gt;&lt;a href=&quot;#&quot; title=&quot;Nunc non ipsum&quot;&gt;&lt;img alt=&quot;Nunc non ipsum&quot; src=&quot;http://demo.bossthemes.com/outside/image/data/bt_outside/f2.jpg&quot; /&gt;&lt;/a&gt;&lt;/div&gt;

&lt;div class=&quot;description col-md-12 col-xs-24&quot;&gt;&lt;span&gt;From&lt;/span&gt;

&lt;div class=&quot;price&quot;&gt;$236.99&lt;/div&gt;

&lt;p&gt;Sony Refurbished&lt;/p&gt;

&lt;div class=&quot;shop-platform&quot;&gt;&lt;a class=&quot;btn btn_red&quot; href=&quot;&quot;&gt;&lt;span&gt;Shop Platforms&lt;/span&gt;&lt;/a&gt;&lt;/div&gt;

&lt;div class=&quot;shop-accessories&quot;&gt;&lt;a class=&quot;btn btn_black&quot; href=&quot;&quot;&gt;&lt;span&gt;Shop Accessories&lt;/span&gt;&lt;/a&gt;&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;

&lt;div class=&quot;block-3 block col-lg-8 col-md-8 col-sm-8 col-xs-24&quot;&gt;
&lt;div class=&quot;heading-title&quot;&gt;
&lt;h3&gt;Running &amp;amp; Casual Skirts&lt;/h3&gt;
&lt;a href=&quot;#&quot;&gt;Shop all&lt;/a&gt;&lt;/div&gt;

&lt;div class=&quot;one-product&quot;&gt;
&lt;div class=&quot;row&quot;&gt;
&lt;div class=&quot;image col-md-12 col-xs-24&quot;&gt;&lt;a href=&quot;#&quot; title=&quot;Nunc non ipsum&quot;&gt;&lt;img alt=&quot;Nunc non ipsum&quot; src=&quot;http://demo.bossthemes.com/outside/image/data/bt_outside/f3.jpg&quot; /&gt;&lt;/a&gt;&lt;/div&gt;

&lt;div class=&quot;description col-md-12 col-xs-24&quot;&gt;&lt;span&gt;From&lt;/span&gt;

&lt;div class=&quot;price&quot;&gt;$236.99&lt;/div&gt;

&lt;p&gt;Sony Refurbished&lt;/p&gt;

&lt;div class=&quot;shop-platform&quot;&gt;&lt;a class=&quot;btn&quot; href=&quot;&quot;&gt;&lt;span&gt;Shop Platforms&lt;/span&gt;&lt;/a&gt;&lt;/div&gt;

&lt;div class=&quot;shop-accessories&quot;&gt;&lt;a class=&quot;btn btn_black&quot; href=&quot;&quot;&gt;&lt;span&gt;Shop Accessories&lt;/span&gt;&lt;/a&gt;&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;';
			$block_content5{$language['language_id']} = '&lt;div class=&quot;container block-top-home&quot;&gt;
&lt;div class=&quot;row&quot;&gt;
&lt;div class=&quot;block-home-slider&quot;&gt;
&lt;div class=&quot;block_slide_content&quot;&gt;
&lt;ul&gt;
	&lt;li class=&quot;col-md-6 col-sm-6&quot;&gt;&lt;a href=&quot;#&quot;&gt;Downloads&lt;/a&gt;&lt;span&gt;Games and Add-ons&lt;/span&gt;&lt;/li&gt;
	&lt;li class=&quot;col-md-6 col-sm-6&quot;&gt;&lt;a href=&quot;#&quot;&gt;Pre-Owned&lt;/a&gt;&lt;span&gt;Great Values&lt;/span&gt;&lt;/li&gt;
	&lt;li class=&quot;col-md-6 col-sm-6&quot;&gt;&lt;a href=&quot;#&quot;&gt;Trade-Ins&lt;/a&gt;&lt;span&gt;Great Offers&lt;/span&gt;&lt;/li&gt;
	&lt;li class=&quot;col-md-6 col-sm-6&quot;&gt;&lt;a href=&quot;#&quot;&gt;Monthly Deals&lt;/a&gt;&lt;span&gt;Current Sales&lt;/span&gt;&lt;/li&gt;
&lt;/ul&gt;
&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;';
			$block_content6{$language['language_id']} = '&lt;div class=&quot;block-home-ads-right&quot; id=&quot;ads_right&quot;&gt;&lt;a href=&quot;#&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://demo.bossthemes.com/outside/image/data/bt_outside/ads-2.png&quot; /&gt;&lt;/a&gt;&lt;/div&gt;';
			$block_content7{$language['language_id']} = '&lt;div class=&quot;block-home-ads-left&quot; id=&quot;ads_left&quot;&gt;&lt;a href=&quot;#&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://demo.bossthemes.com/outside/image/data/bt_outside/ads-1.png&quot; /&gt;&lt;/a&gt;&lt;/div&gt;';
			$block_content8{$language['language_id']} = '&lt;div class=&quot;block-cate-page not-animated&quot; data-animate=&quot;fadeInUp&quot; data-delay=&quot;100&quot;&gt;&lt;a href=&quot;#&quot; title=&quot;banner category&quot;&gt;&lt;img alt=&quot;banner-category&quot; src=&quot;http://demo.bossthemes.com/outside/image/data/bt_outside/banner_category.jpg&quot; /&gt;&lt;/a&gt;&lt;/div&gt;';
        }
		
		$data = array(
			'boss_staticblock_module' 	=> array(
				1 => array('description' => $block_content1, 'layout_id' => 9999, 'store_id' => array(0=>0), 'position' => 'footer', 'status' => 1, 'sort_order' => 2),
				2 => array('description' => $block_content2, 'layout_id' => 9999, 'store_id' => array(0=>0), 'position' => 'header', 'status' => 1, 'sort_order' => 1),
				3 => array('description' => $block_content3, 'layout_id' => $this->getIdLayout("home"), 'store_id' => array(0=>0), 'position' => 'content_top', 'status' => 1, 'sort_order' => 5),
				4 => array('description' => $block_content4, 'layout_id' => $this->getIdLayout("home"), 'store_id' => array(0=>0), 'position' => 'content_top', 'status' => 1, 'sort_order' => 4),
				5 => array('description' => $block_content5, 'layout_id' => 9999, 'store_id' => array(0=>0), 'position' => 'slideshow', 'status' => 1, 'sort_order' => 1),
				6 => array('description' => $block_content6, 'layout_id' => 9999, 'store_id' => array(0=>0), 'position' => 'header', 'status' => 1, 'sort_order' => 3),
				7 => array('description' => $block_content7, 'layout_id' => 9999, 'store_id' => array(0=>0), 'position' => 'header', 'status' => 1, 'sort_order' => 4),
				8 => array('description' => $block_content8, 'layout_id' => $this->getIdLayout("category"), 'store_id' => array(0=>0), 'position' => 'content_top', 'status' => 1, 'sort_order' => 1)
			)
		);

		$this->model_setting_setting->editSetting('boss_staticblock', $data);		
	}
}
?>