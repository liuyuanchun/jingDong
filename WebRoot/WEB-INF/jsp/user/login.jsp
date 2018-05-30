<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>欢迎登录</title>
        
 <script src="bootstrap/js/jquery.min.js" type="text/javascript"></script>
 <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
 <link href="css/loginStyle.css" type = "text/css" rel="stylesheet"/>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />


  </head>
  
  <body>
     <div id="main">
	    <div id="header">
	    	<div id="log"></div>
	    	<div id="huangyingdenglu">欢迎登录</div>
	    	<div id="dengluyemian">
	    		<div id="huihua">
	    		</div><label style="float:left;line-height:20px;font-weight:10px;">登录页面，调查问卷</label>
	    	</div>
	    </div>
	     <div id="content">
		     <div id="login">
		     	<div style="width:250px;height:50px;margin-left:60px;border-bottom:1px solid #F6F6F6">
		     		<a class="zi" style="float:left;text-decoration:none;">扫码登录</a>
		     		<a class="zi" style="float:left;margin-left:50px;text-decoration:none;">账户登录</a>
		     	</div>
		     	<div id="login-box">
		     		<form action="doLogin" method="post">
		     			 <div class="login-box-in">
							<label class="col-sm-2" style="line-height:40px;width:40px;height:40px;background-image:url(images/pwd-icons-new.png);" ></label>
							<div class="col-sm-9">
								<input class="in" type="text" name="username" 
									 placeholder="邮箱/用户名/已验证手机" />
							</div>
						</div>
						<div class="login-box-in" >
							<label class="col-sm-2" style="line-height:40px;width:40px;height:40px;background-image:url(images/pwd-icons-new.png);
								background-position:-48px 0px;" ></label>
							<div class="col-sm-9">
								<input class="in" type="password" name="password" 
									 placeholder="请输入密码" />
							</div>
						</div>
						<div id="forgetPwd" style="width:100px;height:30px;margin-left:200px;text-align:right;line-height:30px;cursor:pointer"><a>忘记密码</a></div>
						<input type="submit" class="login-box-in" style="border:none;background-color:red;font-size:20px;
		    		margin-top:20px;margin-left:45px;text-align:center" value="登录"/>
					
		     		</form>
		     	</div>
		     	<div id="login-foot">
		     		<ul id="login-method">
		     			<li style="margin-top:10px;"> <a href="http://www.baidu.com">
		     				<ul style="list-style:none;float:left;">
		     					<li style="width:20px;height:18px;background-image:url(images/QQ-weixin.png);
									background-position:0px 0px;"></li>
		     					<li>
		     						QQ&nbsp;&nbsp;|
		     					</li>
		     				</ul></a>
		     			</li>
		     			<li style="margin-top:10px;"> <a href="http://www.baidu.com">
		     				<ul style="list-style:none;float:left;">
		     					<li style="width:20px;height:18px;background-image:url(images/QQ-weixin.png);
										background-position:20px 0px;"></li>
		     					<li>
		     						微信
		     					</li>
		     				</ul></a>
		     			</li>
		     			<li style="margin-top:10px;margin-left:100px;"> <a href="showRegister">
		     				<ul style="list-style:none;float:left;">
		     					<li style="width:20px;height:18px;background-image:url(images/pwd-icons-new.png);
										background-position:20px 100px;"></li>
		     					<li>
		     						立即注册
		     					</li>
		     				</ul></a>
		     			</li>
		     		</ul>
		     	</div>
		     </div>
	     
	     </div>
	     <div id="footer">
	    	<div class="links">
		    	<a style="text-decoration:none;">关于我们&nbsp;|</a>
		    	<a style="text-decoration:none;">联系我们&nbsp;|</a>
		    	<a style="text-decoration:none;">人才招聘&nbsp;|</a>
		    	<a style="text-decoration:none;">商家入驻&nbsp;|</a>
		    	<a style="text-decoration:none;">广告服务&nbsp;|</a>
		    	<a style="text-decoration:none;">手机京东&nbsp;|</a>
		    	<a style="text-decoration:none;">友情链接&nbsp;|</a>
		    	<a style="text-decoration:none;">销售联盟&nbsp;|</a>
		    	<a style="text-decoration:none;">京东社区&nbsp;|</a>
		    	<a style="text-decoration:none;">京东公益&nbsp;|</a>
		    	<a style="text-decoration:none;">English&nbsp;Site</a>
	    	</div>
	    	<div class="Copyright">
	    		 Copyright&copy;2004-2016&nbsp;&nbsp;京东JD.com&nbsp;版权所有
	    	</div>
	    </div>
	</div>
  </body>
</html>
