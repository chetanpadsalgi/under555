<?php 
if($data_template){
	echo $data_template;
} else { ?>
<?php 
	function showSubmenu($category) {
		if (count($category['children']) > 0) {
			echo '<div class="sub_menu"><ul>';
			foreach ($category['children'] as $cat) {
				if(count($cat['children']) > 0){
					echo '<li class="sub_category"><a href="'.$cat['href'].'">'.$cat['name'].'</a>';
					showSubmenu($cat);
					echo '</li>';
				}else{
					echo '<li ><a href="'.$cat['href'].'">'.$cat['name'].'</a></li>';
				}
			}
			echo '</ul></div>';
		}
	}
	function showmenuChild($category) {
		if (count($category['children']) > 0) {
			echo '<ul>';
			foreach ($category['children'] as $cat) {
				(($cat['children'])? $parent = ' class="parent"' : $parent='');
				echo '<li'.$parent.'><a href="'.$cat['href'].'">'.$cat['name'].'</a>';
				showmenuChild($cat);
				echo '</li>';
			}
			echo '</ul>';
		}
	}
?>
  
  <nav id="megamenu" class="navbar col-sm-24 col-xs-24  col-md-24">
		<?php $status = $this->config->get('b_General_Menu'); ?>
		
		<?php if($status){ ?><!-- Mega menu -->
			<div><div class="boss-menu"><div><div>
			<div class="cs_mega_menu hidden-xs" >
				<ul class="nav navbar-nav ul_mega_menu">
				<?php foreach ($menus as $menu) { ?>
				<li class="menu_item level-1 parent dropdown">
					<a class="title_menu_parent<?php if (count($menu['menuchilds']) > 0) { echo ' sub_child'; }?> dropdown-toggle" href="<?php echo $menu['href']; ?>"><span class="menu-title"><?php echo $menu['title'] ?><i class="fa fa-caret-down"></i></span><?php if (count($menu['menuchilds']) > 0) { echo '<b></b>'; }?></a>
					
					<?php if (count($menu['menuchilds']) > 0) { ?>
					<div class="options_list dropdown-menu" style="width: <?php echo $menu['dropdown_width']+2; ?>px;">
					<div class="dropdown-menu-inner">
					
						<?php foreach ($menu['menuchilds'] as $menuchild) { ?>
						<div class="option" style="width: <?php echo $menuchild['child_width']; ?>px; float: left">
							
							<?php if ($menuchild['type'] == 'html') { ?><!-- html-->
								<div class="staticblock"><?php echo $menuchild['content']; ?></div>
							<?php } ?>
							
							<?php if ($menuchild['type'] == 'url') { ?><!-- url-->
								<div class="url"><a href="<?php echo $menuchild['href']; ?>" title="<?php echo $menuchild['content']; ?>"><?php echo $menuchild['content']; ?></a></div>
							<?php } ?>
							
							<?php if ($menuchild['type'] == 'information') { ?><!-- information -->
								<ul class="column information">
									<?php foreach($menuchild['content'] as $information) { ?>
									<li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
									<?php } ?>
								</ul>
							<?php } ?>
							
							
							<?php if ($menuchild['type'] == 'manufacturer') { ?><!-- manufacturer -->
								<ul class="column manufacturer">
									<?php foreach($menuchild['content'] as $manufacturer) { ?>
										<li><a href="<?php echo $manufacturer['href']; ?>">
											<?php if ($manufacturer['show_image']) { ?><img src="<?php echo $manufacturer['image']; ?>" alt="<?php echo $manufacturer['name']; ?>"/><?php } ?></a>
											<a href="<?php echo $manufacturer['href']; ?>"><?php if ($manufacturer['show_name']) { ?><span class="name"><?php echo $manufacturer['name']; ?></span><?php } ?>
										</a></li>
									<?php } ?>
								</ul>
							<?php } ?>
							
							
							<?php if ($menuchild['type'] == 'category') { ?><!-- category -->
							
								<?php if ($menuchild['parent']) { ?>
								<?php if($menuchild['parent']['show_parent']){?>
									<?php if (($menuchild['parent']['show_image'])&&$menuchild['parent']['image']) { ?>
										<a href="<?php echo $menuchild['parent']['href']; ?>" class="image"><img src="<?php echo $menuchild['parent']['image']; ?>" alt="<?php echo $menuchild['parent']['name']; ?>" /></a><?php } ?>
									<a href="<?php echo $menuchild['parent']['href']; ?>" class="parent">
										<?php echo $menuchild['parent']['name']; ?>
									</a>
								<?php } ?>
								<?php } ?>
								
								<ul class="column category">
									<?php foreach($menuchild['content'] as $category) { ?>
										<li <?php if ($category['show_sub'] && count($category['children']) > 0) { echo'class="sub_category"'; } ?>>
											<a href="<?php echo $category['href']; ?>">
											<?php if (($category['show_image']) && $category['image']) { ?><img src="<?php echo $category['image']; ?>" alt="<?php echo $category['name']; ?>"/><?php } ?>
											<?php echo $category['name']; ?>
											</a>
											<?php if ($category['show_sub']) { showSubmenu($category); } ?>
										</li>
									<?php } ?>
								</ul>
							
							<?php } ?>
							
							
							<?php if ($menuchild['type'] == 'product') { ?>
								<ul class="column product"><!-- product -->
									<?php foreach($menuchild['content'] as $product) { ?>
										<li>
											<div class="image">
											<?php if ($product['thumb']) { ?><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>"/></a><br/><?php } ?></div>
												<div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a><br /></div>
												<div class="price">
												<?php if (!$product['special']) { ?>
													<?php echo $product['price']; ?>
												<?php } else { ?>
													<span class="price-old"><?php echo $product['price']; ?></span>
													<span class="price-new"><?php echo $product['special']; ?></span>
												<?php } ?>
											    </div>
										</li>
									<?php } ?>
								</ul>
							<?php } ?>
							
						</div>
						<span class="spanOption" style="width: <?php echo $menuchild['child_width']; ?>px;" ></span>
						<?php } ?>
					
					</div>	
					</div>
					<span class="spanOptionList" style="width: <?php echo $menu['dropdown_width']; ?>px;" ></span>
					<?php } ?>
					
				</li>
				<?php } ?>
				</ul>
			</div></div>
			
			
		<?php }else{ ?>
			
			<?php if ($categories) { ?><!-- Menu Default -->
			<div><div class="boss-menu"><div><div>
			<div class="hidden-xs">
			  <ul class="nav navbar-nav">
				<?php foreach ($categories as $category) { ?>
				<li><a <?php if (count($category['children']) > 0) { echo 'class="sub_child"'; }?> href="<?php echo $category['href']; ?>"><span class="menu-title"><?php echo $category['name']; ?></span><?php if (count($category['children']) > 0) { echo '<b></b>'; }?></a>
				  <?php if ($category['children']) { ?>
				  <div class="sub_menu_default dropdown-menu">
					<?php for ($i = 0; $i < count($category['children']);) { ?>
					<ul>
					  <?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
					  <?php for (; $i < $j; $i++) { ?>
					  <?php if (isset($category['children'][$i])) { ?>
					  <li><a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a></li>
					  <?php } ?>
					  <?php } ?>
					</ul>
					<?php } ?>
				  </div>
				  <?php } ?>
				</li>
				<?php } ?>
				<li><a href="index.php?route=bossblog/bossblog"><span class="menu-title">Blog</span></a></li>
			  </ul>
			</div>
			</div>
			<?php } ?>
		<?php } ?>
		
		
		<div id="megamenu-responsive" class="visible-xs col-xs-24 navbar" ><!-- Menu Responsive-->
		<div class="navbar navbar-inverse">
			<div id="megamenu-responsive-root">
				<div class="navbar-header"><a class="navbar-toggle">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					</a>
					<b><?php echo $text_navigation; ?></b>
				</div>	
				<div class="root">
					<ul>
					<?php foreach ($categories as $category) { ?>
						<li <?php if ($category['children']) echo 'class="parent"'; ?>><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
						  <?php if ($category['children']) { ?>
						
							<?php for ($i = 0; $i < count($category['children']);) { ?>
							<ul>
							  <?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
							  <?php for (; $i < $j; $i++) { ?>
							  <?php if (isset($category['children'][$i])) { ?>
							  <li class="parent">
							  <a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a>
							  <?php showmenuChild($category); ?>
							  </li>
							  <?php } ?>
							  <?php } ?>
							</ul>
							<?php } ?>
						 
						  <?php } ?>
						</li>
					<?php } ?>
					
					<li><a href="index.php?route=bossblog/bossblog"><?php echo $text_blog; ?></a></li>
					</ul>
				</div>
			</div>
			<script type="text/javascript">
				$('document').ready(function(){
					$('#megamenu-responsive-root li.parent').prepend('<p>+</p>');
					
					$('a.navbar-toggle').click(function(){
						$('.root').toggleClass('open');
					});
					
					$('#megamenu-responsive-root li.parent > p').click(function(){

						if ($(this).text() == '+'){
							$(this).parent('li').children('ul').slideDown(300);
							$(this).text('-');
						}else{
							$(this).parent('li').children('ul').slideUp(300);
							$(this).text('+');
						}  
						
					});
				});
			</script>
		</div>
		</div>
	</div></div></div>	
	
	</nav>
<?php } ?>