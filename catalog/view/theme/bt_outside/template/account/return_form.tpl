<?php echo $header; ?><div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>

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
  <h1><?php echo $heading_title; ?></h1>
  <span style="margin-bottom:20px;display:block;"><?php echo $text_description; ?></span>
  <form class="return-form" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
    <h2><?php echo $text_order; ?></h2>
    <div class="content" style="margin-bottom:40px;">
      <div class="six columns alpha">
		<span class="tt_input"><?php echo $entry_firstname; ?></span><span class="required">*</span>
        <input type="text" class="form-control" name="firstname" value="<?php echo $firstname; ?>" class="large-field" />
        
        <?php if ($error_firstname) { ?>
        <span class="error"><?php echo $error_firstname; ?></span>
        <?php } ?>
       
        <span class="tt_input"><?php echo $entry_lastname; ?></span><span class="required">*</span> 
        <input type="text" class="form-control" name="lastname" value="<?php echo $lastname; ?>" class="large-field" />
        
        <?php if ($error_lastname) { ?>
        <span class="error"><?php echo $error_lastname; ?></span>
        <?php } ?>
       
        <span class="tt_input"><?php echo $entry_email; ?></span><span class="required">*</span>
        <input type="text" class="form-control" name="email" value="<?php echo $email; ?>" class="large-field" />
       
        <?php if ($error_email) { ?>
        <span class="error"><?php echo $error_email; ?></span>
        <?php } ?>
        
        <span class="tt_input"><?php echo $entry_telephone; ?></span><span class="required">*</span> 
        <input type="text" class="form-control" name="telephone" value="<?php echo $telephone; ?>" class="large-field" />
       
        <?php if ($error_telephone) { ?>
        <span class="error"><?php echo $error_telephone; ?></span>
        <?php } ?>
        
      </div>
      <div class="six columns omega">
		<span class="tt_input"><?php echo $entry_order_id; ?></span><span class="required">*</span>
        <input type="text" class="form-control" name="order_id" value="<?php echo $order_id; ?>" class="large-field" />
        
        <?php if ($error_order_id) { ?>
        <span class="error"><?php echo $error_order_id; ?></span>
        <?php } ?>
        
        <span class="tt_input"><?php echo $entry_date_ordered; ?></span>
        <input type="text" class="form-control" name="date_ordered" value="<?php echo $date_ordered; ?>" class="large-field date" />
       
      </div>
    </div>
    <h2><?php echo $text_product; ?></h2>
    <div id="return-product">
      <div class="content">
        <div class="return-product">
          <div class="return-name four columns alpha">
			<span class="tt_input"><?php echo $entry_product; ?></span><span class="required">*</span> 
            <input type="text" class="form-control" name="product" value="<?php echo $product; ?>" />
            
            <?php if ($error_product) { ?>
            <span class="error"><?php echo $error_product; ?></span>
            <?php } ?>
          </div>
          <div class="return-model four columns">
			<span class="tt_input"><?php echo $entry_model; ?></span><span class="required">*</span> 
            <input type="text" class="form-control" name="model" value="<?php echo $model; ?>" />
            
            <?php if ($error_model) { ?>
            <span class="error"><?php echo $error_model; ?></span>
            <?php } ?>
          </div>
          <div class="return-quantity four columns omega">
			<span class="tt_input"><?php echo $entry_quantity; ?></span>
            <input type="text" class="form-control" name="quantity" value="<?php echo $quantity; ?>" />
          </div>
        </div>
        <div class="return-detail">
          <div class="return-reason four columns alpha">
			<h2><?php echo $entry_reason; ?><span class="required">*</span></h2>
            <table>
              <?php foreach ($return_reasons as $return_reason) { ?>
              <?php if ($return_reason['return_reason_id'] == $return_reason_id) { ?>
              <tr>
                <td width="1"><input type="radio" name="return_reason_id" value="<?php echo $return_reason['return_reason_id']; ?>" id="return-reason-id<?php echo $return_reason['return_reason_id']; ?>" checked="checked" /></td>
                <td><label for="return-reason-id<?php echo $return_reason['return_reason_id']; ?>"><?php echo $return_reason['name']; ?></label></td>
              </tr>
              <?php } else { ?>
              <tr>
                <td width="1"><input type="radio" name="return_reason_id" value="<?php echo $return_reason['return_reason_id']; ?>" id="return-reason-id<?php echo $return_reason['return_reason_id']; ?>" /></td>
                <td><label for="return-reason-id<?php echo $return_reason['return_reason_id']; ?>"><?php echo $return_reason['name']; ?></label></td>
              </tr>
              <?php  } ?>
              <?php  } ?>
            </table>
            <?php if ($error_reason) { ?>
            <span class="error"><?php echo $error_reason; ?></span>
            <?php } ?>
          </div>
          <div class="return-opened four columns">
			<h2 style="margin-bottom:6px"><?php echo $entry_opened; ?></h2>
            <?php if ($opened) { ?>
            <input type="radio" name="opened" value="1" id="opened" checked="checked" />
            <?php } else { ?>
            <input type="radio" name="opened" value="1" id="opened" />
            <?php } ?>
           <label for="opened"> <span style="margin-right:30px;"><?php echo $text_yes; ?></span></label>
            <?php if (!$opened) { ?>
            <input type="radio" name="opened" value="0" id="unopened" checked="checked" />
            <?php } else { ?>
            <input type="radio" name="opened" value="0" id="unopened" />
            <?php } ?>
            <label for="unopened"><?php echo $text_no; ?></label>
            
           
            <br /><br /><span class="tt_input"><?php echo $entry_fault_detail; ?></span>
            <textarea class="form-control" name="comment" cols="150" rows="6"><?php echo $comment; ?></textarea>
          </div>
          <div class="return-captcha four columns omega">
			<span class="tt_input"><?php echo $entry_captcha; ?></span>
            <input type="text" class="form-control" name="captcha" value="<?php echo $captcha; ?>" />
           
            <img src="index.php?route=account/return/captcha" alt="" />
            <?php if ($error_captcha) { ?>
            <span class="error"><?php echo $error_captcha; ?></span>
            <?php } ?>
          </div>
        </div>
      </div>
    </div>
    <br/><div class="buttons" >
      <div class="left"><a href="<?php echo $back; ?>" class="btn btn_red"><?php echo $button_back; ?></a></div>
      <div class="right">
       <input type="submit" value="<?php echo $button_continue; ?>" class="btn btn_black" />
      </div>
    </div>
  </form>
  <?php echo $content_bottom; ?></div></div></div>
<script type="text/javascript"><!--
$(document).ready(function() {
	$('.date').datepicker({dateFormat: 'yy-mm-dd'});
});
//--></script> 
<script type="text/javascript"><!--
$(document).ready(function() {
	$('.colorbox').colorbox({
		width: 640,
		height: 480
	});
});
//--></script> 
<?php echo $footer; ?>