
<div class="left">
  <h2><?php echo $text_your_details; ?></h2>
  <span class="tt_input"><?php echo $entry_firstname; ?></span><span class="required">*</span> <br />
  <input type="text" class="form-control" name="firstname" value="" class="large-field" />

 
  <span class="tt_input"><?php echo $entry_lastname; ?></span><span class="required">*</span> <br />
  <input type="text" class="form-control" name="lastname" value="" class="large-field" />

 
  <span class="tt_input"><?php echo $entry_email; ?></span><span class="required">*</span> <br />
  <input type="text" class="form-control" name="email" value="" class="large-field" />

  
  <span class="tt_input"><?php echo $entry_telephone; ?></span><span class="required">*</span> <br />
  <input type="text" class="form-control" name="telephone" value="" class="large-field" />

 
  <span class="tt_input"><?php echo $entry_fax; ?></span><br />
  <input type="text" class="form-control" name="fax" value="" class="large-field" />
<br />
 
  <h2 class="block_pass"><?php echo $text_your_password; ?></h2>
  <span class="tt_input"><?php echo $entry_password; ?></span><span class="required">*</span> <br />
  <input type="password" class="form-control" name="password" value="" class="large-field" />

  
  <span class="tt_input"><?php echo $entry_confirm; ?></span><span class="required">*</span>  <br />
  <input type="password" class="form-control" name="confirm" value="" class="large-field" />

  
</div>
<div class="right">
  <h2><?php echo $text_your_address; ?></h2>
  <span class="tt_input"><?php echo $entry_company; ?></span><br />
  <input type="text" class="form-control" name="company" value="" class="large-field" />

  
  <div style="display: <?php echo (count($customer_groups) > 1 ? 'table-row' : 'none'); ?>;">
  <?php echo $entry_customer_group; ?><br />
  <?php foreach ($customer_groups as $customer_group) { ?>
  <?php if ($customer_group['customer_group_id'] == $customer_group_id) { ?>
  <input type="radio" name="customer_group_id" value="<?php echo $customer_group['customer_group_id']; ?>" id="customer_group_id<?php echo $customer_group['customer_group_id']; ?>" checked="checked" />
  <label for="customer_group_id<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></label>
  <br />
  <?php } else { ?>
  <input type="radio" name="customer_group_id" value="<?php echo $customer_group['customer_group_id']; ?>" id="customer_group_id<?php echo $customer_group['customer_group_id']; ?>" />
  <label for="customer_group_id<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></label>
  <br />
  <?php } ?>
  <?php } ?>
  <br />
</div>
<div id="company-id-display"><span class="tt_input"><?php echo $entry_company_id; ?></span><span id="company-id-required" class="required">*</span> <br />
  <input type="text" class="form-control" name="company_id" value="" class="large-field" />

 
</div>
<div id="tax-id-display"><span class="tt_input"><?php echo $entry_tax_id; ?></span><span id="tax-id-required" class="required">*</span> <br />
  <input type="text" class="form-control" name="tax_id" value="" class="large-field" />

 
</div>
<span class="tt_input"><?php echo $entry_address_1; ?></span><span class="required">*</span> <br />
<input type="text" class="form-control" name="address_1" value="" class="large-field" />


<span class="tt_input"><?php echo $entry_address_2; ?></span><br />
<input type="text" class="form-control" name="address_2" value="" class="large-field" />


<span class="tt_input"><?php echo $entry_city; ?></span><span class="required">*</span> <br />
<input type="text" class="form-control" name="city" value="" class="large-field" />


<span class="tt_input"><?php echo $entry_postcode; ?></span><span id="payment-postcode-required" class="required">*</span> <br />
<input type="text" class="form-control" name="postcode" value="<?php echo $postcode; ?>" class="large-field" />


<span class="tt_input"><?php echo $entry_country; ?></span><span class="required">*</span> <br />
<select name="country_id" class="form-control">
  <option value=""><?php echo $text_select; ?></option>
  <?php foreach ($countries as $country) { ?>
  <?php if ($country['country_id'] == $country_id) { ?>
  <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
  <?php } else { ?>
  <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
  <?php } ?>
  <?php } ?>
</select>


<span class="tt_input"><?php echo $entry_zone; ?></span><span class="required">*</span> <br />
<select name="zone_id" class="form-control">
</select>


<br />
</div>

<div class="ck_footer">
<div style="clear: both; padding-top: 8px;">
  <div style="margin-bottom:5px;"><input type="checkbox" name="newsletter" value="1" id="newsletter" />
  <label for="newsletter"><?php echo $entry_newsletter; ?></label></div>

  <?php if ($shipping_required) { ?>
  
  <div style="margin-bottom:5px;"><input type="checkbox" name="shipping_address" value="1" id="shipping" checked="checked" />
  <label for="shipping"><?php echo $entry_shipping; ?></label></div>
 

  <?php } ?>
  
</div>
<?php if ($text_agree) { ?>
<div class="buttons">
  <div class="left">
    <input type="checkbox" name="agree" value="1" style="margin-right:5px;" /><?php echo $text_agree; ?></br></br>
    <input type="button" value="<?php echo $button_continue; ?>" id="button-register" class="btn" style="margin-top:10px;"/>
  </div>
</div>
<?php } else { ?>
<div class="buttons">
  <div class="left">
    <span class="button_fr_ip"><input type="button" value="<?php echo $button_continue; ?>" id="button-register" class="btn" /></span>
  </div>
</div>
</div>
<?php } ?>
<script type="text/javascript"><!--
$('#payment-address input[name=\'customer_group_id\']:checked').live('change', function() {
	var customer_group = [];
	
<?php foreach ($customer_groups as $customer_group) { ?>
	customer_group[<?php echo $customer_group['customer_group_id']; ?>] = [];
	customer_group[<?php echo $customer_group['customer_group_id']; ?>]['company_id_display'] = '<?php echo $customer_group['company_id_display']; ?>';
	customer_group[<?php echo $customer_group['customer_group_id']; ?>]['company_id_required'] = '<?php echo $customer_group['company_id_required']; ?>';
	customer_group[<?php echo $customer_group['customer_group_id']; ?>]['tax_id_display'] = '<?php echo $customer_group['tax_id_display']; ?>';
	customer_group[<?php echo $customer_group['customer_group_id']; ?>]['tax_id_required'] = '<?php echo $customer_group['tax_id_required']; ?>';
<?php } ?>	

	if (customer_group[this.value]) {
		if (customer_group[this.value]['company_id_display'] == '1') {
			$('#company-id-display').show();
		} else {
			$('#company-id-display').hide();
		}
		
		if (customer_group[this.value]['company_id_required'] == '1') {
			$('#company-id-required').show();
		} else {
			$('#company-id-required').hide();
		}
		
		if (customer_group[this.value]['tax_id_display'] == '1') {
			$('#tax-id-display').show();
		} else {
			$('#tax-id-display').hide();
		}
		
		if (customer_group[this.value]['tax_id_required'] == '1') {
			$('#tax-id-required').show();
		} else {
			$('#tax-id-required').hide();
		}	
	}
});

$('#payment-address input[name=\'customer_group_id\']:checked').trigger('change');
//--></script> 
<script type="text/javascript"><!--
$('#payment-address select[name=\'country_id\']').bind('change', function() {
	if (this.value == '') return;
	$.ajax({
		url: 'index.php?route=checkout/checkout/country&country_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('#payment-address select[name=\'country_id\']').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
		},
		complete: function() {
			$('.wait').remove();
		},			
		success: function(json) {
			if (json['postcode_required'] == '1') {
				$('#payment-postcode-required').show();
			} else {
				$('#payment-postcode-required').hide();
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
			
			$('#payment-address select[name=\'zone_id\']').html(html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('#payment-address select[name=\'country_id\']').trigger('change');
//--></script> 
 <script type="text/javascript"><!--
$(document).ready(function() {
	$('.colorbox').colorbox({
    width: '90%', 
    height: '90%',
    maxWidth: 640,
    maxHeight: 480
	});
});
//--></script>  