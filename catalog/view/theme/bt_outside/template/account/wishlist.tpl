<?php echo $header; ?><div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>


  <div class="row">
  <?php $column_left  = trim($column_left);
	$column_right  = trim($column_right); ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-24'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-24'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-24'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
  <h1 class="h1margin"><?php echo $heading_title; ?></h1>
  <?php if ($success) { ?>
<div class="success"><?php echo $success; ?><img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>
<?php } ?>
  <?php if ($products) { ?>
 
 <div class="table-responsive wishlist-info">
    <table class="table">
      <thead>
        <tr>
		 <td class="image"></td>
          <td class="name"><?php echo $column_name; ?></td>
        
		  
          <td class="model"><?php echo $column_model; ?></td>		  		       
		  <td class="product_price"><?php echo $column_price; ?></td>
		  <td class="stock"><?php echo $column_stock; ?></td>
          <td class="action"><?php echo $button_cart; ?></td>
		  <td class="remove"><?php echo $button_remove; ?></td>
         
        </tr>
      </thead>
      <?php foreach ($products as $count => $product) { ?>
      <tbody <?php if($count==0){echo 'class="first"';} ?>id="wishlist-row<?php echo $product['product_id']; ?>">
        <tr>
          <td class="image<?php echo ($product==end($products) ? ' last' : ''); ?>"><?php if ($product['thumb']) { ?>
            <a href="<?php echo $product['href']; ?>"><span><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></span></a>
            <?php } ?></td>
			
          <td class="name<?php echo ($product==end($products) ? ' last' : ''); ?>"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></td>
		  
          <td class="model<?php echo ($product==end($products) ? ' last' : ''); ?>"><?php echo $product['model']; ?></td>
		   
		  <td class="product_price<?php echo ($product==end($products) ? ' last' : ''); ?>"><?php if ($product['price']) { ?>
            <div class="price<?php echo ($product==end($products) ? ' last' : ''); ?>">
              <?php if (!$product['special']) { ?>
              <?php echo $product['price']; ?>
              <?php } else { ?>
              <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
              <?php } ?>
            </div>
            <?php } ?></td>
			<td class="stock<?php echo ($product==end($products) ? ' last' : ''); ?>"><?php echo $product['stock']; ?></td>
		 
		  
          
          <td class="action<?php echo ($product==end($products) ? ' last' : ''); ?>"><input type="button" class="btn btn-cart" onclick="boss_addToCart('<?php echo $product['product_id']; ?>');" value="<?php echo $button_cart; ?>"></td>
		  <td class="remove<?php echo ($product==end($products) ? ' last' : ''); ?>"><a href="<?php echo $product['remove']; ?>"><img src="catalog/view/theme/bt_outside/image/remove.png" alt="<?php echo $button_remove; ?>" title="<?php echo $button_remove; ?>" /></a></td>
          
        </tr>
      </tbody>
      <?php } ?>
    </table>
  </div>
  <div class="buttons">
    <div class="right"><br/><a href="<?php echo $continue; ?>" class="btn "><span class="button_fr"><?php echo $button_continue; ?></span></a></div>
  </div>
  <?php } else { ?>
  <div class="content"><?php echo $text_empty; ?></div>
  <div class="buttons">
    <div class="left"><a href="<?php echo $continue; ?>" class="btn btn-primary"><span class="button_fr"><?php echo $button_continue; ?></span></a></div>
  </div>
  <?php } ?>
  <?php echo $content_bottom; ?></div></div></div>
<?php echo $footer; ?>