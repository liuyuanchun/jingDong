<%@page import="entity.Product"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'productliebiao.jsp' starting page</title>
    

	<script src="bootstrap/js/jquery.min.js" type="text/javascript"></script>
	<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<link href="css/bookLieBiaoStyle.css" type = "text/css" rel="stylesheet"/>
	<style type="text/css">
	#header{
		margin:1px auto;
		height:230px;
	}
	iframe {
		width: 100%;
		height: 100%;
	}
	</style>
 
 <script type="text/javascript">

$().ready(function(e) {
	$(".d51111,.d51113").hover(function(){
		$(this).css("cursor","pointer");
		},
		function(){
			$(this).css("cursor","default");
		});
    $(".d51111,.d51113").click(function(){
		window.location.href="showBook?proId="+$(this).parent().data("proid");
	});
});

 </script>
 
  </head> 
  <body>
    <%
    	List<Product> booklist= (List<Product>)request.getAttribute("booklist");
   		int ye = (Integer) request.getAttribute("page");
		int maxPage = (Integer) request.getAttribute("maxPage");
		int sId = ((Integer)request.getAttribute("sId")== null)?-1:(Integer)request.getAttribute("sId");
		int bId = ((Integer)request.getAttribute("bId")== null)?-1:(Integer)request.getAttribute("bId");
    %>
   <div style="margin:1px auto;width:1366px;height:600px;background-color:#F6F6F6">
   <div id="header" class="row">
           <iframe src="header" scrolling="no" frameborder="0" 
			name="header" class="col-sm-12"></iframe>
    </div>
	 <div id="d5">
    <div id="d51">
      <div class="d511">
      <% for(int i = 0; i < booklist.size();i++){%>
        <div class="d5111" data-proid="<%=booklist.get(i).getId()%>">
        <%String picture ="default.jpg";
        if(booklist.get(i).getPicture() != null){
        	if(booklist.get(i).getPicture() !=""){
        		picture = booklist.get(i).getPicture(); 
        	}
        } %>
          <div class="d51111"><img style="width:200px;height:200px;" src="images/<%=picture %>"/></div>
          <div class="d51112" >￥<%=booklist.get(i).getPrice() %></div>
          <div class="d51113" ><%=booklist.get(i).getName() %></div>
        </div>
      <%} %>
      </div>
    </div>
  </div>
  <div id="d6">
    <div id="d61">
    <div class="d611">
    <ul class="u1">
				<li><a
					href="list?page=1&sId=<%=sId %>&bId=<%=bId%>">首页</a>
				</li>
				<li <%if (ye <= 1) {%> class="disabled" style="width:50px;" <%}%>><a
					href="list?page=<%=ye - 1%>&sId=<%=sId %>&bId=<%=bId%>">上一页</a>
				</li>
				<%
					int begin = ((ye - 1) / 5) * 5 + 1;
					int end = 0;
					int cha = maxPage - begin;
					if (cha >= 5) {
						end = begin + 4;
					} else {
						end = begin + cha;
					}
					for (int i = begin; i <= end; i++) {
				%>
				<li <%if (ye == i) {%> class="active" style="width:20px;" <%}%>><a
					href="list?page=<%=i%>&sId=<%=sId %>&bId=<%=bId%> "
					><%=i%></a>
				</li>
				<%
					}
				%>
				<li <%if (ye >= maxPage) {%> class="disabled" style="width:50px;" <%}%>><a
					href="list?page=<%=ye + 1%>&sId=<%=sId %>&bId=<%=bId%>">下一页</a>
				</li>
				<li><a
					href="list?page=<%=maxPage%>&sId=<%=sId %>&bId=<%=bId%>">尾页</a>
				</li>
			</ul>
			</div>
      <!-- <div class="d611">
        <ul class="u1" >
          <li style="width:50px;margin-left:-30px;"> 上一页 </li>
          <li>1</li>
          <li>2</li>
          <li>3</li>
          <li>4</li>
          <li>5</li>
          <li>6</li>
          <li>7</li>
          <li>...</li>
          <li style="width:50px;">下一页></li>
        </ul>
      </div>
      <div class="d612">
        <div style="float:left;width:70px;height:40px;">共83页&nbsp;第</div>
        <div style="float:left;">
          <input type="text" value="1" style="width:35px;height:35px;"/>
        </div>
        <div style="float:left;width:5px;height:40px;margin-left:3px;">页</div>
      </div>
      <div class="d613">确定</div> -->
    </div>
  </div>
    <div id="footer" class="row">
           <iframe src="footer" scrolling="no" frameborder="0" 
			name="footer" class="col-sm-12"></iframe>
    </div>
</div>
  </body>
</html>
