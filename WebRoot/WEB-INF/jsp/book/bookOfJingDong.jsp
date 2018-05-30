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
    
    <title>商品详情 </title>
    
<script src="bootstrap/js/jquery.min.js" type="text/javascript"></script>
<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
 <link href="css/bookxqStyle.css" type = "text/css" rel="stylesheet"/>
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
 <%
 	Product book = (Product)request.getAttribute("proxq");
 %>
<script>
$().ready(function(e) {
	var proId = $("[name='jia']").parent().parent().data("proid");
	var nums = 1;
	var count=0;
	$("[name='jia']").click(function(){
		nums = $("[name=nums]").val();	
		nums++;
		if(nums > <%=book.getNum()%>){
			alert("输入商品的数量超过限制");
			nums = <%=book.getNum()%>;
		}
		$("[name=nums]").val(nums);
	});
	$("[name='jian']").click(function(){
		nums = $("[name=nums]").val();	
		nums--;
		if(nums<0){
			nums=0;
		}
		$("[name=nums]").val(nums);
	});
	function counts(){
		count = <%=book.getPrice()%>*nums;
		count = count.toFixed(2)*1;
	}
  /*   $(".d52624").click(function(){
    	if(nums==0){
    		alert("请输入商品的数量");
    	}else{
    	    counts();
			$(location).prop("href","addToCart?proId="+proId+"&nums="+nums+"&count="+count);	    	
    	}
	});  */
	function clearMes(){
	   $("#d52625").html("");
	}
	  $(".d52624").click(function(){
	 	if(nums==0){
    		alert("请输入商品的数量");
    	}else{
    	    counts();
			$.ajax({
				type:"post",
				url:"addToCart",
				data:"proId="+proId+"&nums="+nums+"&count="+count,
				dataType:"text",
				success:function(data){
					if(data=="noLogin"){
						alert("请先登录呀");
						window.location.href="showLogin";
					}else{}
					$("#d52625").html(data);
					setTimeout(clearMes,1000);
				}
			});	    	
    	}
	 }); 
	
});
</script>
  </head>
  
  <body>
 
    <div style="margin:1px auto;width:1366px;height:600px;background-color:#F6F6F6">
    <div id="header" class="row">
           <iframe src="header" scrolling="no" frameborder="0" 
			name="header" class="col-sm-12"></iframe>
    </div>
  <div id="d5" style="">
    <div id="d51" >
      <ul class="menueu3">
        <li style="font-weight:blod;font-size:18px;width: 40px;">图书</li>
        <li>></li>
        <li>经济</li>
        <li>></li>
        <li>通俗读物</li>
        <li>></li>
        <li>中信出版</li>
        <li>></li>
        <li style="width:200px"><%=book.getName() %></li>
      </ul>
    </div>
    <div id="d52">
      <div class="d521">
       <%String picture ="default.jpg";
        if(book.getPicture() != null){
        	if(book.getPicture() !=""){
        		picture = book.getPicture(); 
        	}
        } %>
        <div class="d5211" ><img style="width:200px;height:200px;margin-top:50px;" src="images/<%=picture %>"/> </div>
        <div class="d5212">
          <div class="d52121"><img src="images/xiaobook2.jpg"/></div>
          <div class="d52122"><img src="images/xiaobook1.jpg"></div>
        </div>
      </div>
      <div class="d522">
        <p style="font-weight:bold;font-family: '黑体';font-size:13px"><%=book.getContent() %></p>
        <p style="color:red;font-size:14px;margin-top:-5px;">京东图书馆勋章日！50万图书满100元折上七折！5.8-5.14每天10点限量抢200减80勋章用户专享券！<a href="http://www.baidu.com">立即查看活动></a></p>
        <p>
        <ul class="menueu4">
         
          <li> <a href="http://www.baidu.com">马化腾</a></li>
          <li> <a href="http://www.baidu.com">孟昭莉</a></li>
          <li> <a href="http://www.baidu.com">闫德利</a></li>
          <li> <a href="http://www.baidu.com">王花蕾</a></li>
          <li> 等等</li>
          
          <li style="width:20px;">著;</li>
           
          <li><a href="http://www.baidu.com">郭凯天</a></li>
          <li style="width:30px;"><a href="http://www.baidu.com">司晓</a></li>
          <li style="width:30px;">主编;</li>
          <li style="width:65px;"><a href="http://www.baidu.com">腾讯研究院</a></li>
          <li style="width:30px;">出品</li>
          
          <li style="width:20px;">编</li>
        </ul>
        </p>
      </div>
      <div class="d523">
        <p style="line-height:25px;position:absolute;top:10px;width:520px; height:25px;border-right:1px #E6E6E6 solid;margin-top:0px;">京&nbsp;东&nbsp;价:&nbsp;<span style="color:red;font-size:20px;font-family:'黑体';font-weight:bold">￥<%=book.getPrice() %></span>[7.5]折&nbsp;<span style="color:#969696">[定价:<span style="text-decoration:line-through">58.00</span>]</span>(降价通知)>
        <div class="d5231">累计评价<a href="http://www.baidu.com" style="color:#005EA7;font-size:16px;text-decoration:none">1.3万+</a></div>
        </p>
        <p style="line-height:25px;position:absolute;top:25px;width:520px; height:25px;margin-top:5px;">促销信息:&nbsp;<span style="color:#FFF;width:30px;height:10px;background-color:#E4393C">满减</span>&nbsp;<span style="color:red">满100.00元，可减30.00%</span>&nbsp;&nbsp;详情></p>
        <p style="line-height:25px;position:absolute;top:46px;width:520px; height:25px;margin-top:5px;">领&nbsp;&nbsp;&nbsp;&nbsp;券:&nbsp;<span style="width:80;height:15px;color:#FFF;background-color:#EB676A">满105减6</span></p>
      </div>
      <div class="d524">
        <p style="line-height:35px;">支&nbsp;&nbsp;持:&nbsp;
        <div class="d5241">
          <div class="d52411"></div>
          <div class="d52412">礼品包装</div>
        </div>
        </p>
        <p style="line-height:35px;">排&nbsp;&nbsp;名:&nbsp;自营&nbsp;经济销量榜&nbsp;第<span style="color:red">36</span>位</p>
        <p style="line-height:35px;">配送至:&nbsp;
        <div style="line-height:20px;position:absolute;top:115px;left:55px;height:20px;width:130px;border:1px solid #C8C8C8;font-family: '黑体';font-size:12px;">北京朝阳区三环以内&nbsp;&or;</div>
        <span style="position:absolute;top:115px;left:190px;"><span style="font-weight:blod;font-size:16px;font-family: '黑体';">有货</span>，支持</span>
        <div class="d5242">99元免基础运费</div>
        <div class="d5243">货到付款</div>
        
        <p style="line-height:35px;"> 服&nbsp;&nbsp;务:&nbsp;由<a href="showMain" >京东</a>发货，并提供售后服务。23:00前下单，预计<span style="font-weight:bold;">明天(05月12日)</span>送达 </p>
      </div>
      <div class="d525">
        <div class="d5251"></div>
        <div class="d5252">
          <div class="d52521">中信出版社</div>
          <div class="d52522">京东自营</div>
          <div class="d52523">进店逛逛</div>
          <div class="d52524">关注店铺</div>
          <div class="d52525">
            <div class="d525251" style="clear:both" >服务支持：</div>
            <div class="d525251" style="clear:both">京准达</div>
            <div class="d525251" >夜间配</div>
            <div class="d525251" >自提</div>
          </div>
        </div>
        <div class="d5253">
          <p>社科教育图书专营店&nbsp;&nbsp;&nbsp;<span style="color:#F00">￥40.60</span></p>
          <p>津黄腾飞图书专营店&nbsp;&nbsp;&nbsp;<span style="color:#F00">￥43.00</span></p>
        </div>
        <div class="d5254">
          <input id="maijia" type="button" value="联系全部卖家">
        </div>
      </div>
      <div class="d526">
        <div class="d5261">
          <div class="d52611" style="border-color:#FFF">选择系列:</div>
          <div class="d52611" style="left:90px;border-color:red">数字经济</div>
          <div class="d52611" style="left:180px">分享经济</div>
          <div class="d52611" style="left:270px">互联网</div>
        </div>
        <div class="d5262" data-proid="<%=book.getId() %>">
          <div class="d52621">
            <input type="text" name="nums" value="1" style="width:35px;height:33px;"/>
          </div>
          <div class="d52622">
            <input type="button" name="jia" value="+" style="width:18px;height:18px;"/>
          </div>
          <div class="d52623">
            <input type="button" name="jian" value="-" style="width:18px;height:18px;"/>
          </div>
          <div class="d52624" style="cursor:pointer;"></div>
          <div id="d52625"></div>
        </div>
      </div>
    </div>
  </div>
  <div> </div>
  <div id="d6">
    <div id="d61">
      <div class="d611">人气单品</div>
      <div class="d612"></div>
      <div class="d613">
        <div class="d6131">
          <div class="d61311"></div>
          <div class="d61312">智能革命：迎接人工智能时代的社会、经济与</div>
          <div class="d61313">￥51.00</div>
        </div>
        <div class="d6132">
          <div class="d61321"></div>
          <div class="d61322">高效的秘密</div>
          <div class="d61323">￥42.00</div>
        </div>
        <div class="d6133">
          <div class="d61331"></div>
          <div class="d61332">人工智能（李开复谈AI如何重塑个人、商业与社会的未来图谱）</div>
          <div class="d61333">￥40.40</div>
        </div>
        <div class="d6134">
          <div class="d61341"></div>
          <div class="d61342">上瘾：让用户养成使用习惯的四大产品逻辑</div>
          <div class="d61343">￥36.80</div>
        </div>
        <div class="d6135">
          <div class="d61351"></div>
          <div class="d61352">小米生态链战地笔记</div>
          <div class="d61353">￥44.80</div>
        </div>
        <div class="d6136">
          <div class="d61361"></div>
          <div class="d61362">腾讯传（1998-2016）</div>
          <div class="d61363">￥43.50</div>
        </div>
      </div>
    </div>
  </div>
 <div id="footer" class="row">
           <iframe src="footer" scrolling="no" frameborder="0" 
			name="footer" class="col-sm-12"></iframe>
    </div>
</div>
</body>
  </body>
</html>
