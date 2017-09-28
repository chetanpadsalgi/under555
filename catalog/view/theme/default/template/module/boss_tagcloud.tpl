<div class="box tagcloud">
    <div class="box-heading">
	   <span><?php echo $heading_title; ?></span>
    </div>
		
    <div class="box-content"> 
		<?php if($boss_tagcloud) { ?>
		  <?php echo $boss_tagcloud; ?>
		<?php } else { ?>
		  <?php echo $text_notags; ?>
		<?php } ?>
    </div>
</div>
