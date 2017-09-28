<footer>
<?php $footer_about = $this->config->get('footer_about'); ?>
<?php $footer_social = $this->config->get('footer_social'); ?>
<?php $footer_payment = $this->config->get('footer_payment'); ?>
<?php $footer_powered = $this->config->get('footer_powered'); ?>
<?php $footer_contact = $this->config->get('footer_contact'); ?>
<?php $footer_link = $this->config->get('footer_link'); ?>
<?php 
require_once( DIR_TEMPLATE.$this->config->get('config_template')."/template/bossthemes/boss_library.php" );
$helper = ThemeControlHelper::getInstance( $this->registry,$this->config->get('config_template'));
?>
<?php
	$modules =$helper->getModulesByPosition('footer'); 
	if( $modules ){ ?>
	<div class="container top">
		<div class="row">		
		<?php foreach ($modules as $module) { 
			echo $module;
		} ?>
		</div>
	</div>
<?php } ?>
<div class="container content">
 <div class="footer_column">
    <div class="row">
 <?php if($footer_about['status']){ ?> 
	<div class="footer-about column col-lg-6 col-md-6 col-sm-12 col-xs-24 not-animated" data-animate="fadeInUp" data-delay="100">
		<h3><?php echo html_entity_decode($footer_about['about_title'][$this->config->get('config_language_id')],ENT_QUOTES, 'UTF-8'); ?></h3>
		<?php if($footer_about['image_status']){ ?><a href="#" title="parallax"><img alt="parallax" src="image/<?php echo $footer_about['image_link']; ?>"></a> <?php } ?>
		<?php echo html_entity_decode($footer_about['about_content'][$this->config->get('config_language_id')],ENT_QUOTES, 'UTF-8'); ?>
	</div>
	<?php } ?>
  <div class="column col-lg-4 col-md-4 col-sm-12 col-xs-24 not-animated" data-animate="fadeInUp" data-delay="100">
    <h3><?php echo $text_information; ?></h3>
    <ul>
	  <?php if ($informations) { ?>
      <?php foreach ($informations as $information) { ?>
      <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
      <?php } ?>
	  <?php } ?>
    </ul>
  </div>
  
   <div class="column col-lg-4 col-md-4 col-sm-12 col-xs-24 not-animated" data-animate="fadeInUp" data-delay="100">
    <h3><?php echo $text_extra; ?></h3>
    <ul>
	  <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
      <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
      <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
	  <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
      <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
    </ul>
  </div>
  
  <div class="column col-lg-4 col-md-4 col-sm-12 col-xs-24 not-animated" data-animate="fadeInUp" data-delay="100">
    <h3><?php echo $text_account; ?></h3>
    <ul>
      <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
      <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
      <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
	  <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
      <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
    </ul>
  </div>
  
	
  
	<div class="block-footer-top column col-lg-6 col-md-6 col-sm-12 col-xs-24 not-animated" data-animate="fadeInUp" data-delay="200">
		<?php if($footer_contact['status']){ ?> 
		<div class="footer-contact">
			<h3><?php echo html_entity_decode($footer_contact['contact_title'][$this->config->get('config_language_id')],ENT_QUOTES, 'UTF-8'); ?></h3>
			<?php echo html_entity_decode($footer_contact['about_content'][$this->config->get('config_language_id')],ENT_QUOTES, 'UTF-8'); ?>
		</div>
		<?php } ?>
		
		<?php if($footer_social['status']){ ?>
		<div class="footer-social">
		<h3><?php echo html_entity_decode($footer_social['title'][$this->config->get('config_language_id')],ENT_QUOTES, 'UTF-8'); ?></h3>

		<ul>
			<li><a class="facebook" href="<?php echo isset($footer_social['face_url'])?$footer_social['face_url']:'#'; ?>" title="Facebook"><i class="fa fa-facebook"></i></a></li>
			<li><a class="twitter" href="<?php echo isset($footer_social['twitter_url'])?$footer_social['twitter_url']:'#'; ?>" title="Twiter"><i class="fa fa-twitter"></i></a></li>
			<li><a class="google" href="<?php echo isset($footer_social['google_url'])?$footer_social['google_url']:'#'; ?>" title="Google plus"><i class="fa fa-google-plus"></i></a></li>
			<li><a class="pinterest" href="<?php echo isset($footer_social['pinterest_url'])?$footer_social['pinterest_url']:'#'; ?>" title="Pinterest"><i class="fa fa-pinterest"></i></a></li>
			<li><a class="vimeo" href="<?php echo isset($footer_social['vimeo_url'])?$footer_social['vimeo_url']:'#'; ?>" title="Vimeo"><i class="fa fa-vimeo-square"></i></a></li>
			<li><a class="rss" href="<?php echo isset($footer_social['rss_url'])?$footer_social['rss_url']:'#'; ?>" title="RSS"><i class="fa fa-rss"></i></a></li>
		</ul>
		</div>
		<?php } ?>
	</div>
	</div>
	</div>
	
	<?php if($footer_link['status']){ ?> 
	<div class="footer-link">
		<h3><?php echo html_entity_decode($footer_link['link_title'][$this->config->get('config_language_id')],ENT_QUOTES, 'UTF-8'); ?></h3>
		<?php echo html_entity_decode($footer_link['link_content'][$this->config->get('config_language_id')],ENT_QUOTES, 'UTF-8'); ?>
	</div>
	<?php } ?>

</div>
<div class="container bottom"><div class="powered-payment">
	<div class="row">
		<div class="powered col-lg-12 col-md-12 col-sm-12 col-xs-24 animated" data-animate="fadeInUp" data-delay="100">
			<?php echo html_entity_decode($footer_powered[$this->config->get('config_language_id')],ENT_QUOTES, 'UTF-8'); ?>
		</div>

		<?php if($footer_payment['status']){ ?>
		<div class="payment col-lg-12 col-md-12 col-sm-12 col-xs-24 animated" data-animate="fadeInUp" data-delay="200">
		<ul>
			<?php if(isset($footer_payment['visa_status'])&&$footer_payment['visa_status']){ ?>
				<li><a title="Visa" href="<?php echo isset($footer_payment['visa_link'])?$footer_payment['visa_link']:'#'; ?>" class="visa"><img alt="Visa" src="image/data/<?php echo $this->config->get('config_template'); ?>/visa.png"></a></li>
			<?php } ?>
			<?php if(isset($footer_payment['master_status'])&&$footer_payment['master_status']){ ?>
				<li><a title="MasterCard" href="<?php echo isset($footer_payment['master_link'])?$footer_payment['master_link']:'#'; ?>" class="masterCard"><img alt="MasterCard" src="image/data/<?php echo $this->config->get('config_template'); ?>/master.png" /></a></li>
			<?php } ?>
			<?php if(isset($footer_payment['paypal_status'])&&$footer_payment['paypal_status']){ ?>
				<li><a title="Paypal" href="<?php echo isset($footer_payment['paypal_link'])?$footer_payment['paypal_link']:'#'; ?>" class="paypal"><img alt="Paypal" src="image/data/<?php echo $this->config->get('config_template'); ?>/paypal.png"></a></li>
			<?php } ?>
			<?php if(isset($footer_payment['merican_status'])&&$footer_payment['merican_status']){ ?>
				<li><a title="Merican" href="<?php echo isset($footer_payment['merican_link'])?$footer_payment['merican_link']:'#'; ?>" class="merican"><img alt="Merican" src="image/data/<?php echo $this->config->get('config_template'); ?>/american.png" /></a></li>
			<?php } ?>
			
			<?php if(isset($footer_payment['skrill_status'])&&$footer_payment['skrill_status']){ ?>
				<li><a title="Skrill" href="<?php echo isset($footer_payment['skrill_link'])?$footer_payment['skrill_link']:'#'; ?>" class="skrill"><img alt="Skrill" src="image/data/<?php echo $this->config->get('config_template'); ?>/skrill.png"></a></li>
			<?php } ?>
		</ul>
		</div>
		<?php } ?>
		</div>
	</div></div>
</footer>
<div id="back_top" class="back_top" title="Back To Top"><span><i class="fa fa-angle-up"></i></span></div>
 <script type="text/javascript">
        $(function(){
			$(window).scroll(function(){
				if($(this).scrollTop()>600){
				  $('#back_top').fadeIn();
				}
				else{
				  $('#back_top').fadeOut();
				}
			});
			$("#back_top").click(function (e) {
				e.preventDefault();
				$('body,html').animate({scrollTop:0},800,'swing');
			});
        });
</script> 
</div>
</body></html>