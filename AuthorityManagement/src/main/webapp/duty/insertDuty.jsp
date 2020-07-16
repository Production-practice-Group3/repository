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
			<h4 class="panel-title">新增岗位信息</h4>
		</div>
		<!-- panel-heading -->
		<div class="panel-body nopadding">
			<form id="roleForm" method="post" class="form-bordered">
				<div class="form-group">
					<label class="col-sm-4 control-label">岗位名称</label>
					<div class="col-sm-8">
						<input class="form-control" id="name" name="name" placeholder="请输入岗位名称">
					</div>
				</div>
					<div class="form-group">
					<label class="col-sm-4 control-label">组织信息</label>
					<div class="col-sm-8">
						<div class="input-group mb15">
							<input id="parent_name" class="form-control" type="text" name="organ.organUuid" placeholder="请输入组织信息"/>
							<span class="input-group-addon" data-toggle="modal" data-target="#orgTree"><i class="fa fa-paper-plane"></i></span> 
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-4 control-label">角色信息</label>
					<div class="col-sm-8">
						<div class="input-group mb15">
							<input class="form-control" id="role_name" name="role.roleUuid" placeholder="请输入角色名称">
							<span class="input-group-addon" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-align-justify"></i></span> 
							<ul id="selectRole" class="dropdown-menu dropdown-menu-right">
							</ul>
						</div>
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
	<!-- 组织树 -->
	<div id="orgTree" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">组织树</h4>
				</div>
				<div class="modal-body">
					<%@ include file="/orgTree.jsp"%>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" onclick="getResult()">确定</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>

	<script type="text/javascript">
		$(function(){
			toastr.options = {
				positionClass : "toast-center-center",
				timeOut : "10000",
				showMethod : "fadeIn",
				hideMethod : "fadeOut",  
				onclick : function() {
					window.location.href='${pageContext.request.contextPath}/duty/duties.jsp';
				}
			};
			
			$.get('${pageContext.request.contextPath}/role/getRoles2', {}, function (data) {
				var html = '';
				for (var i = 0; i < data.length; i++) {
					html += '<li><a href="#" id="' + data[i].role_uuid + '" onclick="chooseRole(this)">' + data[i].role_name + '</a></li>';
				}
				$('#selectRole').append(html);
			}, "json");
			
			
		});
		
		function chooseRole(obj){
			$('#role_uuid').val(obj.id);
			$('#role_name').val(obj.innerText);
		}
		
		
		function submitForm(){
				var form = $('#roleForm').serialize();
				$.post('${pageContext.request.contextPath}/duty/insert', form, function (data) {
					if(data == 1){
						toastr.success('<strong>成功&nbsp;! </strong>&nbsp;&nbsp;请到数据列表进行查看。');
					}else{
						toastr.error('<strong>失败&nbsp;! </strong>&nbsp;&nbsp;请检查数据正确性或联系管理员。');
					}
					setTimeout(function(){
						window.location.href='${pageContext.request.contextPath}/duty/duties.jsp';
					}, 11000);
				}, "json");
		}
		
		function getResult() {
			var result = $('#result').val().split(',');
			$('#parent_name').val(result[0]);
			$('#parent_uuid').val(result[1]);
			$("#orgTree").modal('hide'); //手动关闭
		}
		
		setBodyHeight();
		window.parent.setMainDivHeight($('#abc').css('height'));
	</script>
</body>
</html>