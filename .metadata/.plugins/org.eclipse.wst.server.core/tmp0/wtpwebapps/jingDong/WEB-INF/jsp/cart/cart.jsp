<%@page import="entity.User"%>
<%@page import="entity.Cart"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <head>
    <base href="<%=basePath%>">
    
    <title>购物车</title>
    
<script src="bootstrap/js/jquery.min.js" type="text/javascript"></script>
<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
 <link href="css/cartStyle.css" type = "text/css" rel="stylesheet"/>
<script>
$().ready(function(e) {
	
	$(".quanxuan").click(function(){
		if($(this).prop("checked")==false){
				$(".xuanzhong").prop("checked",false);
		}else if($(this).prop("checked")==true){
				$(".xuanzhong").prop("checked",true);
		}
		calAllPrice();
		calSelected();
	});
	$(".xuanzhong").click(function(){
		if($(this).prop("checked")==false){
			$(".quanxuan").prop("checked",false);
		}else{
			var flag = true;
			$(".xuanzhong").each(function(index,element){
				if($(element).prop("checked")==false){
					$(".quanxuan").prop("checked",false);
					flag=false;
					return;
				}
			});
			if(flag){
				$(".quanxuan").prop("checked",true);
			}else{
				$(".quanxuan").prop("checked",false);
			}
		} 
		calAllPrice();
		calSelected();
	});
	$(".delete").click(function(){
		var proId = $(this).parent().parent().parent().data("proid");
		window.location.href="deleteFromCart?proId="+proId;
	});
	$(".delete").hover(
		function(){
			$(this).css("cursor","pointer");
			$(this).css("color","red");
		},
		function(){
			$(this).css("cursor","default");
			$(this).css("color","#9B9B9B");
	});
	
	/*数量增加  */
	$(".d51613").click(function(){
		var num = $(this).parent().children(".d51612").children().val();
		num++;
		$(this).parent().children(".d51612").children().val(num);
		var price = $(this).parent().parent().parent().children(".d515").children().html();
		var count = num * price;
		$(this).parent().parent().next().children("a").html(count.toFixed("2"));
		var proId=$(this).parent().parent().parent().data("proid");
		modifyNumAndCount(num,count.toFixed("2")*1,proId);
		calAllPrice();
		calSelected();
	});
	/*数量减少  */
	$(".d51611").click(function(){
		var num = $(this).parent().children(".d51612").children().val();
		num--;
		if(num<1){
			num=1;
		}
		$(this).parent().children(".d51612").children().val(num);
		var price = $(this).parent().parent().parent().children(".d515").children().html();
		 var count = num * price;
		$(this).parent().parent().next().children("a").html(count.toFixed("2")); 
		var proId=$(this).parent().parent().parent().data("proid");
		modifyNumAndCount(num,count.toFixed("2")*1,proId);
		calAllPrice();
		calSelected();
	});
	$(".d51611,.d51613").hover(
		function(){
			$(this).css("cursor","pointer");
		},
		function(){
			$(this).css("cursor","default");
	});
	/*计算总价  */
	function calAllPrice(){
		var zongjia = 0;
		$(".xuanzhong").each(function(index,element){
		var count = $(this).parent().parent().children(".d517").children().html();
			if($(element).prop("checked")==true){
				zongjia += count*1;	
			}
			$(".zongjia").html(zongjia.toFixed("2"));
		});
	}
	/*计算选中商品  */
	function calSelected(){
		var allSelect = 0;
		$(".xuanzhong").each(function(index,element){
			 if($(element).prop("checked")==true){
			 var select = $(this).parent().parent().children(".d516").children().children(".d51612").children().val();
				allSelect += select*1 ;
			}
			$(".selected").html(allSelect); 
		});
	}
	/*使用ajax更新num和count  */
	function modifyNumAndCount(num,count,proId){
		$.ajax({
			type:"post",
			url:"modifyCart",
			data:"num="+num+"&proId="+proId,
			dataType:"text",
			success:function(){				
			}
		});
	}	
	$("#d21").click(function(){
		window.location.href="showMain";
	});
	 $("#d65").click(function(){
		var flag = false;
		$(".xuanzhong").each(function(index,element){
			if($(element).prop("checked") == true){
				flag = true;
				return;
			}
		});
		if(flag ==false){
			alert("请至少选中一件商品！");
		}else{
			var str = "";
			$(".xuanzhong").each(function(index,element){
				if($(element).prop("checked") == true){
					var proId = $(this).parent().parent().data("proid");
					str +=proId + ",";
				}
			});
			window.location.href="showAccount?proIdArray="+str;
		}
	}); 
});
</script>
<style type="text/css">

iframe {
	width: 100%;
	height: 100%;
}
</style>
  </head>
  
  <body>
  <%List<Cart> cartlist = (List<Cart>)request.getAttribute("cartlist");
  %>
    <div style="margin:1px auto;width:1366px;background-color:#F6F6F6">
    <div id="d1">
    <div id="d11">送至：北京&or;</div>
    <div id="d12">
      <ul class="u1">
      <%User user = (User)request.getSession().getAttribute("user"); %>
     
        <li style="width:180px">欢迎你<%=user.getUsername() %>&nbsp;&nbsp;&nbsp;</li>

        <li><a style="text-decoration:none;" href="showOrder">我的订单</a></li>
        <li>我的京东&or;</li>
        <li>京东会员</li>
        <li>企业采购</li>
        <li>手机京东&or;</li>
        <li>关注京东&or;</li>
        <li>客户服务&or;</li>
        <li>网站导航&or;</li>
      </ul>
    </div>
  </div>
  <div id="d2">
    <div id="d21" ></div>
    <div id="d22">
      <input class="text1" type="text" id="selectbooktext" placeholder="莫言" style="font-weight:bold;color:#C2C2C2"/>
      <div class="sousuo">搜索</div>
    </div>
  </div>
  <div id="d3">
    <div id="d31">全部商品<%=cartlist.size() %></div>
    <div id="d32">京东大药房</div>
    <div id="d33">
      <div class="d331">配送至:</div>
      <div class="d332">北京朝阳区三环以内&or; </div>
    </div>
  </div>
  <div id="d4">
    <div id="d41" style="width:60px;">
      <input type="checkbox" class="quanxuan" style="margin-top:3px;" />
      &nbsp;全选 </div>
    <div id="d41" style="margin-left:75px;">商品</div>
    <div id="d41" style="margin-left:450px;">单价</div>
    <div id="d41" style="margin-left:60px;">数量</div>
    <div id="d41" style="margin-left:90px;">小计</div>
    <div id="d41" style="margin-left:40px;">操作</div>
  </div>
  
    <div id="d5">
    <%for(int i = 0;i < cartlist.size();i++){ %>
    <div id="d51" data-proid="<%=cartlist.get(i).getProduct().getId() %>" >
      <div class="d511">
        <input type="checkbox" class="xuanzhong" style="margin-left:10px;" />
      </div>
      <div class="d512"><img style="width:80px;height:80px;"src="images/<%=cartlist.get(i).getProduct().getPicture()%>"/></div>
      <div class="d513">
        <div><%=cartlist.get(i).getProduct().getContent() %></div>
        <div style="clear:both;margin-top:29px;">
          <div id="qitian" style="float:left"></div>
          <div style="margin-left:5px;float:left;color:#666">支持7天无理由退货</div>
        </div>
        <div style="clear:both;margin-top:53px;">
          <div id="baozhuang" style="margin-left:0px;float:left"></div>
          <div style="margin-left:5px;float:left;color:#B2B2B2">选包装 </div>
        </div>
      </div>
      <div class="d514">颜色：40周年纪念版</div>
      <div class="d515">¥<a id="jiage1"><%=cartlist.get(i).getProduct().getPrice() %></a></div>
      <div class="d516">
        <div class="d5161">
          <div class="d51611" >-</div>
          <div class="d51612">
            <input type="text" name="num" value="<%=cartlist.get(i).getNum() %>" style="width:35px;height:30px;"/>
          </div>
          <div class="d51613"  >+</div>
        </div>
        <div class="d5162">有货 </div>
      </div>
      <div class="d517">¥<a class="count"><%=cartlist.get(i).getCount() %></a></div>
      <div class="d518">
        <ul id="ul2" >
          <li class="delete">删除</li>
          <li>移到我的关注</li>
          <li>加到我的关注</li>
        </ul>
      </div>
    </div>
    <%} %>
</div>
<div id="d6">
  <div id="d61">
    <input type="checkbox" class="quanxuan" style="margin-top:3px;"/>
    &nbsp;全选 </div>
  <div id="d62">
    <ul class="ul1">
      <li>删除选中的商品</li>
      <li>移到我的关注</li>
      <li>清除下柜商品</li>
    </ul>
  </div>
  <div id="d63">
    <div style="width:36px;float:left;">已选择</div>
    <div class="selected" style="width:10px;float:left;color:#F00;">0</div>
    <div style="width:40px;float:left;">件商品</div>
    <div name="jiantou">&and;</div>
  </div>
  <div id="d64">
    <div  style="width:120px;height:18px;">总价：<span style="color:red;font-weight:bold;font-size:15px;">¥<a class="zongjia">0.00</a></span>
      <div style="float:right;width:12px;height:18px;background-image:url(images/price-tips.png)"></div>
    </div>
    <div style="width:100px;height:25px;">已节省:-¥0.00</div>
  </div>
  <div id="d65"></div>
</div>
<div id="footer" class="row">
   <iframe src="footer" scrolling="no" frameborder="0" 
			name="footer" class="col-sm-12"></iframe>
</div>
</div>
  </body>
</html>
