var isMobile = /iPhone|iPod|iPad|Phone|Mobile|Android|hpwos/i.test(navigator.userAgent);
var isPhone = /iPhone|iPod|Phone|Android/i.test(navigator.userAgent);

jQuery(document).ready(function($) {
	$('#search input[name=\'search\']').on('keydown', function(e) {
        if (e.keyCode == 13) {
            $('header input[name=\'search\']').parent().find('.button-search').trigger('click');
        }
    });
	
	
	$("#megamenu ul.ul_mega_menu > li > a").hover(
        function () {
			$(this).next('.dropdown-menu').slideDown(300);
        },
        function () {
            $(this).parent().mouseleave(function() {
            $('#megamenu .dropdown-menu').slideUp(150);
        });
    });
	
	$("#megamenu ul.navbar-nav > li > a").hover(
        function () {
            $(this).next('.sub_menu_default').slideDown(300);
        },
        function () {
            $(this).parent().mouseleave(function() {
            $(this).find('.sub_menu_default').slideUp(150);
        });
    });
	// tooltips on hover
	$('[data-toggle=\'tooltip\']').tooltip({container: 'body'});
});

function boss_addToCart(product_id) {
  $.ajax({
      url: 'index.php?route=bossthemes/cart/add',
      type: 'post',
      data: 'product_id=' + product_id,
      dataType: 'json',
      success: function(json) {
          if (json['redirect']) {
              location = json['redirect'];
          }

          if (json['success']) {
              addProductNotice(json['title'], json['thumb'], json['success'], 'success');
			  $('#cart-total').html(json['total']);
			  $('#bosscart').load('index.php?route=module/cart #bosscart > *');
          }
      }
  });
}

function boss_addToWishList(product_id) {
	$.ajax({
		url: 'index.php?route=bossthemes/wishlist/add',
		type: 'post',
		data: 'product_id=' + product_id,
		dataType: 'json',
		success: function(json) {
			if (json['success']) {
				addProductNotice(json['title'], json['thumb'], json['success'], 'success');
				$('#wishlist-total').html(json['total']);
			}
		}
	});
}

function boss_addToCompare(product_id) {
	$.ajax({
		url: 'index.php?route=bossthemes/compare/add',
		type: 'post',
		data: 'product_id=' + product_id,
		dataType: 'json',
		success: function(json) {
			if (json['success']) {
                addProductNotice(json['title'], json['thumb'], json['success'], 'success');
				$('#compare-total').html(json['total']);
			}
		}
	});
}


function addProductNotice(title, thumb, text, type) {
	$.jGrowl.defaults.closer = true;
	var tpl = thumb + '<h3>'+text+'</h3>';
	$.jGrowl(tpl, {		
		life: 4000,
		header: title,
		speed: 'slow'
	});
}


/* mega boss menu */
$(window).load(function(){
	resizeWidth();
});
(function($,sr){
  // debouncing function from John Hann
  // http://unscriptable.com/index.php/2009/03/20/debouncing-javascript-methods/
  var debounce = function (func, threshold, execAsap) {
      var timeout;

      return function debounced () {
          var obj = this, args = arguments;
          function delayed () {
              if (!execAsap)
                  func.apply(obj, args);
              timeout = null; 
          };

          if (timeout)
              clearTimeout(timeout);
          else if (execAsap)
              func.apply(obj, args);

          timeout = setTimeout(delayed, threshold || 100); 
      };
  }
// smartresize 
 jQuery.fn[sr] = function(fn){  return fn ? this.bind('resize', debounce(fn)) : this.trigger(sr); };

})(jQuery,'smartresize');

var TO = false;
$(window).smartresize(function(){
if(TO !== false)
    clearTimeout(TO);
 TO = setTimeout(resizeWidth, 400); //400 is time in miliseconds
 //resizeWidth();
});

function resizeWidth()
{
	var menuWidth = 1181;
	var numColumn = 6;
	var currentWidth = $("#megamenu").outerWidth();
	if (currentWidth < menuWidth) {
		new_width_column = currentWidth / numColumn;
		$('#megamenu div.options_list').each(function(index, element) { 
			var options_list = $(this).next();	
      $(this).width(Math.ceil(parseFloat(options_list.css("width"))/menuWidth*numColumn * new_width_column));     
		});
		$('#megamenu div.option').each(function(index, element) {
			var option = $(this).next();
		$(this).width(parseFloat(option.css("width"))/menuWidth*numColumn * new_width_column);
		$("ul", this).width(parseFloat(option.css("width"))/menuWidth*numColumn * new_width_column);
		
		});
		$('#megamenu ul.column').each(function(index, element) {
			var column = $(this).next();
		$(this).width(parseFloat(column.css("width"))/menuWidth*numColumn * new_width_column);
		});
	}
	
	$('#megamenu ul > li > a + div').each(function(index, element) {
		var menu = $('#megamenu').offset();
		var dropdown = $(this).parent().offset();
		i = (dropdown.left + $(this).outerWidth()) - (menu.left + $('#megamenu').outerWidth());
		if (i > 0) {
			$(this).css('margin-left', '-' + i + 'px');
		}
		else
			$(this).css('margin-left', '0px');
	});
}

/* SHARED VARS */
var touch = false;

// handles Animate
function dataAnimate(){
  $('[data-animate]').each(function(){
    
    var $toAnimateElement = $(this);
    
    var toAnimateDelay = $(this).attr('data-delay');
    
    var toAnimateDelayTime = 0;
    
    if( toAnimateDelay ) { toAnimateDelayTime = Number( toAnimateDelay ); } else { toAnimateDelayTime = 200; }
    
    if( !$toAnimateElement.hasClass('animated') ) {
      
      $toAnimateElement.addClass('not-animated');
      
      var elementAnimation = $toAnimateElement.attr('data-animate');
      
      $toAnimateElement.appear(function () {
        
        setTimeout(function() {
          $toAnimateElement.removeClass('not-animated').addClass( elementAnimation + ' animated');
        }, toAnimateDelayTime);
        
      },{accX: 0, accY: -80},'easeInCubic');
      
    }
    
  });
}


   
jQuery(document).ready(function($) {
  
  /* DETECT PLATFORM */
  $.support.touch = 'ontouchend' in document;
  
  if ($.support.touch) {
    touch = true;
    $('body').addClass('touch');
  }
  else{
	$('body').addClass('notouch');
  }
  
  /* Handle Animate */
  if(touch == false){
    dataAnimate();
  }
});