<div class="box block tagcloud not-animated" data-animate="fadeInUp" data-delay="300">
		<div class="box-heading block-title">
			<span><?php echo $heading_title; ?></span>
		</div>
		
		<div class="box-content block-content" > 
			<?php if($blogtagcloud) { ?>
				<?php echo $blogtagcloud; ?>
			<?php } else { ?>
				<?php echo $text_notags; ?>
			<?php } ?>
		</div>
</div>