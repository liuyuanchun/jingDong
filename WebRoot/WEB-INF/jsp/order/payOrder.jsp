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
    
    <title>支付页面</title>
    
	 <script src="bootstrap/js/jquery.min.js" type="text/javascript"></script>
	<script src="bootstrap/js/ bootstrap.min.js" type="text/javascript"></script>
	<link href="css/typeStyle.css" type = "text/css" rel="stylesheet"/>
	<style type="text/css">
	*{
		padding:0;
		margin:0;
	}
	#header{
		width:1000px;
		height:60px;
		margin:1px auto;
		
	}
	#logo{
		margin-top:10px;
		width:172px;
		height:28px;
		background-image:url("images/logo.png");
		float:left;
	}
	#mes{
		width:250px;
		height:30px;
		
		margin-left:750px;
		margin-top:17px;
	}
	#meses li{
		list-style:none;
		float:left;
		line-height:30px;
		margin-left:5px;
	}
	#header1{
		width:1000px;
		height:110px;
		margin:5px auto;
	}
	.dingdanhao li{
		float:left;
		list-style:none;
		margin-left:10px;
	
	}
	#img{
	width:100px;
	height:100px;
	}
	#content1{
		margin:10px auto; 
		width:1000px;
		height:500px;
		
	}
	
	.zhifustyle li{
		list-style:none;
		margin-top:30px;
	}
	.jingdongxiaojinku,.jingdongbaitiao{
		list-style:none;
		clear:both;
		margin-left:50px;
	}
	.jingdongxiaojinku li{
		float:left;
		margin-left:20px;
	}
	.jingdongbaitiao li{
		float:left;
		margin-left:20px;
	}
	#content2{
		margin:10px auto; 
		width:1000px;
		height:100px;
	
	}
	.qitazhifu{
		list-style:none;
	}
	
	.qitazhifustyle li{
		list-style:none;
		float:left;
		margin-left:10px;
		
	}
	</style>
  	<script type="text/javascript">
  	$(document).ready(function(){
  		$("#pay").click(function(){
  			alert("支付成功");
  			var no = $(this).parent().parent().data("no");
  			window.location.href="successPay?no="+no;
  		});
  		$("#pay").mouseover(function(){
  			$(this).css("cursor","pointer");
  		});
  	});
  	</script>
  </head>
  
  <body>
  <%String orderNumber = (String)request.getAttribute("orderNumber"); 
    Double allPrice = (Double)request.getAttribute("allPrice");
    User user = (User)request.getSession().getAttribute("user");
    	String username = "";
    	if(user!=null&&user.getUsername()!=null){
    	username = user.getUsername();
    	}
    %>
    <div id="header">
    	<div id="logo" ></div>
    	<div id="mes">
    		<ul id="meses"> 
    			<li><%=username %>&nbsp;&nbsp;<a style="text-decoration:none" href="showLogin">退出</a>&nbsp;&nbsp;|</li>
    			<li><a style="text-decoration:none;" href="showOrder">我的订单</a>&nbsp;&nbsp;|</li>
    			<li>支付帮助</li>
    			
    		</ul>
    	</div>
    </div>
    <div id="header1">
    <ul class="dingdanhao">
    <li><img id="img" src="images/shoukuan.png"/></li>
    <li style="width:480px;margin-top:40px;">订单提交成功，请尽快付款！订单号：<%=orderNumber %></li>
    <li style="margin-left:250px;margin-top:40px;">应付金额:<%=allPrice %></li>
    </ul>
    </div>
    <div id="content1">
    	<ul class="zhifustyle">
    	<li style="height:36px;margin-top:5px;"><img style="widrh:132px;height:35px;" src="images/jdpay-icon.png"/>
    	<span style="font-family:'楷体';font-size:25px;">单单立减，更省一点</span></li>
    	<li >
	    	<ul class="jingdongxiaojinku">
	    		<li><input style="width: 20px;height:20px;" type="checkbox"/></li>
	    		<li><img style="width:30px;height:30px;" src="images/XJKCONSUME.png"/></li>
	    		<li style="margin-left:10px;">京东小金库</li>
	    	</ul>
    	</li>
    	<li>
    		<ul class="jingdongbaitiao">
	    		<li><input style="width: 20px;height:20px;" type="checkbox"/></li>
	    		<li><img style="width:30px;height:30px;" src="images/PAY-BAITIAO.png"/></li>
	    		<li style="margin-left:10px;">打白条</li>
    		</ul>
    	</li>
 		<li>
    		<ul class="jingdongbaitiao"  data-no="<%=orderNumber %>">
	    		<li style="width:220px;height:50px;border:1px red solid;margin-left:50px;background-color:red;line-height:50px;font-size:25px;color:#fff;text-align:center;"><a id="pay">立即支付</a></li>
	    		
    		</ul>
    	</li>
    	</ul>
    </div>
    <div id="content2">
    	<ul class="qitazhifu">
    		<li><img src="images/o-icon.png"/></li>
    		<li>
    			<ul class="qitazhifustyle">
    				<li>
    				微信支付&nbsp;&nbsp;&nbsp;|
    				</li>
    				<li>
    				中国银联&nbsp;&nbsp;&nbsp;|
    				</li>
    				<li>
    				预付卡支付
    				</li>
    			</ul>
    	</ul>
    </div>
  </body>
</html>
