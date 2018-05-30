<%@page import="java.util.List"%>
<%@page import="entity.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
 <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
 <script src="bootstrap/js/jquery.min.js" type="text/javascript"></script>
 <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<body>
<%  
	List<Supplier> supplierList = (List<Supplier>)request.getAttribute("supplierList"); 
	List<Pro> proList = (List<Pro>)request.getAttribute("proList"); 
%>

<div style="width:500px;margin:20px auto;height:430px;">
  <form action="doAddSupplierPro" method="post" class="form-horizontal" role="form">
 <div class="form-group">
   		<label class="col-sm-3 control-label">供&nbsp;&nbsp;应&nbsp;&nbsp;商：</label>
   		<div class="col-sm-5">
			<select name="supplierId" class="form-control sId">
			<option value="-1">请选择供应商</option>
			<%for(int i = 0 ;i <  supplierList.size();i++){ %>
			<option value="<%=supplierList.get(i).getId() %>"><%=supplierList.get(i).getSupplierName() %></option>
			<%} %>
			</select>
   		</div>
   		<div id="publishingmsg" class="col-sm-4" style="color:red;line-height:30px;"></div>
  </div>
 <div class="form-group">
   		<label class="col-sm-3 control-label">产&nbsp;&nbsp;&nbsp;&nbsp;品：</label>
   		<div class="col-sm-5">
			<select name="proId" class="form-control sId">
			<option value="-1">请选择产品</option>
			<%for(int i = 0 ;i <  proList.size();i++){ %>
			<option value="<%=proList.get(i).getId() %>"><%=proList.get(i).getProName() %></option>
			<%} %>
			</select>
   		</div>
   		<div id="publishingmsg" class="col-sm-4" style="color:red;line-height:30px;"></div>
  </div>
   <div class="form-group">
   		<label class="col-sm-3 control-label">数量：</label>
    	<div class="col-sm-5"><input type="number" name="count"  class="form-control"/></div>
  </div>
   <div class="form-group">
   		<label class="col-sm-3 control-label">备注：</label>
    	<div class="col-sm-5"><input type="text" name="note"  class="form-control"/></div>
  </div>
  <div class="form-group"  style="margin-left:150px;" >
  <input type="submit" class="btn btn-primary" value="保存"/>
  </div>
  </form>
  </div>
</body>
</html>