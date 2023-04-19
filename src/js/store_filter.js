// ==== 所有類別 & 展覽商品 篩選按鈕 ====

$(document).ready(function() {
	
	var $btns = $('.tablinks').click(function() {
	  if (this.id == 'all') {
	    $('#parent > ul > li').fadeIn(450);
	  } else {
	    var $el = $("#parent > ul >li[data-events-only*='Y']").fadeIn(450);
	    $('#parent > ul >li').not($el).hide();
	  }

	  
	  $btns.removeClass('active');
	  $(this).addClass('active');

	})
	
});