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
			<h4 class="panel-title">角色信息列表</h4>
		</div>
		<table id="role_table">
		</table>
	</div>
	<div class="modal fade" id="resTreeModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">资源树</h4>
				</div>
				<div class="modal-body">
					<input id="roleId" type="hidden">
					<%@ include file="/role/resTree.jsp"%>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" onclick="saveResource()">确定</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		
		$(function(){
			$('#role_table').bootstrapTable({
				url : '${pageContext.request.contextPath}/role/getRoles',
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
				uniqueId : "roleUuid",
				columns : [ { field : 'roleId', title : '角色编码' },
							{ field : 'roleName', title : '角色名称' },
							{ field:'roleUuid', title : '操作', width : 300, align : 'center', formatter : 
								function actionFormatter(value, row, index) {
									var result = '';
									result += '<a href="#" class="btn btn-sm" onclick="updateRole(\'' + value + '\')"><span class="fa fa-edit"></span>&nbsp;编辑</a>';
									result += '<a href="#" class="btn btn-sm" onclick="deleteRole(\'' + value + '\')"><span class="fa fa-trash-o"></span>&nbsp;删除</a>';
									result += '<a href="#" class="btn btn-sm" onclick="linkResource(\'' + value + '\')"><span class="fa fa-link"></span>&nbsp;关联资源</a>';
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
			
			$('#resTreeModal').on('hide.bs.modal', function () {
		          window.location.reload();
		   });
		});
		
		function updateRole(id){
			window.parent.openIframe('${pageContext.request.contextPath}/role/updateRole.jsp?id=' + id);
		}	
		
		function deleteRole(id){
			window.parent.openModel('${pageContext.request.contextPath}/deleteModal.jsp?id=' + id + '&type=role');
		}
		
		function linkResource(id){
			$('#roleId').val(id);
		 	$.get('${pageContext.request.contextPath}/role/getResources', { roleId : id}, function (data) {
		 		if(data.length > 0){
		 			$('input[name="res_uuid"]').each(function(){
			 			if(data.indexOf($(this).attr('id')) != -1){
			 				 $(this).attr('checked','checked');
			 			}
		            });
		 		}
			}, "json");
			
			$('#resTreeModal').modal('show');
		}
		
		function saveResource(){
			var cks = '';
			var pid = '';
            $('input[name="res_uuid"]:checked').each(function(){ 
            	if(pid != $(this).attr('title')){
            		cks += $(this).attr('title')+','; 
            		pid = $(this).attr('title');
            	}
            	cks += $(this).attr('id')+','; 
            });
            var params = {
            		roleId : $('#roleId').val(),
            		resources : cks
            };
            toastr.options = {
    				positionClass : "toast-center-center",
    				showMethod : "fadeIn",
    				hideMethod : "fadeOut",  
    				onclick : function() {
    					$('#resTreeModal').modal('hide');
    				}
    			};
            
            $.get('${pageContext.request.contextPath}/role/linkResource', params, function (data) {
            	if(data == 0){
            		toastr.error('<strong>关联资源失败&nbsp;! </strong>');
				}else{
					toastr.success('<strong>关联资源成功&nbsp;!</strong>');
				}
			}, "json");
		}
		
		window.parent.setMainDivHeight(0);
		window.parent.set_iFrame(680);
	</script>
</body>
</html>