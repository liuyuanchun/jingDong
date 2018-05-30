<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>个人注册</title>
    
 <script src="bootstrap/js/jquery.min.js" type="text/javascript"></script>
 <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
 <link href="css/registerStyle.css" type = "text/css" rel="stylesheet"/>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<script type="text/javascript">
$(document).ready(function(){
	$(".qiye,.yqiye").hover(function(){
		$(this).removeClass("out");
		$(this).addClass("over");
	},
	function(){
		$(this).removeClass("over");
		$(this).addClass("out");
	});
	$("#img").click(function(){
		$(this).prop("src","getRandom?"+Math.random());
	});
	$("[name=qpassword]").blur(function(){
		var qpwd=$(this).val();
		var pwd=$("[name=password]").val();
		if(qpwd!=pwd){
			alert("两次输入的密码不一致");
			$(this).val("");
			$("[name=password]").val("");
		}
	});
	$("[name=yanzheng]").blur(function(){
		$.ajax({
			type:"post",
			url:"testRandom",
			data:"text="+$("[name=yanzheng]").val(),
			dataType:"text",
			success:function(data){
				if(data!="success"){
					alert(data);
					$("[name=yanzheng]").val("");
				}
			}
		});
	});
	
	$("form").submit(function(){
		var user = $("[name=username]").val();
		var pwd = $("[name=password]").val();
		var tel = $("[name=telphone]").val();
		var yanzheng = $("[name=yanzheng]").val();
		var telyanzheng = $("[name=telyanzheng]").val();
		if(user==""){
			alert("请输入用户名");
			return false;
		}
		if(pwd==""){
			alert("请输入密码");
			return false;
		}
		if(tel==""){
			alert("请输入手机号");
			return false;
		}
		if(telyanzheng==""){
			alert("请输入手机验证码");
			return false;
		}
		return true;
	});
});
</script>
<style type="text/css">
.over{
	cursor:pointer;
	font-weight:bold;
}
.out{
	cursor:default;
}
</style>
  </head>
  
  <body>
    <div id="main">
	    <div id="header">
	    	<div id="log"></div>
	    	<div id="huangyingzhuce">欢迎注册</div>
	    	<div id="denglu">已有账号？&nbsp;<a href="login" style="cursor:pointer;color:red;text-decoration:none;">请登录</a></div>
	    </div>
	    <div id="content">
		    <div id="dianji">
		    	<form id="from" action="login" method="post">
		    		<div class="zhucekuang" style="margin-top:0px;">
		    			<div id="user">
		    				<div>
		    					<label class="col-sm-3 control-label">用&nbsp;&nbsp;&nbsp;户&nbsp;&nbsp;&nbsp;名</label>
		    					<div class="col-sm-8">
		    					<input type="text" name="username" class="input" placeholder="您的用户名和登录名"/>
		    					</div>
		    				</div>
		    			</div>
		    		</div>
		    		<div class="zhucekuang">
		    			<div id="password">
		    				<div>
			    				<label class="col-sm-3 control-label">设&nbsp;置&nbsp;密&nbsp;码</label>
			    				<div class="col-sm-8">
			    				<input type="password" name="password" class="input" placeholder="建议至少使用两种字符组合"/>
			    				</div>
		    				</div>
		    			</div>
		    		</div>
		    		<div class="zhucekuang">
		    			<div id="qpassword">
		    				<div>
		    				<label class="col-sm-3 control-label">确&nbsp;认&nbsp;密&nbsp;码</label>
		    				<div class="col-sm-8">
		    				<input type="password" name="qpassword" class="input" placeholder="请再次输入密码"/>
		    				</div>
		    				</div>
		    			</div>
		    		</div>
		    		<div class="zhucekuang">
		    			<div id="phone">
		    				<div>
		    				<label class="col-sm-3 control-label">中国&nbsp;0086</label>
		    				<div class="col-sm-8">
		    				<input type="text" name="telphone" class="input" placeholder="建议使用常用手机" /></div>
		    				</div>
		    			</div>
		    		</div>
		    		<div class="zhucekuang">
		    			<div id="yanzhengma">
		    				<div>
			    				<label class="col-sm-3 control-label">验&nbsp;&nbsp;证&nbsp;&nbsp;码</label>
			    				<div class="col-sm-5">
			    				<input type="password" name="yanzheng" class="input" placeholder="请输入验证码"/></div>
			    				<div class="col-sm-4">
			    					<img id="img" style="width:134px; height:50px;" src="getRandom">
			    				</div>
		    				</div>
		    			</div>
		    		</div>
		    		<div class="zhucekuang">
		    			<div id="phoneyanzheng">
		    				<div>
			    				<label class="col-sm-3 control-label">手机验证码</label>
			    				<div class="col-sm-5">
			    				<input type="text" name="telyanzheng"  class="input" placeholder="请输入手机验证码"/>
			    				</div>
			    				<button class="col-sm-4" id="getTelRandom">获取验证码</button>
		    				</div>
		    				
		    			</div>
		    		</div>
		    		<div style="width:400px;height:50px;margin-left:50px;line-height:50px;">
		    		<input type="checkbox" checked/>阅读并同意<a style="text-decoration:none;cursor:pointer;">《京东用户注册协议》</a>&nbsp;
		    		<a style="text-decoration:none;cursor:pointer;">《隐私政策》</a>
		    		</div>
		    		<input type="submit" class="zhucekuang" style="border:none;background-color:red;font-size:20px;
		    		margin-top:10px;text-align:center" value="立即注册"/>
		    	</form>
		    </div>
		    <div id="about">
		    	<div class="qiye">
			    	<div id=tubiao1></div>
			    	<div id="qiyeyonghu" style="line-height:45px;">企业用户注册</div>
		    	</div>
		    	<div class="yqiye" style="border-top:1px #666 solid;margin-top:20px;height:55px;">
			    	<div id="tubiao2"></div>
			    	<div id="yqiyeyonghu">INTERNATIONAL<br/>CUSTOMERS</div>
		    	</div>
		    </div>
	    </div>
	    
	    <div id="footer">
	    	<div class="links" >
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
