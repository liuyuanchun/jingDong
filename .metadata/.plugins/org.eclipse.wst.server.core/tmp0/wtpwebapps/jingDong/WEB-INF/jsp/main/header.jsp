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
    
	<script src="bootstrap/js/jquery.min.js" type="text/javascript"></script>
    <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <link href="css/headerStyle.css" type = "text/css" rel="stylesheet"/>
<script>
$(document).ready(function(){
	$(".text1").keyup(function(){
	if($(".text1").val()!=""){
	$.ajax({
	type:"post",
	 url:"reci",
	 data:"text="+$(".text1").val(),
	 dataType:"text",
	 success:function(data){
	 	var data1 = data.substring(0,data.length-1);
	 	var strs = data1.split(",");
	 	var mes="";
	 	for(var i = 0;i < strs.length; i++){
	 		mes=strs[i]+"<br/>";
	 	}
	 	$("#message").show();
	 	$("#message").html(mes);
	 }
	});
	}else{
	$("#message").hide();}
	});
		$("[name=loginOut]").click(function(){
		$.ajax({
			type:"post",
			url:"loginOut",
			data:"",
			dataType:"",
			success:function(data){
				window.location.href="header";
			}
		});
	});
});
</script>
<style type="text/css">
#message{
	width: 454px;
	border:1px black solid;
	display:none;
	bachground-color:#fff;
}
</style>
  </head>
  
  <body>
    <div id="d1">
    <div id="d11">送至：北京&or;</div>
    <div id="d12">
      <ul class="u1">
      <%User user = (User)request.getSession().getAttribute("user"); 
      if(user==null){%>
        <li style="width:180px"><a target="_top" href="showLogin"  style="text-decoration:none;">你好，请登录</a> <a href="showRegister" target="_top" style="color:#F33;text-decoration:none;">请注册</a></li>
        <%}else if(user.getType().equals("管理员")){ %>
        	<li style="width:250px;margin-left:100px;">欢迎你<%=user.getUsername() %>&nbsp;&nbsp;&nbsp;<a href="showManage" target="_blank" style="text-decoration:none">去后台管理中心</a>&nbsp;&nbsp;&nbsp;<span name="loginOut" style="cursor:pointer;text-decoration:none;">注销</span></li>
        <%}else{ %>
        	<li id="we"  style="width:180px;margin-left:100px;">欢迎你<%=user.getUsername() %>&nbsp;&nbsp;&nbsp;<span name="loginOut" style="cursor:pointer;text-decoration:none;">注销</span></li>
        <%} %>
        <li><a style="text-decoration:none;" target="_top" href="showOrder">我的订单</a></li>
        <li>我的京东&or;</li>
        <li>京东会员</li>
        <li>手机京东&or;</li>
        <li>关注京东&or;</li>
        <li>客户服务&or;</li>
        <li>网站导航&or;</li>
      </ul>
    </div>
  </div>
  <div id="d2"> </div>
  <div id="d3">
    <div id="d31"><a href="http://www.jd.com/" target="_top"><img src="images/jingdongDog.png"/></a></div>
    <div id="d32">
      <input class="text1" type="text" id="selectbooktext" placeholder="莫言" style="font-weight:bold"/>
      <div class="sousuo">搜索</div>
      <div id="message" ></div>
    </div>
    <div id="d33">
      <div class="shoppingCar"></div>
      <div class="word"><a href="showCart" target="_top" style="cursor:pointer;text-decoration:none;">我的购物车 ></a></div>
    </div>
    <div id="d34">
      <ul class="menueu1">
        <li>图书钜惠</li>
        <li>文学奖</li>
        <li>非虚构</li>
        <li style="width: 60px;">每150减50</li>
        <li>思维导图</li>
        <li>每49减15</li>
        <li>高考三轮</li>
        <li>Python</li>
      </ul>
    </div>
  </div>
  <div id="d4">
    <div id="d41">
      <div class="d411">全部商品分类</div>
      <div class="d412">&or;</div>
    </div>
    <div id="d42">
      <ul class="menueu2">
        <li>首页</li>
        <li>服装城</li>
        <li>美妆馆</li>
        <li>京东超市</li>
        <li>生鲜</li>
        <li>全球购</li>
        <li>闪购</li>
        <li>拍卖</li>
        <li>金融</li>
      </ul>
    </div>
  </div>
  </body>
</html>
