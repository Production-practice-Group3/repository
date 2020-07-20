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
			<h4 class="panel-title">编辑组织信息</h4>
		</div>
		<!-- panel-heading -->
		<div class="panel-body nopadding">
			<form id="orgForm" method="post" class="form-bordered">
				<input id="organ_uuid" name="organUuid" type="hidden" value="<%=request.getParameter("id")%>">
				
				<div class="form-group">
					<label class="col-sm-4 control-label">组织编码</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="organ_code" name="organCode" placeholder="请输入组织编码">
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-4 control-label">组织名称</label>
					<div class="col-sm-8">
						<input class="form-control" id="organ_name" name="organName" placeholder="请输入组织名称">
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-4 control-label">父组织信息</label>
					<div class="col-sm-8">
						<div class="input-group mb15">
							<input id="parent_name" class="form-control" type="text" name="parentName" placeholder="请输入父组织信息"/>
							<input id="parent_uuid" type="hidden" name="parentUuid"/>
							<span class="input-group-addon" data-toggle="modal" data-target="#orgTree"><i class="fa fa-paper-plane"></i></span> 
						</div>
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-4 control-label">描述</label>
					<div class="col-sm-8">
						<textarea class="form-control" id="description" name="description" placeholder="请输入描述"></textarea>
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-4 control-label">组织账号</label>
					<div class="col-sm-8">
						<input class="form-control" id="account_code" name="accountCode" placeholder="请输入组织账号">
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-4 control-label">组织简称</label>
					<div class="col-sm-8">
						<input class="form-control" id="shortname" name="shortname" placeholder="请输入组织简称">
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
					window.location.href='${pageContext.request.contextPath}/org/organizations.jsp';
				}
			};
			
			//初始化页面
			$.get('${pageContext.request.contextPath}/org/getOrg', {uuid : $('#organ_uuid').val()}, function (org) {
				$('#organ_code').val(org.organCode);
				$('#organ_name').val(org.organName);
				$('#parent_uuid').val(org.parentUuid);
				$('#parent_name').val(org.parentName);
				$('#description').val(org.description);
				$('#account_code').val(org.accountCode);
				$('#shortname').val(org.shortname);
			}, "json");
			
		});
		
		function submitForm(){
				var form = $('#orgForm').serialize();
				$.post('${pageContext.request.contextPath}/org/update', form, function (data) {
					
					debugger;
					if(data == 1){
						toastr.success('<strong>成功&nbsp;! </strong>&nbsp;&nbsp;请到数据列表进行查看。');
					}
					else if(data == 2){
						toastr.error('<strong>失败&nbsp;! </strong>&nbsp;&nbsp;父组织选择错误！');
					}
					else{
						toastr.error('<strong>失败&nbsp;! </strong>&nbsp;&nbsp;请检查数据正确性或联系管理员。');
					}
					
					setTimeout(function(){
						window.location.href='${pageContext.request.contextPath}/org/organizations.jsp';
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