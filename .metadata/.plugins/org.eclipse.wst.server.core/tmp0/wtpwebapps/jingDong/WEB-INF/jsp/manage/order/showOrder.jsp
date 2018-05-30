<%@page import="entity.User"%>
<%@page import="entity.Product"%>
<%@page import="entity.Order"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>后台订单页</title>
	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<script src="bootstrap/js/jquery.min.js"  type="text/javascript"></script>
	<script src="bootstrap/js/bootstrap.min.js"  type="text/javascript"></script>
	<style type="text/css">
	*{
		margin:0;
		padding:0;
	}
	#header{
		margin:10px auto;
		height:82px;
		border: 1px red solid;
		background-color:#e45050;
	}
	.header1 {
		list-style:none;
	}
	.header1 li{
		float:left;
	}
	#wodejingdong{
		list-style:none;
		clear:both;
	}
	#content{
		width:1200px;
		margin:1px auto;
	}
	#myOrder{
		margin-left:30px;
		width:200px;
		font-size:16px;
		text-align:center;
		float:left;
	}
	#myOrder .aboutOrder{
		list-style:none;
		clear:both
	}
	.aboutOrder li{
		margin-top:10px;
	}
	#orderDescri{
		float:left;
		width:900px;
		
		margin-left:10px;
	}
	
	.productHeader{
		width:889px;
		height:30px;
	}
	.productContent{
		width:889px;
	}
	.productHeader1{
		list-style:none;
	}
	.productHeader1 li{
		float:left;
	}
	.img{
		width:50px;
		height:50px;
	}
	#menue{
		list-style:none;
	}
	#menue li{
		float:left;
	}
	table tr td:nth-child(1){
		width:50px;
	}
	table tr td:nth-child(2){
		width:170px;
	}
	</style>
  <script type="text/javascript">
  $().ready(function(){
  	$("[name=send]").click(function(){
  		var orderId = $(this).parent().data("send");
  		var aa = $(this);
  		$.ajax({
  			type:"post",
  			url:"sendMOrder",
  			data:"orderId="+orderId,
  			dataType:"text",
  			success:function(data){
  			if(data=="success"){
  				aa.html("已发货");}
  			}
  		});
  	});
  });
  </script>
  </head>
 
  <body>
  	   <%List<Order> orders = (List<Order>)request.getAttribute("orderlist"); 
  	   if(orders ==null){
  		 orders=new ArrayList<Order>();
  	   }
  	   %>
      
	  <div id="content">
	  	<div id="orderDescri">
	  	<table class="table-bordered">
	  	<tr>
		  	<td style="width:900px">
		  		<ul id="menue">
		  			<li>近三个月订单</li>
		  			<li style="margin-left:60px;">订单详情</li>
		  			<li style="margin-left:100px;">收货人</li>
		  			<li style="margin-left:110px;">金额</li>
		  			<li style="margin-left:100px;">全部状态</li>
		  			<li style="margin-left:90px;">是否发货</li>
		  		</ul>
		  		
		  	</td>
	  	</tr>
	 
	   	<% for(int i =0;i<orders.size();i++){ %>
	  		
	  		<tr>
	  			<td><div class="productHeader">
	  				<ul  class="productHeader1" style="list-style:none;">
	  					<li style="margin-left:10px;width:150px;"><%=orders.get(i).getDate() %></li>
	  					<li style="margin-left:10px;width:200px;"><%=orders.get(i).getNo() %></li>
	  					<li style="margin-left:100px;">京东</li>
	  					<li style="margin-left:300px;"><a href = "deleteOrder?id=<%=orders.get(i).getId() %>">删除</a></li>
	  				</ul>
	  			</div></td>
	  			</tr>
	  			<tr><td><div class="productContent">
	  				<table class="table">
	  				<%List<Product> pro = orders.get(i).getProducts();
	  				for(int j =0;j<pro.size();j++){ 
	  					%>
	  					<tr> 
	  						<td><img class="img" src="images/<%=pro.get(j).getPicture() %>"/></td>
	  						<td><%=pro.get(j).getContent() %></td>
	  						<td>x<%=pro.get(j).getNum() %></td>
	  						<%String uName = orders.get(i).getUsername(); if(uName!=null){%>
	  						<td><%=uName %></td> <%}else{ %>
	  						<td>暂无用户名</td>
	  						<%} %>
	  						<% double price =pro.get(j).getPrice() * pro.get(j).getNum();  %>
	  						<td><%=price %></td>
	  						<td><%=orders.get(i).getStatus() %></td>
	  						<%if(("已发货").equals(orders.get(i).getSendOrder())) {%>
	  						<td>已发货</td>
	  						<%}else{ %>
	  						<td data-send="<%=orders.get(i).getId() %>"><a name="send">发货</a></td>
	  						<%} %>
	  					</tr>
	  					<%} %>
	  					
	  				</table>
	  			</div></td>
	  		</tr>
	  		
	  		 <%} %> 
	  		</table>
	  	</div>
	  </div>
	  <div id="footer" class="row">
           <iframe src="footer" scrolling="no" frameborder="0" 
			name="footer" class="col-sm-12"></iframe>
    </div>
  </body>
</html>
