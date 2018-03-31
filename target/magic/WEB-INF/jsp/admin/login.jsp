<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/pagetag.jsp"%>
<!doctype html>
<html>
<head>
<title>数字模创</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="author" content="">
<meta name="viewport"
	content="width=device-width,minimum-scale=1,maximum-scale=5,user-scalable=no">
<meta name="format-detection" content="telephone=no">
<meta name="msapplication-tap-highlight" content="no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="0">
<script src="<c:url value='/admin/js/jquery-1.12.3.js'/>"></script>
<script src="<c:url value='/admin/js/html5shiv.js'/>"></script>
<script src="<c:url value='/admin/js/jquery.validate.min.js'/>"></script>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/admin/css/animate.min.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/admin/css/user.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/admin/IconFont/iconfont.css'/>">
<script type="text/javascript">
	$(function(){
		$(".login_box form").validate({
			submitHandler:function(form){
	            form.submit();
	        },
	        rules: {
	        	username:"required",
	        	password:"required"
	        },
	        messages: {
	        	username: "请输入用户名",
	        	password: "请输入密码"
	  	    },
	  	    errorPlacement: function(error, element) {
	  	    	$(element).parent().next().append(error);
			},
			errorElement: "p",
		});
	});
</script>
</head>

<body>
	<!---->
	<div id="topbar">
		<ul>
			<li>欢迎光临数字模创</li>
			<li class="f_right"><a href="#">网站首页</a><a href="#">加盟合作</a><a
				href="#">网站首页</a><a href="#">关于我们</a></li>
		</ul>
	</div>
	<!---->
	<section class="logo"></section>
	<!---->
	<section class="login_box">
		<form action="<c:url value='/admin/doLogin'></c:url>" method="post">
			<input type="hidden" name="token" value="${token}"/>
			<h1>用户登录</h1>
			<ul>
				<li><strong class="icon iconfont">&#xe624;</strong> <input
					type="text" class="input_text" placeholder="请输入用户名" name="username"></li>
				<li>
					<sf:errors path="userVO.username" cssClass="error"></sf:errors>
				</li>
				<li><strong class="icon iconfont strong_t1">&#xe625;</strong> <input
					type="password" class="input_text" placeholder="请输入密码" name="password"></li>
				<li>
					<sf:errors path="userVO.password" cssClass="error"></sf:errors>
				</li>
				<li><input type="submit" class="sub_btn" value="我要登录"></li>
			</ul>
		</form>
	</section>
	<!---->
	<footer style="margin-top:120px;">
		<ul>
			<li><a href="#">服务条款</a>| <a href="#"> 联系我们</a> | <a href="#">关于我们</a></li>
			<li>Copyright (C) 2016 数字模创 沪ICP：5365894号</li>
		</ul>
	</footer>
	<!---->
</body>
</html>

