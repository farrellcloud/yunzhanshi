<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/pagetag.jsp"%>
<!doctype html>
<html>
<head>
<title>数字畅景</title>
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
<script src="<c:url value='/js/jquery-1.12.3.js'/>"></script>
<script src="<c:url value='/js/html5shiv.js'/>"></script>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/animate.min.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/IconFont/iconfont.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/defaut.css'/>">
<script type="text/javascript">
	function shownav_box() {
		$("#nav_box").toggle(500);
	}
	//隐藏遮罩层  
	function hidenav_box() {
		$("#nav_box").toggle(500);
	}
</script>
</head>

<body>
	<!---->
	<div id="topbar">
		<ul>
			<li>欢迎光临数字畅景</li>
			<li class="f_right"><a href="<c:url value='/'/>">网站首页</a><a
				href="#">加盟合作</a><a href="#">关于我们</a></li>
		</ul>
	</div>
	<!---->
	<!---->
	<header>
		<ul>
			<li><a href="#" class="logo"></a></li>
		</ul>
	</header>
	<!---->
	<nav>
		<ul>
			<li>
				<c:forEach var="category" items="${categorys }" end="8" varStatus="status">
					<c:choose>
						<c:when test="${(cateId == null && status.index == 0) || cateId == category.id}">
							<a href="javascript:void(0);" class="title">${category.cateName}</a>
						</c:when>
						<c:otherwise>
							<a href="<c:url value='/category/${category.id }'/>">${category.cateName}</a>
						</c:otherwise>
					</c:choose>
						
				</c:forEach>
				<span class="icon iconfont m_category" onClick="shownav_box()">&#xe63b;</span>
				<div id="nav_box" onClick="hidenav_box()">
					<c:forEach var="category" items="${categorys }">
						<a href="<c:url value='/category/${category.id }'/>">${category.cateName}</a>
					</c:forEach>
				</div>
			</li>
		</ul>
	</nav>
	<!---->
	<section class="banner"></section>
	<!---->
	<section class="list">
		<!---->
		<h1>精品展示</h1>
		<!---->
		<!---->
		<ul class="pic">
			<c:forEach var="product" items="${categorys[index].products }">
				<li>
					<figure>
						<a href="<c:url value='/show/${product.productName }'/>" title="点击查看三维展示模型" target="_black"><img src="${imageURL}${product.thumbImage}"
							alt="${product.title }" /></a>
					</figure> <a href="<c:url value='/show/${product.productName }'/>" title="点击查看三维展示模型" target="_black">${product.title }</a>
				</li>
			</c:forEach>
		</ul>
		<!---->
	</section>
	<!---->
	<footer>
		<ul>
			<li><a href="#">服务条款</a>| <a href="#"> 联系我们</a> | <a href="#">关于我们</a></li>
			<li>Copyright (C) 2016 数字模创 沪ICP：5365894号</li>
		</ul>
	</footer>
	<!---->
</body>
</html>

