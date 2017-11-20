<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>list</title>
<%
	pageContext.setAttribute("PATH",request.getContextPath());
%>
<script type="text/javascript" src="${PATH}/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="${PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
</head>
<body>
	<div class="container">
		<!-- 标题 -->
		<div class="row">
			<div class="col-md-12">
				<h1>DVD操作</h1>
			</div>
		</div>
		<!-- 按钮 -->
		<div class="row">
			<div class="col-md-4 col-md-offset-8">
				<button class="btn btn-success">新增</button>
				<button class="btn btn-danger">删除</button>
			</div>
		</div>
		<!--表格  -->
		<div class="row">
			<div class="col-md-12">
				<table class="table">
					<thead>
						<tr>
							<td>id</td>
							<td>name</td>
							<td>count</td>
							<td>ststus</td>
							<td>操作</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>ssss</td>
							<td>2</td>
							<td>4</td>
							<td>
								<button class="btn btn-success btn-sm">
									<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>编辑
								</button>
								<button class="btn btn-danger btn-sm">
									<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>删除
								</button>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<!-- 页码信息 -->
		<div class="row">
		
		</div>
	</div>

</body>
</html>