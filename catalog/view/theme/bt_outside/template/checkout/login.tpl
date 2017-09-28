<div class="login-content">

<div class="left">
  <h2><?php echo $text_new_customer; ?></h2>
  <p><b><?php echo $text_checkout; ?></b></p>
  <label for="register">
    <?php if ($account == 'register') { ?>
    <input type="radio" name="account" value="register" id="register" checked="checked" />
    <?php } else { ?>
    <input type="radio" name="account" value="register" id="register" />
    <?php } ?>
    <span><?php echo $text_register; ?></span></label>
  <br />
  <?php if ($guest_checkout) { ?>
  <label for="guest">
    <?php if ($account == 'guest') { ?>
    <input type="radio" name="account" value="guest" id="guest" checked="checked" />
    <?php } else { ?>
    <input type="radio" name="account" value="guest" id="guest" />
    <?php } ?>
    <span><?php echo $text_guest; ?></span></label>
  
  <?php } ?>
  <br />
  <br />
  <p><?php echo $text_register_account; ?></p>
  <br /><input type="button" value="<?php echo $button_continue; ?>" id="button-account" class="btn btn_black" />
  <br />
  <br />
</div>
<div id="login" class="right">
  <h2><?php echo $text_returning_customer; ?></h2>
  <p><b><?php echo $text_i_am_returning_customer; ?></b></p>
  <span><?php echo $entry_email; ?></span><span class="required"> *</span>
  <input type="text" class="form-control" name="email" value="" />
  

  <span><?php echo $entry_password; ?></span><span class="required"> *</span><br />
  <input type="password" class="form-control" name="password" value="" />
 
 
  <br /><input type="button" style=" float: left;margin-right: 20px;"value="<?php echo $button_login; ?>" id="button-login" class="btn btn_red" style="margin-top:7px" />
   <a class="forgotten" href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a>
  <br />
</div>
</div>
