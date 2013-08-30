<?php
################################################################################################
#  developed by dedalx http://dedalx.com/		                              	       #
#  All rights reserved                                                                         #
################################################################################################
class ControllerModulePerfectum extends Controller {
	
	private $error = array(); 
	
	public function index() {   
		
		// OpenCart 1.5.4
		// $this->load->language('module/perfectum'))
		
		// OpenCart 1.5.5
		$this->language->load('module/perfectum');
		
		//Set the title from the language file $_['heading_title'] string
		//$this->document->setTitle($this->language->get('heading_title'));
		$this->document->setTitle(strip_tags($this->language->get('heading_title')));

		//Load the settings model. You can also add any other models you want to load here.
		$this->load->model('setting/setting');
		
					$this->load->model('tool/image');
	
	if (isset($this->request->post['dx_image'])) {
			$this->data['dx_image'] = $this->request->post['dx_image'];
			$dx_image = $this->request->post['dx_image'];
		} else {
			$this->data['dx_image'] = '';
		}
		
		if (isset($this->request->post['dx_full_image'])) {
			$this->data['dx_full_image'] = $this->request->post['dx_full_image'];
			$dx_image = $this->request->post['dx_full_image'];
		} else {
			$this->data['dx_full_image'] = '';
		}
		
		
		//Save the settings if the user has submitted the admin form (ie if someone has pressed save).
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('perfectum', $this->request->post);	

				
					
			$this->session->data['success'] = $this->language->get('text_success');
		
						
			$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}
		
			$this->data['text_image_manager'] = 'Image manager';
					$this->data['token'] = $this->session->data['token'];		
		
		$text_strings = array(
				'heading_title',
				'text_enabled',
				'text_disabled',
				'text_content_top',
				'text_content_bottom',
				'text_column_left',
				'text_column_right',
				'entry_layout',
				'entry_position',
				'entry_status',
				'entry_sort_order',
				'button_save',
				'button_cancel',
				'button_add_module',
				'button_remove',
				'entry_example' 
		);
		
		foreach ($text_strings as $text) {
			$this->data[$text] = $this->language->get($text);
		}
		

		// store config data
		
		$config_data = array(
		'perfectum_status',
		'perfectum_color_body_bg',
		'perfectum_button_bg',
		'perfectum_button_hoverbg',
		'perfectum_topmenu_bg',
		
		'perfectum_body_bg_pattern',
		'perfectum_body_font',
		'perfectum_body_fontsize',
		'perfectum_header_font',
		'perfectum_buttons_font',
		'perfectum_header_font_weight',
		'perfectum_buttons_font_weight',
		'perfectum_header_font_subset',
		'perfectum_buttons_font_subset',
		
		'perfectum_buttons_fontsize',
		'perfectum_header_fontsize',
		'perfectum_fonts_transform',
		'perfectum_bfonts_transform',
		'perfectum_footer_b',
		'dx_image',
		'perfectum_preview',
		'dx_bg_image',
		'dx_full_image',
		'perfectum_full_preview',
		'dx_full_bg_image',
		'perfectum_transparent_content',
		'perfectum_layout_responsive',
		'perfectum_layout_boxed',
		'perfectum_layout_boxed_shadow',
		'perfectum_layout_related',
		'perfectum_layout_pdisplay',
		'perfectum_layout_custommenu',
		'perfectum_layout_custommenu_item1_text',
		'perfectum_layout_custommenu_item2_text',
		'perfectum_layout_custommenu_item3_text',
		'perfectum_layout_custommenu_item4_text',
		'perfectum_layout_custommenu_item5_text',
		'perfectum_layout_custommenu_item6_text',
		'perfectum_layout_custommenu_item7_text',
		'perfectum_layout_custommenu_item8_text',
		'perfectum_layout_custommenu_item9_text',
		'perfectum_layout_custommenu_item10_text',
		'perfectum_layout_custommenu_item1_url',
		'perfectum_layout_custommenu_item2_url',
		'perfectum_layout_custommenu_item3_url',
		'perfectum_layout_custommenu_item4_url',
		'perfectum_layout_custommenu_item5_url',
		'perfectum_layout_custommenu_item6_url',
		'perfectum_layout_custommenu_item7_url',
		'perfectum_layout_custommenu_item8_url',
		'perfectum_layout_custommenu_item9_url',
		'perfectum_layout_custommenu_item10_url',
		
		'perfectum_layout_custommenu_block',
		'perfectum_layout_custommenu_block_title',
		'perfectum_layout_custommenu_block_content',
		'perfectum_layout_custommenu_position',
		'perfectum_layout_custommenu_block_width',
		'perfectum_layout_custommenu_block_position',
		
		'perfectum_layout_refsearch',
		'perfectum_layout_shortenby',
		'perfectum_layout_promoblock_content',
		
		'layout_product_customtab_content',
		'layout_product_customtab_title',
		'layout_product_customtab',
		'layout_product_customcontactblock_content',
		'layout_product_customcontactblock',
		
		'layout_product_showsalebadge',
		'layout_product_showsalebadge_title',
		'layout_product_showsalebadge_color',
		
		
		'perfectum_effects_carousel',
		'perfectum_effects_productimage',
		
		'perfectum_custom_css',
		'perfectum_custom_js',
		
		'perfectum_slider_enable',
		'perfectum_slider_autoplay',
		'perfectum_slider_code',
		'perfectum_slider_autoplay_delay',
		
		'customFooter_status',
		'customFooter_onallpages',
			'about_header', 
			'about_text',
		'contact_header',
		'custom_address',
		'telephone1',
		'telephone2',
		'email1',
		'email2',
		'skype',
		'fax',
		'facebook_status',
		'facebook_id',
		'custom_footer_column_status',
		'custom_footer_column_header',
		'custom_footer_column_content',
		  'twitter_column_status',
		  'twitter_column_header',
		'twitter_number_of_tweets',
		'twitter_username',
		'categories_column_status',
		
		'social_icons_googleplus_url',
		'social_icons_pinterest_url',
		
		
		'about_us_image',
		'about_us_image_status',
		'about_us_image_preview',
		
		'payment_icons_enabled',
		
		'payment_icons_paypal',
		'payment_icons_paypal_url',
		
		'payment_icons_visa',
		'payment_icons_visa_url',
		
		'payment_icons_mastercard',
		'payment_icons_mastercard_url',
		
		'payment_icons_discover',
		'payment_icons_discover_url',
		
		'payment_icons_amex',
		'payment_icons_amex_url',

		
		'dx_paymenticon_custom',
		'dx_paymenticon_image',
		'perfectum_preview_payment',
		'dx_paymenticon_custom_url',
		
		'footer_powered_text'
		
		);
		
		foreach ($config_data as $conf) {
			if (isset($this->request->post[$conf])) {
				$this->data[$conf] = $this->request->post[$conf];
			} else {
				$this->data[$conf] = $this->config->get($conf);
			}
		}
		
		
		
	
		//This creates an error message. The error['warning'] variable is set by the call to function validate() in this controller (below)
 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
		
		//SET UP BREADCRUMB TRAIL. YOU WILL NOT NEED TO MODIFY THIS UNLESS YOU CHANGE YOUR MODULE NAME.
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
			'href'      => $this->url->link('module/perfectum', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = $this->url->link('module/perfectum', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

	
		//This code handles the situation where you have multiple instances of this module, for different layouts.
		if (isset($this->request->post['perfectum_module'])) {
			$modules = explode(',', $this->request->post['perfectum_module']);
		} elseif ($this->config->get('perfectum_module') != '') {
			$modules = explode(',', $this->config->get('perfectum_module'));
		} else {
			$modules = array();
		}			
				
		$this->load->model('design/layout');
		
		$this->data['layouts'] = $this->model_design_layout->getLayouts();
				
		foreach ($modules as $module) {
			if (isset($this->request->post['perfectum_' . $module . '_layout_id'])) {
				$this->data['perfectum_' . $module . '_layout_id'] = $this->request->post['perfectum_' . $module . '_layout_id'];
			} else {
				$this->data['perfectum_' . $module . '_layout_id'] = $this->config->get('perfectum_' . $module . '_layout_id');
			}	
			
			if (isset($this->request->post['perfectum_' . $module . '_position'])) {
				$this->data['perfectum_' . $module . '_position'] = $this->request->post['perfectum_' . $module . '_position'];
			} else {
				$this->data['perfectum_' . $module . '_position'] = $this->config->get('perfectum_' . $module . '_position');
			}	
			
			if (isset($this->request->post['perfectum_' . $module . '_status'])) {
				$this->data['perfectum_' . $module . '_status'] = $this->request->post['perfectum_' . $module . '_status'];
			} else {
				$this->data['perfectum_' . $module . '_status'] = $this->config->get('perfectum_' . $module . '_status');
			}	
						
			if (isset($this->request->post['perfectum_' . $module . '_sort_order'])) {
				$this->data['perfectum_' . $module . '_sort_order'] = $this->request->post['perfectum_' . $module . '_sort_order'];
			} else {
				$this->data['perfectum_' . $module . '_sort_order'] = $this->config->get('perfectum_' . $module . '_sort_order');
			}				
		}
		

		
		$this->data['modules'] = $modules;
		
		if (isset($this->request->post['perfectum_module'])) {
			$this->data['perfectum_module'] = $this->request->post['perfectum_module'];
		} else {
			$this->data['perfectum_module'] = $this->config->get('perfectum_module');
		}

		//Choose which template file will be used to display this request.
		$this->template = 'module/perfectum.tpl';
		$this->children = array(
			'common/header',
			'common/footer',
		);
		
		if (isset($this->data['dx_paymenticon_image']) && file_exists(DIR_IMAGE . $this->data['dx_paymenticon_image'])) {
			$this->data['perfectum_preview_payment'] = $this->model_tool_image->resize($this->data['dx_paymenticon_image'], 70, 70);
		} else {
			$this->data['perfectum_preview_payment'] = $this->model_tool_image->resize('no_image.jpg', 50, 70);
		}
		
		if (isset($this->data['dx_image']) && file_exists(DIR_IMAGE . $this->data['dx_image'])) {
			$this->data['perfectum_preview'] = $this->model_tool_image->resize($this->data['dx_image'], 70, 70);
		} else {
			$this->data['perfectum_preview'] = $this->model_tool_image->resize('no_image.jpg', 50, 70);
		}
		
		
		if (isset($this->data['dx_full_image']) && file_exists(DIR_IMAGE . $this->data['dx_full_image'])) {
			$this->data['perfectum_full_preview'] = $this->model_tool_image->resize($this->data['dx_full_image'], 70, 70);
		} else {
			$this->data['perfectum_full_preview'] = $this->model_tool_image->resize('no_image.jpg', 50, 70);
		}

		if (isset($this->data['about_us_image']) && file_exists(DIR_IMAGE . $this->data['about_us_image'])) {
			$this->data['about_us_image_preview'] = $this->model_tool_image->resize($this->data['about_us_image'], 70, 70);
		} else {
			$this->data['about_us_image_preview'] = $this->model_tool_image->resize('no_image.jpg', 50, 70);
		}
		
		//Send the output.
		$this->response->setOutput($this->render());
	}
	
	/*
	 * 
	 * This function is called to ensure that the settings chosen by the admin user are allowed/valid.
	 * You can add checks in here of your own.
	 * 
	 */
	
	
	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/perfectum')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->error) {
			return TRUE;
		} else {
			return FALSE;
		}	
	}


}
?>