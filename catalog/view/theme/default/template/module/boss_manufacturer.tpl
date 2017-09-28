<div class="box b_manufacture not-animated" data-animate="fadeInLeft" data-delay="100">
	<div class="box-heading"> <?php echo $heading_title; ?> </div>
	<div class="box-content">
    <label>
	<select class="boss_select" onchange="location = this.value">
      <option value=""><?php echo $text_manufacturer; ?></option>
      <?php foreach ($manufacturers as $manufacturer) { ?>
      <?php if ($manufacturer['manufacturer_id'] == $manufacturer_id) { ?>
      <option value="<?php echo $manufacturer['href']; ?>" selected="selected"><?php echo $manufacturer['name']; ?></option>
      <?php } else { ?>
      <option value="<?php echo $manufacturer['href']; ?>"><?php echo $manufacturer['name']; ?></option>
      <?php } ?>
      <?php } ?>
    </select>
	</label>
	</div>
</div>