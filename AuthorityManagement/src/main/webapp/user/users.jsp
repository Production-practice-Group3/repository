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
			<h4 class="panel-title">用户信息列表</h4>
		</div>
		<table id="user_table">
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
			$('#user_table').bootstrapTable({
				url : '${pageContext.request.contextPath}/user/getUsers',
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
				uniqueId : "userUuid",
				columns : [ { checkbox : true, visible: true }, 
							{ field : 'username', title : '姓名', width : 120, align : 'center' },
							{ field : 'email', title : '邮箱', width : 200, align : 'center' },
							{ field : 'mobile', title : '手机', width : 150, align : 'center' },
							{ field : 'niceName', title : '昵称', width : 130, align : 'center' },
							{ field : 'organ.organName', title : '部门', width : 200, align : 'center' },
							//{ field : 'is_admin', title : '是否管理员' ,formatter : ifFormatter, width : 120, align : 'center'},
							//{ field : 'is_sun', title : '是否阳光用户',formatter : ifFormatter, width : 120 , align : 'center'},
							{ field : 'modtime', title : '修改时间' ,formatter : dateFormatter, align : 'center'}
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
				var users = $('#user_table').bootstrapTable('getSelections');
				if(users.length > 1 || users.length == 0){
					toastr.options.positionClass = "toast-center-center";
					toastr.info('请选择一条数据进行数据编辑操作!');
					return;
				}
				window.parent.openIframe('${pageContext.request.contextPath}/user/updateUser.jsp?id=' + users[0].userUuid);
			});			
			
			$('#btn_delete').click(function(){
				var users = $('#user_table').bootstrapTable('getSelections');
				if(users.length > 1 || users.length == 0){
					toastr.options.positionClass = "toast-center-center";
					toastr.info('请选择一条数据进行数据编辑操作!');
					return;
				}
				window.parent.openModel('${pageContext.request.contextPath}/deleteModal.jsp?id=' + users[0].userUuid + '&type=user');
			});			
		});
		window.parent.setMainDivHeight(0);
		window.parent.set_iFrame(680);
	</script>
</body>
</html>





















