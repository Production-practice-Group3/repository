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
			<h4 class="panel-title">新增用户信息</h4>
		</div>
		<!-- panel-heading -->
		<div class="panel-body nopadding">
			<form id="orgForm" method="post" class="form-bordered">
				<input id="user_uuid" name="userUuid" type="hidden" value="<%=request.getParameter("id")%>">
				<div class="form-group">
					<label class="col-sm-4 control-label">用户名</label>
					<div class="col-sm-8">
						<input class="form-control" id="username" name="username" placeholder="请输入用户姓名">
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-4 control-label">密码</label>
					<div class="col-sm-8">
						<input class="form-control" type="password" id="password" name="password" placeholder="请输入用户密码">
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-4 control-label">邮箱</label>
					<div class="col-sm-8">
						<input class="form-control" id="email" name="email" placeholder="请输入用户邮箱">
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-4 control-label">手机</label>
					<div class="col-sm-8">
						<input class="form-control" id="mobile" name="mobile" placeholder="请输入用户手机号">
					</div>
				</div>
				
			
				<div class="form-group">
					<label class="col-sm-4 control-label">所属组织</label>
					<div class="col-sm-8">
						<div class="input-group mb15">
						    <!-- <input id="parent_uuid" type="hidden" name="organ.organUuid"/>-->
							 <input id="parent_name" class="form-control" type="text" name="organ.organName" placeholder="请选择组织信息"/>
							<input id="parent_uuid" type="hidden" name="organ.organUuid"/>
							<span class="input-group-addon" data-toggle="modal" data-target="#orgTree"><i class="fa fa-paper-plane"></i></span> 
						</div>
					</div>
				</div>
				
				<div class="form-group" style="display: none;">
					<label class="col-sm-4 control-label">岗位信息</label>
					<div id="duty" class="col-sm-8">
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-4 control-label">昵称</label>
					<div class="col-sm-8">
						<input class="form-control" id="nice_name" name="niceName" placeholder="请输入用户昵称">
					</div>
				</div>
				
				
				<div class="form-group">
					<label class="col-sm-4 control-label">备注</label>
					<div class="col-sm-8">
						<textarea class="form-control" id="remark" name="remark" placeholder="请输入备注"></textarea>
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
	<!-- 用户树 -->
	<div id="orgTree" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">用户树</h4>
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
					window.location.href='${pageContext.request.contextPath}/user/users.jsp';
				}
			};
			
			//初始化页面
			$.get('${pageContext.request.contextPath}/user/getUser', {uuid : $('#user_uuid').val()}, function (user) {
				$('#username').val(user.username);
				$('#password').val(user.password);
				$('#email').val(user.email);
				$('#mobile').val(user.mobile);
				$('#nice_name').val(user.niceName);
				$('#remark').val(user.remark);
				//组织数据赋值
				$('#parent_uuid').val(user.organ.organUuid);
				$('#parent_name').val(user.organ.organName);
				if(user.duties != null || user.duties.length > 0){
					
					
					$.get('${pageContext.request.contextPath}/duty/getDutyByOrganId', { organId : user.organ.organUuid }, function(data) {
						var html = '';
						for (var i = 0; i < data.length; i++) {
							var duty = data[i];
							html += '<div class="checkbox icheck-silver icheck-inline"><input type="checkbox" ' + checkDuty(user.duties,duty.dutyid) + ' id="' + duty.dutyid + '" value="' + duty.dutyid + '" name="duties[' + i + '].dutyid"/><label for="' + duty.dutyid + '">'
									+ duty.name + '</label></div>';
						}
						$('#duty').append(html);
						$('#duty').parent().css('display', 'block');
			
						setBodyHeight();
					}, "json");
					
					
					for (var i = 0; i <  user.duties.length; i++) {
						document.getElementById(user.duties[i].dutyid).checked = true;
					}
				}
				
				
			}, "json");

		});
		
		function checkDuty(array,dutyid){
			var html = 'checked = "true"';
			for (var i = 0; i < array.length; i++) {
				if(dutyid == array[i].dutyid){
					return html;
				}
			}
			return '';
		}

		function submitForm() {
			var form = $('#orgForm').serialize();
			$.post('${pageContext.request.contextPath}/user/update',form,function(data) {
				if (data == 1) {
					toastr.success('<strong>成功&nbsp;! </strong>&nbsp;&nbsp;请到数据列表进行查看。');
				} 
				else if(data == 2){
					toastr.success('<strong>用户名已存在&nbsp;! </strong>&nbsp;&nbsp;请重新输入。');
				}
				else if(data == 3){
					toastr.success('<strong>用户名密码不能为空&nbsp;! </strong>&nbsp;&nbsp;请重新输入。');
				}
				else {
					toastr.error('<strong>失败&nbsp;! </strong>&nbsp;&nbsp;请检查数据正确性或联系管理员。');
				}

				setTimeout(function() {
					window.location.href = '${pageContext.request.contextPath}/user/users.jsp';
				}, 11000);

			}, "json");
		}

		function getResult() {
			var result = $('#result').val().split(',');
			$('#parent_name').val(result[0]);
			$('#parent_uuid').val(result[1]);
			$("#orgTree").modal('hide'); //手动关闭
			
			$('#duty').empty();
			
			$.get('${pageContext.request.contextPath}/duty/getDutyByOrganId', { organId : result[1] }, function(data) {
				var html = '';
				for (var i = 0; i < data.length; i++) {
					var duty = data[i];
					html += '<div class="checkbox icheck-silver icheck-inline"><input type="checkbox" id="' + duty.dutyid + '" value="' + duty.dutyid + '" name="duties[' + i + '].dutyid" /><label for="' + duty.dutyid + '">'
							+ duty.name + '</label></div>';
				}
				$('#duty').append(html);
				$('#duty').parent().css('display', 'block');
	
				var o = document.getElementById("abc");
				window.parent.set_iFrame(o.clientHeight || o.offsetHeight);
			}, "json");
			
		}
		setBodyHeight();
		window.parent.setMainDivHeight($('#abc').css('height'));
		
	</script>
</body>
</html>