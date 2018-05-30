<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'left.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
    <script src="bootstrap/js/jquery.min.js" type="text/javascript"></script>
    <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <Style>
    #accordion{
    	margin-top:20px;
    	width:200px;
    	 background-color: #FFFFF0 ;
    }
    #accordion a{
    text-decoration:none;
    }
    .panel-title,.panel-body{
    	text-align:center;
    }
    .panel-body a{
    	cursor:pointer;
    }
    
    </Style>
  </head>
  
  <body>
    <div class="panel-group" id="accordion">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion" 
                href="#product">商品管理</a>
            </h4>
        </div>
        <div id="product" class="panel-collapse collapse">
            <div class="panel-body"><a href="showMProduct" target="right">显示商品</a></div>
            <div class="panel-body"><a href="showMAddProduct" target="right">添加商品</a></div>
        </div>
    </div>
       <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion" 
                href="#type">商品类别管理</a>
            </h4>
        </div>
        <div id="type" class="panel-collapse collapse">
            <div class="panel-body"><a href="showMType" target="right">管理商品分类</a></div>
        </div>
        
    </div>
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion" 
                href="#message">用户信息管理</a>
            </h4>
        </div>
        <div id="message" class="panel-collapse collapse">
       		<div class="panel-body"><a href="showMUser" target="right">修改用户信息</a></div>
            <div class="panel-body"><a href="showModifyMpwd" target="right">修改密码</a></div>
            
        </div>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion" 
                href="#order">订单管理</a>
            </h4>
        </div>
        <div id="order" class="panel-collapse collapse">
            <div class="panel-body"><a  href="showMOrder" target="right">显示订单</a></div>
           
        </div>
    </div>
   
       <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion" 
                href="#supplier">供货商管理</a>
            </h4>
        </div>
        <div id="supplier" class="panel-collapse collapse">
            <div class="panel-body"><a  href="showMSupplier" target="right">展示供货商</a></div>
            <div class="panel-body"><a  href="showAddSupplierPage" target="right">增加供货商</a></div>
            
           
        </div>
    </div>
    
           <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion" 
                href="#supplierOrder">订货管理</a>
            </h4>
        </div>
        <div id="supplierOrder" class="panel-collapse collapse">
            <div class="panel-body"><a  href="showMSupplierOrder" target="right">展示订货记录</a></div>
            <div class="panel-body"><a  href="showAddMSupplierOrder" target="right">新增订货记录</a></div>
        </div>
    </div>
</div>
  </body>
</html>
