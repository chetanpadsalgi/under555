<?php echo $header; ?>
<div class="container">
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
    <div id="content" class="<?php echo $class; ?> rss-content"><?php echo $content_top; ?>
    <div class="rss-title">
    </div>
    <div class="box-content">
        <table border="0" style="text-align:left">
        <tr><td colspan="2"><strong><span><?php echo $heading_title; ?></span></strong></td></tr>
        <tr>
            <td><a href="http://192.168.1.177/bossmodules/trunk/site/index.php?route=bossblog/bossblog&rss=bossblog"><img border="0" src="catalog/view/theme/default/image/bossblog/rss.png" /></a></td>
            <td><a href="http://192.168.1.177/bossmodules/trunk/site/index.php?route=bossblog/bossblog&rss=bossblog"><b>Boss Blog</b></a></td>
        </tr>
        <tr><td colspan="2"><strong><span>RSS Blog Categories</span></strong></td></tr>
        <?php foreach ($categories as $category) { ?>
        <tr>
            <td><a href="<?php echo $category['href']; ?>"><img border="0" src="catalog/view/theme/default/image/bossblog/rss.png" /></a></td>
            <td><a href="<?php echo $category['href']; ?>"><b><?php echo $category['name']; ?></a></td>
        </tr>
        <?php if ($category['children']) { ?>
        <?php foreach ($category['children'] as $child) { ?>
        <tr>
            <td class="child"><a href="<?php echo $child['href']; ?>"><img border="0" src="catalog/view/theme/default/image/bossblog/rss.png" /></a></td>
            <td class="child"><a href="<?php echo $child['href']; ?>"><b><?php echo $child['name']; ?></a></td>
        </tr>
        <?php } ?>
        <?php } ?>
         <?php } ?>
        </table>
     </div>   
</div></div></div>
<?php echo $footer; ?>
