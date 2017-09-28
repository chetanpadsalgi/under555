<?php
class ModelBossthemesBossEditorthemes extends Model
{
   private $color_themes = array(
        'theme1' => array(         
			
            'g_text_1' 					=> '505050',			
			'g_text_2' 					=> 'ea5210',
			'g_bg_color'             	=> '004177',			
			
            'h_bg_color'				=> '050404',
			'h_text_nomal_1'     		=> 'ffffff',
            'h_text_hover_1'     		=> '969696',    	
			
            'f_text_1'                 	=> 'ffffff',
            'f_text_normal_2'        	=> '969696',
            'f_text_hover_2'        	=> 'ff8400',
            
			
            'm_bg_color'             	=> '',
			'm_bg_hv_color'             => '',      
			'mdrop_bg_color'           	=> 'ffffff',   
            'm_text_normal_1'          	=> '191919',			
            'm_text_normal_2'           => '191919',
            'm_text_hover_2'        	=> 'ea5210',
            'm_text_normal_3'       	=> '505050',
            'm_text_hover_3' 			=> 'ff8400',
			
			
            'p_name_text_normal'        => '191919',
            'p_name_text_hover'   		=> 'ea5210',
            'p_des_text'        		=> '646464',
            'p_price_text'             	=> '191919',
            'p_spec_text'               => 'e41e1e',
			'button_bg_normal' 			=> '',
			'button_bg_hover' 			=> '',
			'button_text_normal' 		=> 'ffffff',
			'button_text_hover'     	=> 'ffffff',
			
			
            't_page'                  	=> '191919',
            't_bread_normal_1'         	=> '787878',
			't_bread_hover_1'			=> '191919',
			't_block_bg' 				=> '004177',
			't_block_text' 				=> 'ffffff',
			
			
        ),
        'theme2' => array(
            
			
            'g_text_1' 					=> '646464',			
			'g_text_2' 					=> '202020',
			'g_text_3' 					=> '47cbde',
			'g_bg_color'             	=> 'ffffff',
			'gdrop_bg_color'           	=> '0e0e10',
			
			
			
            'h_bg_color'				=> '050404',
			'h_text_nomal_1'     		=> 'ffffff',
            'h_text_hover_1'     		=> '969696',
			'h_text_2'     				=> '202020',  				
            			
			
            'f_text_1'                 	=> '47cbde',
            'f_text_normal_2'        	=> 'a0a0a0',
            'f_text_hover_2'        	=> '47cbde',
            
			
            'm_bg_color'             	=> '3c9ccd',
			'm_bg_hv_color'             => '3996c6',
			'm_bd_color'             	=> '3996c6 ',           
            'm_text_normal_1'          	=> 'ffffff',			
            'm_text_normal_2'           => '47cbde',
            'm_text_hover_2'        	=> 'ea5210',
            'm_text_normal_3'       	=> 'a0a0a0',
            'm_text_hover_3' 			=> '47cbde',
			
			
            'p_name_text_normal'        => '47cbde',
            'p_name_text_hover'   		=> 'ea5210',
            'p_des_text'        		=> '646464',
            'p_price_text'             	=> '202020',
            'p_spec_text'               => 'a92e0b',
			'button_bg_normal' 			=> '',
			'button_bg_hover' 			=> '',
			'button_text_normal' 		=> '787878',
			'button_text_hover'     	=> 'ffffff',
			
			
            't_page'                  	=> '202020',
            't_bread_normal_1'         	=> '787878',
			't_bread_hover_1'			=> '202020',
			't_block_bg' 				=> '1e1e1e',
			't_block_text' 				=> 'ffffff',
			
        )
    );
	
	private $background = array(
            'g_bg_image_1'       => 'back_1.png',
            'g_bg_image_2'       => 'back_2.png',
            'g_bg_image_3'       => 'back_3.png',
            'g_bg_image_4'       => 'back_4.png',
            'g_bg_image_5'       => 'back_5.png',
            'g_bg_image_6'       => 'back_6.png',
			'g_bg_image_7'       => 'back_7.png',
            'g_bg_image_8'       => 'back_8.png',
            'g_bg_image_9'       => 'back_9.png',
            'g_bg_image_10'       => 'back_10.png',
            'g_bg_image_11'       => 'back_11.png',
            'g_bg_image_12'       => 'back_12.png',
			'g_bg_image_13'       => 'back_13.png',
            'g_bg_image_14'       => 'back_14.png',
            'g_bg_image_15'       => 'back_15.png'
    );

    private $theme_name;
	

    private $theme_names = array(
        'theme1' => 'Default',
        'theme2' => 'Light',
      
		
        
    );

    public function setThemeName($theme_name)
    {
        $this->theme_name = $theme_name;
    }

   
    public function getThemeNames()
    {
        return $this->theme_names;
    }

    public function getColorThemes()
    {
        return $this->color_themes;
    }
	
	public function getBackgrounds()
    {
        return $this->background;
    }
    function getExtensions($type) {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "extension WHERE `type` = '" . $this->db->escape($type) . "'");

        return $query->rows;
    }

}