
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
    
    <title>My JSP 'header.jsp' starting page</title>
    
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<script src="bootstrap/js/jquery.min.js" type="text/javascript"></script>
<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script type="text/javascript">

</script>
<style>
#title{
	background: #f5f5f0;
	height:60px;
	font-size:40px;
	text-align:center;
}
#title #user{
	width:200px;
	height:20px;
	float:right;
	margin-top:40px;
	font-size:16px;
	text-align:left;
}
</style>
  </head>
  <body>
  	<%session = request.getSession();%>
  <div id="title">后台管理中心
  <div id="user" style="">
 <% if(session.getAttribute("user")!=null){
		User user = (User)session.getAttribute("user"); %>
		欢迎回来<%=user.getUsername() %>&nbsp;&nbsp; <a id="logout" target="_top" href="showLogin">注销</a>
	<% }%>
	</div>
  </div> 
  </body>
</html>
