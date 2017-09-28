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
    <div class="content">
      <table class="form">
        <tr>
          <td class="entry_news"><?php echo $entry_newsletter; ?></td></tr>
          <tr><td><?php if ($newsletter) { ?>
            <input type="radio" name="newsletter" value="1" checked="checked" />
            <span style="margin-right:30px;"><?php echo $text_yes; ?>&nbsp;</span>
            <input type="radio" name="newsletter" value="0" />
            <span><?php echo $text_no; ?></span>
            <?php } else { ?>
            <input type="radio" name="newsletter" value="1" />
             <span style="margin-right:30px;"><?php echo $text_yes; ?>&nbsp;</span>
            <input type="radio" name="newsletter" value="0" checked="checked" />
            <span><?php echo $text_no; ?></span>
            <?php } ?></td>
        </tr>
      </table>
    </div>
    <div class="buttons">
      <div class="left"><a href="<?php echo $back; ?>" class="btn"><?php echo $button_back; ?></a></div>
      <div class="right"><input type="submit" value="<?php echo $button_continue; ?>" class="btn" /></div>
    </div>
  </form>
  </div>
  <?php echo $content_bottom; ?></div></div></div>
<?php echo $footer; ?>