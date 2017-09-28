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
 <div class="voucher_fr boss_margin">
  <h1><?php echo $heading_title; ?></h1>
  <p><?php echo $text_description; ?></p>
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
    <table class="form">
      <tr>
        <td><?php echo $entry_to_name; ?><span class="required">*</span> </td></tr>
        <tr><td><input type="text" class="form-control" name="to_name" value="<?php echo $to_name; ?>" />
          <?php if ($error_to_name) { ?>
          <span class="error"><?php echo $error_to_name; ?></span>
          <?php } ?></td>
      </tr>
      <tr>
        <td><?php echo $entry_to_email; ?><span class="required">*</span> </td></tr>
        <tr><td><input type="text" class="form-control" name="to_email" value="<?php echo $to_email; ?>" />
          <?php if ($error_to_email) { ?>
          <span class="error"><?php echo $error_to_email; ?></span>
          <?php } ?></td>
      </tr>
      <tr>
        <td><?php echo $entry_from_name; ?><span class="required">*</span> </td></tr>
        <tr><td><input type="text" class="form-control" name="from_name" value="<?php echo $from_name; ?>" />
          <?php if ($error_from_name) { ?>
          <span class="error"><?php echo $error_from_name; ?></span>
          <?php } ?></td>
      </tr>
      <tr>
        <td><?php echo $entry_from_email; ?><span class="required">*</span> </td></tr>
        <tr><td><input type="text" class="form-control" name="from_email" value="<?php echo $from_email; ?>" />
          <?php if ($error_from_email) { ?>
          <span class="error"><?php echo $error_from_email; ?></span>
          <?php } ?></td>
      </tr>
      <tr>
        <td class ="gift"><?php echo $entry_theme; ?><span class="required">*</span> </td></tr>
        <tr><td class="radio"><?php foreach ($voucher_themes as $voucher_theme) { ?>
          <?php if ($voucher_theme['voucher_theme_id'] == $voucher_theme_id) { ?>
          <span style="display:block;"><input type="radio" name="voucher_theme_id" value="<?php echo $voucher_theme['voucher_theme_id']; ?>" id="voucher-<?php echo $voucher_theme['voucher_theme_id']; ?>" checked="checked" />
          <label for="voucher-<?php echo $voucher_theme['voucher_theme_id']; ?>"><?php echo $voucher_theme['name']; ?></label></span>
          <?php } else { ?>
          <span style="display:block;"><input type="radio" name="voucher_theme_id" value="<?php echo $voucher_theme['voucher_theme_id']; ?>" id="voucher-<?php echo $voucher_theme['voucher_theme_id']; ?>" />
          <label for="voucher-<?php echo $voucher_theme['voucher_theme_id']; ?>"><?php echo $voucher_theme['name']; ?></label></span>
          <?php } ?>
      
          <?php } ?>
          <?php if ($error_theme) { ?>
          <span class="error"><?php echo $error_theme; ?></span>
          <?php } ?></td>
      </tr>
      <tr>
        <td class="message"><?php echo $entry_message; ?></td></tr>
        <tr><td><textarea class="form-control" name="message" cols="40" rows="5"><?php echo $message; ?></textarea></td>
      </tr>
      <tr>
        <td><span class="required">*</span><?php echo $entry_amount; ?></td></tr>
        <tr><td><input type="text" class="form-control" name="amount" value="<?php echo $amount; ?>" size="5" />
          <?php if ($error_amount) { ?>
          <span class="error"><?php echo $error_amount; ?></span>
          <?php } ?></td>
      </tr>
    </table>
    <div class="buttons">
      <div class="left">
        <?php if ($agree) { ?>
        <input type="checkbox" name="agree" value="1" checked="checked" />
        <?php } else { ?>
        <input type="checkbox" name="agree" value="1" />
        <?php } ?><?php echo $text_agree; ?>
        </br></br></br><span class="button_fr_ip"><input type="submit" value="<?php echo $button_continue; ?>" class="btn" /></span>
      </div>
    </div>
  </form>
  <?php echo $content_bottom; ?></div></div></div></div>
<?php echo $footer; ?>