<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
%>
<html>
<head>
	<script src="<%=basePath%>/resources/jquery/jquery-2.1.1.js" type="text/javascript"></script>
	<script src="<%=basePath%>/resources/easyui-layout/easyloader.js" type="text/javascript"></script>
	<script src="<%=basePath%>/resources/bootstrap/dist/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="<%=basePath%>/resources/bootstrap-table/dist/bootstrap-table.js" type="text/javascript"></script>
	<script src="<%=basePath%>/resources/bootstrap-table/dist/locale/bootstrap-table-zh-CN.min.js" type="text/javascript"></script>
	<script src="<%=basePath%>/resources/zTree/js/jquery.ztree.core.js" type="text/javascript"></script>
	<script src="<%=basePath%>/resources/data-fmt/DATA-FMT.js" type="text/javascript"></script>
	<script src="<%=basePath%>/resources/zTree/js/jquery.ztree.excheck.js"></script>
	<script src="<%=basePath%>/resources/jquery-confirm/dist/jquery-confirm.min.js"></script>
	<script src="<%=basePath%>/resources/bootstrap-fileinput/js/fileinput.min.js" type="text/javascript"></script>
	<script src="<%=basePath%>/resources/handsontable/dist/handsontable.full.min.js" type="text/javascript"></script>
	<script src="<%=basePath%>/resources/ext/panelR.js" type="text/javascript"></script>
	<script src="<%=basePath%>/resources/zTree/js/jquery.ztree.node.js" type="text/javascript"></script>
	
	<script src="<%=basePath%>/resources/easyui-layout/bootstrap-typeahead.js"></script><!--qiu stylehead.js 搜索自动补充completion  -->
	
	<link rel="stylesheet" href="<%=basePath%>/resources/bootstrap/dist/css/bootstrap.min.css" type="text/css" />
	<link rel="stylesheet" href="<%=basePath%>/resources/zTree/css/metroStyle/metroStyle.css" type="text/css" />
	<link rel="stylesheet" href="<%=basePath%>/resources/bootstrap-table/dist/bootstrap-table.css" type="text/css" />
	<link rel="stylesheet" href="<%=basePath%>/resources/icon/iconfont.css" type="text/css" />
	<link rel="stylesheet" href="<%=basePath%>/resources/ext/buttonExt.css" type="text/css" />
	<link rel="stylesheet" href="<%=basePath%>/resources/jquery-confirm/dist/jquery-confirm.min.css" type="text/css" />
	<link rel="stylesheet" href="<%=basePath%>/resources/bootstrap-fileinput/css/fileinput.min.css" type="text/css" />
	<link rel="stylesheet" href="<%=basePath%>/resources/handsontable/dist/handsontable.full.min.css" type="text/css" />
	<link rel="stylesheet" href="<%=basePath%>/resources/handsontable/dist/handsontable-ext.css" type="text/css" />

</head>
<style>
	.form-control {
		font-size: 12px;
	}
	
	.input_radius {
		border-top-right-radius: 5px;
		border-top-left-radius: 5px;
		border-bottom-right-radius: 5px;
		border-bottom-left-radius: 5px;
	}
	/* .table-no-bordered{  
	    border-right: 2px solid transparent; 
	  		border-right: none;
	}
	.fixed-table-body { 
	    overflow: hidden !important;
	    height: auto !important; 
	} */
/* ul li以横排显示 */

#addBussElement {
font-size: 1600px；


}
</style>
<body class="easyui-layout" id="elemLayout">
	<div
		data-options="region:'east',split:true,collapsed:true"
		style="width: 300px">
		<div data-options="region:'north',border:false"
			style="background: #F6F6F6; border-bottom: 1px solid #DDDDDD; height: 28px; width: 100%; padding-top: 2px; padding-left: 5px;">
			<i id="addBussElementValue" class="iconfont icon-addition btn-hover"
				title="新建值域" onclick="addBussElementValues()"
				style="cursor: pointer; margin-left: 6px; font-size: 18px"></i> <i
				id="updateBussElementValue" class="iconfont icon-brush btn-hover"
				title="修改值域" onclick="updateBussElementValues()"
				style="cursor: pointer; margin-left: 6px; font-size: 18px"></i> <i
				id="delBussElementValue" class="iconfont icon-empty btn-hover"
				title="删除值域"
				style="cursor: pointer; margin-left: 6px; font-size: 18px"
				onclick="delBussElementValues()"></i>
		</div>
		<div data-options="region:'center',border:false">
			<ul id="bussElementValueTree" class="ztree"></ul>
		</div>
	</div>
	<div data-options="region:'west',split:true"
		style="width: 300px">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'north',border:false"
				style="background: #F6F6F6; border-bottom: 1px solid #DDDDDD; height: 28px; width: 100%; padding-top:2px; padding-left: 5px;">
				<select id="dirControl" class="form-control"
					style="width: 200px; height: 23px; line-height: 23px;">
				</select>
			</div>
			<div data-options="region:'center',border:false">
				<ul id="elementDir" class="ztree"></ul>
			</div>
		</div>
	</div>
	<div data-options="region:'center'">
		<div class="easyui-layout" data-options="fit:true">

			<div data-options="region:'center',border:false" style="overflow:hidden">
				<div style="background: #F6F6F6; border-bottom: 1px solid #DDDDDD; height: 28px; width: 100%; padding-top: 2px; padding-left: 5px;">
					<div style="float: left;">
						<i id="importBussElement" onclick="importBussElement()"
							title="导入要素" class="iconfont icon-smallscreen btn-hover"
							style="cursor: pointer; margin-left: 6px; font-size: 16px"></i> <i
							id="addBussElement" onclick="addBussElement()" title="新建要素"
							class="iconfont icon-addition btn-hover"
							style="cursor: pointer; margin-left: 6px; font-size: 16px"></i> <i
							id="updateBussElement" onclick="updateBussElement()" title="修改要素"
							class="iconfont icon-brush btn-hover"
							style="cursor: pointer; margin-left: 6px; font-size: 16px;"></i> <i
							id="deleteBussElement" onclick="deleteBussElement()" title="删除要素"
							class="iconfont icon-empty btn-hover"
							style="cursor: pointer; margin-left: 6px; font-size: 16px"></i> <i
							id="linkBussElementDirectory" onclick="linkBussElementDirectory()"
							title="链接要素" class="iconfont icon-lianjie btn-hover"
							style="cursor: pointer; margin-left: 6px; font-size: 14px"></i> <i
							id="unlinkBussElementDirectory"
							onclick="unlinkBussElementDirectory()" title="断开要素"
							class="iconfont icon-break btn-hover"
							style="cursor: pointer; margin-left: 6px; font-size: 14px"></i>
					</div>
					<div style="float: right;width:300px; margin-right: 6px;">
						<select id="type" name="select" class="form-control" style="float: left; margin-left: 6px; width: 100px; height: 23px; line-height: 23px;">
							<option value="bussElement">按要素</option>
							<option value="bussElementValue">按取值</option>
						</select>  
						<div class="input-group" style="height: 23px;margin-left: 6px;padding-left: 6px; ">
						<div class="input-icon-group" style="height: 23px;">
							<div class="input-group" style="width: 100%;height: 23px;">
								<input type="text" id="name" name="name" class="form-control" data-provide="typeahead" style="height: 23px;border-right: 0px;border-right-color: white;width:166px;"> 
								<span class="input-group-addon" style="background-color:white; padding: 0px;border-left: 0px; border-left-color: white;">
									<i id="queryBussElementDirectory" title="搜索" class="iconfont icon-search btn-hover"></i>
								</span> 
								</input>
							</div>
						</div>
						</div>
					</div>
				</div>
				<div class="menu">
					<ul id="myTab" class="nav nav-pills">
						<li class="active"><a href="#tab_allElements" data-toggle="tab">全部要素</a></li>
						<li><a href="#tab_linkElements" data-toggle="tab">已链接要素</a></li>
						<li><a href="#tab_nlinkElements" data-toggle="tab">未链接要素</a></li>
					</ul>
				</div>
				<div id="myTabContent" class="tab-content">
					<div class="tab-pane fade in active" id="tab_allElements">
						<div style="width: 100%; height: 82%;">
							<table id="allElementTable" class="table-no-bordered"></table>
						</div>
					</div>
					<div class="tab-pane fade" id="tab_linkElements">
						<div style="width: 100%; height: 82%;">
							<table id="bussElementLinkTable" class="table-no-bordered"></table>
						</div>
					</div>
					<div class="tab-pane fade" id="tab_nlinkElements">
						<div style="width: 100%; height: 82%;">
							<table id="bussElementUnLinkedTable" class="table-no-bordered"></table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 左侧树话框-->
	<jsp:include page="elementTree.jsp" />
	<!-- 中间话框-->
	<jsp:include page="elementCenter.jsp" />
	<!-- 值域维护模式对话框-->
	<jsp:include page="elementRangeValueManage.jsp" />
</body>
</html>