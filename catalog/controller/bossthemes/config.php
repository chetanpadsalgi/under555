<?php  
class ControllerBossthemesConfig extends Controller {
	
	public function index() {
		$user_agent = isset($this->request->server['HTTP_USER_AGENT'])?$this->request->server['HTTP_USER_AGENT']:'';
	}
	public function isMobile($user_agent) {
		$mobile = false;
		if(stripos($user_agent,"iPod") || stripos($user_agent,"iPhone") || stripos($user_agent,"webOS") || stripos($user_agent,"BlackBerry") || stripos($user_agent,"windows phone") || stripos($user_agent,"symbian") || stripos($user_agent,"vodafone") || stripos($user_agent,"opera mini") || stripos($user_agent,"windows ce") || stripos($user_agent,"smartphone") || stripos($user_agent,"palm") || stripos($user_agent,"midp")) {
			$mobile = true;
		}
		if(stripos($user_agent,"Android") && stripos($user_agent,"mobile")){
		    $mobile = true;
		}else if(stripos($user_agent,"Android")){
	    	$mobile = false;
	   	}
		
		return $mobile;
	}
	
	public function isTablet($user_agent) {
		$tablet = false;
		if(stripos($user_agent,"Android") && stripos($user_agent,"mobile")){
		    $tablet = false;
		}else if(stripos($user_agent,"Android")){
	    	$tablet = true;
	   	}
		if(stripos($user_agent,"iPad") || stripos($user_agent,"RIM Tablet") || stripos($user_agent,"hp-tablet") || stripos($user_agent,"Kindle Fire")) {
			$tablet = true;
		}
		
		return $tablet;
	}
}
?>