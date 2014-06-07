;(function($){
	$.myDialog = {
		 params:{
			autoOpen : true,
			height : 140,
			modal : true,
			width : 300
		},
	
		show:function(options){
			var opts = $.extend({}, $.myDialog.params, options);
			var dialogDiv = $('<div></div>');
			dialogDiv.attr({'id':opts.id, 'title':opts.title});
			dialogDiv.append($('<iframe></iframe>').attr({'id':'iframe_dialog','border':'0', 'src':opts.link, 'width':'100%', 'height':'100%', 'frameborder':'no'}));
			$("body").append($("<div id='aa_dialog'></div>").append(dialogDiv));
			
			$("#"+opts.id).omDialog(opts);
		},
		
		close:function(id) {
			//$('#'+id).omDialog('close').remove();
			//$('#'+id).omDialog('destroy');
			$('#aa_dialog').remove();
		}
		
		
	}
})(jQuery);