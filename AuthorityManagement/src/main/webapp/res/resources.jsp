<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<%@ include file="/tabledata.jsp"%>

</head>
<body>
	<div id="abc" class="panel panel-dark-head">
		<div class="panel-heading">
			<h4 class="panel-title">资源信息列表</h4>
		</div>
		<table id="res_table">
		</table>
	</div>

	<div id="toolbar" class="btn-group">
		<button id="btn_edit" type="button" class="btn btn-default">
			<span class="fa fa-edit" aria-hidden="true"></span>&nbsp;修改
		</button>
		<button id="btn_delete" type="button" class="btn btn-default">
			<span class="fa fa-trash-o" aria-hidden="true"></span>&nbsp;删除
		</button>
	</div>

	<script type="text/javascript">
		
		$(function(){
			$('#res_table').bootstrapTable({
				url : '${pageContext.request.contextPath}/res/getResources',
				method : 'get',
				toolbar : '#toolbar',
				striped : true,
				cache : false,
				pagination : true,
				sidePagination : "server",
				pageNumber : 1,
				pageSize : 10,
				pageList : [ 10, 25, 50, 100 ],
				showColumns : true,
				showRefresh : true,
				clickToSelect : true,
				uniqueId : "res_uuid",
				columns : [ { checkbox : true,  visible: true }, 
							{ field : 'menu_id', title : '菜单目录号' },
							{ field : 'dir_name', title : '菜单名称' },
							{ field : 'dir_level_number', title : '菜单级数' },
							{ field : 'parent.dirName', title : '父菜单名称' },
							{ field : 'isitem', title : '明细否' ,formatter : ifFormatter},
							{ field : 'locale', title : '语言类型' },
						  ],
				queryParams : function(params) {
					var queryData = {
							pageSize : params.limit,
							pageNumber : (params.offset / params.limit) + 1
					};
					return queryData;
				}
			});
		
			$('#btn_edit').click(function(){
				var resources = $('#res_table').bootstrapTable('getSelections');
				if(resources.length > 1 || resources.length == 0){
					toastr.options.positionClass = "toast-center-center";
					toastr.info('请选择一条数据进行数据编辑操作!');
					return;
				}
				window.parent.openIframe('${pageContext.request.contextPath}/res/updateResource.jsp?id=' + resources[0].res_uuid);
			});			
			
			$('#btn_delete').click(function(){
				var resources = $('#res_table').bootstrapTable('getSelections');
				if(resources.length > 1 || resources.length == 0){
					toastr.options.positionClass = "toast-center-center";
					toastr.info('请选择一条数据进行数据编辑操作!');
					return;
				}
				window.parent.openModel('${pageContext.request.contextPath}/deleteModal.jsp?id=' + resources[0].res_uuid + '&type=res');
			});			
		});
		window.parent.setMainDivHeight(0);
		window.parent.set_iFrame(680);
	</script>
</body>
</html>