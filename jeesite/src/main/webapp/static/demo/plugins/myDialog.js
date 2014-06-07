;(function($){
	jQuery.myDialog = function(options) {
		var params = {
			autoOpen : true,
			height : 140,
			modal : true,
			width : 300
		};
		
		var opts = $.extend({}, params, options);
		
		show:function(pp){
			var tt = "<div id='dialog-modal' title='模态窗口'><p>显示模态对话框，在关闭对话框之前不能操作页面内容.</p></div>";
			$( "#dialog-modal").omDialog(opts);

		};
		
	}
})(jQuery);