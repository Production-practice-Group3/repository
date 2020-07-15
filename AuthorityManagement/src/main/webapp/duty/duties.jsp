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
			<h4 class="panel-title">岗位信息列表</h4>
		</div>
		<table id="duty_table">
		</table>
	</div>

	<script type="text/javascript">
		$(function(){
			$('#duty_table').bootstrapTable({
				url : '${pageContext.request.contextPath}/duty/getDuties',
				method : 'get',
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
				uniqueId : "dutyId",
				columns : [ { field : 'name', title : '岗位名称', width : 200},
							{ field : 'organ.organName', title : '组织信息', width : 200},
							{ field : 'role.roleName', title : '角色信息', width : 200},
							{ field:'dutyId', title : '操作', width : 100, align : 'center', formatter : 
								function actionFormatter(value, row, index) {
									var result = '';
									result += '<a href="#" class="btn btn-sm" onclick="updateDuty(\'' + value + '\')"><span class="fa fa-edit"></span>&nbsp;编辑</a>';
									result += '<a href="#" class="btn btn-sm" onclick="deleteDuty(\'' + value + '\')"><span class="fa fa-trash-o"></span>&nbsp;删除</a>';
									return result;
								}
							}
						  ],
				queryParams : function(params) {
					var queryData = {
							pageSize : params.limit,
							pageNumber : (params.offset / params.limit) + 1
					};
					return queryData;
				}
			});
		});
		
		function updateDuty(id){
			window.parent.openIframe('${pageContext.request.contextPath}/duty/updateDuty.jsp?id=' + id);
		}	
		
		function deleteDuty(id){
			window.parent.openModel('${pageContext.request.contextPath}/deleteModal.jsp?id=' + id + '&type=duty');
		}	
		
		window.parent.setMainDivHeight(0);
		window.parent.set_iFrame(680);
	</script>
</body>
</html>