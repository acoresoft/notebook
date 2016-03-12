$(function(){
	//触发全屏
	/*$(document).on("click", "[data-toggle=fullscreen]", function(e) {
		if (screenfull.enabled) {
			screenfull.request();
		}
	});*/
	$("[nav-n]").each(function () {
		$(this).bind("click",function(){
				var nav = $(this).attr("nav-n");
				var sn = nav.split(",");
				var html = '<li><i class="fa fa-home"></i>';
				html+='<a href="index.shtml">Home</a></li>';
				for(var i=0;i<2;i++){
					html+='<li><a href="javascript:void(0)">'+sn[i]+'</a></li>';
				}
				$("#topli").html(html);
				var tb = $("#loadhtml");
				//tb.html(CommnUtil.loadingImg());
				//tb.load($$ctx+sn[2]);
		});
	});
})
