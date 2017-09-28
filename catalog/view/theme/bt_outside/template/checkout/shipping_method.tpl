<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<?php if ($shipping_methods) { ?>
<p><?php echo $text_shipping_method; ?></p>
<table class="radio">
   <tr>
    <td colspan="2"><h2><?php echo 'Shipment Options.'; ?></h2></td>
  </tr>
  <?php foreach ($shipping_methods as $shipping_method) { ?>

  <?php if (!$shipping_method['error']) { ?>
  <?php foreach ($shipping_method['quote'] as $quote) { ?>
 <tr class="highlight">
    <td style="display:block;"><?php if ($quote['code'] == $code || !$code) { ?>
      <?php $code = $quote['code']; ?>
      <input type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>" id="<?php echo $quote['code']; ?>" checked="checked" />
      <?php } else { ?>
      <input type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>" id="<?php echo $quote['code']; ?>" />
      <?php } ?></td>
    <td><label for="<?php echo $quote['code']; ?>" style="margin-right:4px;"><?php echo $quote['title']; ?></label></td>
    <td style="text-align: right;"><label for="<?php echo $quote['code']; ?>"><?php echo $quote['text']; ?></label></td>
  </tr>
  <?php } ?>
  <?php } else { ?>
  <tr>
    <td colspan="3"><div class="error"><?php echo $shipping_method['error']; ?></div></td>
  </tr>
  <?php } ?>
  <?php } ?>
</table>

<?php } ?>
<span><?php echo $text_comments; ?></span>
<textarea class="form-control" name="comment" rows="8" ><?php echo $comment; ?></textarea>
<br />

<div class="buttons">
  <div class="left">
    <input type="button" value="<?php echo $button_continue; ?>" id="button-shipping-method" class="btn" />
  </div>
</div>


