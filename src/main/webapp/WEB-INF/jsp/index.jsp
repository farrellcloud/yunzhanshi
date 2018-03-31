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
<meta name="viewport"	content="width=device-width,minimum-scale=1,maximum-scale=1,user-scalable=no">
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
</head>

<body>
<!---->
<div id="topbar">
  <ul>
    <li>欢迎光临数字畅景</li>
  </ul>
</div>
<!----> 
<!---->
<figure class="banner"> <img class="logo" src="<c:url value='/images/logo_index.png'/>" /> <img src="<c:url value='/images/h_bg.png'/>" width="100%" /> </figure>
<!---->
<div id="nav_box">
  <c:forEach var="category" items="${categorys }"> <a href="<c:url value='/category/${category.id }'/>">${category.cateName}</a> </c:forEach>
</div>
<!---->
<section class="list"> 
  <!---->
  <h1>${catename }</h1>
  <!----> 
  <!---->
  <ul class="pic">
    <c:forEach var="product" items="${categorys[index].products }">
      <li>
        <figure> <a href="<c:url value='/show/${product.productName }'/>" title="点击查看三维展示模型" target="_black"><img src="${imageURL}${product.thumbImage}"
							alt="${product.title }" /></a> </figure>
        <a href="<c:url value='/show/${product.productName }'/>" title="点击查看三维展示模型" target="_black">${product.title }</a> </li>
    </c:forEach>
  </ul>
  <!----> 
</section>
<!---->
<footer>
  <ul>
    <li>Copyright (C) 2016 数字畅景</li>
  </ul>
</footer>
<!---->
</body>
</html>