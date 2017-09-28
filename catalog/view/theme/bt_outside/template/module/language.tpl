<?php if (count($languages) > 1) { ?>
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
  <div id="language"><?php echo $text_language; ?>
	<?php foreach ($languages as $language) { ?>
		<?php if ($language['code'] == $language_code) { ?>
			<a title="<?php echo $language['name']; ?>"><b><?php echo $language['code']; ?></b></a>
		<?php } else { ?>
			<a title="<?php echo $language['name']; ?>" onclick="$('input[name=\'language_code\']').attr('value', '<?php echo $language['code']; ?>'); $('#language').parent().submit();"><?php echo $language['code']; ?></a>
		<?php } ?>
    <?php } ?>
    <input type="hidden" name="language_code" value="" />
    <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
  </div>
</form>
<?php } ?>
