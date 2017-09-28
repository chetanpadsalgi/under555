<?php  
class ControllerModuleBossCarousel extends Controller {
	protected function index($setting) {
		static $module = 0;
		if(isset($setting['banner_id'])){
		
		$this->load->model('design/banner');
		$this->load->model('tool/image');
		
		$this->document->addScript('catalog/view/javascript/bossthemes/jquery.touchSwipe.min.js');
		$this->document->addScript('catalog/view/javascript/bossthemes/jquery.carouFredSel-6.2.0-packed.js');
		
		$this->data['limit'] = $setting['limit'];
		$this->data['scroll'] = $setting['scroll'];
						
		$this->data['banners'] = array();
		
		if(isset($setting['banner_id'])){
		
			$results = $this->model_design_banner->getBanner($setting['banner_id']);
			  
			foreach ($results as $result) {
				if (file_exists(DIR_IMAGE . $result['image'])) {
					$this->data['banners'][] = array(
						'title' => $result['title'],
						'link'  => $result['link'],
						'image' => $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height'])
					);
				}
			}
		}
		
		$this->data['module'] = $module++; 
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/boss_carousel.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/boss_carousel.tpl';
		} else {
			$this->template = 'default/template/module/boss_carousel.tpl';
		}
		
		$this->render(); 
		}
	}
}
?>