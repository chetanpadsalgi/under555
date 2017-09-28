<div id="cart" class="dropdown_cart">
 <h4 class="title"><?php echo $heading_title; ?></h4>	
  <button type="button" data-toggle="dropdown" onclick="$('#cart').load('index.php?route=module/cart #cart > *');" class="btn-dropdown-cart dropdown-toggle"><span id="cart-total"><?php echo $text_items; ?></span></button>
  <ul class="dropdown-menu pull-right">  
	<h3 class="title"><?php echo $heading_title; ?></h3>	
    <?php if ($products || $vouchers) { ?>
    <li>
      <table class="table table-striped">
        <?php foreach ($products as $product) { ?>
        <tr>
          <td class="text-center">
				<div class="image">
					<?php if ($product['thumb']) { ?>
					<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" /></a>
					<?php } ?>
					
				</div>
				
			</td>
          <td class="text-left name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
            <?php if ($product['option']) { ?>
            <br />
            <?php foreach ($product['option'] as $option) { ?>
            - <small><?php echo $option['name']; ?> <?php echo $option['value']; ?></small><br />
            <?php } ?>
            <?php } ?>
			<div class="quantity_cart"><span class="price"><?php echo $product['total']; ?> x <?php echo $product['quantity']; ?></span></div>
		</td>
		<td><div class="remove"><button type="button" onclick="(getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') ? location = 'index.php?route=checkout/cart&remove=<?php echo $product['key']; ?>' : $('#cart').load('index.php?route=module/cart&remove=<?php echo $product['key']; ?>' + ' #cart > *');" title="<?php echo $button_remove; ?>" class="btn-danger"><i class="fa fa-times"></i></button></div></td>
          
          
         
        </tr>
       <?php } ?>
		<?php foreach ($vouchers as $voucher) { ?>
        <tr class="voucher">
          <td class="text-center">
		  <div class="image">
			
		  </div>
		  </td>
          <td class="text-left">
			<div>
			<div class="description">
				<?php echo $voucher['description']; ?>
			</div>
			<div class="quantity_cart"><span class="price"><?php echo $voucher['amount']; ?> x 1 </span></div>
			<div>
		  </td>
		  <td><div class="remove">
				<button type="button" onclick="(getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') ? location = 'index.php?route=checkout/cart&remove=<?php echo $voucher['key']; ?>' : $('#cart').load('index.php?route=module/cart&remove=<?php echo $voucher['key']; ?>' + ' #cart > *');" title="<?php echo $button_remove; ?>" class="btn-danger"><i class="fa fa-times"></i></button>
			</div></td>
        
          
         
        </tr>
        <?php } ?>
        
      </table>
    </li>
    <li>
      <div>
        <table class="minicart_total">
          <?php foreach ($totals as $total) { ?>
          <tr>
            <td class="text-left <?php echo ($total==end($totals) ? ' last' : ''); ?>"><span><?php echo $total['title']; ?></span></td>
            <td class="text-right <?php echo ($total==end($totals) ? ' last' : ''); ?>"><?php echo $total['text']; ?></td>
          </tr>
          <?php } ?>
        </table>
        <div class="buttons">
			<span class="cart_bt"><a class="btn btn_black" href="<?php echo $cart; ?>"><?php echo $text_cart; ?></a></span>		
			<span class="checkout_bt"><a class="btn " href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a></span>
		</div>
      </div>
    </li>
    <?php } else { ?>
    <li><p class="text-center"><?php echo $text_empty; ?></p></li>
    <?php } ?>
  </ul>
</div>
