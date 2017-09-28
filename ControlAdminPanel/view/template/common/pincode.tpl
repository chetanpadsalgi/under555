<?php echo $header; ?>
<br />
	<div id="content"> 
	<script>
			function check(){
				var r=confirm("Delete Pincode?");
				if (r==true){
				 return true;
				}
				else{
				  return false;
				}
			}
			
	$(function(){
	$('.tab-section').hide();
	$('#tabs a').bind('click', function(e){
		$('#tabs a.current').removeClass('current');
		$('.tab-section:visible').hide();
		$(this.hash).show();
		$(this).addClass('current');
		e.preventDefault();
	}).filter(':first').click();
});
		</script> 
		<script type="text/javascript" src="view/javascript/jquery/jscolor/jscolor.js"></script>
		<script>
			function addrows(){
				var counter = $('#counter').val();
				var setvalue = parseInt(counter)+1;
				$('#counter').val(setvalue);
				$row_string='<tr id = "row'+counter+'"><td class="left"><input type = "text" name = "data['+counter+'][pin]"></td><td class="left"><select name = "data['+counter+'][service]"><option value = "0">Serviceable</option/><option value = "1">Cash on Delivery</option/></select></td><td class="left"><a onclick="removerow('+counter+');" class="button">Remove</a></td></tr></tbody>';
				$('#last_row').before($row_string);
			}
			
			function removerow(counter){
				$("#row"+counter).remove();
			}
		</script>
		<style>
			td,th{
				
				padding-top:5px;
				padding-bottom:5px;
			}
		</style>
		<script>
			 $(function(){
				$('#tab-section').hide();
				$('#tabs a').click(function(e){
				$('.tab-section:visible').hide();
				$(this.hash).show();
				});
			});
		</script>

	  <?php if (isset($warning)){ ?>
	  <div class="warning"><?php echo $warning; ?></div>
	  <?php } ?>
	  <?php if (isset($success)) { ?>
	  <div class="success"><?php echo $success; ?></div>
	  <?php } ?>
	  <?php if (isset($success1)) { ?>
	  <div class="success"><?php echo $success1; ?></div>
	  <?php } ?>
	  <?php if (isset($warning1)){ ?>
	  <div  class="warning"><?php echo $warning1; ?></div>
	  <?php } ?>
	  <?php if (isset($warning2)){ ?>
	  <div class="warning"><?php echo $warning2; ?></div>
	  <?php } ?>
		<br />
		<?php if(isset($_GET['addpin'])){ ?>
		
	<div class="box">
		<div class="heading">
		  <h1><img src="view/image/module.png" alt="">Add Pincode</h1>
		  <div class="buttons"><a onclick="$('#form').submit();" class="button">Save</a><a href="?route=common/pincode&token=<?php echo $_GET['token'] ; ?>&allpin=1" class="button">Cancel</a></div>
		</div>
		<div class="content" >
			<div id="tabs" style="margin-bottom:10px; padding:5px; background:#EFEFEF; border:1px solid #DDDDDD">
				<span style="padding:5px 20px; "><a href="#tab-general" class="button">Insert Pincode</a></span> 
			</div>
        <div id="tab-general" class="tab-section" >			
			<form action = "?route=common/pincode/insert&token=<?php echo $_GET['token']; ?>" method="POST"  id="form">
				<table id = 'tbl1' class="list">
				  <thead>
					<tr>
					  <td class="left">Pincode:</td>
					  <td class="left">Services:</td>
					   <td class="left"></td>
					</tr>
				  </thead>
					<tbody id="module-row">
						<tr id = "row1">
						<td class="left"><input type = "text" name = "data[1][pin]"></td>
						<td class="left">
							<select name = "data[1][service]">
								<option value = "0">Serviceable</option>
								<option value = "1">Cash on Delivery</option>
							</select>
						</td>
					    <td class="left">
						    <a onclick="$('#row1').remove();" class="button">Remove</a>
							<input type = "hidden" id = "counter" value = "2">
						</td>					  
					    </tr>
						 <tfoot id = "last_row">
						 <tr>
						  <td colspan="2"></td>
						  <td class="left"><a  class="button" onclick="addrows();" >ADD ROW</a>
						</tr>   
				  </tfoot>
				</table>
			</form>
		</div>	  
		<div id="tab-data" class="tab-section">
		<form action = "?route=common/pincode/upload&token=<?php echo $_GET['token']; ?>" method="post"  id="form_upload" enctype="multipart/form-data">
        <table id="module" class="list">
		  <thead>
            <tr>
             <td class="left">Upload CSV File:</td>
             <td class="left"></td>
			 <td class="left"></td>
            </tr>
          </thead>
		  <tbody id="module-row">
				<tr>
					<td class="left"><input type="file" name="file_up" id="file"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href = "http://onjection.com/opencart156/sampale.csv" class = "button">Download Tamplate File</a></td>
					<td align = 'center'>
						<select name = "upload_service">
							<option value = "0">Serviceable</option/>
							<option value = "1">Cash on Delivery</option/>
						</select>
					</td>
					<td>
						<div class="buttons"><a onclick="$('#form_upload').submit();" class="button">Upload</a></div>
					</td>
				</tr>
        </table>
      </form>
	</div>
	</div>
	</div>
			
	<?php }
		if(isset($_GET['allpin'])){
	?>
			
	<?php $token = $_GET['token'];?>
	<script>
		function filter() {
			url = 'index.php?route=common/pincode&token=<?php echo $token; ?>&allpin=1';
			var select = $( "#myselect").val();
				if (select != 2) {
					url += '&myselect='+select;
				}		
			location = url;
		}
	</script>
		<div class="box">
			<div class="heading">
			  <h1><img src="view/image/module.png" alt="">All Pincode</h1>
			  <div class="buttons"><a href="<?php echo $downloadcsv; ?>" class="button">Download CSV</a><a href="?route=common/pincode&token=<?php echo $_GET['token'] ; ?>&allpin=1" class="button">Cancel</a><a class="button" onclick="$('#form').submit();">Delete</a></div>
			 </div>
			<div class="content">
			<form action = "?route=common/pincode/delete&token=<?php echo $_GET['token']; ?>" method="post"  id="form">
	        <table id="module" class="list">
	          <thead>
				<tr class="filter">
					<td align="center">Search</td>
					<td>
						<select id="myselect">
							<?php if(isset($_GET['myselect'])){if($_GET['myselect'] == 1){ ?>
								<option value = "1">COD Pincode</option>
								<option value = "2">All Pincode</option>
								<option value = "0">Prepaid Pincode</option>
							<?php }
								else if($_GET['myselect'] == 0) { ?>
									<option value = "0">Prepaid Pincode</option>
									<option value = "2">All Pincode</option>
									<option value = "1">COD Pincode</option>
							<?php }}
								  else{ ?>
										<option value = "2">All Pincode</option>
										<option value = "1">COD Pincode</option>
										<option value = "0">Prepaid Pincode</option>
							<?php   } ?>
						</select>
					</td>
					<td colspan="3" align="right"><a onclick="filter();" class="button">Filter</a></td>
				</tr>
	            <tr>
				  <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);"></td>
	              <td class="left">Pincode:</td>
	              <td class="left">Services Avaliable:</td>
				  <td class="left">Cash on Delivery:</td>
				  <td class="left">Edit:</td>
	            </tr>
	          </thead>
		<!--  <table width = "90%" align = "center" border = "1" style = "border-collapse:collapse;" cellspacing = "7">
			<tr bgcolor = "#0072BC"><th  align = "center" colspan = "5"><font color = 'white'>Edit Pincode</font></th></tr>
			<tr align = "center"><td><b>Pincode</b></td><td><b>Service Avaliable</b></td><td><b>Cash on Delivery</b></td><td><b>Edit</b></td><td><b>Delete</b></td></tr> -->
	<?php			
			if (isset($pincodes)) {
			foreach ($pincodes as $pincode) {
	?>
			<td style="text-align: center;"> </td>
			<tr align = "center">
				 <td style="text-align: center;">                
					<input type="checkbox" name="selected[]" value="<?php echo $pincode['id'];?>" >
				</td>
				<td class="left"><?php echo $pincode['pin']; ?></td>
					<?php	if($pincode['service'] == 1){
								echo '<td class="left">-</td><td class="left">YES</td>';
							}
							else if($pincode['service'] == 0){
									echo '<td class="left">YES</td><td class="left">-</td>';
							}
					?>
				<td class="left">[ <a  href = "?route=common/pincode&token=<?php echo $this->request->get['token']?>&editpin=<?php echo $pincode['id'];?>"><font color = 'blue'>Edit</font></a> ]</td>
					<!-- <td class="right">[ <a onclick = "return check()"  href = "?route=common/pincode&token=<?php echo $this->request->get['token']?>&delpin=<?php echo $pincode['id'];?>"><font color = 'blue'>Delete</font></a> ]</td> -->
			</tr>
	<?php
			}}
			echo "</table>";
	?>
	
	<div style = "padding-left:5%;padding-right:5%; width:90%;" class="pagination"><?php echo $pagination; ?></div>
	</div>
	</div>
	<?php
		}
		if(isset($_GET['editpin'])){
	?>	<div class="box">
			<div class="heading">
				<h1><img src="view/image/module.png" alt="">Edit Pincode</h1>
				<div class="buttons"><a onclick="$('#form_update').submit();" class="button">Update</a><a href="?route=common/pincode&token=<?php echo $_GET['token'] ; ?>&allpin=1" class="button">Cancel</a></div>
			</div>
			<div class="content">
			<form action = "?route=common/pincode/update&token=<?php echo $_GET['token']; ?>" method="POST"  id="form_update">
				<table id="module" class="list">
					<thead>
						<tr>
						  <td class="left">Pincode:</td>
						  <td class="left">Services Avaliable:</td>
						</tr>
					</thead>
					<tbody id="module-row">
						<tr id = "row1"> 
							<td class="left"><input type = "text" value = "<?php echo $pin_code[0]['pincode']; ?>" name = "e_pin" ></td>
							<td class="left"><select name = "e_service">
								<?php
									if($pin_code[0]['service_available'] == 1){
										echo '<option value = "1">Cash on Delivery</option/>';
										echo '<option value = "0">Serviceable</option/>';
									}
									else{
										echo '<option value = "0">Serviceable</option/>';
									echo '<option value = "1">Cash on Delivery</option/>';
									}
								?>
							</td>
							<input type = "hidden" name = "id" value = '<?php echo $_GET['editpin'];?>'>
						</tr>
					</tbody>			
				</table>
			</form>
			</div>
		</div>
		
	<?php	
		}
		if(isset($_GET['setting'])){
	?>
		<div id = "container" style="height:0%" >
		<div class="box">
		<div class="heading">
		  <h1><img src="view/image/setting.png" alt=""> Settings</h1>
		  <div class="buttons"> <a href="?route=common/pincode&token=<?php echo $_GET['token'] ; ?>&allpin=1" class="button">Cancel</a><a onclick="$('#form_setting').submit();" class="button">Save</a></div>
		</div>
		<div class="content">
		 <form method = "POST" id = "form_setting">
		 <div id="tab-general" style="display: block;">
			  <table class="form" ><tbody>
				<tr align = "center"><td  align = "left">Are you want to stop CHECKOUT for Unserviceable PINCODE </td>
				<td  align = "left">
					<?php 
						$pincode_checkout_status = $this->config->get('pincode_checkout_status');
						if(isset($pincode_checkout_status)){ 
							if($pincode_checkout_status == 1){ ?>
								<select name = "pincode_checkout_status" >
									<option value = "1">Enable</option/>
									<option value = "0">Disable</option/>
								</select>
							<?php
							}
							else{ ?>
								<select name = "pincode_checkout_status">
									<option value = "0">Disable</option/>
									<option value = "1">Enable</option/>
								</select>
							<?php
							}
						}
						else { ?>
							<select name = "pincode_checkout_status">
									<option value = "0">Disable</option/>
									<option value = "1">Enable</option/>
							</select>
						<?php
						}
					?>
				
			</td></tr>
			<tr align = "center" ><td  align = "left">No Service Available Message</td>
				<td  align = "left"> 
					<?php 
						$message_not = $this->config->get('pincode_msg_unavailable');
						if(isset($message_not)){ ?>
							<textarea name = "pincode_msg_unavailable" rows = "6" cols = "50"><?php  echo $message_not; ?></textarea>
						<?php }
						else { ?>
							<textarea name = "pincode_msg_unavailable"  rows = "6" cols = "50"></textarea>
						<?php
						}
					?>
			</td></tr>
			<tr align = "center" ><td  align = "left">COD Message</td>
				<td  align = "left">
					<?php 
							$message_cod = $this->config->get('pincode_msg_codavailable');
							if(isset($message_cod)){ ?>
								<textarea name = "pincode_msg_codavailable" rows = "6" cols = "50"><?php  echo $message_cod; ?></textarea>
							<?php }
							else { ?>
								<textarea name = "pincode_msg_codavailable" rows = "6" cols = "50"></textarea>
							<?php
							}
					?>
			</td></tr>
			<tr align = "center" ><td  align = "left">Servicable Message</td>
				<td  align = "left">
					<?php 
						$message_pre = $this->config->get('pincode_msg_preavailable');
						if(isset($message_pre)){ ?>
							<textarea name = "pincode_msg_preavailable" rows = "6" cols = "50"><?php  echo $message_pre; ?></textarea>
						<?php }
						else { ?>
							<textarea name = "pincode_msg_preavailable" rows = "6" cols = "50"></textarea>
						<?php
						}
					?>
			</td></tr>
                        <tr align = "center" ><td  align = "left">For Both Conditions </td>
				<td  align = "left">
					<?php 
						$message_for_both = $this->config->get('pincode_msg_for_both');
						if(isset($message_for_both)){ ?>
							<textarea name = "pincode_msg_for_both" rows = "6" cols = "50"><?php  echo $message_for_both; ?></textarea>
						<?php }
						else { ?>
							<textarea name = "pincode_msg_for_both" rows = "6" cols = "50"></textarea>
						<?php
						}
					?>
			</td></tr>
			<tr align = "center"><td  align = "left">Message text Color</td>
				<td  align = "left">
						<?php 
						$text_color = $this->config->get('text_color');
						if(isset($text_color)){ ?>
							<input class="color" name = "text_color" value = "<?php echo $text_color; ?>" size = "50">
						<?php }
						else { ?>
							<input class="color" name = "text_color" value = "FF2D0D" size = "50">
						<?php
							}
						?>
				</td>
			</tr>
		 </tbody>
		</table>
      </div>
     </form>
    </div>
  </div>
  </div>
  </div>
<?php 
	} 
	
	 echo $footer;
?>