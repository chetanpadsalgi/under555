<?php echo $header; ?><div class="container">
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
  <?php echo $text_message; ?>
  <div class="buttons">
    <div class="left"><br/><a href="<?php echo $continue; ?>" class="btn"><?php echo $button_continue; ?></a></div>
  </div>
  <?php echo $content_bottom; ?></div><?php echo $column_right; ?></div></div>
<?php echo $footer; ?>