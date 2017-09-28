<?php if (!isset($redirect)) { ?>
<div class="checkout-product">
<div class="table-responsive">
  <table class="table">
    <thead>
      <tr>
        <td class="name"><?php echo $column_name; ?></td>
        <td class="model"><?php echo $column_model; ?></td>
        <td class="quantity"><?php echo $column_quantity; ?></td>
        <td class="unitprice"><?php echo $column_price; ?></td>
        <td class="total"><?php echo $column_total; ?></td>
      </tr>
    </thead>
    <tbody>
      <?php foreach ($products as $product) { ?>  
      <?php if($product['recurring']): ?>
        <tr>
            <td colspan="6" style="border:none;"><image src="catalog/view/theme/default/image/reorder.png" alt="" title="" style="float:left;" /><span style="float:left;line-height:18px; margin-left:10px;"> 
                <strong><?php echo $text_recurring_item ?></strong>
                <?php echo $product['profile_description'] ?>
            </td>
        </tr>
      <?php endif; ?>
      <tr>
        <td class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
          <?php foreach ($product['option'] as $option) { ?>
          <br />
          &nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
          <?php } ?>
          <?php if($product['recurring']): ?>
          <br />
          &nbsp;<small><?php echo $text_payment_profile ?>: <?php echo $product['profile_name'] ?></small>
          <?php endif; ?>
        </td>
        <td class="model"><?php echo $product['model']; ?></td>
        <td class="quantity"><?php echo $product['quantity']; ?></td>
        <td class="price"><?php echo $product['price']; ?></td>
        <td class="price total"><?php echo $product['total']; ?></td>
      </tr>
      <?php } ?>
      <?php foreach ($vouchers as $voucher) { ?>
      <tr>
        <td class="name"><?php echo $voucher['description']; ?></td>
        <td class="model"></td>
        <td class="quantity">1</td>
        <td class="price"><?php echo $voucher['amount']; ?></td>
        <td class="price total"><?php echo $voucher['amount']; ?></td>
      </tr>
      <?php } ?>
    </tbody>
   
  </table>
  </div>
</div>
<div class="cart-total">
    <table id="total">
      <?php foreach ($totals as $total) { ?>
      <tr>
        <td class="left <?php echo ($total==end($totals)? ' last': ''); ?>" style="width:auto;"><b><?php echo $total['title']; ?>:</b></td>
        <td class="right price <?php echo ($total==end($totals)? ' last': ''); ?>" style="width:auto;"><?php echo $total['text']; ?></td>
      </tr>
      <?php } ?>
    </table>
</div>
<div class="payment"><?php echo $payment; ?></div>
<?php } else { ?>
<script type="text/javascript"><!--
location = '<?php echo $redirect; ?>';
//--></script> 
<?php } ?>