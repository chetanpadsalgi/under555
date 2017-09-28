<div class="box box_alphabet not-animated" data-animate="fadeInLeft" data-delay="100">
  <div class="box-heading"><span><?php echo $heading_title; ?></span></div>
  <div class="box-content">
    <div class="boss-alphabet">
      <ul>
        <?php foreach ($alphabet as $char) { ?>
        <li><a href="<?php echo $char['href']; ?>"><span><?php echo $char['char']; ?></span></a></li>
        <?php } ?>
      </ul>
	</div>
  </div>
</div>
