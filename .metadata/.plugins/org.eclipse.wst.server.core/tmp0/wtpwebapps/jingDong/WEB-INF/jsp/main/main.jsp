<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'shouye.jsp' starting page</title>
    <script src="bootstrap/js/jquery.min.js" type="text/javascript"></script>
	<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<link href="css/shouYeStyle.css" type = "text/css" rel="stylesheet"/>
	<script>
$().ready(function(e) {
    var imgs=$("#slide li");
	var icons=$(".active li");
	imgs.hide();
	$("#left,#right").hide();
	imgs.eq(0).show();
	icons.eq(0).addClass("active");
	var i=0;
	function change(){
		i++;
		if(i==imgs.length){
			i=0;	
		}
		selected();	
	}
	function selected(){
		imgs.hide();
		imgs.eq(i).show();
		icons.removeClass("active");
		icons.eq(i).addClass("active");	
	}
	$("#d521").hover(function(){
		$("#left,#right").show();
		$("#d521").css("cursor","pointer");
		clearInterval(timer);
	},
	function(){
		$("#left,#right").hide();
		$("#d521").css("cursor","defualt");
		 timer=setInterval(change,2000);
	});
	$("#left").hover(function(){
		$("#left").css("background","#643B36");
		},function(){
		$("#left").css("background","#D1DCE6");
		});
	$("#right").hover(function(){
		$("#right").css("background","#643B36");
		},function(){
		$("#right").css("background","#D1DCE6");
		});
	icons.click(function(){
		i=$(this).index();
		selected();
		clearInterval(timer);
	});
	$("#left a").click(function(){
		i--;
		if(i<0){
			i=imgs.length-1;
		}
		selected();
		clearInterval(timer);	
	});
	$("#right a").click(function(){
		i++;
		if(i==imgs.length){
			i=0;;
		}
		selected();	
		clearInterval(timer);
	});
	var timer=setInterval(change,2000);
});
</script>
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
  </head>
  
  <body>
  <div style="margin:1px auto;width:1366px;height:600px;background-color:#F6F6F6">
   <div id="header" class="row">
           <iframe src="header" scrolling="no" frameborder="0" 
			name="header" class="col-sm-12"></iframe>
    </div>
   <div id="d5">
	<div id="d51">
    	<ul class="shangpin">
        	<li><a>家用电器</a></li>
            <li><a>手机</a>/<a>运营商</a>/<a>数码</a></li>
            <li><a>电脑</a>/<a>办公</a></li>
            <li><a>家居</a>/<a>家具</a>/<a>家装</a>/<a>厨具</a></li>
            <li><a>男装</a>/<a>女装</a>/<a>童装</a>/<a>内衣</a></li>
            <li><a>美妆个护</a>/<a>宠物</a></li>
   			<li><a>女鞋</a>/<a>箱包</a>/<a>钟表</a>/<a>珠宝</a></li>
 			<li><a>男鞋</a>/<a>运动</a>/<a>户外</a></li>
            <li><a>汽车</a>/<a>汽车用品</a></li>
            <li><a>母婴</a>/<a>玩具乐器</a></li>
            <li><a>食品</a>/<a>酒类</a>/<a>生鲜</a>/<a>特产</a></li>
            <li><a>医药保健</a>/<a>计生情趣</a></li>
            <li><a href="showType" style="text-decoration:none;color:#FFF;">图书</a>/<a>音像</a>/<a>电子书</a></li>
            <li><a>机票</a>/<a>酒店</a>/<a>旅游</a>/<a>生活</a></li>
            <li><a>理财</a>/<a>众筹</a>/<a>白条</a>/<a>保险</a></li>
        </ul>
    </div>
    <div id="d52">
    	<div id="d521" >
    		<ul id="slide">
        		<li><img src="images/jingdong1.jpg"/></li>
          	  <li><img src="images/jingdong2.jpg"/></li>
          	  <li><img src="images/jingdong3.jpg"/></li>
                <li><img src="images/jingdong4.jpg"/></li>
                <li><img src="images/jingdong5.jpg"/></li>
            </ul>
            <div id="left" style="left:0px;"><a>&lsaquo;<a></div>
            <div id="right" style="right:0px;"><a>&rsaquo;<a></div>
              <div id="icon">
    			<ul class="active">
    			  <li style="margin-left:-40px;"></li>
    			  <li style="margin-left:0px;"></li>
     			  <li></li>
     			  <li></li>
     			  <li></li>
   			 	</ul>
  			  </div>
        </div>
        <div class="d522">
        	<ul id="abouttupian">
            	<li style="margin-left:-40px"><img src="images/tupian1.jpg"/></li>
                <li><img src="images/tupian2.jpg"/></li>
            </ul>
        </div>
    </div>
    <div id="d53">
    	<div class="d531">
        	<div class="d5311"></div>
            <div class="d5312">
            	<div class="d53121">Hi，jd_4d0c140</div>
                <div class="d53122">
                	<div class="denglu"><a style="text-decoration:none;" href="showLogin">登陆</a></div>
                    <div class="zhuce"><a style="text-decoration:none;" href="showRegister">注册</a></div>
                </div>
            </div>
            <div class="d5313">
            	<div class="fuli">新人福利</div>
                <div class="huiyuan">PLUS会员</div>
            </div>
        </div>
        <div class="d532">
        	<div class="d5321">
            	<div class="cuxiao">促销</div>
                <div class="gonggao">公告</div>
                <div class="gengduo">更多</div>
            </div>
            <div class="d5322">
            	<ul id="u1">
                	<li >爆款秒杀 低至五折</li>
                	<li>京东健康母亲节关爱不打折</li>
               		<li>抢4999，爆款手机买1送1</li>
                    <li>母亲节，有爱就“购”了</li>
                </ul>
            </div>
        </div>
        <div class="d533">
        	<div class="d5331">
            	<ul id="u2">
                	<li style="color:#C03;border-top:2px solid #E01121;margin-left:-35px;">话费</li>
                    <li>机票</li>
                    <li>酒店</li>
                    <li>游戏</li>
                </ul>
            
            </div>
            <div class="d5332">
            	<ul id="u3">
                	<li style="margin-left:-35px;">话费充值</li>
                    <li>流量充值</li>
                    <li>套餐变更</li>
                </ul>
            </div>
            <div class="d5333">
            	<ul id="u4">
                	<li>号码:&nbsp;<input type="text" placeholder="移动/联通/电信" style="width:90px;height:20px; font-size:12px;color:#999">
                    </li>
                    <li style="width:190px;">面值:
                    <select value="100元" style="width:55px;height:20px;">
                    	<option>10元</option>
                        <option>20元</option>
                        <option>30元</option>
                        <option>50元</option>
                        <option>100元</option>
                        <option>200元</option>
                        <option>300元</option>
                        <option>500元</option>
                    </select>
                    <span style="font-size:12px;color:red;">￥98.0-￥100.0
                    </li>
                </ul>
            </div>
            <div class="d5334">快速充值</div>
            <div class="d5335">
            	<div class="hot"></div>
                <div class="qianghuafei">抢50元话费券</div>
            </div>
            
        </div>
    </div>
</div>
<div id="d6">
	<div id="d61">
    	<div class="jiao"></div>
        <div class="d612"></div>
        <div class="d613">京东秒杀</div>
        <div class="d614">总有你想不到的低价</div>
        <div class="d615"></div>
        <div class="d616">当前场次</div>
        <div class="d617">00</div>
        <div class="d618">:</div>
        <div class="d619">57</div>
        <div class="d6110">:</div>
        <div class="d6111">47</div>
        <div class="d6112">后结束抢购</div>
    </div>
</div>
<div id="d7">
	<div id="d71">
    	<div class="d711">
        	<ul id="u5">
            	<li>曹文轩</li>
                <li>DK</li>
                <li>超级战舰</li>
                <li>迪士尼</li>
                <li>凯迪克</li>
                <li>辅食</li>
            </ul>
        </div>
        <div class="d712">
        	<ul id="u6">
            	<li style="margin-top:0px;background-color:#9F7ADD"></li>
        		<li>热门读物</li>
            	<li>0-2岁</li>
            	<li>3-6岁</li>
            	<li>7-10岁</li>
            	<li>11-14岁</li>
            	<li>家教育儿</li>
        	</ul>
        </div>
        <div class="d713"></div>
	</div>
    <div id="d72">
    	<div class="d721"></div>
        <div class="d722"></div>
        <div class="d723"></div>
	</div>
    <div id="d73">
    	<ul id="u7">
        	<li>
            	<div class="tushutupian" style="background-image:url(images/qie.jpg);"></div>
                <div class="tushumiaoshu">海豚科学馆：动物妙想国（套装 全8册）</div>
                <div class="jiage">￥90.00&nbsp;&nbsp;&nbsp;<span style="color:#CCC;font-size:14px;text-decoration:line-through">￥144.00</span></div>
            </li>
            <li>
            	<div class="tushutupian" style="background-image:url(images/xiaohongdou.jpg);"></div>
                <div class="tushumiaoshu">小红豆系列（套装1-3卷）</div>
                <div class="jiage">￥33.00&nbsp;&nbsp;&nbsp;<span style="color:#CCC;font-size:14px;text-decoration:line-through">￥48.00</span></div>
            </li>
            <li>
            	<div class="tushutupian" style="background-image:url(images/xiaosongshu.jpg);"></div>
                <div class="tushumiaoshu">真正的蒙氏教育在家庭 蒙台梭利家庭教育解决方案（套装共4</div>
                <div class="jiage">￥144.00&nbsp;&nbsp;&nbsp;<span style="color:#CCC;font-size:14px;text-decoration:line-through">￥192.00</span></div>
            </li>
            <li>
            	<div class="tushutupian" style="background-image:url(images/xiaoxuesheng.jpg);"></div>
                <div class="tushumiaoshu">DK小学生百科全书 微观世界（精装版）（全彩）</div>
                <div class="jiage">￥98.80&nbsp;&nbsp;&nbsp;<span style="color:#CCC;font-size:14px;text-decoration:line-through">￥158.00</span></div>
            </li>
            <li>
            	<div class="tushutupian" style="background-image:url(images/xiaogou.jpg);"></div>
                <div class="tushumiaoshu">丽声妙想英文绘本 牛津阅读树 第一级至第四级套装(套装共4册 </div>
                <div class="jiage">￥133.30&nbsp;&nbsp;&nbsp;<span style="color:#CCC;font-size:14px;text-decoration:line-through">￥182.00</span></div>
            </li>
            <li>
            	<div class="tushutupian" style="background-image:url(images/wenxuan.jpg)"></div>
                <div class="tushumiaoshu">正版包邮 漫步到宇宙尽头 李然 继时间简史、人类简史后，媲美</div>
                <div class="jiage">￥33.00&nbsp;&nbsp;&nbsp;<span style="color:#CCC;font-size:14px;text-decoration:line-through">￥48.00</span></div>
            </li>
        </ul>
	</div>
</div>
 <div id="footer" class="row">
           <iframe src="footer" scrolling="no" frameborder="0" 
			name="footer" class="col-sm-12"></iframe>
    </div>
</div>
  </body>
</html>
