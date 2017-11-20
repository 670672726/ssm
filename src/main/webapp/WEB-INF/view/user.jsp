<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
	pageContext.setAttribute("PATH",request.getContextPath());
%>

<script type="text/javascript" src="${PATH}/static/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="${PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
</head>
<body>
	<!--导航条  -->
	
	<nav class="navbar navbar-inverse" role="navigation">
            <div class="container-fluid">
                <div class="collapse navbar-collapse" id="example-navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a>欢迎您,用户</a>
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
                    <a href="#" class="list-group-item active">用户操作</a>
					<a href="#" class="list-group-item">DVD查询租赁操作</a>
					<a href="#" class="list-group-item">DVD租赁记录查询</a>
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
                                    <label for="name">状态</label>
                                    <select class="form-control" id="select_val">
                                        <option value="0">全部DVD</option>
                                        <option value="1">可借DVD</option>
                                        <option value="2">已借DVD</option>
                                        <option value="3">热门DVD</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <button type="button" class="btn btn-default" id="search">开始搜索</button>
                                </div>
                            </form>
                        </div>
                    </div>
                   <!--表格  -->
					<div class="row">
						<div class="col-md-12">
							<table class="table table-hover" id="dvd_table">
								<thead>
									<tr>
										<td>序列号</td>
										<td>DVD名称</td>
										<td>租借次数</td>
										<td>状态</td>
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
					var select_val=0;
					/*页面加载完发送请求  */
					$(function() {
						to_page(1,0);
					});
					$("#search").click(function(){
						var select_val=$("#select_val").val();
						to_page(1,select_val);
					});
					/* 到达页面 */
					function to_page(pn,select_val) {
						$.ajax({
							url:"${PATH}/dvdshow.do",
							data:"select_val=" + select_val + "&pn=" + pn,
							type:"post",
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
							var lendbutton=$("<button></button>").addClass("btn btn-danger btn-sm")
							.append($("<span></span>").addClass("glyphicon glyphicon-pawn")).append("租DVD");
							//为当前按钮添加一个自定义属性，表明id
							lendbutton.attr("lend_id",item.id);
							var returnbutton=$("<button></button>").addClass("btn btn-success btn-sm ")
							.append($("<span></span>").addClass("glyphicon glyphicon-tent")).append("还DVD");
							//为当前按钮添加一个自定义属性，表明id
							returnbutton.attr("return_id",item.id);
							if (item.status==0) {
								returnbutton.addClass("return_btn");
								var status=$("<td></td>").append("已借");
							}else{
								lendbutton.addClass("lend_btn");
								var status=$("<td></td>").append("可借");
							}
							var twobutton=$("<td></td>").append(lendbutton).append(" ").append(returnbutton);
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
								to_page(1,select_val);
							});
							prepageli.click(function() {
								to_page(result.extend.PageInfo.pageNum-1,select_val);
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
								to_page(result.extend.PageInfo.pageNum+1,select_val);
							});
							lastpageli.click(function() {
								to_page(result.extend.PageInfo.pages,select_val);
							});
						}
						ul.append(firstpageli).append(prepageli);
						$.each(result.extend.PageInfo.navigatepageNums,function(index,item){
							var numli=$("<li></li>").append($("<a></a>").append(item));
							if (result.extend.PageInfo.pageNum==item) {
								numli.addClass("active");
							}else {
								numli.click(function () {
									to_page(item,select_val);
								});
							}
							ul.append(numli);
						});
						ul.append(nextpageli).append(lastpageli);
						var navEle=$("<nav></nav>").append(ul);
						$("#page-nav-area").append(navEle);
					}
						/* 借DVD */
						$(document).on("click",".lend_btn",function(){
							var id=$(this).attr("lend_id");
							var dname=$(this).parents("tr").find("td:eq(1)").text();
							if(confirm("确认要租借【"+dname+"】吗")){
								$.ajax({
									url:"${PATH}/lend.do",
									data:"id="+id,
									type:"post",
									success:function(result){
										/* $(this).next("button").removeClass("return_btn"); */
										to_page(currentpage, select_val);
									}
								});
							}
							
						});
						/* 还DVD */
						$(document).on("click",".return_btn",function(){
							var id=$(this).attr("return_id");
							var dname=$(this).parents("tr").find("td:eq(1)").text();
							if(confirm("确认要归还【"+dname+"】吗")){
								$.ajax({
									url:"${PATH}/return.do",
									data:"id="+id,
									type:"post",
									success:function(result){
										to_page(currentpage, select_val);
									}
								});
							}
							
						});
				</script>
				
</body>
</html>