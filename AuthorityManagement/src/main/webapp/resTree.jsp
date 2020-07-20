<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.tree.css" />
</head>
<body>
	<div class="tree well"  onclick="abc()">
		<input id="result" type="hidden">
		<ul id="in">
		</ul>
		<ul id="out">
		</ul>
	</div>
	<script type="text/javascript">
		
		$(function() {
			
			$.get('${pageContext.request.contextPath}/res/getResourcesByParentId', { parentId : '-1' }, function(root) {
				for (var i = 0; i < root.children.length; i++) {
					getChildren_in(root.children[i]);
					if (root.children[i].hasChildren){
						html_in += '</li>';
					}
				}
				
				$('#in').append('<li><span id="'+ root.id +'"><i class="icon-folder-open"></i> '+ root.name + '</span><ul>' + html_in + '</ul></li>');
			
			}, 'json');
			
		});
		
		var html_in = '';
		function getChildren_in(org) {
			if (!org.hasChildren) {
					html_in += '<li><span id="'+ org.id +'"><i class="icon-leaf"></i> ' + org.name + '</span></li>';
			} else {
				html_in += '<li><span id="'+ org.id +'"><i class="icon-minus-sign"></i> ' + org.name + '</span>';
				html_in += '<ul>';
				for (var i = 0; i < org.children.length; i++) {
					var child = org.children[i];
					getChildren_in(child);
				}
				html_in += '</li></ul>';
			}
			return html_in;
		}
		
		//为节点添加展开，关闭的操作
		var count = 0;
		function abc() {
			
			if(count != 0){ return false; } //只允许触发一次。。。。。。
			
			$('.tree li:has(ul)').addClass('parent_li').find(' > span').attr('title', 'Collapse this branch');
			
			$('.tree li.parent_li > span').on('click',function(e) {
				var children = $(this).parent('li.parent_li').find(' > ul > li');
				if (children.is(":visible")) {
					children.hide('fast');
					$(this).attr('title', 'Expand this branch').find(' > i').addClass('icon-plus-sign').removeClass('icon-minus-sign');
				} else {
					children.show('fast');
					$(this).attr('title', 'Collapse this branch').find(' > i').addClass('icon-minus-sign').removeClass('icon-plus-sign');
				}
				e.stopPropagation();
			});
			
			$('li > span').on('click',function(e) {
				var oks = $('.icon-ok');
				if(oks != undefined || oks.length > 0){
					$('.icon-ok').remove();
				}				
			
				$(this).after('&nbsp;&nbsp;<i class="icon-ok"></i>');
				$('#result').val($(this).text()+ ',' + $(this).attr('id'));
			});
			
			count++;
		}
	</script>
	
</body>
</html>