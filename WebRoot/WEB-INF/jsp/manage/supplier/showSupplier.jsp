<%@page import="entity.Supplier"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
   <script src="bootstrap/js/jquery.min.js" type="text/javascript"></script>
    <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<script type="text/javascript">
	$().ready(function(){
		$("[name=modify]").click(function(){
			var userid = $(this).parent().data("userid");
			window.location.href="modifySupplierInfo?id="+userid;
		});
		
		$("[name=delete]").click(function(){
			var userid = $(this).parent().data("userid");
    		var a = confirm("请确定要删除该供应商?删除操作不可还原!");
    		if(a==true){
     		$.ajax({
    			type:"post",
    			url:"doSupplierDeleteById",
    			data:"id="+userid,
    			dataType:"text",
    			success:function(data){
    				console.log(data);
    				if("200"==data){
    					alert("删除成功!");
    					window.location.href="showMSupplier";
    				}else{
    					alert("删除失败!");
    				}
    			},
    	        error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert(XMLHttpRequest.status);
                    alert(XMLHttpRequest.readyState);
                    alert(textStatus);
            }
    		}); 
    		}
		});
    });
	</script>
  </head>
  
  <body>
  <%  
  List<Supplier> supplier = (List<Supplier>)request.getAttribute("supplierlist");
  Supplier supplierDTO=(Supplier)request.getAttribute("supplier");
  if(supplierDTO==null){
	  supplierDTO=new Supplier();
	  supplierDTO.setSupplierName("");
	  supplierDTO.setSupplierType("");
  }else{
	  if(supplierDTO.getSupplierName()==null){
		  supplierDTO.setSupplierName("");
	  }
	  
	  if(supplierDTO.getSupplierType()==null){
		  supplierDTO.setSupplierType("");
	  }
  }
  %>
    <form action="showMSupplier" method="post">
	<div style="width:320px;float:left;margin-top:10px;">
		<label class="col-sm-4 control-label" style="line-height:30px;">供应商名称:</label>
		<div class="col-sm-8">
			<input type="text" name="supplierName" class="form-control"
				value="<%=supplierDTO.getSupplierName() %>" placeholder="请输入供应商名称" />
		</div>
	</div>
	<div style="width:280px;float:left;margin-top:10px;">
		<label class="col-sm-4 control-label" style="line-height:30px;">种类:</label>
		<div class="col-sm-8">
			<input type="text" name="supplierType" class="form-control"
				value="<%=supplierDTO.getSupplierType() %>" placeholder="请输入种类" />
		</div>
	</div>
	 <button type="submit" id="select" class="btn btn-primary" style="margin-top:10px;margin-left:10px;">查询</button>
  </form>
    <table class="table table-condensed table-bordered">
    	<tr>
    		<th>供应商编号</th>
    		<th>供应商名称</th>
    		<th>供应商类型</th>
    		<th style="width:150px;">操作</th>
    	</tr>
    	<%for(int i = 0; i < supplier.size();i++){ %>
    		<tr data-userid="<%=supplier.get(i).getId()%>">
    			<td><%=supplier.get(i).getSupplierCode() %></td>
    			<td><%=supplier.get(i).getSupplierName() %></td>
    			<td><%=supplier.get(i).getSupplierType() %></td>
    			<td data-userid="<%=supplier.get(i).getId() %>"><button class="btn btn-default" name="modify">修改</button><button name="delete" class="btn btn-default" style="margin-left:5px">删除</button></td>
    		</tr>
    	<%} %>
    </table>
  </body>
</html>