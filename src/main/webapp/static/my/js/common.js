function onloadurl(){
	$("[data-url]").each(function () {
		var tb = $(this);
		tb.html(CommnUtil.loadingImg());
		tb.load($$ctx+tb.attr("data-url"));
	});
};
;(function() {
	CommnUtil={
			loadingImg :function() {
				var html = '<div class="alert alert-warning">'
					+ '<button type="button" class="close" data-dismiss="alert">'
					+ '<i class="ace-icon fa fa-times"></i></button><div style="text-align:center">'
					+ '<img src="' + $$ctx + '/static/my/img/loading.gif"/><div>'
					+ '</div>';
				return html;
				}
	}
	var utils={};
	utils.in_array=function(array, string) {
		for (var s = 0; s < array.length; s++) {
			thisEntry = array[s].toString();
			if (thisEntry == string) {
				return true;
			}
		}
		return false;
	}
	//window.CommnUtil=CommnUtil;
})();