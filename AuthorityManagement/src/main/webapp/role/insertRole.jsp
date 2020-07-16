<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>系统主页</title>
<meta name="viewport" charset="utf-8" content="width=device-width, initial-scale=1">
<%@ include file="/tabledata.jsp"%>
<link href="${pageContext.request.contextPath}/css/bootstrap-override.css" rel="stylesheet">
<style>
.form-control {
	border-radius: 5px;
	height: 30px;
}
</style>

</head>
<body>
	<div id="abc" class="panel panel-dark-head">
		<div class="panel-heading">
			<h4 class="panel-title">新增角色信息</h4>
		</div>
		<!-- panel-heading -->
		<div class="panel-body nopadding">
			<form id="roleForm" method="post" class="form-bordered">
				<div class="form-group">
					<label class="col-sm-4 control-label">角色编码</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="role_id" name="roleId" placeholder="请输入角色编码">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-4 control-label">角色名称</label>
					<div class="col-sm-8">
						<input class="form-control" id="role_name" name="roleName" placeholder="请输入角色名称">
					</div>
				</div>
				<div class="form-group" style="text-align: center;">
					<div class="col-sm-12" style="text-align: center;">
						<input type="button" class="btn btn-default" onclick="submitForm()" value="提交" />
						&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="reset" class="btn btn-default">重置</button>
					</div>
				</div>
			</form>
		</div>
	</div>

	<script type="text/javascript">
		$(function(){
			toastr.options = {
				positionClass : "toast-center-center",
				timeOut : "10000",
				showMethod : "fadeIn",
				hideMethod : "fadeOut",  
				onclick : function() {
					window.location.href='${pageContext.request.contextPath}/role/roles.jsp';
				}
			};
		});
		
		function submitForm(){
				var form = $('#roleForm').serialize();
				$.post('${pageContext.request.contextPath}/role/insert', form, function (data) {
					
					debugger;
					if(data == 1){
						toastr.success('<strong>成功&nbsp;! </strong>&nbsp;&nbsp;请到数据列表进行查看。');
					}else{
						toastr.error('<strong>失败&nbsp;! </strong>&nbsp;&nbsp;请检查数据正确性或联系管理员。');
					}
					
					setTimeout(function(){
						window.location.href='${pageContext.request.contextPath}/role/roles.jsp';
					}, 11000);
					
				}, "json");
		}
		setBodyHeight();
		window.parent.setMainDivHeight($('#abc').css('height'));
		
	</script>
</body>
</html>