<?php echo $header; ?>
<div id="content">
<div class="breadcrumb">
  <?php foreach ($breadcrumbs as $breadcrumb) { ?>
  <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
  <?php } ?>
</div>
<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<div class="box">
  <div class="heading">
    <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
    <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><?php echo $button_cancel; ?></a></div>
  </div>
  <div class="content">
   <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
		<div class="vtabs" id="filterTabs">
		<?php $module_row_t = 0;?>
		<?php foreach($modules as $module) {?>
			<a href="#tab<?php echo $module_row_t ; ?>" id="tabtitle<?php echo $module_row_t ; ?>"><?php echo $text_module; echo $module_row_t + 1;?>&nbsp;<img src="view/image/delete.png" alt="" 
			onclick="$('.vtabs a:first').trigger('click'); $('#tabtitle<?php echo $module_row_t; ?>').remove(); $('#tab<?php echo $module_row_t; ?>').remove(); return false;" /></a>
			<?php $module_row_t++; ?>
		<?php } ?>
		
			<span class="addModule"><?php echo $button_add_module; ?> &nbsp;<img src="view/image/add.png" alt="" onclick="addModule();"/></span>
		</div>
		<?php $module_row_c = 0;?>
		<?php foreach ($modules as $key=>$module) {?>
		<div id="tab<?php echo $module_row_c;?>" class="vtabs-content">
			<div id="tabcontent<?php echo $key;?>" class="htabs">
				<a href="#moduletab<?php echo $module_row_c;?>"><?php echo $module_tab; ?></a>
				<a href="#modulesetting<?php echo $module_row_c;?>"><?php echo $module_setting; ?></a>
			</div>
				<div id="modulesetting<?php echo $module_row_c;?>" class="htabs-content">
			<table class="form">
					
					<tr><td><?php echo $entry_image; ?></td>
					<td class="left"><input type="text" name="boss_filterproduct_module[<?php echo $module_row_c;?>][image_width]" value="<?php echo (isset($module['image_width']) ? $module['image_width'] : '') ?>" size="3" /> <input type="text" name="boss_filterproduct_module[<?php echo $module_row_c;?>][image_height]" value="<?php echo (isset($module['image_height']) ? $module['image_height'] : '') ?>" size="3" /> <?php if (isset($error_image[$module_row_c])) { ?>
					<span class="error"><?php echo $error_image[$module_row_c]; ?></span>
					<?php } ?></td></tr>
					
					<tr><td><?php echo $entry_limit; ?></td><td class="left">
					<input type="text" name="boss_filterproduct_module[<?php echo $module_row_c;?>][limit]" value="<?php echo (isset($module['limit']) ? $module['limit'] : '') ?>" size="3" /><?php if (isset($error_numproduct[$module_row_c])) { ?>
					<span class="error"><?php echo $error_numproduct[$module_row_c]; ?></span>
					<?php } ?></td>
					</tr>
					
					<tr><td><?php echo $entry_tab; ?></td><td class="left">
				    <select name="boss_filterproduct_module[<?php echo $module_row_c;?>][use_tab]">
				    <option value="1" <?php if($module['use_tab'] == 1) echo "selected=selected";?>><?php echo $text_enabled; ?></option>
				    <option value="0" <?php if($module['use_tab'] == 0) echo "selected=selected";?>><?php echo $text_disabled; ?></option>
				    </select></td></tr>
					
					<tr><td><?php echo $entry_layout; ?></td><td class="left">
					<select name="boss_filterproduct_module[<?php echo $module_row_c;?>][layout_id]">
					<?php foreach($layouts as $layout) {?>
					<option value="<?php echo $layout['layout_id']?>" <?php if($module['layout_id']== $layout['layout_id']) echo "selected=selected";?>><?php echo addslashes($layout['name']); ?></option>
					<?php } ?>
					</select></td></tr>
					
					 <tr><td><?php echo $entry_position; ?></td><td class="left">
					  <select name="boss_filterproduct_module[<?php echo $module_row_c;?>][position]">
					  <option value="content_top" <?php if($module['position']== "content_top") echo "selected=selected";?> ><?php echo $text_content_top; ?></option>
					  <option value="content_bottom" <?php if($module['position']== "content_bottom") echo "selected=selected";?>><?php echo $text_content_bottom; ?></option>
					 <option value="column_left" <?php if($module['position']== "column_left") echo "selected=selected";?>><?php echo $text_column_left; ?></option>
					  <option value="column_right" <?php if($module['position']== "column_right") echo "selected=selected";?>><?php echo $text_column_right; ?></option>
					  </select></td></tr>
					
					<tr><td><?php echo $entry_status; ?></td><td class="left">
					<select name="boss_filterproduct_module[<?php echo $module_row_c;?>][status]">
					<option value="1" <?php if($module['status']== 1) echo "selected=selected";?>><?php echo $text_enabled; ?></option>
					<option value="0" <?php if($module['status']== 0) echo "selected=selected";?>><?php echo $text_disabled; ?></option>
					</select></td></tr>
					
					<tr><td><?php echo $entry_sort_order; ?></td><td class="left"><input type="text" name="boss_filterproduct_module[<?php echo $module_row_c;?>][sort_order]" value="<?php echo $module['sort_order'];?>" size="3" /></td></tr>
					
					<tr><td><?php echo $entry_width_column; ?></td><td class="left"><input type="text" name="boss_filterproduct_module[<?php echo $module_row_c;?>][width_column]" value="<?php echo $module['width_column'];?>" size="3" /></td></tr>
					
					<tr>
						<td><?php echo $entry_store; ?></td>
						<td><div class="scrollbox">
						  <?php $class = 'even'; ?>
						  <div class="<?php echo $class; ?>">
							<?php if (isset($module['store_id']) && in_array(0, $module['store_id'])) { ?>
							<input type="checkbox" name="boss_filterproduct_module[<?php echo $module_row_c;?>][store_id][]" value="0" checked="checked" />
							<?php } else { ?>
							<input type="checkbox" name="boss_filterproduct_module[<?php echo $module_row_c;?>][store_id][]" value="0" />
							<?php } ?>
							<?php echo $text_default; ?>
						  </div>
						  <?php foreach ($stores as $store) { ?>
						  <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
						  <div class="<?php echo $class; ?>">
							<?php if (isset($module['store_id']) && in_array($store['store_id'], $module['store_id'])) { ?>
							<input type="checkbox" name="boss_filterproduct_module[<?php echo $module_row_c;?>][store_id][]" value="<?php echo $store['store_id']; ?>" checked="checked" />
							<?php echo $store['name']; ?>
							<?php } else { ?>
							<input type="checkbox" name="boss_filterproduct_module[<?php echo $module_row_c;?>][store_id][]" value="<?php echo $store['store_id']; ?>" />
							<?php echo $store['name']; ?>
							<?php } ?>
						  </div>
						  <?php } ?>
						</div></td>
					</tr>
					
				</table>
			</div>
				<div id="moduletab<?php echo $module_row_c;?>" class="htabs-content">
				<table id="tableMoldue<?php echo $module_row_c;?>" class="list"><thead><tr>
						<td class="left"><?php echo $tab_stt; ?></td>
						<td class="left"><?php echo $tab_title; ?></td>
						<td class="left"><?php echo $tab_get_product; ?></td>
						<td></td></tr></thead>
						<?php $tab_row = 0;?>
						<?php if(isset($module['tabs'])) {?>
						<?php foreach($module['tabs'] as $tab) {?>
						<tbody id="module<?php echo $module_row_c;?>tab-row<?php echo $tab_row;?>">
						<tr>
							<td class="left"><?php $tab_stt;?> <b>#<?php echo $tab_row + 1; ?></b></td>
							<td class="left">
							<?php foreach ($languages as $language) { ?>
							  <input name="boss_filterproduct_module[<?php echo $module_row_c; ?>][tabs][<?php echo $tab_row;?>][title][<?php echo $language['language_id']; ?>]" value="<?php echo isset($tab['title'][$language['language_id']]) ? $tab['title'][$language['language_id']] : ''; ?>" />
							  <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><br />
							<?php } ?></td>
							
							<td class="left">
							<select name="boss_filterproduct_module[<?php echo $module_row_c; ?>][tabs][<?php echo $tab_row;?>][type_product]" onchange="showCategories(this,<?php echo $module_row_c; ?>,<?php echo $tab_row; ?>)">
							<?php foreach($filter_types as $key=>$text){ ?>
							<option value="<?php echo $key;?>" <?php if($tab['type_product'] == $key) echo "selected=selected";?>><?php echo $text;?></option>
							<?php } ?>
							</select>
							<?php if ($tab['type_product'] == 'category') { ?>
						<?php if (isset($error_category[$tab_row])) { ?>
						<span class="error"><?php echo $error_category[$tab_row]; ?></span>
						<?php } ?>
						<div class="scrollbox" id="scrollbox<?php echo $tab_row; ?>">
							<?php $class = 'odd'; ?>
							<?php foreach ($categories as $category) { ?>
							<?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
							<div class="<?php echo $class; ?>">
							  <?php if (isset($tab['filter_type_category']) && $category['category_id'] == $tab['filter_type_category']) { ?>
							  <input type="radio" name="boss_filterproduct_module[<?php echo $module_row_c; ?>][tabs][<?php echo $tab_row;?>][filter_type_category]" value="<?php echo $category['category_id']; ?>" checked="checked" />
							  <?php echo $category['name']; ?>
							  <?php } else { ?>
							  <input type="radio" name="boss_filterproduct_module[<?php echo $module_row_c; ?>][tabs][<?php echo $tab_row;?>][filter_type_category]" value="<?php echo $category['category_id']; ?>" />
							  <?php echo $category['name']; ?>
							  <?php } ?>
							</div>
							<?php } ?>
						  </div>
						<?php } ?>
							</td>
							<td class="left"><a onclick="$('#module<?php echo $module_row_c;?>tab-row<?php echo $tab_row;?>').remove();" class="button"><?php echo $button_remove; ?></a></td>
						</tr>
						</tbody>
						<?php $tab_row++;?>
						<?php }?>
						<?php } ?>
						<tfoot><tr><td colspan="3"></td>
						<td class="left"><a onclick="addTab(this,<?php echo $module_row_c;?>,<?php echo $tab_row;?>);" class="button"><?php echo $button_add_tab; ?></a></td>
						</tr></tfoot></table>
				</div>
		</div>

		<?php $module_row_c++; ?>
		<?php } ?>
   </form>
  </div>
</div>
</div>

<script type="text/javascript"><!--
<!-- TABS -->
<?php foreach ($modules as $key=>$module) {?>
	$('#tabcontent<?php echo $key;?> a').tabs();
<?php }?>
<?php if(!empty($modules)){ ?>
$('#filterTabs a').tabs();
<?php } ?>
	var module_row = <?php echo $module_row_t; ?>;
	// add module
    function addModule() {
	  html_tab = '<a href="#tab' + module_row + '" id="tabtitle' + module_row + '"><?php echo $module_stt; ?> ' + (module_row + 1) + '&nbsp;<img src="view/image/delete.png" alt="" onclick="$(\'.vtabs a:first\').trigger(\'click\'); $(\'#tabtitle' + module_row + '\').remove(); $(\'#tab' + module_row + '\').remove(); return false;" /></a>';
      html = '<div id="tab' + module_row + '" class="vtabs-content">';
	  
	  html += '<div id="tabcontent' + module_row + '" class="htabs">';
	  html += '<a href="#modulesetting' + module_row  + '"><?php echo $module_setting; ?></a>';
	  html += '<a href="#moduletab' + module_row + '"><?php echo $module_tab; ?></a>';
	  html += '</div>';
	  
	  
	  html += '<div id="modulesetting' + module_row  + '" class="htabs-content">';
	  html += '<table class="form">';
	  html += '<tr><td><?php echo $entry_image; ?></td><td class="left">';
	  html += '<input type="text" name="boss_filterproduct_module[' + module_row + '][image_width]" value="255" size="3" /> <input type="text" name="boss_filterproduct_module[' + module_row + '][image_height]" value="255" size="3" /></td>';
	  html += '</tr>';
	  html += '<tr><td><?php echo $entry_limit; ?></td><td class="left">';
	  html += '<input type="text" name="boss_filterproduct_module[' + module_row + '][limit]" value="16" size="3" /></td>';
	  html += '</tr>';
	  
	  html += '<tr><td><?php echo $entry_tab; ?></td><td class="left">';
	  html += '<select name="boss_filterproduct_module[' + module_row + '][use_tab]">';
	  html += '<option value="1" selected="selected"><?php echo $text_enabled; ?></option>';
	  html += '<option value="0"><?php echo $text_disabled; ?></option>';
	  html += '</select></td></tr>';
	  
	  html += '<tr><td><?php echo $entry_layout; ?></td><td class="left">';
	  html += '<select name="boss_filterproduct_module[' + module_row + '][layout_id]">';
	  <?php foreach($layouts as $layout) {?>
	  html += '<option value="<?php echo $layout['layout_id']?>"><?php echo addslashes($layout['name']); ?></option>';
	  <?php } ?>
	  html += '</select></td></tr>';
	  
	  
	  html += '<tr><td><?php echo $entry_position; ?></td><td class="left">';
	  html += '<select name="boss_filterproduct_module[' + module_row + '][position]">';
	  html += '<option value="content_top"><?php echo $text_content_top; ?></option>';
	  html += '<option value="content_bottom"><?php echo $text_content_bottom; ?></option>';
	  html += '<option value="column_left"><?php echo $text_column_left; ?></option>';
	  html += '<option value="column_right"><?php echo $text_column_right; ?></option>';
	  html += '</select></td></tr>';
	
	  html += '<tr><td><?php echo $entry_status; ?></td><td class="left">';
	  html += '<select name="boss_filterproduct_module[' + module_row + '][status]">';
	  html += '<option value="1" selected="selected"><?php echo $text_enabled; ?></option>';
	  html += '<option value="0"><?php echo $text_disabled; ?></option>';
	  html += '</select></td></tr>';
	  
	  html += '<tr><td><?php echo $entry_sort_order; ?></td><td class="left"><input type="text" name="boss_filterproduct_module[' + module_row + '][sort_order]" value="" size="3" /></td></tr>';
	  html += '<tr><td><?php echo $entry_width_column; ?></td><td class="left"><input type="text" name="boss_filterproduct_module[' + module_row + '][width_column]" value="24" size="12" /></td></tr>';
	  html += '<tr><td><?php echo $entry_store; ?></td><td><div class="scrollbox"><input type="checkbox" name="boss_filterproduct_module[' + module_row + '][store_id][]" value="0" checked="checked" /><?php echo $text_default; ?>';
	  <?php foreach ($stores as $store) {?>
	  html += '<input type="checkbox" name="boss_filterproduct_module[' + module_row + '][store_id][]" value="<?php echo $store['store_id'];?>" /><?php echo $store['name'] ?>';
	  <?php }?>
	  html += '</div></td></tr>';
	  html += '</table>';
	  html += '</div>';
	  
	  
	  html += '<div id="moduletab' + module_row  + '" class="htabs-content">';
	  html += '<table id="tableMoldue' + module_row + '" class="list"><thead><tr>';
      html += '<td class="left"><?php echo $tab_stt; ?></td>';
      html += '<td class="left"><?php echo $tab_title; ?></td>';
	  html += '<td class="left"><?php echo $tab_get_product; ?></td>';
      html += '<td></td></tr></thead>';
	  html += '<tfoot><tr><td colspan="3"></td>';
      html += '<td class="left"><a onclick="addTab(this,' + module_row +',0);" class="button"><?php echo $button_add_tab; ?></a></td>';
      html += '</tr></tfoot></table>';
	  html += '</div>';
	  html += '</div>';
	 $('div.vtabs span.addModule').before(html_tab);
	 if($('#tab' + (module_row -1)).length > 0)
		$('#tab' + (module_row -1)).after(html);
	else
		$('.vtabs').after(html);
	 $('#filterTabs a').tabs();
	 $('#tabtitle' + module_row).trigger('click');
	  $('#tabcontent' + module_row + ' a').tabs();
      module_row++;
    }
//--></script>
<script type="text/javascript"><!--
	//var tab_row = <?php echo $tab_row; ?>;;
	// add menu
    function addTab(btnAddTab,module_row,tab_row) {
      html  = '<tbody id="module'+module_row+'tab-row'+tab_row+'">';
      html += '<tr>';
      html += '<td class="left"><b>#' + (tab_row+1) + '</b></td><td class="left">';
	  <?php foreach ($languages as $language) { ?>
	  html += '<input type="input" name="boss_filterproduct_module[' + module_row + '][tabs][' + tab_row + '][title][<?php echo $language['language_id'];?>]"/>';
	  html += '<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><br />';
		<?php }?>
	  html += '</td>';
	  
	  html += '<td class="left">';
	  html += '<select name="boss_filterproduct_module[' + module_row + '][tabs][' + tab_row + '][type_product]" onchange="showCategories(this,' + module_row+ ',' + tab_row + ')">';
	<?php foreach($filter_types as $key=>$text){ ?>
		html += '<option value="<?php echo $key;?>"><?php echo $text;?></option>';
	<?php } ?>
	 html += '</select></td>';
     html += '<td class="left"><a onclick="$(\'#module'+ module_row +'tab-row' + tab_row + '\').remove();" class="button"><?php echo $button_remove; ?></a></td>';
	 html += '</tr></tbody>';
	 $('#tableMoldue' + module_row  +  ' tfoot').before(html);
	 $(btnAddTab).replaceWith('<a onclick="addTab(this,' + module_row +', '+ (tab_row + 1)+ ');" class="button"><?php echo $button_add_tab; ?></a>');
    }
//--></script>

 <script type="text/javascript"><!--
    function showCategories(select, module,row) {
	  if (select.options[select.selectedIndex].value == 'category') {
		divclass = 'odd';
		html  = '<div class="scrollbox" id="scrollbox' + row + '">';
		<?php foreach ($categories as $category) { ?>
		  divclass = divclass == 'even' ? 'odd' : 'even';
		  html += '<div class="' + divclass + '">';
		  html += '<input type="radio" name="boss_filterproduct_module[' + module + '][tabs][' + row + '][filter_type_category]" value="<?php echo $category['category_id']; ?>" />';
		  html += '<?php echo $category['name']; ?>'
		  html += '</div>';
		<?php } ?>
		html += '</div>';
		  
		$(select).after(html);
	  }
	  else {
		$('#scrollbox' + row).slideUp("normal", function() { $(this).remove(); } );
	  }
    }
  //--></script>

<?php echo $footer; ?>