<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script type="text/javascript" src="/ssm-web/static/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="/ssm-web/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="/ssm-web/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员界面</title>
<%
	pageContext.setAttribute("PATH",request.getContextPath());
%>
</head>
<body>	
	<!--DVD编辑模态框  -->
	<div class="modal fade" id="editdvdModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <!-- 标题 -->
	        <h4 class="modal-title" id="myModalLabel">DVD编辑</h4>
		    </div>
		    <!-- 内容 -->
		   <div class="modal-body">
		        <form class="form-horizontal" id="edit_from">
		        <div class="form-group">
				    <label class="col-sm-2 control-label">DVD序列</label>				   
				     <div class="col-sm-10">
					      <p class="form-control-static" id="dvd_edit_id" ></p>
				       <span  class="help-block"></span>
				    </div>
				  </div>
				  <div class="form-group">
				    <label  class="col-sm-2 control-label" >DVD名称</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control"  name="dname" id="dvd_edit_dname" placeholder="dvd_name">
				       <span  class="help-block"></span>
				    </div>
				  </div>
				  <div class="form-group">
				    <label  class="col-sm-2 control-label" >租借次数</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control"  name="dcount" id="dvd_edit_dcount" placeholder="dvd_count">
				       <span  class="help-block"></span>
				    </div>
				  </div>
				  <div class="form-group">
				    <label  class="col-sm-2 control-label" >租借状态</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control"  name="status" id="dvd_edit_status" placeholder="dvd_status">
				       <span  class="help-block"></span>
				    </div>
				  </div>
				</form>
		    </div>
		   <!-- 选择 -->
	      <div class="modal-footer">
	       	<button type="button" class="btn btn-primary" id="dvd_edit_btn">编辑</button>
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>   
	      </div>
	    </div>
	  </div>
</div>
	<!--DVD增添模态框  -->
	<div class="modal fade" id="adddvdModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <!-- 标题 -->
	        <h4 class="modal-title" id="myModalLabel">DVD增添</h4>
		    </div>
		    <!-- 内容 -->
		   <div class="modal-body">
		        <form class="form-horizontal" id="add_from">
				  <div class="form-group">
				    <label  class="col-sm-2 control-label" >dname</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control"  name="dname" id="dvd_name" placeholder="dvd_name">
				       <span id="helpBlock2" class="help-block"></span>
				    </div>
				  </div>
				</form>
		    </div>
		   <!-- 选择 -->
	      <div class="modal-footer">
	       	<button type="button" class="btn btn-primary" id="dvd_save_btn">保存</button>
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>   
	      </div>
	    </div>
	  </div>
</div>
	<!--导航条  -->
	<nav class="navbar navbar-inverse" role="navigation">
            <div class="container-fluid">
                <div class="collapse navbar-collapse" id="example-navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a id="welcome_username"></a>
                        </li>
                        <li><a href="#">安全退出</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <!--主体  -->
        <div class="container-fluid">
            <div class="row">
            	<!-- 左侧菜单 -->
                <div class="col-sm-2">
					<button  class="list-group-item "  id="search_dvd_result">DVD查询租赁操作</button>
					<button  class="list-group-item " id="search_record_result">DVD租赁记录查询</button>
                </div>
                <!-- 右侧主体 -->
                <div class="col-sm-10">
                    <div class="panel panel-default">
				       <div class="panel-heading">
                           	 搜索
                        </div>
                        <div class="panel-body">
                            <form role="form" class="form-inline">
                                <div class="form-group">
                                   	<label id="con_lab">DVD名称</label>
                                    <input type="text" id="search_condition">
                                </div>
                                <div class="form-group">
                                    <button type="button" class="btn btn-default" id="search">条件查询</button>
                                    <button type="button" class="btn btn-default" id="search_all"></button>
                                </div>
                            
							<div class="form-group col-md-offset-4" id="two_button">
								<!-- <button type="button" class="btn btn-success" id="add_dvd_model_btn" >新增DVD</button> -->
							</div>
                            </form>
                        </div>
                    </div>
                    
                   <!--表格  -->
					<div class="row">
						<div class="col-md-12">
							<table class="table table-hover" id="dvd_table">
								<thead>
									<!--表头内容  -->									
								</thead>
								<tbody>
									<!--表格内容ajax生成 -->
								</tbody>
							</table>
						</div>
					</div>
					<!-- 页码信息 -->
					<div class="row">
						<div class="col-md-6" id="page-info-area"></div>
						<div class="col-md-6" id="page-nav-area"></div>
					</div>
				</div>
				<script type="text/javascript">
					var allpage;//总页
					var currentpage;//当前页
					var change=0;//左侧按钮
					var dname;
					var uname=sessionStorage.getItem("uname");
					/*页面加载完发送请求  */
					$(function() {
						$("#welcome_username").append("欢迎您，"+uname);
						to_page(1);
					});
					/*左侧按钮0  */
					$("#search_dvd_result").click(function(){
						change=0;
						to_page(1);
					});
					/*左侧按钮1  */
					$("#search_record_result").click(function(){
						change=1;
						to_page(1);
					});
					/*	查询  */
					$("#search").click(function(){
						dname=$("#search_condition").val();
						to_page(1);
					});
					$("#search_all").click(function(){
						dname=undefined;
						to_page(1);
					});
					function to_page(pn) {
						if(change==0){
							if (dname!=undefined) {
								$.ajax({
									url:"/ssm-web/dvdcondition.do",
									data:"dname="+dname+"&pn="+pn,
									type:"get",
									contentType: 'application/x-www-form-urlencoded; charset=UTF-8',//防止乱码
									success:function(result){
										build_thead_select();
										build_dvd_table(result);
										build_page_info(result);
										build_page_nav(result);
									}
								});
							}else {
								$.ajax({
									url:"/ssm-web/dvdshow.do",
									data:"select_val=0"+"&pn="+pn,
									type:"get",
									contentType: 'application/x-www-form-urlencoded; charset=UTF-8',//防止乱码
									success:function(result){
										build_thead_select();
										build_dvd_table(result);
										build_page_info(result);
										build_page_nav(result);
									}
								});
							}
						}else {
							if (dname!=undefined) {
								$.ajax({
									url:"/ssm-web/recordcondition.do",
									data:"dname="+dname+ "&pn=" + pn,
									type:"post",
									contentType: 'application/x-www-form-urlencoded; charset=UTF-8',//防止乱码
									success:function(result){
										build_thead_select();
										build_record_table(result);
										build_page_info(result);
										build_page_nav(result);
									}
								});
							}else {
								$.ajax({
									url:"/ssm-web/recordall.do",
									data:"pn=" + pn,
									type:"post",
									contentType: 'application/x-www-form-urlencoded; charset=UTF-8',//防止乱码
									success:function(result){
										build_thead_select();
										build_record_table(result);
										build_page_info(result);
										build_page_nav(result);
									}
								});
							}
							
						}
							
						
					}
					
					/* 显示表头和选项 */
					function build_thead_select(){
						$("#dvd_table thead").empty();
						$("#select_val").empty();
						if (change==0) {
							/* 表头 */
							$("<tr></tr>").append($("<td>DVD序列号</td>"))
							.append($("<td>DVD名称</td>")).append($("<td>租借次数</td>"))
							.append($("<td>状态</td>")).append($("<td>操作</td>"))
							.appendTo("#dvd_table thead");
							/*搜索  */				
							$("#search_all").text("所有DVD查询");
							$("#two_button").html("<button type='button' class='btn btn-success' id='add_dvd_model_btn' >新增DVD</button>"); 
							
						}else{
							/* 表头 */
							$("<tr></tr>").append($("<td>记录序列号</td>"))
							.append($("<td>DVD名称</td>"))
							.append($("<td>借用日期</td>")).append($("<td>归还日期</td>"))
							.appendTo("#dvd_table thead");
							/*搜索 */				
							$("#search_all").text("所有记录查询");
							$("#two_button").empty();
							
						}
					}
					/*显示表体 record*/
					function build_record_table(result){
						$("#dvd_table tbody").empty();
						var dvd=result.extend.PageInfo.list;
						$.each(dvd,function(index,item){
							var id=$("<td></td>").append(item.id);
							var dname=$("<td></td>").append(item.dname);
							var lendtime=$("<td></td>").append(item.lendTime);
							var returntime=$("<td></td>").append(item.returnTime);
						
							$("<tr></tr>").append(id)
							.append(dname).append(lendtime)
							.append(returntime)
							.appendTo("#dvd_table tbody");
						});
					}
					/*显示表格DVD  */
					function build_dvd_table(result) {
						$("#dvd_table tbody").empty();
						var dvd=result.extend.PageInfo.list;
						$.each(dvd,function(index,item){
							var did=$("<td></td>").append(item.id);
							var dname=$("<td></td>").append(item.dname);
							var dcount=$("<td></td>").append(item.dcount);
							if (item.status==0) {
								var status=$("<td></td>").append("已借");
							}else{
								var status=$("<td></td>").append("可借");
							}
							var editbutton=$("<button></button>").addClass("btn btn-success btn-sm edit_btn")
							.append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
							//为当前按钮添加一个自定义属性，表明id
							editbutton.attr("edit_id",item.id);
							var deletbutton=$("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
							.append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
							//为当前按钮添加一个自定义属性，表明id
							deletbutton.attr("del_id",item.id);
							var twobutton=$("<td></td>").append(editbutton).append(" ").append(deletbutton);
							$("<tr></tr>").append(did)
							.append(dname).append(dcount)
							.append(status).append(twobutton)
							.appendTo("#dvd_table tbody");
						});
					}
					/*显示分页条信息 */
					function build_page_info(result){
						$("#page-info-area").empty();
						$("#page-info-area").append("当前"+result.extend.PageInfo.pageNum
								+"页，总"+result.extend.PageInfo.pages
								+"页，总"+result.extend.PageInfo.total+"条记录");
						allpage=result.extend.PageInfo.pages+1;
					}
					/*显示分页条  */
					function build_page_nav(result){
						//当前页
						currentpage=result.extend.PageInfo.pageNum;
						$("#page-nav-area").empty();
						var ul=$("<ul></ul>").addClass("pagination");
						var firstpageli=$("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
						var prepageli=$("<li></li>").append($("<a></a>").append("&laquo;"));
						/*逻辑判断  */
						if(result.extend.PageInfo.hasPreviousPage==false){
							firstpageli.addClass("disabled");
							prepageli.addClass("disabled");
						}else {
							firstpageli.click(function() {
								to_page(1);
							});
							prepageli.click(function() {
								to_page(result.extend.PageInfo.pageNum-1);
							});
						}
						var nextpageli=$("<li></li>").append($("<a></a>").append("&raquo;"));
						var lastpageli=$("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
						/*逻辑判断  */
						if(result.extend.PageInfo.hasNextPage==false){
							nextpageli.addClass("disabled");
							lastpageli.addClass("disabled");
						}else {
							nextpageli.click(function() {
								to_page(result.extend.PageInfo.pageNum+1);
							});
							lastpageli.click(function() {
								to_page(result.extend.PageInfo.pages);
							});
						}
						ul.append(firstpageli).append(prepageli);
						$.each(result.extend.PageInfo.navigatepageNums,function(index,item){
							var numli=$("<li></li>").append($("<a></a>").append(item));
							if (result.extend.PageInfo.pageNum==item) {
								numli.addClass("active");
							}else {
								numli.click(function () {
									to_page(item);
								});
							}
							ul.append(numli);
						});
						ul.append(nextpageli).append(lastpageli);
						var navEle=$("<nav></nav>").append(ul);
						$("#page-nav-area").append(navEle);
					}
					/* modalk框 */
					$(document).on("click","#add_dvd_model_btn",function(){
						$("#adddvdModal").modal({
							backdrop:"static"
						});
					});
					function vatidate_add_from(){
						var dname=$("#dvd_name").val();
						var resdname=/(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
						if(!resdname.test(dname)){
							show_vatidate_msg("#dvd_name","失败","dvd名称可以是6-16字母或2-5位中文");
							return false;
						}else {
							show_vatidate_msg("#dvd_name","成功"," ");
							return true;
						}
						
					}
					//显示校验结果的信息
					function show_vatidate_msg(ele,status,msg){
						$(ele).parent().removeClass("has-error has-success");
						$(ele).next().text("");
						if(status=="失败"){
							$(ele).parent().addClass("has-error");
							$(ele).next("span").text(msg);
						}else{
							$(ele).parent().addClass("has-success");
							$(ele).next("span").text(msg);
						}
					}
					/*点击保存操作  */
					$("#dvd_save_btn").click(function(){
						/*发送ajax请求添加dvd  */
						if (vatidate_add_from()) {
							$.ajax({
								url:"/ssm-web/dvd.do",
								type:"post",
								data:$("#add_from").serialize(),
						        contentType: 'application/x-www-form-urlencoded; charset=UTF-8',//防止乱码
						        success:function(result){
						        	$("#adddvdModal").modal('hide');
						        	to_page(allpage);
						        }
							});
						}	
					});
					/*点击删除  */
					$(document).on("click",".delete_btn",function(){
						//确认弹出删除窗口
						var dname=$(this).parents("tr").find("td:eq(1)").text();
						var id=$(this).attr("del_id");
						if(confirm("确认删除【"+dname+"】吗")){
							$.ajax({
								url:"/ssm-web/dvd"+id+".do",
								type:"delete",
								success:function(result){
									alert(result.message);
									to_page(currentpage);
								}
								
							});
						}
						
					});
					/* 点击编辑 */
					$(document).on("click",".edit_btn",function(){
						$("#editdvdModal").modal({
							backdrop:"static"
						});
						var dname=$(this).parents("tr").find("td:eq(1)").text();
						var dcount=$(this).parents("tr").find("td:eq(2)").text();
						var status=$(this).parents("tr").find("td:eq(3)").text();				
						var id=$(this).attr("edit_id");
						$("#dvd_edit_id").text(id);
						$("#dvd_edit_dname").val(dname);
						$("#dvd_edit_dcount").val(dcount);
						if (status=="已借") {
							$("#dvd_edit_status").val(0);
						}else {
							$("#dvd_edit_status").val(1);
						}			
						$("#dvd_edit_btn").click(function(){					
								$.ajax({
									url:"/ssm-web/editdvd.do",
									type:"put",
									data:"id="+id+"&"+$("#edit_from").serialize(),
									success:function(result){							
										alert(result.message);
										$("#editdvdModal").modal("hide");
										to_page(currentpage);
									}
								});
						
						});
						
					});
			</script>
</body>
</html>