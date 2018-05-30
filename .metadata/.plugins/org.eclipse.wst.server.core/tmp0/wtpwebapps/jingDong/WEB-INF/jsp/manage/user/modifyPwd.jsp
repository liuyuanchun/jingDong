<%@page import="entity.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'modifPwd.jsp' starting page</title>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
   <script src="bootstrap/js/jquery.min.js" type="text/javascript"></script>
    <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <%User user = (User)request.getSession().getAttribute("user");
    System.out.print(user.getUsername());
     if(user!=null){%>
	<script type="text/javascript">
	$().ready(function(){
	$("[name=opassword]").blur(function(){
		var oPwd = $(this).val();
		$.ajax({
			type:"post",
			url:"compareMPwd",
			data:"oPwd="+oPwd,
			dataType:"text",
			success:function(data){
				if(data!="true"){
					$("#opasswordmes").html(data);
					$("[name=opassword]").val("");
				}else{
					$("#opasswordmes").html("");
				}
			}
		});
		<%-- var soPwd = "<%=user.getPassword()%>";
		if(oPwd != soPwd){
			alert("原密码错误");
			$("[name=opasswordmes]").val("原密码错误");
			$(this).val("");
		} --%>
	});
	$("[name=qpassword]").blur(function(){
		var pwd = $("[name=qpassword]").val();
		var qpwd = $(this).val();
		if(pwd!=qpwd){
			alert("两次输入的密码不同！");
			$(this).val("");	
		}
	});
	});
	</script>
	<%} %>
  </head>
  <body>
   <div style="width:515px;margin:20px auto;height:430px;">
  <form action="ModifyMpwd" method="post"  enctype="multipart/form-data"  class="form-horizontal" role="form">
  <div class="form-group" >
   		<label class="col-sm-3 control-label">请输入原密码：</label>
   		<div class="col-sm-5"><input type="text" name="opassword" class="form-control"  placeholder="请输入原密码"/></div>
   		<div id="opasswordmes" class="col-sm-4" style="color:red;line-height:30px;"></div>
  </div>
  
  <div class="form-group">
  		<label class="col-sm-3 control-label">请输入新密码：</label>
  		<div class="col-sm-5"><input type="text" name="password" class="form-control"  placeholder="请输入新密码"/></div>
  		<div id="passwordmsg" class="col-sm-4" style="color:red;line-height:30px;"></div>
  </div>
  
  <div class="form-group">
  		<label class="col-sm-3 control-label">请确认新密码：</label>
  		<div class="col-sm-5"><input type="text" name="qpassword" class="form-control"  placeholder="请确认新密码"/></div>
  		<div id="qpasswordmsg" class="col-sm-4" style="color:red;line-height:30px;"></div>
  </div>
  <div class="form-group"  style="margin-left:150px;" >
  <input type="submit" class="btn btn-primary" value="保存"/>
  </div>
  </form>
  </div>
  </body>
</html>
