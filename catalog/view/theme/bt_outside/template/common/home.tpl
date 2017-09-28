<?php echo $header; ?>
<?php $column_left  = trim($column_left);$column_right  = trim($column_right); ?>
<div class="container home_product"><div class="row">
<?php echo $column_left; ?><?php echo $column_right; ?>
	<?php if ($column_left && $column_right) { ?>
	<div id="content" class="col-sx-24 col-sm-12 col-md-12">
	<?php }else if ($column_left || $column_right) { ?>
	<div id="content" class="col-sx-24 col-sm-18 col-md-18">
	<?php }else { ?>
	<div id="content" class="col-sx-24 col-sm-24 col-md-24">
	<?php } ?><?php echo $content_top; ?><?php echo $content_bottom; ?></div>   
</div></div>
<?php echo $footer; ?>