<?php echo $header; ?>
<div class="container">
<ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
<div class="row"><?php echo $column_left; ?>
	<?php $column_left  = trim($column_left);
	$column_right  = trim($column_right); ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-18'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-24'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
  
  <h1><?php echo $heading_title; ?></h1>
  <b><?php echo $text_critea; ?></b><br/><br/>
  <div class="content">
    <?php echo $entry_search; ?>
      <?php if ($search) { ?>
      <input type="text" class="form-control" name="search" value="<?php echo $search; ?>" />
      <?php } else { ?>
      <input type="text" class="form-control" name="search" value="<?php echo $search; ?>" onclick="this.value = '';" onkeydown="this.style.color = '000000'" style="color: #999;" />
      <?php } ?>
      <select name="category_id" class="form-control">
        <option value="0"><?php echo $text_category; ?></option>
        <?php foreach ($categories as $category_1) { ?>
        <?php if ($category_1['category_id'] == $category_id) { ?>
        <option value="<?php echo $category_1['category_id']; ?>" selected="selected"><?php echo $category_1['name']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $category_1['category_id']; ?>"><?php echo $category_1['name']; ?></option>
        <?php } ?>
        <?php foreach ($category_1['children'] as $category_2) { ?>
        <?php if ($category_2['category_id'] == $category_id) { ?>
        <option value="<?php echo $category_2['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $category_2['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
        <?php } ?>
        <?php foreach ($category_2['children'] as $category_3) { ?>
        <?php if ($category_3['category_id'] == $category_id) { ?>
        <option value="<?php echo $category_3['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $category_3['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
        <?php } ?>
        <?php } ?>
        <?php } ?>
        <?php } ?>
      </select>
      <?php if ($sub_category) { ?>
      <input type="checkbox" name="sub_category" value="1" id="sub_category" checked="checked" />
      <?php } else { ?>
      <input type="checkbox" name="sub_category" value="1" id="sub_category" />
      <?php } ?>
      <label for="sub_category"><?php echo $text_sub_category; ?></label><br />
    
    <?php if ($description) { ?>
    <input type="checkbox" name="description" value="1" id="description" checked="checked" />
    <?php } else { ?>
    <input type="checkbox" name="description" value="1" id="description" />
    <?php } ?>
    <label for="description"><?php echo $entry_description; ?></label>
  </div>
  <div class="buttons">
    <div class="left" style="width:100%;margin-bottom:18px;"><input type="button" value="<?php echo $button_search; ?>" id="button-search" class="btn btn-primary" /></div>
  </div>
  <h2><?php echo $text_search; ?></h2>
  <?php if ($products) { ?>

	<div class="product-filter not-animated" data-animate="fadeInUp" data-delay="300">
	<div class="display_box">	
	<div class="limit-sort">
		<div class="sort">
		<span class="tt_input"><?php echo $text_sort; ?></span>
          <label>
		  <select id="input-sort" onchange="location = this.value;">
            <?php foreach ($sorts as $sorts) { ?>
            <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
            <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
            <?php } ?>
            <?php } ?>
          </select>
		  </label>
        </div>
        <div class="text-control-label">
          <label class="control-label" for="input-limit"><?php echo $text_limit; ?></label>
        </div>
        <div class="limit">
		<span class="tt_input"><?php echo $text_limit; ?></span>
          <label>
		  <select id="input-limit" onchange="location = this.value;">
            <?php foreach ($limits as $limits) { ?>
            <?php if ($limits['value'] == $limit) { ?>
            <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
            <?php } ?>
            <?php } ?>
          </select>
		  </label>
        </div>
		</div>
          <div class="display">
            <button type="button" id="list-view" class="btn-list" title="<?php echo $text_list; ?>"></button>
            <button type="button" id="grid-view" class="btn-grid" title="<?php echo $text_grid; ?>"></button>
         
        </div>
		<div class="product-compare">
		<a href="<?php echo $compare; ?>" id="compare-total"><h2><?php echo $text_compare; ?></h2></a>
		</div>
		</div>
        <div class="text-control-label">
          <label class="control-label" for="input-sort"><?php echo $text_sort; ?></label>
        </div>
       
      </div>
	
 
  <div class="row">
        <?php foreach ($products as $product) { ?>
        <div class="product-layout product-list col-xs-24">
          <div class="product-thumb">
            <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
            <div class="info">
              <div class="caption">
                <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
				 <?php if ($product['rating']) { ?>
				  <div class="rating"><img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
				 <?php } ?>
                <?php if ($product['price']) { ?>
                <div class="price">
                  <?php if (!$product['special']) { ?>
                  <?php echo $product['price']; ?>
                  <?php } else { ?>
                  <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
                  <?php } ?>
                  <?php if ($product['tax']) { ?>
                  <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                  <?php } ?>
                </div>
                <?php } ?>
				  <div class="description"><p><?php echo $product['description']; ?></p></div>
              </div>
              <div class="button-group">
                <div class="cart">
				<button class="btn btn-cart"type="button" onclick="boss_addToCart('<?php echo $product['product_id']; ?>');"><span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
				</div>
				<div class="compare_wishlist">
                 <div class="compare"><a onclick="boss_addToCompare('<?php echo $product['product_id']; ?>');"><i class="fa fa-plus"></i><?php echo $button_compare; ?></a></div>
				<div class="wishlist"><a onclick="boss_addToWishList('<?php echo $product['product_id']; ?>');"><i class="fa fa-plus"></i><?php echo $button_wishlist; ?></a></div>
				</div>
              </div>
            </div>
          </div>
        </div>
        <?php } ?>
    </div>
  <div class="pagination"><?php echo $pagination; ?></div>
  <?php } else { ?>
  <div class="content"><?php echo $text_empty; ?></div>
  <?php }?>
  <?php echo $content_bottom; ?></div><?php echo $column_right; ?>
</div></div>
<script type="text/javascript"><!--
$('#content input[name=\'search\']').keydown(function(e) {
	if (e.keyCode == 13) {
		$('#button-search').trigger('click');
	}
});

$('select[name=\'category_id\']').bind('change', function() {
	if (this.value == '0') {
		$('input[name=\'sub_category\']').attr('disabled', 'disabled');
		$('input[name=\'sub_category\']').removeAttr('checked');
	} else {
		$('input[name=\'sub_category\']').removeAttr('disabled');
	}
});

$('select[name=\'category_id\']').trigger('change');

$('#button-search').bind('click', function() {
	url = 'index.php?route=product/search';
	
	var search = $('#content input[name=\'search\']').attr('value');
	
	if (search) {
		url += '&search=' + encodeURIComponent(search);
	}

	var category_id = $('#content select[name=\'category_id\']').attr('value');
	
	if (category_id > 0) {
		url += '&category_id=' + encodeURIComponent(category_id);
	}
	
	var sub_category = $('#content input[name=\'sub_category\']:checked').attr('value');
	
	if (sub_category) {
		url += '&sub_category=true';
	}
		
	var filter_description = $('#content input[name=\'description\']:checked').attr('value');
	
	if (filter_description) {
		url += '&description=true';
	}

	location = url;
});

//--></script> 
<script type="text/javascript"><!--

$('#list-view').click(function() {
	listclick();
});

$('#grid-view').click(function() {
	gridclick();
});

view = $.totalStorage('display');
if (view && (view == 'list')) {
	listclick();
}else{
	gridclick();
}

function listclick(){
	$('#content .product-layout > .clearfix').remove();
	$('#content .product-layout').attr('class', 'product-layout product-list col-xs-24');
	var class_product = loadcache();
	$('#content .product-list .image').attr('class', 'image col-lg-'+class_product+' col-md-'+class_product+' col-sm-'+class_product+' col-xs-24');
	$('#grid-view').attr('class','btn-grid');
	$('#list-view').attr('class','btn-list active');
	document.getElementById("grid-view").disabled = false; 
	document.getElementById("list-view").disabled = true; 
	$.totalStorage('display', 'list');
}
function loadcache(){
	var jsprefix = 'oc11_';
	class_array_new = $.totalStorage(jsprefix + 'changeProductView');
	<?php $b_Layout_Settings = explode(',', $this->config->get('b_Layout_Setting')); ?>
	if(class_array_new){
		class_product_arr = class_array_new[2].split("-");
	}else{
		class_product_arr1 = '<?php echo $b_Layout_Settings[2] ; ?>';
		class_product_arr = class_product_arr1.split("-");
		
	}
	
	
	cols = $('#column-right, #column-left').length;
	
	if(class_product_arr){
		if (cols == 2) {
			var class_product = class_product_arr[2];
		} else if (cols == 1) {
			var class_product = class_product_arr[1];
		} else {
			var class_product = class_product_arr[0];
		}
	}else{
		var class_product = '6';
	}
	
	return class_product;
}
function gridclick(){
	var class_product = loadcache();
	$('#content .product-layout > .clearfix').remove();
	
	$('#content .product-layout').attr('class', 'product-layout product-grid col-lg-'+class_product+' col-md-'+class_product+' col-sm-'+class_product+' col-xs-24');
	$('#content .product-grid .image').attr('class', 'image');
	$('#grid-view').attr('class','btn-grid active');
	document.getElementById("grid-view").disabled = true; 
	document.getElementById("list-view").disabled = false; 
	$('#list-view').attr('class','btn-list');
	$.totalStorage('display', 'grid');
}
//--></script>
<?php echo $footer; ?>