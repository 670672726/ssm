<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	pageContext.setAttribute("PATH",request.getContextPath());
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LoginUser</title>
<link href="${PATH}/static/css/style.css" rel="stylesheet" type="text/css" media="all">
<script type="text/javascript" src="${PATH}/static/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="${PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>

</head>
<body>
<!--注册框  -->
<!-- Modal -->
<div class="modal fade" id="regist_Modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
    
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">用户注册</h4>
      </div>
      
      <div class="modal-body">
       <form class="form-horizontal" id="model_form">
		  <div class="form-group">
		    <label  class="col-sm-2 control-label">用户名称</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" name="uname" id="Resign_uname" placeholder="uname">
		      <span  class="help-block"></span>
		    </div>
		  </div>
		  <div class="form-group">
		    <label  class="col-sm-2 control-label">用户密码</label>
		    <div class="col-sm-10">
		      <input type="password" class="form-control" name="upass" id="Resign_password" placeholder="password">
		    	<span  class="help-block"></span>
		    </div>
		  </div>
		  <div class="form-group">
			  <label class="radio-inline">
			    <input type="radio" name="type" id="Resign_type" value="0" checked>
			   	 普通用户
			  </label>
			  <label class="radio-inline">
			    <input type="radio" name="type" id="Resign_type" value="1">
				管理员用户
			  </label>
			</div>
		</form>
	</div>     
      <div class="modal-footer">
       	<button type="button" class="btn btn-primary" id="resigin_adduser">注册</button>
        <button type="button" class="btn btn-default" id="resigin_close" data-dismiss="modal">关闭</button>
      </div>
    </div>
  </div>
</div>
<!-- 主界面 -->
<h1>DVD系统登录界面</h1>
<div class="container">
	<div class="login">
		<h2>登 录</h2>
			<form id="form" name="form" action="#" method="post">
				<div>
					<input id="uname" type="text" name="uname" placeholder="用户名">
					<span  class="help-block"></span>
				 </div>
				 <div>
					<input id="upass" type="password" name="upass" placeholder="密码">
					<span  class="help-block"></span>
				</div>
				<div>
					<input  type="radio" name="type" value="0" checked="checked">普通用户
					<input  type="radio" name="type" value="1">管理员用户
					<span  class="help-block"></span>
				</div>
				
				<div class="send-button">
					<input id="login_btn" type="button" value="登 录"  >
					<input id="regist_btn" type="button" value="注 册"  >
				</div>
			</form>	
	</div>
</div>
</body>
<script  src="${PATH}/static/js/loginAndregist.js" charset="utf-8"></script>
</html>