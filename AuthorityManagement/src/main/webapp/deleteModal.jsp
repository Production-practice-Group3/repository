<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="${pageContext.request.contextPath}/js/toastr.min.js"></script>
<link href="${pageContext.request.contextPath}/css/toastr.css" rel="stylesheet">
</head>
<body>

	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
		<h4 class="modal-title" id="myModalLabel">提示</h4>
	</div>
	<div class="modal-body">
		<strong>确定要删除该数据吗?</strong>
	</div>
	<div class="modal-footer">
		<button type="button" class="btn btn-info" onclick="deleteData()">确定</button>
		<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	</div>

	<input id="dataId" type="hidden" value="<%=request.getParameter("id")%>">
	<input id="dataType" type="hidden" value="<%=request.getParameter("type")%>">

	<script type="text/javascript">
		function deleteData(id, type) {
		
			$('#_Modal').modal('hide');
	
			var url = '';
			var locationUrl='';
			switch ($('#dataType').val()) {
			case 'org':
				url = '${pageContext.request.contextPath}/org/remove';
				locationUrl = '${pageContext.request.contextPath}/org/organizations.jsp';
				break;
			case 'user':
				url = '${pageContext.request.contextPath}/user/remove';
				locationUrl = '${pageContext.request.contextPath}/user/users.jsp';
				break;
			case 'role':
				url = '${pageContext.request.contextPath}/role/remove';
				locationUrl = '${pageContext.request.contextPath}/role/roles.jsp';
				break;
			case 'duty':
				url = '${pageContext.request.contextPath}/duty/remove';
				locationUrl = '${pageContext.request.contextPath}/duty/duties.jsp';
				break;
			case 'res':
				url = '${pageContext.request.contextPath}/res/remove';
				locationUrl = '${pageContext.request.contextPath}/res/resources.jsp';
				break;
			default:
				url = '';
				locationUrl=''
			}
			
			toastr.options.positionClass = "toast-center-center";
			$.get(url, { id : $('#dataId').val() }, function(data){
				if(data == 1){
					toastr.success('<strong>成功&nbsp;! </strong>&nbsp;&nbsp;请到数据列表进行查看。');
				}else{
					toastr.error('<strong>失败&nbsp;! </strong>&nbsp;&nbsp;下面有子菜单不能删除。');
				}
				
				setTimeout(function(){
					$('#myContainer').attr('src', locationUrl);
				}, 2500);
				
			}, 'json');
		}
	</script>


</body>
</html>