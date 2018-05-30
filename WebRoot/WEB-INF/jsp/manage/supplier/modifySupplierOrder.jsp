<%@page import="entity.SupplierOrder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>修改供应商订货信息</title>
</head>
 <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
 <script src="bootstrap/js/jquery.min.js" type="text/javascript"></script>
 <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<body>
<% SupplierOrder supplierDTO =(SupplierOrder)request.getAttribute("supplierDTO"); 
   
%>

<div style="width:500px;margin:20px auto;height:430px;">
  <form action="doSupplierOrderModify" method="post" class="form-horizontal" role="form">
  <input type="hidden" name="id" value="<%=supplierDTO.getId()%>">
  <input type="hidden" name="proCode" value="<%=supplierDTO.getProCode()%>">
  <div class="form-group" >
   		<label class="col-sm-3 control-label">供应商编码：</label>
   		<div class="col-sm-5"><input type="text" name="supplierCode" disabled="disabled" class="form-control" value="<%=supplierDTO.getSupplierCode() %>"  placeholder="请输入新用户名"/></div>
  </div>
  
  <div class="form-group">
  		<label class="col-sm-3 control-label">供应商名称：</label>
  		<div class="col-sm-5"><input type="text" name="supplierName" disabled="disabled" class="form-control" value="<%=supplierDTO.getSupplierName() %>" /></div>
  		<div id="msg" class="col-sm-4" style="color:red;line-height:30px;"></div>
  </div>
  <div class="form-group">
   		<label class="col-sm-3 control-label">供应商类型：</label>
    	<div class="col-sm-5"><input type="text" disabled="disabled" name="supplierType" value="<%=supplierDTO.getSupplierType()%>" class="form-control"/></div>
  </div>
   <div class="form-group">
   		<label class="col-sm-3 control-label">产品名称：</label>
    	<div class="col-sm-5"><input type="text" disabled="disabled" name="proName" value="<%=supplierDTO.getProName()%>" class="form-control"/></div>
  </div>
   <div class="form-group">
   		<label class="col-sm-3 control-label">单价：</label>
    	<div class="col-sm-5"><input type="text" disabled="disabled" name="proPrice" value="<%=supplierDTO.getProPrice() %>" class="form-control"/></div>
  </div>
   <div class="form-group">
   		<label class="col-sm-3 control-label">数量：</label>
    	<div class="col-sm-5"><input type="text" disabled="disabled" name="count" value="<%=supplierDTO.getCount()%>" class="form-control"/></div>
  </div>
   <div class="form-group">
   		<label class="col-sm-3 control-label">备注：</label>
    	<div class="col-sm-5"><input type="text" name="note" value="<%=supplierDTO.getNote()%>" class="form-control"/></div>
  </div>
  <div class="form-group"  style="margin-left:150px;" >
  <input type="submit" class="btn btn-primary" value="保存"/>
  </div>
  </form>
  </div>
</body>
</html>