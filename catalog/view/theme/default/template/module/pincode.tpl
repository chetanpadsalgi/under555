<div class="box">
    <div class="box-heading"><?php echo $heading_title; ?></div>
    <div class="box-content">
        <form method = "POST" align = "center" id = "pincheck" <?php if(isset($_SESSION['pincode'])){ echo "style='display:none;'";}?>>
              Check your delivery options: <br /><input placeholder="Enter Pincode" type="text" id="pin" />
            <input type = "button"  onClick = "getdata()" value="Check" class="button" />
        </form>
        <div id="msg" >
            <?php
            $text_color = $this->config->get('text_color'); 
            $font_size = $this->config->get('font_size');
            if(isset($_SESSION['pincode'])){
            echo "<div id='msg' ><img src='image/pincode/l.png' width='15' height='15'>Delivery option for: ".$_SESSION['pincode']."&nbsp;&nbsp;<form><input type = 'button'  onclick = 'showform()' value='Change' class='button' />
            </form><br />";
            echo $_SESSION['pin_check_result']."</font></font><br />";
            }
            ?>
        </div>
    </div>
</div>    
</div>

<script type="text/javascript">
    function getdata() {

        var pin = $("#pin").val();
        if (pin != '') {
            $.ajax({
                type: "POST",
                url: "?route=module/pincode/pinCheck",
                data: {pincode: pin},
                dataType: "text"
            }).done(function (result)
            {
                $("#msg").show();
                $("#msg").html(result);
                $("#pincheck").hide();

            });
        }
        else {
            alert('Please enter a valid Pincode');
        }
    }
    function showform() {
        $("#msg").hide();
        $("#pincheck").show();

    }

</script>
