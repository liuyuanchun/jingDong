<%@page import="entity.Publishing"%>
<%@page import="entity.SmallType"%>
<%@page import="entity.BigType"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加商品</title>
   <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
   <script src="bootstrap/js/jquery.min.js" type="text/javascript"></script>
    <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<%List<BigType> allType = (List<BigType>)request.getAttribute("allType");
	List<SmallType> smallType = allType.get(0).getSmallType();
 %>
 <script type="text/javascript">
 	$().ready(function(){
 		var options = Array();
 		<%for(int i = 0; i < allType.size();i++){
 			for(int j = 0; j <allType.get(i).getSmallType().size(); j++){
 			SmallType smallType1 = allType.get(i).getSmallType().get(j);%>
 			options[<%=allType.get(i).getId()%>] += "<option value='<%=smallType1.getId()%>'><%=smallType1.getName()%></option>"; 
 			<%}
 		}%>
 		$("[name=bId]").change(function(){
 			var bId = $(this).val();
 			$("[name='smallType.id']").html(options[bId]);
 		});
 		$("[name=name]").blur(function(){
 			if($(this).val()==""){
 				$("#namemsg").html("商品名称不能为空");
 			}
 		});
 		$("[name=name]").focus(function(){
 			$("#namemsg").html("");
 		});
 		$("[name=price]").blur(function(){
 			if($(this).val()==""){
 				$("#pricemsg").html("商品单价不能为空");
 			}
 		});
 		$("[name=price]").focus(function(){
 			$("#pricemsg").html("");
 		});
 		$("[name=num]").blur(function(){
 			if($(this).val()==""){
 				$("#pricemsg").html("商品单价不能为空");
 			}
 		});
 		$("form").submit(function(){
 			var puId = $("[name='publishing.id']").val();
 			if(puId ==-1){
 				$("#publishingmsg").html("未选择出版社");
 				return false;
 			}else{
 				$("#publishingmsg").html("");
 			}
 		});
 	});
 </script>
  </head>
  
  <body>
  <% List<Publishing> publist =  (List<Publishing>)request.getAttribute("publist"); %>
   <div style="width:500px;margin:20px auto;height:430px;">
  <form action="AddMProduct" method="post"  enctype="multipart/form-data"  class="form-horizontal" role="form">
  <div class="form-group" >
   		<label class="col-sm-3 control-label">商品名称：</label>
   		<div class="col-sm-5"><input type="text" name="name" class="form-control"  placeholder="请输入名字"/></div>
   		<div id="namemsg" class="col-sm-4" style="color:red;line-height:30px;"></div>
  </div>
  
  <div class="form-group">
  		<label class="col-sm-3 control-label">单&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;价：</label>
  		<div class="col-sm-5"><input type="text" name="price" class="form-control"  placeholder="请输入单价"/></div>
  		<div id="pricemsg" class="col-sm-4" style="color:red;line-height:30px;"></div>
  </div>
  <div class="form-group" >
   		<label class="col-sm-3 control-label">库存数量：</label>
   		<div class="col-sm-5"><input type="text" name="num" class="form-control"  placeholder="请输入库存数量"/></div>
   		<div id="nummsg" class="col-sm-4" style="color:red;line-height:30px;"></div>
  </div>
 <div class="form-group">
   		<label class="col-sm-3 control-label">照&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;片：</label>
   		<div class="col-sm-5"><input type="file" name="mypicture" class="form-control"/></div>
  </div>
  <div class="form-group">
   		<label class="col-sm-3 control-label">商品简介：</label>
   		<div class="col-sm-5"><textarea name="content" class="form-control"></textarea></div>
  </div>
  <div class="form-group">
   		<label class="col-sm-3 control-label">作&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;者：</label>
    	<div class="col-sm-5"><input type="text" name="author" class="form-control"/></div>
  </div>
   <div class="form-group">
   		<label class="col-sm-3 control-label">商品分类：</label>
   		<div class="col-sm-4">
			<select name="bId" class="form-control">
			<%for(int i = 0;i < allType.size(); i++){ %>
			<option value="<%=allType.get(i).getId()%>"><%=allType.get(i).getName() %></option>
			<%} %>
			</select>
			</div>
			<div class="col-sm-4">
			<select name="smallType.id" class="form-control">
			<% for(int i = 0; i < smallType.size();i++){%>
			<option value="<%=smallType.get(i).getId() %>"><%=smallType.get(i).getName() %></option>
			<%} %>
			</select>
   		</div>
  </div>
   <div class="form-group">
   		<label class="col-sm-3 control-label">出&nbsp;&nbsp;版&nbsp;&nbsp;社：</label>
   		<div class="col-sm-5">
			<select name="publishing.id" class="form-control sId">
			<option value="-1">请选择出版社</option>
			<%for(int i = 0 ;i <  publist.size();i++){ %>
			<option value="<%=publist.get(i).getId() %>"><%=publist.get(i).getName() %></option>
			<%} %>
			</select>
   		</div>
   		<div id="publishingmsg" class="col-sm-4" style="color:red;line-height:30px;"></div>
  </div>
  <div class="form-group"  style="margin-left:150px;" >
  <input type="submit" class="btn btn-primary" value="保存"/>
  </div>
  </form>
  </div>
  </body>
</html>
