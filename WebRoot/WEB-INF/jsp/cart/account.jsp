<%@ page language="java" import="java.util.*,entity.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>结算页</title>
    

	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<script src="bootstrap/js/jquery.min.js"  type="text/javascript"></script>
	<script src="bootstrap/js/bootstrap.min.js"  type="text/javascript"></script>
  	<style>
	  	* {
	  		margin:0;
	  		padding:0;
	  	}
	  	#all {
	  		width:1349px;
	  		overflow:hidden;
	  	}
		#d1 {
			font-family: "黑体";
			font-size: 13px;
			margin: 1px auto;
			height: 30px;
			background-color: #F1F1F1;
			line-height: 30px;
			position: relative;
		}
		#d1 #d11 {
			position: absolute;
			left: 180px;
		}
		#d1 #d12 {
			position: absolute;
			right: 150px;
			bottom: 10px;
			height: 15px;
			line-height: 20px;
		}
		#d1 #d12 .u1 li {
			list-style: none;
			float: left;
			right: 400px;
			bottom: 2px;
			width: 75px;
			border-right: #666 1px solid;
			margin-right: 2px;
		}
	#head2 {
			width:990px;
			height:110px;
			margin:0 auto;
			overflow:hidden;
			}
  	#logo {
  			float:left;
  			width:274px;
  			height:60px;
  			margin-top:18px;
  			}
  	#dog {
  			float:left;
  			width:194px;
  			height:60px;
  			line-height:60px;
  			text-align:center;
  			}
  	#jsLogo {
  			float:left;
  			width:80px;
  			height:40px;
  			margin-top:10px;
  			}
  	#liucheng {
  			float:left;
  			width:500px;
  			height:60px;
  			margin-top:28px;
  			margin-left:200px;
  			text-align:center;
  			line-height:60px;
  			}
  	#tianxie {
  			float:left;
  			width:990px;
  			height:24px;
  			font-size:15px;
  			margin:0 auto;
  			}	
  	#head3 {
  			width:1349px;
  			}
  	#center {
  		
  			width:990px;
  			height:750px;
  			margin:0 auto;
  			border:1px rgb(230,230,230) solid;
  			}
  	#center1 {
  			float:left;
  			width:990px;
  			height:24px;
  			}
  	#center1 div{
  			float:left;
  			width:100px;
  			height:24px;
  			line-height:24px;
  			text-align:center;
  			margin-left:10px;
  			}
  	#center1 a{
  			float:left;
  			width:100px;
  			height:24px;
  			line-height:24px;
  			text-align:center;
  			margin-left:760px;
  			font-size:13px;
  			text-decoration:none;
  			}	
  	#addr {
  			float:left;
  			width:950px;
  			height:70px;
  			margin-left:20px;
  			border-bottom:1px rgb(230,230,230) solid;
  			}  		
  	.addr1	{
  			float:left;
  			width:130px;
  			height:30px;
  			line-height:30px;
  			text-align:center;
  			font-size:13px;
  			margin-top:20px;
  			border:2px solid red;
  			}
  	.addr1 span{
  			width:90px;
  			height:20px;
  			margin-top:5px;
  			margin-left:13px;
  			line-height:20px;
  			text-align:center;
  			}
  	.addr2 {
  			float:left;
  			width:820px;
  			height:28px;
  			padding-left:10px;
  			line-height:28px;
  			margin-top:20px;
  			}	
  	#duihao {
  			float:left;
  			width:12px;
  			height:12px;
  			margin-left:11px;
  			margin-top:14px;
  			}
  	#yizhan {
  			float:left;
  			width:970px;
  			height:90px;
  			margin-left:10px;
  			border-bottom:1px rgb(230,230,230) solid;
  			}
  	#center3 {
  			float:left;
  			width:990px;
  			height:24px;
  			padding:10px 10px;
  			margin-left:10px;
  		}
  	#songhuoxia {
  			float:left;
  			width:950px;
  			margin-left:20px;
  			height:300px;
  		}
  	#peisong {
  			float:left;
  			width:350px;
  			height:300px;
  			margin-top:20px;
  			background:rgb(247,247,247);
  		}
  	#detail {
  			float:left;
  			width:600px;
  			height:300px;
  			margin-top:20px;
  			background:rgb(243,251,254);
  			}
  	.goodsDetail {
  		   
  			float:left;
  			width:600px;
  			padding:20px;
  			border-bottom:1px solid rgb(230,230,230);
  			}
  		.goods {
  			float:left;
  			width:110px;
  			height:100px;
  			padding:5px;
  			}
  		.goods img{
  			width:70px;
  			height:80px;
  			}	
  		.goodsName {
  			float:left;
  			width:150px;
  			height:100px;
  			padding:10px
  			}	
  		.price {
  			float:left;
  			width:100px;
  			height:100px;
  			padding:10px
  			}
  		.count {
  			float:left;
  			width:100px;
  			height:100px;
  			padding:10px
  			}
  		.youhuo {
  			float:left;
  			width:100px;
  			height:100px;
  			padding:10px
  			}
  		#bottom {
  			float:left;
  			width:950px;
  			margin-left:20px;
  			height:80px;
  			background:rgb(250,250,231);
  			}
  		#allCount {
  			float:left;
  			width:80px;
  			height:26px;
  			margin-left:650px;
  			margin-top:10px;
  			}
  		#yingfu {
  			float:left;
  			width:80px;
  			height:26px;
  			margin-left:20px;
  			margin-top:10px;
  			}
  		#money {
  			float:left;
  			width:60px;
  			height:30px;
  			margin-left:20px;
  			margin-top:10px;
  			color:red;
  			font-size:18px;
  			font-weight:bold;
  			}
  		#endAddr {
  			float:left;
  			width:950px;
  			height:40px;
  			line-height:40px;
  			text-align:center;
  			}					
  		#submit {
  			float:left;
  			width:950px;
  			margin-left:20px;
  			height:80px;
  			padding:20px;
  			}
  		#btn {
  			width:140px;
  			height:40px;
  			margin-left:750px;
  			background:red;
  			color:white;
  			}	
  		frame {
			width: 100%;
			height: 100%;
		}																
  	</style>
  	<% 
	Double allPrice = (Double)request.getAttribute("allPrice");
	List<Cart> cartlist = (List<Cart>)request.getAttribute("proList"); 
	
  	%>
  	<script>
  		$(document).ready(function(){
  			$("#btn").click(function(){
  			var proId ="";
	  			<%if(cartlist.size()>0){
					for(int i=0;i < cartlist.size();i++){
					%>	proId  +=<%=cartlist.get(i).getpId()%>+",";
					
				<%	}}%>
  				proId = proId.substring(0,proId.length-1);
  				window.location.href="submitOrder?proIdArray="+proId;
  			});
  		});
  	</script>
  </head>
  
<body>

<div id="all">
 <div style="margin:1px auto;width:1366px;background-color:#F6F6F6">
    <div id="d1">
    <div id="d11">送至：北京&or;</div>
    <div id="d12">
      <ul class="u1">
      <%User user = (User)request.getSession().getAttribute("user");
      if(user!= null&&user.getUsername() != null) {%>
        <li style="width:180px">欢迎你<%=user.getUsername() %>&nbsp;&nbsp;&nbsp;</li>
		<%} %>
        <li>我的订单</li>
        <li>我的京东&or;</li>
        <li>京东会员</li>
        <li>企业采购</li>
        <li>手机京东&or;</li>
        <li>关注京东&or;</li>
        <li>客户服务&or;</li>
        <li>网站导航&or;</li>
      </ul>
    </div>
  </div>
  </div>
  <div id="head2">
  	<div id="logo">
  		<div id="dog" style="background-image:url(images/icon.png);width:170px;height:50px;margin-top:10px;"></div>
  		<div id="jsLogo"><img src="images/purchase-icon.png"/></div>
  	</div>
  	<div id="liucheng"><img src="images/liucheng.png"/></div>
  	<div id="tianxie">填写并核对订单信息</div>
  </div>
  <div id="head3">
  	<div id="center">
  		<div id="center1">
  			<div>收货人信息</div>
  			<a>新增收货地址</a>
  		</div>
  		<div id="addr">
  			<div class="addr1">
  				<span style="float:left">元芳</span>
  				<img id="duihao" src="images/selected-icon.png">
  			</div>
  			<div class="addr2">
  				<label style="float:left;">元芳   山东  青岛市  城阳区  青岛到农业大学（西苑校区）183****1800</label>
  				<a style="float:right;padding-right:10px;">编辑</a>
  			</div>
  		</div>
  		<div id="yizhan" >
  			<div class="addr1" style="margin-left:10px;margin-top:26px;">
  				<span>新城花园</span>
  			</div>
  			<div class="addr2" style="margin-left:4px;margin-top:26px;">
  				<label style="float:left;">新城花园物美超市   山东  青岛市  城阳区  青岛到农业大学（西苑校区）183****1800</label>
  				<a style="float:right;padding-right:10px;">编辑</a>
  			</div>
  		</div>
  		<div id="center3">
  			支付方式
  		</div>
  		<div id="addr">
  			<div class="addr1">
  				<span style="float:left">货到付款</span>
  			</div>
  			<div class="addr1" style="margin-left:30px;border:1px solid rgb(230,230,230)">
  				<span style="float:left;">在线支付</span>
  			</div>
  		</div>
  		<div id="center3">
  			送货清单
  		</div>
  		<div id="songhuoxia">
  			<div id="peisong">
  				<div style="margin-left:10px;">配送方式</div>
  				<div class="addr1" style="margin-left:10px">
  				<span style="float:left">京东快递</span>
  				<img id="duihao" src="images/selected-icon.png">
  			</div>
  			</div>
	  		<div id="detail">
	  			<div id="d1" style="margin-left:20px;">
	  				商家：京东自营
	  			</div>
	  			<%
	  			int allNum = 0;
	  			for(int i = 0; i< cartlist.size(); i++) { %> 
	  			<div class="goodsDetail" >
	  				<div class="goods"><img src="images/<%=cartlist.get(i).getProduct().getPicture() %>"></div>
	  				<div class="goodsName"><%=cartlist.get(i).getProduct().getName() %></div>
	  				<div class="price">￥<%=cartlist.get(i).getProduct().getPrice() %></div>
	  				<div class="count">x<%=cartlist.get(i).getNum() %><%allNum +=cartlist.get(i).getNum(); %></div>
	  				<div class="youhuo">有货</div>
	  			</div>
	  			<%} %> 
	  		</div>
  		</div>
  		<div id="bottom">
  			<div id="allCount">共<%=allNum %>件</div>
  			<div id="yingfu">应付金额</div>
  			<div id="money">￥<%=allPrice %></div>
  			<div id="endAddr">山东省青岛市城阳区青岛农业大学</div>
  		</div>
  		<div id="submit">
  			<input type="button" id="btn" style="" value="提交订单" >
  		</div>
  	  </div>
  	</div>
    </div>
 </body>
</html>
