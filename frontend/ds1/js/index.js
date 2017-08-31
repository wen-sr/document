$(function(){
	var carousel = $(".carousel");
	var list = $(".list");
	var buttons = $(".buttons span");
	var prev = $("#prev");
	var next = $("#next");
	var index = 1;

	prev.bind('click', function() {
		if(index == 1){
			index = 5;
		}else{
			index--;
		}
		animate(600);
	});
	next.bind('click', function() {
		if(index == 5){
			index = 1;
		}else{
			index++;
		}
		animate(-600);
	});



	/**
	 * 通过list的left数值移动显示的图片
	 * @param  {offset}
	 */
	function animate(offset){
		var newLeft = parseInt(list.css('left')) + offset;
		if(newLeft < -3000){
			newLeft = -600;
		}else if (newLeft > -600) {
			newLeft = -3000;
		}
		list.css('left', newLeft);
		showButton();
	}
	/**
	 * 显示按钮颜色
	 * @return {}
	 */
	function showButton(){
		buttons.eq(index-1).addClass('on').siblings().removeClass('on');
	}

	buttons.each(function(index, el) {
		$(this).bind('click',function(){
			var myIndex = $(this).attr("index");
			var offset = -600 * parseInt(myIndex - index);
			
		});
	});
})