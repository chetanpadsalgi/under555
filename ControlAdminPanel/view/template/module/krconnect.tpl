<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if (isset($sync_updated_count)) { ?>
  <div class="success"><?php echo $sync_updated_count." order(s) synchronised."; ?></div>
  <?php } ?>
  <?php if (isset($success)) { ?>
  <div class="success"><?php echo $success; ?></div>
  <?php } ?>
  <?php if (isset($error)) { ?>
  <div class="warning"><?php echo $error; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
      <div id="tab-general">
        <form action="<?php echo $action; ?>" method="post" id="form" >
          <input type="hidden" name="config_krconnect_status" value="1">
        <table id="module" class="form">
            <tr>
              <td class="left"><?php echo $text_kartrocket_key; ?></td>
              <td class="left"><input type='text' name="config_kr_key" id="config_kr_key" value="<?php echo $config_kr_key; ?>" size=50></td>              
           </tr>
            <tr>
              <td class="left"><?php echo $text_kartrocket_store_url; ?></td>
              <td class="left">
		<input type='text' name="config_kr_storeurl" id="config_kr_storeurl" value="<?php echo $config_kr_storeurl; ?>" size=100>
	      </td>              
           </tr>
            <tr>
              <td class="left"><?php echo $text_kartrocket_cat_map; ?></td>
              <td class="left">
		 <table cellspacig=3 cellpadding=5>
                 <?php foreach($oc_order_status as $key => $oc_status){ 
                 ?>
                 <tr>
                 <td><label><?php echo $oc_status['name'] ;?></label> </td>
                 <td><select name='config_kr_statusmapping[<?php echo $oc_status["order_status_id"];?>]'>
                      <option value=''>Select Category</option>";   
                     <?php foreach($kr_order_status as $kr_key => $kr_status){ 
                            $selected = '';
                            if($config_kr_statusmapping[$oc_status['order_status_id']] == $kr_key) $selected = 'selected';  
                            echo "<option value='".$kr_key."' ".$selected." >".$kr_status."</option>";
                      }?>                             
                     </select></td></tr>
                  <?php }?>
                 </table>
	      </td>              
           </tr>
            </table>
        </form>
        <form action="<?php echo $url_sync; ?>" method="post" id="form1" >
        <table id="module1" class="form">
            <tr>
              <td class="left"><?php echo $text_sync_from_date; ?></td>
              <td class="left">
		<input type='text' name="sync_from_date" id="sync_from_date" value="" >
	      </td>              
           </tr>
            <tr>
              <td class="left"><?php echo $text_sync_to_date; ?></td>
              <td class="left">
		<input type='text' name="sync_to_date" id="sync_to_date" value="" >
	      </td>              
           </tr>
            <tr>
                <td class="left" colspan="2"><div class="buttons"><a onclick="$('#form1').submit();" class="button"><?php echo $button_kartrocket_sync; ?></a></td>
           </tr>
        </table>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>
<script lang="javascript">
$(document).ready(function() {
	$('#sync_from_date').datepicker({dateFormat: 'yy-mm-dd',maxDate : new Date(),
            onSelect: function(selected) {
                    $("#sync_to_date").datepicker("option","minDate", selected)
            }
        });
        $('#sync_to_date').datepicker({dateFormat: 'yy-mm-dd',maxDate : new Date(),onSelect: function(selected) {
           $("#sync_from_date").datepicker("option","maxDate", selected)
        }});	
        $("#sync_from_date").datepicker("setDate", "-7d");
        $("#sync_to_date").datepicker("setDate", "-0d");
});
    $('#form').submit(function(){
        
       if ($('#config_kr_key').val() == '') {
            alert('Please enter Kartrocket Key.'); 
            $('#config_kr_key').focus();
            return false;
        }
       if ($('#config_kr_storeurl').val() == '') {
            alert('Please enter Kartrocket store url.'); 
            $('#config_kr_storeurl').focus();
            return false;
        }
       if ($('#config_kr_storeurl').val() == '') {
            alert('Please enter Kartrocket store url.'); 
            $('#config_kr_storeurl').focus();
            return false;
        }
       
      if ($('#config_kr_storeurl').val() == '') {
            alert('Please enter Kartrocket store url.'); 
            $('#config_kr_storeurl').focus();
            return false;
        }
});
    $('#form1').submit(function(){
        
       if ($('#sync_from_date').val() == '') {
            alert('Please enter from date.'); 
            $('#sync_from_date').focus();
            return false;
        }
       if ($('#sync_to_date').val() == '') {
            alert('Please enter to date.'); 
            $('#sync_from_date').focus();
            return false;
        }
        //return false;
});

</script>