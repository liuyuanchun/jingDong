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
    
    <title>用户信息管理</title>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
   <script src="bootstrap/js/jquery.min.js" type="text/javascript"></script>
    <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<script type="text/javascript">
	$().ready(function(){
		$("[name=modify]").click(function(){
			var userid = $(this).parent().data("userid");
			window.location.href="showUserModifyPage?userId="+userid;
		});
		
		$("[name=delete]").click(function(){
			var userid = $(this).parent().data("userid");
    		var a = confirm("请确定要删除该用户?删除操作不可还原!");
    		if(a==true){
     		$.ajax({
    			type:"post",
    			url:"doUserDeleteById",
    			data:"userId="+userid,
    			dataType:"text",
    			success:function(data){
    				console.log(data);
    				if("200"==data){
    					alert("删除成功!");
    					window.location.href="showMUser";
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
  <%  List<User> user = (List<User>)request.getAttribute("userlist");
  User userDTO=(User)request.getAttribute("user");
  if(userDTO==null){
	 userDTO=new User();
	 userDTO.setUsername("");
	 userDTO.setTelphone("");
  }
  %>
    <form action="searchUserForManage" method="post">
	<div style="width:280px;float:left;margin-top:10px;">
		<label class="col-sm-4 control-label" style="line-height:30px;">用户名称:</label>
		<div class="col-sm-8">
			<input type="text" name="username" class="form-control"
				value="<%=userDTO.getUsername() %>" placeholder="请输入用户名称" />
		</div>
	</div>
	<div style="width:280px;float:left;margin-top:10px;">
		<label class="col-sm-4 control-label" style="line-height:30px;">联系方式:</label>
		<div class="col-sm-8">
			<input type="text" name="telphone" class="form-control"
				value="<%=userDTO.getTelphone() %>" placeholder="请输入联系方式" />
		</div>
	</div>
	 <button type="submit" id="select" class="btn btn-primary" style="margin-top:10px;margin-left:10px;">查询</button>
  </form>
    <table class="table table-condensed table-bordered">
    	<tr>
    		<th>用户名</th>
    		<th>联系方式</th>
    		<th>用户类型</th>
    		<th style="width:150px;">操作</th>
    	</tr>
    	<%for(int i = 0; i < user.size();i++){ %>
    		<tr data-userid="<%=user.get(i).getId()%>">
    			<td><%=user.get(i).getUsername() %></td>
    			<td><%=user.get(i).getTelphone() %></td>
    			<td><%=user.get(i).getType() %></td>
    			<td data-userid="<%=user.get(i).getId() %>"><button class="btn btn-default" name="modify">修改</button><button name="delete" class="btn btn-default" style="margin-left:5px">删除</button></td>
    		</tr>
    	<%} %>
    </table>
  </body>
</html>
