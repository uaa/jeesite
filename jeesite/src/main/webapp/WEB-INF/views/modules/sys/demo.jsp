<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></meta>
<meta name="generator" content="JsDoc Toolkit" />
<title></title>

<script type="text/javascript" src="/jeesite/static//demo/plugins/validator/jq/jquery.min-1.11.js"></script>
<script type="text/javaScript"	src="/jeesite/static//demo/js/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="/jeesite/static//demo/plugins/jq-ui/jquery-ui-1.10.4.custom.min.js"></script>
<link rel="stylesheet" href="/jeesite/static//demo/plugins/jq-ui/css/ui-lightness/jquery-ui-1.10.4.custom.min.css">
<link rel="stylesheet" href="/jeesite/static//demo/plugins/validator/jquery.validator.css">
<link rel="stylesheet" href="/jeesite/static//demo/plugins/doc.css">

<link rel="stylesheet" href="/jeesite/static//demo/plugins/jqGrid/css/ui.jqgrid.css">
<script type="text/javascript" src="/jeesite/static//demo/plugins/jqGrid/js/i18n/grid.locale-cn.js"></script>
<script type="text/javascript" src="/jeesite/static//demo/plugins/jqGrid/js/jquery.jqGrid.min.js"></script>

<script type="text/javascript" src="/jeesite/static//demo/plugins/validator/jquery.validator.js"></script>
<script type="text/javascript" src="/jeesite/static//demo/plugins/validator/local/zh_CN.js"></script>

<script type="text/javascript">
var _$ = jQuery.noConflict(true);
</script>


<link rel="stylesheet" type="text/css"	href="/jeesite/static//demo/css/default/om-default.css"></link>
<link rel="stylesheet" href="/jeesite/static//demo/plugins/doc.css">
<script type="text/javaScript"	src="/jeesite/static//demo/js/jquery.min.js"></script>
<script type="text/javaScript"	src="/jeesite/static//demo/js/operamasks-ui.min.js"></script>
<script type="text/javaScript"	src="/jeesite/static//demo/lang/zh-tw.js"></script>

<script type="text/javascript">

_$(function() {
	//初始化表格数据
	_$("#list").jqGrid({
        //url: "/jeesite/static//demo/dataGrid.json",
        url:"/jeesite/a/sys/user/page",
        datatype: "json",
        mtype: "GET",
        colNames: ["排序", "名称", "链接"],
        colModel: [
            { name: "sort", width: 55, hidden: true },
            { name: "name", width: 90 },
            { name: "href", width: 80, align: "right" }
        ],
        pager: "#pager",
		rows: "rows",
        rowNum: 10,
        rowList: [10, 20, 30],
        sortname: "id",
        sortorder: "desc",
        viewrecords: true,
        gridview: true,
        autoencode: true,
        caption: "表格展示",
		autowidth:true,
		//width:800,
		height:320,
		multiselect:true //设置可以多选
    });
	
	
	//新增操作
	_$('#createBtn').button({}).click(function(){
		window.top.$.myDialog.show({
					autoOpen: true,
					height: 200,
					width :600,
					modal: true, 
					link : 'demo_create.html',
					title : '新增',
					id : 'dialog-modal', 
					buttons : [{
									text : "提交", 
									click : function() {
										window.top.frames['iframe_dialog'].contentWindow.submitForm();
									}
								},{
									text : "关闭", 
									click : function() {
										window.top.$.myDialog.close('dialog-modal');
									}
								}
							  ],
					onClose:function(event){
						window.top.$.myDialog.close('dialog-modal');
					}
				});
	});
	
	//查询操作
	_$('#queryBtn').button({}).click(function() {
		//根据查询条件重新加载数据
		_$('#list').jqGrid({}).trigger("reloadGrid");;		
	});
	
	//高级查询操作
	_$('#moreBtn').button({}).click(function() {
		$( "#more-dialog" ).omDialog("open");		
	});
	
	//编辑操作
	_$('#eidtBtn').button({}).click(function() {
		var selRows = _$('#list').jqGrid('getGridParam', 'selarrrow');
		if(selRows && selRows.length==1) {
			window.top.$.myDialog.show({
					autoOpen: true,
					height: 200,
					width :600,
					modal: true, 
					link : 'demo_edit.html',
					title : '编辑',
					id : 'dialog-modal', 
					buttons : [{
									text : "提交", 
									click : function() {
										window.top.frames['iframe_dialog'].contentWindow.submitForm();
									}
								},{
									text : "关闭", 
									click : function() {
										window.top.$.myDialog.close('dialog-modal');
									}
								}
							  ],
					onClose:function(event){
						window.top.$.myDialog.close('dialog-modal');
					}
				});
		} else {
			$.omMessageBox.alert({
			   content:'请选择一条记录进行编辑'
			});
		}
	});
	
	//查看操作
	_$('#viewBtn').button({}).click(function() {
		var selRows = _$('#list').jqGrid('getGridParam', 'selarrrow');
		if(selRows && selRows.length==1) {
			window.top.$.myDialog.show({
					autoOpen: true,
					height: 200,
					width :600,
					modal: true, 
					link : 'demo_view.html',
					title : '查看',
					id : 'dialog-modal', 
					buttons : [{
									text : "关闭", 
									click : function() {
										window.top.$.myDialog.close('dialog-modal');
									}
								}
							  ],
					onClose:function(event){
						window.top.$.myDialog.close('dialog-modal');
					}
				});
		} else {
			$.omMessageBox.alert({
			   content:'请选择一条记查看'
			});
		}		
	});
	
	//删除操作
	_$('#deleteBtn').button({}).click(function() {
		var selRows = _$('#list').jqGrid('getGridParam', 'selarrrow');
		if(selRows && selRows.length==1) {
			//传数据给后台操作
		} else {
			$.omMessageBox.alert({
			   content:'请选择一条记录删除'
			});
		}		
	});



	$( "#more-dialog" ).omDialog({
            autoOpen : false, 
            resizable: false,
            height:140,
            modal: false,
            buttons: [{
                text : "当然", 
                click : function () {
                    $("#earth").text("又一次拯救了地球, 英雄真是寂寞");
                    $("#dialog-confirm" ).omDialog("close");
                }
            }, {
                text : "暂不", 
                click : function () {
                    $("#earth").text("正儿女情长，拯救地球这种小事就交给奥特曼了");
                    $("#dialog-confirm" ).omDialog("close");
                }
            }]
        });

});

	
</script>
</head>
<body>
<div>	
	<div style="float:left">
		地区:<input type="text" style="width:150; height:50"/> <a id="queryBtn" href="javascript:void(0)">查询</a><a id="moreBtn" href="javascript:void(0)">高级查询</a>
	</div>
	<div style="float:right">
	  <a id="createBtn" href="javascript:void(0)">新增</a>
	  <a id="eidtBtn" href="javascript:void(0)">编辑</a>
	  <a id="viewBtn" href="javascript:void(0)">查看</a>
	  <a id="deleteBtn" href="javascript:void(0)">删除</a>
	</div>
	<div style="clear:both"></div>
</div>
<div style="height:10px"></div>
<!--<table id="grid"></table>-->

<div >
<table id="list"><tr><td></td></tr></table> 
<div id="pager"></div>
</div>


<div id="more-dialog" title="确认" style="display: none;">
    <table>
    	<tr><td>用户名</td><td><input type="text" id="username"/></td></tr>
        <tr><td>密码</td><td><input type="text" id="upwd"/></td></tr>
    </table>
</div>


</body>
