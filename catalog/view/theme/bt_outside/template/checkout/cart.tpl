<?php echo $header; ?><div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row"><?php echo $column_left; ?><?php echo $column_right; ?>
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
  <h1 style="margin-bottom:35px;"><?php echo $heading_title; ?>
    <?php if ($weight) { ?>
    &nbsp;(<?php echo $weight; ?>)
    <?php } ?>
  </h1>
  <?php if ($attention) { ?>
<div class="attention"><?php echo $attention; ?><img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>
<?php } ?>
<?php if ($success) { ?>
<div class="success"><?php echo $success; ?><img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>
<?php } ?>
<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?><img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>
<?php } ?>
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
    <div class="table-responsive cart-info">
      <table class="table">
        <thead>
          <tr>
		  <td class="image"></td>
            <td class="name"><?php echo $column_name; ?></td>
            <td class="model"><?php echo $column_model; ?></td>
            
           
			<td class="product_price"><?php echo $column_price; ?></td>
			<td class="quantity"><?php echo $column_quantity; ?></td>
            <td class="total"><?php echo $column_total; ?></td>
			<td class="remove"><?php echo $button_remove; ?></td>
		
          </tr>
        </thead>
        <tbody>
          <?php foreach ($products as $key =>  $product) { ?>
            <?php if($product['recurring']): ?>
              <tr>
                  <td colspan="6" style="border:none;"><image src="catalog/view/theme/default/image/reorder.png" alt="" title="" style="float:left;margin-top:13px;" /><span style="float:left;line-height:18px; margin-left:10px;margin-top:13px;"> 
                      <strong><?php echo $text_recurring_item ?></strong>
                      <?php echo $product['profile_description'] ?>
                  </td>
                </tr>
            <?php endif; ?>
			
          <tr class="<?php if($key==0){ echo 'first';} ?><?php if($product==end($products) && !$vouchers){echo ' last';} ?>" >
		  
            <td class="image"><?php if ($product['thumb']) { ?>
              <span><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a></span>
              <?php } ?></td>
            <td class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
              <?php if (!$product['stock']) { ?>
              <span class="stock">***</span>
              <?php } ?>
              <div>
                <?php foreach ($product['option'] as $option) { ?>
                - <small><?php echo $option['name']; ?>: <?php echo $option['value']; ?></small><br />
                <?php } ?>
                <?php if($product['recurring']): ?>
                - <small><?php echo $text_payment_profile ?>: <?php echo $product['profile_name'] ?></small>
                <?php endif; ?>
              </div>
              <?php if ($product['reward']) { ?>
              <small><?php echo $product['reward']; ?></small>
              <?php } ?></td>
            <td class="model"><?php echo $product['model']; ?></td>
            
            <td class="product_price"><span class="price"><?php echo $product['price']; ?></span></td>
			<td class="quantity"><input type="text" name="quantity[<?php echo $product['key']; ?>]" value="<?php echo $product['quantity']; ?>" size="1" />
              &nbsp;
               <div class="icon">
			  <input type="image" src="catalog/view/theme/default/image/update.png" alt="<?php echo $button_update; ?>" title="<?php echo $button_update; ?>" />
              &nbsp;</div></td>
            <td class="total"><span class="price"><?php echo $product['total']; ?></span></td>
			<td class="remove"><a href="<?php echo $product['remove']; ?>"><img src="catalog/view/theme/default/image/remove.png" alt="<?php echo $button_remove; ?>" title="<?php echo $button_remove; ?>" /></a></td>
          </tr>
          <?php } ?>
		  <?php $count_voucher = count($vouchers); ?>
          <?php foreach ($vouchers as $key => $vouchers) { ?>
		<tr class="<?php if($key==0 && !$products){ echo 'first';} ?><?php if($key==($count_voucher-1)){echo ' last';} ?>">
            <td class="image"></td>
            <td class="name"><?php echo $vouchers['description']; ?></td>
            <td class="model"></td>
            
            <td class="product_price"><span class="price"><?php echo $vouchers['amount']; ?></span></td>
			<td class="quantity"><input type="text" name="" value="1" size="1" disabled="disabled" />
              &nbsp;<div class="icon"></div></td>
            <td class="total"><span class="price"><?php echo $vouchers['amount']; ?></span></td>
			<td class="remove"><a href="<?php echo $vouchers['remove']; ?>"><img src="catalog/view/theme/default/image/remove.png" alt="<?php echo $button_remove; ?>" title="<?php echo $button_remove; ?>" /></a></td>
          </tr>
          <?php } ?>
        </tbody>
      </table>
    </div>
  </form>
  <?php if ($coupon_status || $voucher_status || $reward_status || $shipping_status) { ?>
  <h2 class="text_next_cart" style="margin-bottom:23px;"><?php echo $text_next; ?></h2>
  <div class="cart_content">
    <p style="margin-bottom:9px;"><?php echo $text_next_choice; ?></p>
    <table class="radio">
      <?php if ($coupon_status) { ?>
      <tr class="highlight">
        <td style="margin-bottom:9px;display:inline-block;"><?php if ($next == 'coupon') { ?>
          <input type="radio" name="next" value="coupon" id="use_coupon" checked="checked" style="margin-bottom:0px;vertical-align:-1px;" />
          <?php } else { ?>
          <input type="radio" name="next" value="coupon" id="use_coupon" style="margin-bottom:0px;vertical-align:-1px;" />
          <?php } ?></td>
        <td style="margin-bottom:9px;display:inline-block;"><label for="use_coupon"><?php echo $text_use_coupon; ?></label></td>
      </tr>
      <?php } ?>
      <?php if ($voucher_status) { ?>
      <tr class="highlight">
        <td style="margin-bottom:9px;display:inline-block;"><?php if ($next == 'voucher') { ?>
          <input type="radio" name="next" value="voucher" id="use_voucher" checked="checked" style="margin-bottom:0px;vertical-align:-1px;" />
          <?php } else { ?>
          <input type="radio" name="next" value="voucher" id="use_voucher" style="margin-bottom:0px;vertical-align:-1px;" />
          <?php } ?></td>
        <td style="margin-bottom:9px;display:inline-block;"><label for="use_voucher"><?php echo $text_use_voucher; ?></label></td>
      </tr>
      <?php } ?>
      <?php if ($reward_status) { ?>
      <tr class="highlight">
        <td style="margin-bottom:9px;display:inline-block;"><?php if ($next == 'reward') { ?>
          <input type="radio" name="next" value="reward" id="use_reward" checked="checked" style="margin-bottom:0px;vertical-align:-1px;" />
          <?php } else { ?>
          <input type="radio" name="next" value="reward" id="use_reward" style="margin-bottom:0px" />
          <?php } ?></td>
        <td style="margin-bottom:9px;display:inline-block;"><label for="use_reward"><?php echo $text_use_reward; ?></label></td>
      </tr>
      <?php } ?>
      <?php if ($shipping_status) { ?>
      <tr class="highlight">
        <td style="margin-bottom:9px;display:inline-block;"><?php if ($next == 'shipping') { ?>
          <input type="radio" name="next" value="shipping" id="shipping_estimate" checked="checked" style="margin-bottom:0px;vertical-align:-1px;" />
          <?php } else { ?>
          <input type="radio" name="next" value="shipping" id="shipping_estimate" style="margin-bottom:0px;vertical-align:-1px;" />
          <?php } ?></td>
        <td style="margin-bottom:9px;display:inline-block;"><label for="shipping_estimate"><?php echo $text_shipping_estimate; ?></label></td>
      </tr>
      <?php } ?>
    </table>
  </div>
  <div class="cart-module">
    <div id="coupon" class="content" style="display: <?php echo ($next == 'coupon' ? 'block' : 'none'); ?>;">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
        <span style="display:block;margin-bottom: 26px;"><?php echo $entry_coupon; ?></span>
        <input type="text" name="coupon" value="<?php echo $coupon; ?>" />
        <input type="hidden" name="next" value="coupon" />
        </br></br><input type="submit" value="<?php echo $button_coupon; ?>" class="btn btn-primary" />
      </form>
    </div>
    <div id="voucher" class="content" style="display: <?php echo ($next == 'voucher' ? 'block' : 'none'); ?>;">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
        <span style="display:block;margin-bottom: 26px;"><?php echo $entry_voucher; ?></span>
        <input type="text" name="voucher" value="<?php echo $voucher; ?>" />
        <input type="hidden" name="next" value="voucher"/> 
        </br></br><input type="submit" value="<?php echo $button_voucher; ?>" class="btn btn-primary" />
      </form>
    </div>
    <div id="reward" class="content" style="display: <?php echo ($next == 'reward' ? 'block' : 'none'); ?>;">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
        <?php echo $entry_reward; ?>&nbsp;
        <input type="text" name="reward" value="<?php echo $reward; ?>" />
        <input type="hidden" name="next" value="reward" />
         <input type="submit" value="<?php echo $button_reward; ?>" class="btn btn-primary" />
      </form>
    </div>
    <div id="shipping" class="content" style="display: <?php echo ($next == 'shipping' ? 'block' : 'none'); ?>;">
      <span style="display:block;margin-bottom: 26px;"><?php echo $text_shipping_detail; ?></span>
      <table>
        <tr>
          <td class="module_cart_sh"><span class="tt_input"><?php echo $entry_country; ?></span> <span class="required">*</span> </td></tr>
          <tr><td><select class="form-control" name="country_id">
              <option value=""><?php echo $text_select; ?></option>
              <?php foreach ($countries as $country) { ?>
              <?php if ($country['country_id'] == $country_id) { ?>
              <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
              <?php } ?>
              <?php } ?>
            </select></td>
        </tr>
        <tr>
          <td class="module_cart_sh"><span class="tt_input"><?php echo $entry_zone; ?></span> <span class="required">*</span> </td></tr>
         <tr><td><select class="form-control" name="zone_id">
            </select></td>
        </tr>
        <tr>
          <td class="module_cart_sh"><span class="tt_input"><?php echo $entry_postcode; ?></span> <span id="postcode-required" class="required">*</span> </td></tr>
          <tr><td><input class="form-control" type="text" name="postcode" value="<?php echo $postcode; ?>" /></td>
		 </tr>
		 <tr><td></br><input type="button" value="<?php echo $button_quote; ?>" id="button-quote" class="btn btn-primary" /></td></tr>
      </table>
    </div>
  </div>
  <?php } ?>
  
  
 <div class="cart-total">
    <table id="total">
      <?php foreach ($totals as $total) { ?>
      <tr>
        <td class="left <?php echo ($total==end($totals)? ' last': ''); ?>"><b><?php echo $total['title']; ?>:</b></td>
        <td class="right <?php echo ($total==end($totals)? ' last': ''); ?>"><?php echo $total['text']; ?></td>
      </tr>
      <?php } ?>
    </table>
  </div>
  <div class="buttons">
    <div class="right checkout_cart"><a href="<?php echo $checkout; ?>" class="btn btn_red"><?php echo $button_checkout; ?></a></div>
	<div class="left continueshopping"><a href="<?php echo $continue; ?>" class="btn btn_black"><?php echo $button_shopping; ?></a></div>
  </div>
  
  
  <?php echo $content_bottom; ?></div></div></div>
<script type="text/javascript"><!--
$('input[name=\'next\']').bind('change', function() {
	$('.cart-module > div').hide();
	
	$('#' + this.value).show();
});
//--></script>
<?php if ($shipping_status) { ?>
<script type="text/javascript"><!--
$('#button-quote').live('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/quote',
		type: 'post',
		data: 'country_id=' + $('select[name=\'country_id\']').val() + '&zone_id=' + $('select[name=\'zone_id\']').val() + '&postcode=' + encodeURIComponent($('input[name=\'postcode\']').val()),
		dataType: 'json',		
		beforeSend: function() {
			$('#button-quote').attr('disabled', true);
			$('#button-quote').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
		},
		complete: function() {
			$('#button-quote').attr('disabled', false);
			$('.wait').remove();
		},		
		success: function(json) {
			$('.success, .warning, .attention, .error').remove();			
						
			if (json['error']) {
				if (json['error']['warning']) {
					$('#notification').html('<div class="warning" style="display: none;">' + json['error']['warning'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
					
					$('.warning').fadeIn('slow');
					
					$('html, body').animate({ scrollTop: 0 }, 'slow'); 
				}	
							
				if (json['error']['country']) {
					$('select[name=\'country_id\']').after('<span class="error">' + json['error']['country'] + '</span>');
				}	
				
				if (json['error']['zone']) {
					$('select[name=\'zone_id\']').after('<span class="error">' + json['error']['zone'] + '</span>');
				}
				
				if (json['error']['postcode']) {
					$('input[name=\'postcode\']').after('<span class="error">' + json['error']['postcode'] + '</span>');
				}					
			}
			
			if (json['shipping_method']) {
				html  = '<h2><?php echo $text_shipping_method; ?></h2>';
				html += '<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">';
				html += '  <table class="radio">';
				html += '<tr>';
					html += '  <td colspan="3"><b>Shipment Options</b></td>';
					html += '</tr>';
				for (i in json['shipping_method']) {
					
				
					if (!json['shipping_method'][i]['error']) {
						for (j in json['shipping_method'][i]['quote']) {
							html += '<tr class="highlight">';
							
							if (json['shipping_method'][i]['quote'][j]['code'] == '<?php echo $shipping_method; ?>') {
								html += '<td><input type="radio" name="shipping_method" value="' + json['shipping_method'][i]['quote'][j]['code'] + '" id="' + json['shipping_method'][i]['quote'][j]['code'] + '" checked="checked" /></td>';
							} else {
								html += '<td><input type="radio" name="shipping_method" value="' + json['shipping_method'][i]['quote'][j]['code'] + '" id="' + json['shipping_method'][i]['quote'][j]['code'] + '" /></td>';
							}
								
							html += '  <td><label for="' + json['shipping_method'][i]['quote'][j]['code'] + '">' + json['shipping_method'][i]['quote'][j]['title'] + '</label></td>';
							html += '  <td style="text-align: right;"><label for="' + json['shipping_method'][i]['quote'][j]['code'] + '">' + json['shipping_method'][i]['quote'][j]['text'] + '</label></td>';
							html += '</tr>';
						}		
					} else {
						html += '<tr>';
						html += '  <td colspan="3"><div class="error">' + json['shipping_method'][i]['error'] + '</div></td>';
						html += '</tr>';						
					}
				}
				
				html += '  </table>';
				html += '  <br />';
				html += '  <input type="hidden" name="next" value="shipping" />';
				
				<?php if ($shipping_method) { ?>
				html += '  <input type="submit" value="<?php echo $button_shipping; ?>" id="button-shipping" class="btn" />';	
				<?php } else { ?>
				html += '  <input type="submit" value="<?php echo $button_shipping; ?>" id="button-shipping" class="btn" disabled="disabled" />';	
				<?php } ?>
							
				html += '</form>';
				
				$.colorbox({
					overlayClose: true,
					opacity: 0.5,
					width: '60%',
					height: '70%',
					href: false,
					html: html
				});
				
				$('input[name=\'shipping_method\']').bind('change', function() {
					$('#button-shipping').attr('disabled', false);
				});
			}
		}
	});
});
//--></script> 
<script type="text/javascript"><!--
$('select[name=\'country_id\']').bind('change', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/country&country_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('select[name=\'country_id\']').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
		},
		complete: function() {
			$('.wait').remove();
		},			
		success: function(json) {
			if (json['postcode_required'] == '1') {
				$('#postcode-required').show();
			} else {
				$('#postcode-required').hide();
			}
			
			html = '<option value=""><?php echo $text_select; ?></option>';
			
			if (json['zone'] != '') {
				for (i = 0; i < json['zone'].length; i++) {
        			html += '<option value="' + json['zone'][i]['zone_id'] + '"';
	    			
					if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
	      				html += ' selected="selected"';
	    			}
	
	    			html += '>' + json['zone'][i]['name'] + '</option>';
				}
			} else {
				html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
			}
			
			$('select[name=\'zone_id\']').html(html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('select[name=\'country_id\']').trigger('change');
//--></script>
<?php } ?>
<?php echo $footer; ?>
