<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<?php if ($payment_methods) { ?>
<p><?php echo $text_payment_method; ?></p>
<table class="radio" style="margin-bottom:18px;">
  <?php foreach ($payment_methods as $payment_method) { ?>
  <tr class="highlight">
    <td style="display:block;"><?php if ($payment_method['code'] == $code || !$code) { ?>
      <?php $code = $payment_method['code']; ?>
      <input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" id="<?php echo $payment_method['code']; ?>" checked="checked" />
      <?php } else { ?>
      <input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" id="<?php echo $payment_method['code']; ?>" />
      <?php } ?></td>
    <td><label for="<?php echo $payment_method['code']; ?>"><?php echo $payment_method['title']; ?></label></td>
  </tr>
  <?php } ?>
</table>

<?php } ?>
<span><?php echo $text_comments; ?></span>
<textarea class="form-control" name="comment" rows="8" ><?php echo $comment; ?></textarea>


<?php if ($text_agree) { ?>
<div class="buttons">
  <div class="">
    <?php if ($agree) { ?>
    <input type="checkbox" name="agree" value="1" checked="checked" />
    <?php } else { ?>
    <input type="checkbox" name="agree" value="1" />
    <?php } ?><?php echo $text_agree; ?><br/></br>
    <span class="button_fr_ip"><input type="button" value="<?php echo $button_continue; ?>" id="button-payment-method" class="btn" style="margin-top:8px;" /></span>
  </div>
</div>
<?php } else { ?>
<div class="buttons">
  <div class="left">
    <span class="button_fr_ip"><input type="button" value="<?php echo $button_continue; ?>" id="button-payment-method" class="btn" /></span>
  </div>
</div>
<?php } ?>
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



