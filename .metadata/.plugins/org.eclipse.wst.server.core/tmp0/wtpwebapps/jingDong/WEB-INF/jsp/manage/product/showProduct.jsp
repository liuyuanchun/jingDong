<%@page import="entity.Product"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>显示商品</title>
  <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
   <script src="bootstrap/js/jquery.min.js" type="text/javascript"></script>
    <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script type="text/javascript">
    $().ready(function(){
    	$("[name=delete]").click(function(){
    		var proId = $(this).parent().data("proid");
    		var a = confirm("请确定要删除学生?");
    		if(a==true){
    		$.ajax({
    			type:"post",
    			url:"deleteMProduct",
    			data:"proId="+proId,
    			dataType:"text",
    			success:function(data){
    				if(data=="success"){
    					alert("删除成功");
    					window.location.href="showMProduct";
    				}else{
    					alert(data);
    				}
    			}
    		});}
    	});
    	$("[name=modify]").click(function(){
    		var proId = $(this).parent().data("proid");
    		window.location.href="showModifyMProduct?proId="+proId;
    		
    	});
    });
    </script>
    <style type="text/css">
 
    	
    }
    </style>
    <style type="text/css">
    .picture{
    	width:30px;
    	height:30px;
    }
    #search{
    	width:1025px;
    	height:50px;
    }
    table tr td:nth-child(3){
    width:300px;
    }
    table tr td:nth-child(2){
    width:100px;
    }
    </style>
  </head>
  
  <body>
  <%List<Product> books = (List<Product>)request.getAttribute("booklist");
  int maxPage = (Integer)request.getAttribute("maxPage");
  int ye = (Integer)request.getAttribute("page");
  Product condition = (Product)request.getAttribute("condition");
  
  %>
  <div id="products">
  <div id="search" >
  <form action="showMProduct" method="post">
	<div style="width:280px;float:left;margin-top:10px;">
		<label class="col-sm-4 control-label" style="line-height:30px;">商品名称:</label>
		<div class="col-sm-8">
			<input type="text" name="name" class="form-control"
				value="<%=condition.getName() %>" placeholder="请输入商品名称" />
		</div>
	</div>
	<div style="width:280px;float:left;margin-top:10px;">
		<label class="col-sm-4 control-label" style="line-height:30px;">商品种类:</label>
		<div class="col-sm-8">
			<input type="text" name="smallType.name" class="form-control"
				value="<%=condition.getSmallType().getName() %>" placeholder="请输入商品种类" />
		</div>
	</div>
	<div style="width:280px;float:left;margin-top:10px;">
		<label class="col-sm-4 control-label" style="line-height:30px;">商品单价:</label>
		<div class="col-sm-8">
			<input type="text" name="price" class="form-control" <%if(condition.getPrice()==-1.00){ %>
				value=""<%}else{ %>value="<%=condition.getPrice()%>"<%} %> placeholder="请输入商品单价" />
		</div>
	</div>
	 <button type="submit" id="select" class="btn btn-primary" style="margin-top:10px;margin-left:10px;">查询</button>
  </form>
  </div>
  <table class="table table-striped">
  	<tr >
  		<th>商品图片</th>
  		<th>商品名称</th>
  		<th>商品详情</th>
  		<th>商品单价</th>
  		<th>商品数量</th>
  		<th>商品种类</th>
  		<th>作者</th>
  		<th>出版社</th>
  		<th>操作</th>
  	</tr>
  	<%for(int i = 0; i < books.size();i++){ %>
  		<tr data-proid="<%=books.get(i).getId()%>">
  			<%String picture="default.jpg";
  			if(books.get(i).getPicture()!=null){
  				if(books.get(i).getPicture()!=""){
  					picture=books.get(i).getPicture();
  				}
  			} %>
  			<td><img class="picture" src="managePicture/<%=picture %>"/></td>
  			<td><%=books.get(i).getName() %></td>
  			<td><%=books.get(i).getContent() %></td>
  			<td><%=books.get(i).getPrice() %></td>
  			<td><%=books.get(i).getNum() %></td>
  			<td><%=books.get(i).getSmallType().getName() %></td>
  			<td><%=books.get(i).getAuthor()%></td>
  			<td><%=books.get(i).getPublishing().getName()%></td>
  			<td data-proid="<%=books.get(i).getId() %>"><button name="modify">修改</button><button name="delete" style="margin-left:5px">删除</button></td>
  		</tr>
  	<%} %>
  </table>
  <ul class="pagination" style="margin-left:400px;">
  <%	int begin = ((ye - 1) / 5) * 5 + 1;
					int end = 0;
					int cha = maxPage - begin;
					if (cha >= 5) {
						end = begin + 4;
					} else {
						end = begin + cha;
					} %>
	<li <%if(ye <= 1 ){ %>class="disabled"<%} %>><a href="showMProduct?page=<%=ye-1 %>&name=<%=condition.getName() %>&smallType.name=<%=condition.getSmallType().getName() %>&price=<%=condition.getPrice()%>">&laquo;</a></li>
	<%for(int i = begin ;i <= maxPage;i++ ) {%>
	<li <%if(ye == i ){ %>class="active"<%} %>><a href="showMProduct?page=<%=i%>&name=&smallType.name=&price="><%=i %></a></li>
	<%} %>
	<li <%if(ye >=maxPage ){ %>class="disabled"<%} %>><a href="showMProduct?page=<%=ye+1 %>&name=<%=condition.getName() %>&smallType.name=<%=condition.getSmallType().getName() %>&price=<%=condition.getPrice()%>">&raquo;</a></li>
</ul>
   </div>
  </body>
</html>
