<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>后台管理系统</title>

<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<script src="bootstrap/js/jquery.min.js" type="text/javascript"></script>
<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<Style>

*{
	margin:0;
	padding:0;
}
#container{
	width: 1300px;
	margin:0px auto;
}
#main{
 background-color: #FFFFF0 ;
}
#container{
	height:60px;
}
#left {
	height: 650px;	
}
#right{
	height: 850px;	
}
#left{
	width:230px;
}
iframe {
	width: 100%;
	height: 100%;
}
</Style>
</head>

<body>
  <div id="container">
   <div id="header" class="row">
     <iframe src="MHeader" scrolling="no" frameborder="0" 
			name="header" class="col-sm-12"></iframe>
   </div>
	<div id="main" class="row" style=" background-color: #FFFFF0 ;">
		<iframe src="MLeft" scrolling="no" frameborder="0" id="left"
			name="left" class="col-sm-3"></iframe>
		<iframe src="showMProduct" scrolling="no" frameborder="0" id="right"
			name="right" class="col-sm-9"></iframe>
	</div>
	<div id="footer" class="row" >
     <iframe src="MFooter" scrolling="no" frameborder="0" 
			name="footer" class="col-sm-12"></iframe>
   </div>
  </div>
</body>
</html>
