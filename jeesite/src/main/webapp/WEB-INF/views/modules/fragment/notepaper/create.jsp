<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></meta>
<meta name="generator" content="JsDoc Toolkit" />
<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/dialog.jsp" %>
<title>便笺信息</title>

<script type="text/javascript" src="/jeesite/static//demo/plugins/validator/jq/jquery.min-1.11.js"></script>
<script type="text/javaScript"	src="/jeesite/static//demo/js/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="/jeesite/static//demo/plugins/jq-ui/jquery-ui-1.10.4.custom.min.js"></script>
<link rel="stylesheet" href="/jeesite/static//demo/plugins/jq-ui/css/ui-lightness/jquery-ui-1.10.4.custom.min.css"></link>
<link rel="stylesheet" href="/jeesite/static//demo/plugins/validator/jquery.validator.css"></link>
<link rel="stylesheet" href="/jeesite/static//demo/plugins/doc.css"></link>

<link rel="stylesheet" href="/jeesite/static//demo/plugins/jqGrid/css/ui.jqgrid.css"></link>
<script type="text/javascript" src="/jeesite/static//demo/plugins/jqGrid/js/i18n/grid.locale-cn.js"></script>
<script type="text/javascript" src="/jeesite/static//demo/plugins/jqGrid/js/jquery.jqGrid.min.js"></script>

<script type="text/javascript" src="/jeesite/static//demo/plugins/validator/jquery.validator.js"></script>
<script type="text/javascript" src="/jeesite/static//demo/plugins/validator/local/zh_CN.js"></script>

<script type="text/javascript">

$(function() {
	//初始化表格数据
	$("#list").jqGrid({
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
	
});

	
</script>
</head>
<body>
<div>	
	<div style="float:right">
	  <input id="btnSubmit" class="btn btn-primary" type="submit" value="查询" onclick=""/>
	  <input id="btnSubmit" class="btn btn-primary" type="submit" value="新增" onclick=""/>
	  <input id="btnSubmit" class="btn btn-primary" type="submit" value="修改" onclick=""/>
	  <input id="btnSubmit" class="btn btn-primary" type="submit" value="查看" onclick=""/>
	  <input id="btnSubmit" class="btn btn-primary" type="submit" value="删除" onclick=""/>
	</div>
	<div style="clear:both"></div>
</div>
<div style="height:10px"></div>

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
</html>