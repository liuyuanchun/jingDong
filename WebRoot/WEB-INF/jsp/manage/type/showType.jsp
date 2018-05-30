<%@page import="entity.SmallType"%>
<%@page import="entity.BigType"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>显示商品类别</title>  
     <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
   <script src="bootstrap/js/jquery.min.js" type="text/javascript"></script>
    <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script type="text/javascript">
    	$().ready(function(){
    	//双击大分类显示小分类
    		$("#bType").dblclick(function(){
    			var bId = $(this).val();
    			$.ajax({
    				type:"post",
    				url:"showMsType",
    				data:"bId="+bId,
    				dataType:"text",
    				success:function(data){
    					if(data==""){
    					$("#sType").html("");
    					}else{
	    					var mes = data.substring(0,data.length -1);
	    					var str = mes.split(";");
	    					var options ="";
	    					for(var i = 0; i < str.length;i++){
	    						var sType = str[i].split(",");
	    						options +="<option value="+sType[0]+">"+sType[1]+"</option>";
	    					}
	    					$("#sType").html(options);
    					}
    				}
    			});
    		});
    		//添加大分类
    	$("#bButton").click(function(){
    		var bType = prompt("请输入大分类的名称");
    		if(bType != null){
	    		$.ajax({
	    			type:"post",
	    			url:"addMbType",
	    			data:"bType=" + bType,
	    			dataType:"text",
	    			success:function(data){
	    				if(data=="success"){
	    					window.location.href="showMType";
	    				}else{
	    					alert(data);
	    				}
	    			}
	    		});
    		}
    	});
    	//删除大分类
    	
    	
    	//修改大分类
    	
    	
    	
    	//添加小分类
    	$("#sButton").click(function(){
    		var options=$("#bType option:selected");//获取选中的项
			var bId = options.val();   //拿到选中项的值
			var bName = options.text();   //拿到选中项的文本
    		var bId = $("#bType").val();
    		var sName = prompt("请输入“"+bName+"”要添加的小分类的名称");
    		if(sName != null){
    			$.ajax({
    				type:"post",
	    			url:"addMsType",
	    			data:"bId=" + bId+"&sName="+sName,
	    			dataType:"text",
	    			success:function(data){
	    				if(data=="success"){
	    					window.location.href="showMType";
	    				}else{
	    					alert(data);
	    				}
	    			}
    			});
    		}
    	});
    	//删除小分类
    		$("#delsButton").click(function(){
    			
    			var sOptions = $("#sType").val();
    			if(sOptions==null){
    					alert("请选中要删除的小分类");
    			}else{
    				var sTId = sOptions;
    				var sTName = $("#sType option:selected").html();
    				var a = confirm("是否要删除选中的小分类:‘"+sTName+"’？");
    				if(a==true){
    				
    					$.ajax({
    						type:"post",
    						url:"delMsType",
    						data:"sId="+sTId,
    						dataType:"text",
    						success:function(data){
    							if(data=="success"){
    								alert("删除成功！");
    								window.location.href="showMType";
    							}else{
    								alert(data);
    							}
    						}
    					});
    				}
    			}
    			
    		});
    	
    	//修改小分类
    	$("#modisButton").click(function(){
    			var sOptions = $("#sType").val();
    			if(sOptions==null){
    					alert("请选中要修改的小分类");
    			}else{
    				var sTId = sOptions;
    				var sTName = $("#sType option:selected").html();
    				 var nsName = prompt("请输入要修改的小分类的名称");
    				if(nsName !=null){
    				 	
	    				$.ajax({
	    					type:"post",
	    						url:"modifyMsType",
	    						data:"sId="+sTId +"&nsName="+nsName,
	    						dataType:"text",
	    						success:function(data){
	    							if(data=="success"){
	    								alert("修改成功！");
	    								window.location.href="showMType";
	    							}else{
	    								alert(data);
	    							}
	    						}
	    				});
    				}
    			}
    	});
    });
    </script>
    <style type="text/css">
    .centent{
    	margin-top:50px;
        float:left;
    	width:400px;
    	height:400px;
    }
   #bType,#sType{
   		width:400px;
    	height:400px;
    	font-size:18px;
   }
   #bButton,#sButton{
   	margin-top:10px;
   margin-left:50px;
   }
   #sButton{
   	margin-left:250px;
   }
    </style>
  </head>
  
  <body>
  <% List<BigType> bType = (List<BigType>)request.getAttribute("btypelist"); %>
  <div>
    <div class="centent">
    <select multiple id="bType">
    <%for(int i = 0; i < bType.size();i++){ %>
    <option value="<%=bType.get(i).getId()%>" <%if(i==0){out.print("selected");} %>><%=bType.get(i).getName() %></option>
    <%} %>
    </select>
    </div>
    <div class="centent" style="margin-left:100px;">
    <%List<SmallType> sType = bType.get(0).getSmallType(); %>
    <select multiple id="sType">
    	<%for(int i = 0; i < sType.size();i++){ %>
    		<option value="<%=sType.get(i).getId() %>"><%=sType.get(i).getName() %></option>
    	<%} %>
    </select>
    </div>
    <div style="clear:both">
     <button id="bButton">添加大分类</button>
     <button id="delbButton">删除大分类</button>
     <button id="modibButton">修改大分类</button>
    <button id="sButton">添加小分类</button>
    <button id="delsButton">删除小分类</button>
    <button id="modisButton">修改小分类</button>
    </div>
    </div>
  
   
  </body>
</html>
