<?php echo $header; ?>
<div class="container">
<ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
<div class="row"><?php echo $column_left; ?><?php echo $column_right; ?>
	<?php $column_left  = trim($column_left);
	$column_right  = trim($column_right); ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-18'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-24'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
    <h1><?php echo $heading_title; ?></h1>
    <?php if ($articles) { ?>
        <div class="product-filter not-animated" data-animate="fadeInUp" data-delay="300">
	<div class="display_box">	
	<div class="limit-sort">
		<div class="sort">
		<span class="tt_input"><?php echo $text_sort; ?></span>
          <label>
		  <select id="input-sort" onchange="location = this.value;">
            <?php foreach ($sorts as $sorts) { ?>
            <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
            <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
            <?php } ?>
            <?php } ?>
          </select>
		  </label>
        </div>
        <div class="text-control-label">
          <label class="control-label" for="input-limit"><?php echo $text_limit; ?></label>
        </div>
        <div class="limit">
		<span class="tt_input"><?php echo $text_limit; ?></span>
          <label>
		  <select id="input-limit" onchange="location = this.value;">
            <?php foreach ($limits as $limits) { ?>
            <?php if ($limits['value'] == $limit) { ?>
            <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
            <?php } ?>
            <?php } ?>
          </select>
		  </label>
        </div>
		</div>
          <div class="display">
            <button type="button" id="list-view" class="btn-list" title="<?php echo $text_list; ?>"></button>
            <button type="button" id="grid-view" class="btn-grid" title="<?php echo $text_grid; ?>"></button>
         
        </div>
		</div>
		
        <div class="text-control-label">
          <label class="control-label" for="input-sort"><?php echo $text_sort; ?></label>
        </div>
       
      </div>
           
		<div class="row">
            
                <?php foreach ($articles as $article) { ?>
				<div class="article-layout article-list col-xs-24">
                   
                    <div class="std">
						<div class="article-name">
							<h2><a href="<?php echo $article['href']; ?>"><?php echo $article['name']; ?></a></h2>                    
						</div>
    					
    					<div class="time-stamp">
                            <?php $date = new DateTime($article['date_modified']);?>
                           <?php echo $date->format('l, M j, Y');?>
                        </div>					
                        <div class="article-image"><a href="<?php echo $article['href']; ?>"><img src="<?php echo $article['thumb']; ?>" title="<?php echo $article['name']; ?>" alt="<?php echo $article['name']; ?>" /></a></div>
						<div class="article_dt">
						
                        <div class="article-title"><p><?php  echo $article['title']; ?></p></div>
    					<div class="article-footer">
                            <span class="post-by"> Post by <span><?php echo $article['author']; ?></span></span>
                            
        					<span class="comment-count"><span><?php echo $article['comment']; ?> </span><a href="<?php echo $article['href']; ?>">Comment(s)</a></span>                 
                        </div>
						</div>
                    </div>
					 
					</div>
                <?php } ?>
            
        </div>
		
        <div class="pagination"><?php echo $pagination; ?></div>  
    <?php } else { ?>
      <div class="content"><?php echo $text_empty; ?></div>
    <?php }?>
    
<?php echo $content_bottom; ?></div></div></div>
<script type="text/javascript"><!--

$('#list-view').click(function() {
	listclick();
});

$('#grid-view').click(function() {
	gridclick();
});

view = $.totalStorage('display');
if (view && (view == 'list')) {
	listclick();
}else{
	gridclick();
}

function listclick(){
	$('#content .article-layout > .clearfix').remove();
	$('#content .article-layout').attr('class', 'article-layout article-list col-xs-24');
	$('#grid-view').attr('class','btn-grid');
	$('#list-view').attr('class','btn-list active');
	document.getElementById("grid-view").disabled = false; 
	document.getElementById("list-view").disabled = true; 
	$.totalStorage('display', 'list');
}
function gridclick(){
	var jsprefix = 'res_';
	class_array_new = $.totalStorage(jsprefix + 'changeProductView');
	<?php $b_Layout_Settings = explode(',', $this->config->get('b_Layout_Setting')); ?>
	if(class_array_new){
		class_product_arr = class_array_new[2].split("-");
	}else{
		class_product_arr1 = '<?php echo $b_Layout_Settings[2] ; ?>';
		class_product_arr = class_product_arr1.split("-");
		
	}
	
	
	cols = $('#column-right, #column-left').length;
	
	if(class_product_arr){
		if (cols == 2) {
			var class_product = class_product_arr[2];
		} else if (cols == 1) {
			var class_product = class_product_arr[1];
		} else {
			var class_product = class_product_arr[0];
		}
	}else{
		var class_product = '6';
	}
	
	$('#content .article-layout > .clearfix').remove();
	
	$('#content .article-layout').attr('class', 'article-layout article-grid col-lg-'+class_product+' col-md-'+class_product+' col-sm-'+class_product+' col-xs-24');
	
	$('#grid-view').attr('class','btn-grid active');
	document.getElementById("grid-view").disabled = true; 
	document.getElementById("list-view").disabled = false; 
	$('#list-view').attr('class','btn-list');
	$.totalStorage('display', 'grid');
}
//--></script>  
<?php echo $footer; ?>