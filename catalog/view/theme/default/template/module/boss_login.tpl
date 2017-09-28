<div id="boss-login">
<?php if (!$logged) { ?>
	<ul>
	<li class="login-li">
		<span><?php echo $text_login; ?></span>
		<div id="content-login" class="content dropdown-menu" style="display:none">
			<form action="<?php echo $action_login; ?>" method="post" enctype="multipart/form-data" id="logintop" >
				<div class="login-bor">
				<div class="login-frame">
					<h1><?php echo $button_login; ?></h1>
					<span style="display:block"><?php echo $text_username; ?><span class="required"> *</span></span>
					<input type="text" name="email" autocomplete="off"  onblur="if(this.value=='') this.value=this.defaultValue" onfocus="if(this.value==this.defaultValue) this.value=''" value="<?php echo $text_username; ?>" />
					<span style="display:block"><?php echo $entry_password; ?><span class="required"> *</span></span>
					<input type="password" name="password" onblur="if(this.value=='') this.value=this.defaultValue" onfocus="if(this.value==this.defaultValue) this.value=''" value="<?php echo $entry_password; ?>" />
					<br />
					<div class="action" style="margin-top:4px;">
					<a style="float:left;margin-right:20px;margin-bottom:15px;" onclick="$('#logintop').submit();" class="btn btn-primary btn-continue"><span><?php echo $button_login; ?></span></a>
					<a class="forgotten" href="<?php echo $forgotten; ?>"><?php  echo $text_forgotten; ?></a>
					<br/><span class="signup_text" style="float:left"><?php  echo $text_welcome_2; ?></span>					
					</div>
				</div>
				</div>
			</form>
		</div>
	</li>
	<li><span><?php echo $text_welcome_2; ?></span></li>
	</ul>
	
<?php } else { ?>
	<?php echo $text_logged; ?>

<?php } ?>
</div>
<script type="text/javascript"><!--
$(document).ready(function(){
	var show_hide = 0;
	if(isMobile||isPhone){
	$('.show_hide_login').click(function(){
		$("#content-login").slideToggle();
	});
	}else{
		$('.login-li').hover(function() {
			
			$('#boss_cart .content').hide();
			$('#search-form').hide();
			show_search = 0;
			$('#content-login', this).slideDown();
			
			$(".login-frame input").focus(function() {
				show_hide = 1;
			});
			$('#boss-login li.login-li a', this).addClass('active');
			$('#boss-login').mouseleave(function() {
				if(show_hide==0){
					$('#content-login', this).hide();
				}
			});
		},function(){
			$('#boss-login').mouseleave(function() {
				if(show_hide==0){
					$('#content-login').hide();
					$('#boss-login li.login-li a', this).removeClass('active');
				}
			});
		});
	}
	$('body').mouseup(function(login) {
        if(!($(login.target).parents('#boss-login').length > 0)) {
            show_hide=0;
            $('#content-login').hide();
        }
    });
});
//--></script>