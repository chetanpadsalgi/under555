<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
<meta charset="UTF-8" />
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content="<?php echo $keywords; ?>" />
<?php } ?>
<meta content="width=device-width, initial-scale=1, maximum-scale=1" name="viewport">
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<link href='http://fonts.googleapis.com/css?family=Roboto:400,500,700' rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/stylesheet/bossthemes/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/stylesheet/bossthemes/bootstrap-custom.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/stylesheet/bossthemes/swipebox.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/stylesheet/bossthemes/jquery.jgrowl.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/stylesheet/stylesheet.css" />
<?php $b_show_animate = $this->config->get('b_show_animate'); ?>
<?php if (isset($b_show_animate) && $b_show_animate ==1) {  ?>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/stylesheet/bossthemes/cs.animate.css" />
<?php } ?>
<?php foreach ($styles as $style) { ?>
<link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>

<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/stylesheet/bossthemes/responsive.css" />
<script type="text/javascript" src="catalog/view/javascript/jquery/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css" />
<script type="text/javascript" src="catalog/view/javascript/bossthemes/jquery.jgrowl.js"></script>
<script type="text/javascript" src="catalog/view/javascript/bossthemes/bootstrap.min.js"></script>
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="catalog/view/javascript/common.js"></script>
<script type="text/javascript" src="catalog/view/javascript/bossthemes/bossthemes.js"></script>
<?php foreach ($scripts as $script) { ?>
<script type="text/javascript" src="<?php echo $script; ?>"></script>
<?php } ?>
<script type="text/javascript" src="catalog/view/javascript/bossthemes/getwidthbrowser.js"></script>
<script type="text/javascript" src="catalog/view/javascript/bossthemes/jquery.appear.js"></script>
<script type="text/javascript" src="catalog/view/javascript/bossthemes/jquery.smoothscroll.js"></script>
<script type="text/javascript" src="catalog/view/javascript/bossthemes/jquery.swipebox.js"></script>
 <!--[if lt IE 9]>
  <script type="text/javascript" src="catalog/view/javascript/bossthemes/html5shiv.js"></script>
<script type="text/javascript" src="catalog/view/javascript/bossthemes/respond.min.js"></script>
<![endif]-->
<!--[if IE 8]>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/stylesheet/ie8.css" />
<![endif]-->
<!--[if IE 9]>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/stylesheet/ie9.css" />
<![endif]-->
<!--[if IE 7]> 
<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/stylesheet/ie7.css" />
<![endif]-->
<!--[if lt IE 7]>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/stylesheet/ie6.css" />
<script type="text/javascript" src="catalog/view/javascript/DD_belatedPNG_0.0.8a-min.js"></script>
<script type="text/javascript">
DD_belatedPNG.fix('#logo img');
</script>
<![endif]-->
<link href='http://fonts.googleapis.com/css?family=Lato:300,400,700,900,400italic' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700' rel='stylesheet' type='text/css'>

<script>  
if (/*@cc_on!@*/false) {  
    document.documentElement.className+=' ie10';  
}  
</script>

<?php include "catalog/view/theme/".$this->config->get('config_template')."/template/bossthemes/Boss_font_setting.php"; ?>
<?php include "catalog/view/theme/".$this->config->get('config_template')."/template/bossthemes/Boss_color_setting.php"; ?>
<?php if ($stores) { ?>
<script type="text/javascript"><!--
$(document).ready(function() {
<?php foreach ($stores as $store) { ?>
$('body').prepend('<iframe src="<?php echo $store; ?>" style="display: none;"></iframe>');
<?php } ?>
});
//--></script>
<?php } ?>
<?php echo $google_analytics; ?>
</head>
<?php 
	$array = (explode('/',$_SERVER['REQUEST_URI']));
	$end = end($array);
	if($end == "index.php" || $end == "home" || $end == ""){
		$home_page='home_page';
	}else{
		$home_page="other_page";
	}
?>
<body class="<?php echo $home_page; ?>">
<?php 
require_once( DIR_TEMPLATE.$this->config->get('config_template')."/template/bossthemes/boss_library.php" );
$helper = ThemeControlHelper::getInstance( $this->registry,$this->config->get('config_template'));
?>

<div id="page-container">
<header id="page-header">
	<div class="header-top">
		<div class="container">
			<div class="row">
				<div class="left col-md-10 col-sm-8 col-xs-24">
					<?php if(isset($boss_login)){ ?>
						<?php echo $boss_login; ?>
					<?php } ?>
				</div>
				<div class="right col-md-14 col-sm-16 col-xs-24">
					
					<div class="language_currency">
						<?php echo $language; ?>
						<?php echo $currency; ?>
					</div>
					<div class="link">
						<a href="<?php echo $home; ?>"><span><?php echo $text_home; ?></span></a>
						<a href="<?php echo $wishlist; ?>" id="wishlist-total"><span><?php echo $text_wishlist; ?></span></a>
						<a href="<?php echo $account; ?>"><span><?php echo $text_account; ?></span></a>
						<a href="<?php echo $shopping_cart; ?>"><span><?php echo $text_shopping_cart; ?></span></a>
						<a href="<?php echo $checkout; ?>"><span><?php echo $text_checkout; ?></span></a>
					</div>
				</div>
			</div>
		</div>
	</div>
   <div class="container">
    <div class="row">
		<div class="header-content ">
		<div class="col-md-6 col-sm-6 col-xs-24">
			<div class="row">
			<?php if ($logo) { ?>
			<div id="logo"><a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a></div>
			<?php } ?>
			</div>
		</div>
		<div class="col-md-12 col-sm-12 col-xs-24">
		<div class="boss_search">
			<?php
			$modules =$helper->getModulesByPosition('header'); 
			if($modules ){
				foreach ($modules as $module) { 
					echo $module; 
				} 
			} 
			?>
			<div id="search">
				<div class="button-search"></div>
				<input type="text" name="search" placeholder="<?php echo $text_search; ?>" value="<?php echo $search; ?>" />
			</div>
		</div>		
		</div>
		<div class="col-md-6 col-sm-6 col-xs-24">
				<?php echo $cart; ?>
		</div>
		</div>
  </div>
  </div>
</header>

<!-- megamenu position-->
<div class="menubar">
<div class="container">
	<div class="row">
	<div class="bossmenu">
		<?php	
		$modules =$helper->getModulesByPosition('mainmenu'); 
		if( $modules ){
			foreach ($modules as $module) { 
				 echo $module; 
			} 
		}?>
		
	</div>
	</div>
</div>
</div>
<div class="container">
<?php if ($error) { ?>
    
    <div class="warning"><?php echo $error ?><img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>
    
<?php } ?>
<div id="notification"></div>
</div>
<!-- Slideshow Position-->
<?php
	$modules =$helper->getModulesByPosition('slideshow'); 
	if( $modules ){
		foreach ($modules as $module) { 
			echo $module; 
		} 
	} 
?>
