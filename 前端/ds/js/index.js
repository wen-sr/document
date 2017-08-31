$(function(){
	contentNav();
	carousel();
	//绑定mouse追踪事件

});
/**
 * 导航目录
 * @return {[type]} [description]
 */
function contentNav(){
	//左侧对象
	var showItem_l = $(".showItem_l");
	//左侧激活对象
	var showItem_l_row;
	//右侧激活对象
	var showItem_r_row;
	//定时器
	var timer,timer1;
	//判断鼠标是否在右侧导航明细内
	var mouseInRightRow = false;
	//用数组记录鼠标移动的坐标
	var mouseTrack = [];

	$(".showItem_r").on("mouseenter", function(e){
		mouseInRightRow = true;
	}).on("mouseleave", function(e){
		mouseInRightRow = false;
	})


	//定义时间moveHandler，记录鼠标移动的坐标
	var moveHandler = function(e){
		mouseTrack.push({
			x:e.pageX,
			y:e.pageY
		})
		if(mouseTrack.length > 3) {
			mouseTrack.shift();
		}
	}


	//显示左侧导航目录
	$(".GoodClass h3").on("mouseenter",function(e){
		showItem_l.removeClass("hide");
		//在document上绑定鼠标移动事件
		$(document).bind("mousemove",moveHandler);
	})
	$(".GoodClass").on("mouseleave",function(e){
		timer1 = setTimeout(function(){
			if(mouseInRightRow){
				return;
			}
			showItem_l.addClass("hide");
			showItem_l_row.removeClass('active');
			$(".showItem_r").addClass("hide");	
			//解绑事件
			$(document).unbind("mousemove",moveHandler);
		},300);
		
	});
	//根据左侧导航目录，显示对应的右侧详细内容
	$(".showItem_l").on("mouseenter","dl",function(e){
		if(!showItem_l_row){
			showItem_l_row = $(e.target).addClass("active");
			showItem_r_row = $("#" + showItem_l_row.data('id'));
			$(".showItem_r").removeClass("hide");
			showItem_r_row.removeClass("hide");
			return;
		}
		//如果当前对象的timer没有执行（被下一个覆盖），则清空
		if(timer){
			clearTimeout(timer);
		}

		//得到鼠标当前所在位置
		var currMousePos = mouseTrack[2];
		var leftCorner = mouseTrack[1];

		var delay = needDelay($(".showItem_r"),leftCorner,currMousePos);

		if(delay){
			timer = setTimeout(function(){
				if(mouseInRightRow){
					return;
				}
				showItem_l_row.removeClass("active");
				$(".showItem_r").addClass("hide");
				showItem_r_row.addClass("hide");
				showItem_l_row = $(e.target).addClass("active");
				showItem_r_row = $("#" + showItem_l_row.data('id'));
				$(".showItem_r").removeClass("hide");
				showItem_r_row.removeClass("hide");
				timer = null;
			},300);
		}else{
			showItem_l_row.removeClass("active");
			$(".showItem_r").addClass("hide");
			showItem_r_row.addClass("hide");
			showItem_l_row = $(e.target).addClass("active");
			showItem_r_row = $("#" + showItem_l_row.data('id'));
			$(".showItem_r").removeClass("hide");
			showItem_r_row.removeClass("hide");
		}
	})
}

/**
 * 焦点轮播图
 * @return {[type]} [description]
 */
function carousel(){
	var carousel = $(".carousel");
	var list = $(".list");
	var buttons = $(".buttons span");
	var prev = $("#prev");
	var next = $("#next");
	var index = 1;
	var timer;
	

	prev.bind('click', function() {
		//如果正在执行位移，则返回
		if (list.is(':animated')) {
            return;
        }
		if(index == 1){
			index = 5;
		}else{
			index--;
		}
		animate(600);
	});
	next.bind('click', function() {
		//如果正在执行位移，则返回
		if (list.is(':animated')) {
            return;
        }
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
		var newLeft = parseInt(list.css('margin-left')) + offset;
		
		list.animate({"margin-left":newLeft},300,function(){
			if(newLeft < -3000){
				list.css("margin-left",-600);
			}else if (newLeft > -500) {
				list.css("margin-left",-3000);
			}
		});
		showButton();
	}
	/**
	 * 显示按钮颜色
	 * @return {}
	 */
	function showButton(){
		buttons.eq(index-1).addClass('on').siblings().removeClass('on');
	}
	/**
	 * 给每个button绑定click事件
	 * @param  {[type]} i   [description]
	 * @param  {[type]} el) {		$(this).bind('click',function(){			var myIndex [description]
	 * @return {[type]}     [description]
	 */
	buttons.each(function(i, el) {
		$(this).bind('click',function(){
			//如果正在轮播，或当前显示的正是点击的对象，则返回
			if (list.is(':animated') || $(this).attr('class') == 'on') {
				return;
			}
			var myIndex = $(this).attr("index");
			var offset = -600 * parseInt(myIndex - index);
			animate(offset);
			index = myIndex;
			showButton();
		});
	});

	/**
	 * 自动轮播
	 * @return {[type]} [description]
	 */
	function play() {
		// timer = setTimeout(function() {
		// 	next.trigger('click');
		// 	play();
		// }, interval);
		timer = setInterval(function(){
			next.trigger('click');
		},3000);
	}

	function stop() {
		clearTimeout(timer);
	}

	// carousel.hover(stop, play);
	// play();
}