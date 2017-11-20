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

<script type="text/javascript" src="${PATH}/static/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="${PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>

</head>
<body>
	<!--模态框  -->
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
	<!--主页面  -->
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
				<button class="btn btn-success" id="add_dvd_model_btn" >新增</button>
				<button class="btn btn-danger">删除</button>
			</div>
		</div>
		<!--表格  -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover" id="dvd_table">
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
		var allpage;
		var currentpage;
		/*页面加载完发送请求  */
		$(function() {
			to_page(1);
		});
		function to_page(pn) {
			$.ajax({
				url:"${PATH}/dvdshow.do",
				data:"pn="+pn,
				type:"get",
				contentType: 'application/x-www-form-urlencoded; charset=UTF-8',//防止乱码
				success:function(result){
					build_dvd_table(result);
					build_page_info(result);
					build_page_nav(result);
				}
			});
		}
		/*显示表格  */
		function build_dvd_table(result) {
			$("#dvd_table tbody").empty();
			var dvd=result.extend.PageInfo.list;
			$.each(dvd,function(index,item){
				var did=$("<td></td>").append(item.id);
				var dname=$("<td></td>").append(item.dname);
				var dcount=$("<td></td>").append(item.dcount);
				var status=$("<td></td>").append(item.status);
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
		$("#add_dvd_model_btn").click(function(){
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
					url:"${PATH}/dvd.do",
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
					url:"${PATH}/dvd"+id+".do",
					type:"delete",
					success:function(result){
						alert(result.message);
						to_page(currentpage);
					}
					
				});
			}
			
		});
	</script>
</body>
</html>