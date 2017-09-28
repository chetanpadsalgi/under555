<!--module boss - fillter product-->
<?php if(!empty($tabs)){ ?>
<div id="boss_homefilter_tabs<?php echo $module; ?>" class="boss_homefilter_tabs">
	<?php if($use_tab){ ?>
	<section id="taboptions" class="clearfix not-animated" data-animate="fadeInUp" data-delay="100">
		<ul id="homefilter" class="option-set clearfix" data-option-key="filter">
			<?php foreach ($tabs as $numTab => $tab) { ?>
				 <li><a href="#filter" data-option-value=".<?php echo $tab['value']; ?>"><?php echo $tab['title']; ?></a></li>
			<?php } ?>
		</ul>
	</section>
	<?php }?>
	
	<div id="filtercontainer<?php echo $module; ?>" class="clearfix">
	<div class="filtercontainer not-animated" data-animate="fadeInUp" data-delay="100">
		<?php if(!$use_tab){ ?>
		<?php foreach ($tabs as $numTab => $tab) { ?>
			<div class="tabcontainer tabcontainer<?php echo $numTab; ?> col-lg-8 col-md-8 col-sm-8 col-xs-24">
			<div class="tab-title"><h3><?php echo $tab['title']; ?></h3></div>
			<div class="tab-items">
			<?php foreach ($tab['products'] as $key => $product){?>
				<div class="item">
					<?php if ($product['thumb']) { ?>
					<div class="image">
					<a class="cs_img"  data-id="<?php echo $product['product_id']; ?>"  href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>"/></a>
					</div>
					<?php } ?>
					<div class="caption">
					<div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
					<?php if ($product['rating']) { ?>
					<div class="rating"><img src="catalog/view/theme/<?php echo $template; ?>/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
					<?php } ?>
					<?php if ($product['price']) { ?>
					<div class="price">
					  <?php if (!$product['special']) { ?>
					  <?php echo $product['price']; ?>
					  <?php } else { ?>
					  <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
					  <?php } ?>
					</div>
					<?php } ?>
					<div class="cart"><input type="button" value="<?php echo $button_cart; ?>" onclick="boss_addToCart('<?php echo $product['product_id']; ?>');" class="btn btn-cart" /></div>
					</div>
				</div>
			<?php } ?>
				</div></div>
			<?php } ?>
		<?php }else{ ?>
			<?php foreach ($products as $key => $product){?>
				<div class="element <?php echo $product['value']; ?>">
					<?php if ($product['thumb']) { ?>
					<div class="image">
					<a class="cs_img"  data-id="<?php echo $product['product_id']; ?>"  href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>"/>
					
					</a>
					</div>
					<?php } ?>
					<div class="caption">
					<div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
					<?php if ($product['rating']) { ?>
					<div class="rating"><img src="catalog/view/theme/<?php echo $template; ?>/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
					<?php } ?>
					<?php if ($product['price']) { ?>
					<div class="price">
					  <?php if (!$product['special']) { ?>
					  <?php echo $product['price']; ?>
					  <?php } else { ?>
					  <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
					  <?php } ?>
					</div>
					<?php } ?>
					<div class="cart"><input type="button" value="<?php echo $button_cart; ?>" onclick="boss_addToCart('<?php echo $product['product_id']; ?>');" class="btn btn-cart" /></div>
					</div>
				</div>
			<?php } ?>	
		<?php } ?>
		</div>
	</div>
	
</div>
<?php if($use_tab){ ?>
<script>
	var $container = $('#filtercontainer<?php echo $module; ?>');
	var $optionSets = $('#taboptions .option-set');
       
	$(window).load(function(){
		var $optionLinkfirst = $optionSets.find("a").first();
		var $this = $optionLinkfirst;
		var $optionSet = $this.parents('.option-set');
		$optionSet.find('.selected').removeClass('selected');
		$this.addClass('selected');
		var options = {},
			key = $optionSet.attr('data-option-key'),
			value = $this.attr('data-option-value');
		// parse 'false' as false boolean
		value = value === 'false' ? false : value;
		options[ key ] = value;
		if ( key === 'layoutMode' && typeof changeLayoutMode === 'function' ) {
		  // changes in layout modes need extra logic
		  changeLayoutMode( $this, options )
		} else {
		  // otherwise, apply new options
		  $container.isotope( options );
		}
	});
	
	
    $(function(){

      $container.isotope({
        itemSelector : '.element'
      });
	  var $optionLinks = $optionSets.find('a');	
      $optionLinks.click(function(){
        var $this = $(this);
        // don't proceed if already selected
        if ( $this.hasClass('selected') ) {
          return false;
        }
        var $optionSet = $this.parents('.option-set');
        $optionSet.find('.selected').removeClass('selected');
        $this.addClass('selected');
  
        // make option object dynamically, i.e. { filter: '.my-filter-class' }
        var options = {},
            key = $optionSet.attr('data-option-key'),
            value = $this.attr('data-option-value');
        // parse 'false' as false boolean
        value = value === 'false' ? false : value;
        options[ key ] = value;
        if ( key === 'layoutMode' && typeof changeLayoutMode === 'function' ) {
          // changes in layout modes need extra logic
          changeLayoutMode( $this, options )
        } else {
          // otherwise, apply new options
          $container.isotope( options );
        }
        
        return false;
      });

      
    });
</script>
<?php } ?>
<?php } ?>
<!--module boss - fillter product-->