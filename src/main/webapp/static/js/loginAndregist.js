var PATH = "http://localhost:8090/ssm-web/";
$(function(){
	//注册检验用户名是否重复
	$("#Resign_uname").change(function(){
		var uname=$("#Resign_uname").val();
		 $.ajax({
		        url:"checkuser.do",
		        type:"POST",
		        data:"uname="+uname,
		        contentType: 'application/x-www-form-urlencoded; charset=UTF-8',//防止乱码
		        success:function(result){
		            if(result.code==100){
		            	$("#resigin_adduser").attr("ajax-va","success");
		            	show_vatidate_msg("#Resign_uname","成功","此用户名不重复");
		            }else{
		            	$("#resigin_adduser").attr("ajax-va","error");
		            	show_vatidate_msg("#Resign_uname","失败","此用户名重复");
		            }
		        }
		    });
	});
});
$("#login_btn").click(function(){
	var flag= vatidate_login_from();
	if (flag) {
		 $.ajax({
		        url:PATH+"login.do",
		        type:"POST",
		        dataType:"json",
		        data:$("#form").serialize(),
		        contentType: 'application/x-www-form-urlencoded; charset=UTF-8',//防止乱码
		        success:function(result){
		            if (result.code=100) {
		            	sessionStorage.setItem("uid",result.extend.uid);
		            	sessionStorage.setItem("uname",result.extend.uname);
		            	if (result.extend.type==0) {
		            	    window.location.href = PATH+"/main/user.jsp";
						}else
							window.location.href = PATH+"/main/admin.jsp";
					}
					
		        }
		    });
	}
   
});
 function vatidate_login_from(){
	 	var flag=false;
		var uname=$("#uname").val();
		var resuname=/(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{4,8})/;
		if(!resuname.test(uname)){
			show_vatidate_msg("#uname","失败","用户名必须为6-16字母或4-8位中文");
			flag= false;
		}else {
			show_vatidate_msg("#uname","成功"," ");
			flag= true;
		}
		var upass=$("#upass").val();
		var resupass=/(^[a-zA-Z0-9_-]{6,16}$)/;
		if(!resupass.test(upass)){
			show_vatidate_msg("#upass","失败","密码必须为6-16字母或数字");
			flag= false;
		}else {
			show_vatidate_msg("#upass","成功"," ");
			flag= true;
		}
		return flag;
		
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
	
	//注册界面
	$("#regist_btn").click(function(){
		//表单重置
		$("#Resign_password").parent().removeClass("has-error has-success");
		$("#Resign_uname").parent().removeClass("has-error has-success");
		$("this").removeAttr("ajax-va");
		$("#regist_Modal form")[0].reset();
		$("#regist_Modal span").text("");
		
		//打开模态框
		$("#regist_Modal").modal({
			backdrop:"ststic"
		});
	});
	function vatidate_resgin_from(){
	 	var flag=false;
		var uname=$("#Resign_uname").val();
		var resuname=/(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{4,8})/;
		if(!resuname.test(uname)){
			show_vatidate_msg("#Resign_uname","失败","用户名为6-16字母或4-8位中文");
			flag= false;
		}else {
			show_vatidate_msg("#Resign_uname","成功","");
			flag= true;
		}
		var upass=$("#Resign_password").val();
		var resupass=/(^[a-zA-Z0-9_-]{6,16}$)/;
		if(!resupass.test(upass)){
			show_vatidate_msg("#Resign_password","失败","密码为6-16字母或数字");
			flag= false;
		}else {
			show_vatidate_msg("#Resign_password","成功","");
			flag= true;
		}
		return flag;
		
	}
	//注册按钮
	$("#resigin_adduser").click(function(){
		//前端校验
		if(!vatidate_resgin_from()){
			return false;
		}
		//后端验重
		if($(this).attr("ajax-va")=="error"){
			show_vatidate_msg("#Resign_uname","失败","用户名重复");
			return false;
		}
				$.ajax({
			        url:"resgin.do",
			        type:"POST",
			        dataType:"json",
			        data:$("#model_form").serialize(),
			        contentType: 'application/x-www-form-urlencoded; charset=UTF-8',//防止乱码
			        success:function(result){
			            if(result.code==100){
			            	$("#regist_Modal").modal('hide');
			            }else{
			            	show_vatidate_msg("#Resign_uname","失败","用户名必须为6-16字母或4-8位中文");
			            	
			            }
			        }
			    });

	   
	});
