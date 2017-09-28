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
  <h1><?php echo $heading_title; ?></h1>
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
    <h2><?php echo $text_location; ?></h2>
    <div class="contact-info">
      <div class="content"><div class="left" style="margin-bottom:15px;"><b><?php echo $text_address; ?></b><br />
        <?php echo $store; ?><br />
        <?php echo $address; ?></div>
      <div class="right" style="margin-bottom:15px;">
        <?php if ($telephone) { ?>
        <b><?php echo $text_telephone; ?></b><br />
        <?php echo $telephone; ?><br />
        <br />
        <?php } ?>
        <?php if ($fax) { ?>
        <span><?php echo $text_fax; ?></span><br />
        <?php echo $fax; ?>
        <?php } ?>
      </div>
    </div>
    </div>
    <h2><?php echo $text_contact; ?></h2>
    <div class="content">
    <span><?php echo $entry_name; ?></span><br />
    <input type="text" class="form-control" name="name" value="<?php echo $name; ?>" />
   
    <?php if ($error_name) { ?>
    <span class="error"><?php echo $error_name; ?></span>
    <?php } ?>
    
    <span><?php echo $entry_email; ?></span><br />
    <input type="text" class="form-control" name="email" value="<?php echo $email; ?>" />
    
    <?php if ($error_email) { ?>
    <span class="error"><?php echo $error_email; ?></span>
    <?php } ?>
    
    <span><?php echo $entry_enquiry; ?></span><br />
    <textarea class="form-control" name="enquiry" cols="40" rows="10"><?php echo $enquiry; ?></textarea>
    
    <?php if ($error_enquiry) { ?>
    <span class="error"><?php echo $error_enquiry; ?></span>
    <?php } ?>
    <br />
    <span><?php echo $entry_captcha; ?></span><br />
    <input type="text" class="form-control" name="captcha" value="<?php echo $captcha; ?>" />
    <br />
    <img src="index.php?route=information/contact/captcha" alt="" />
    <?php if ($error_captcha) { ?>
    <span class="error"><?php echo $error_captcha; ?></span>
    <?php } ?>
    </div>
	<br/>
    <div class="buttons">
      <div class="left"><input type="submit" value="<?php echo $button_continue; ?>" class="btn" /></div>
    </div>
  </form>
  <?php echo $content_bottom; ?></div></div></div>
<?php echo $footer; ?>