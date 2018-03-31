<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/pagetag.jsp"%>
<!doctype html>
<html>
<head>
<title>${product.title}</title>
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
<meta name="Keywords" content="${product.keywords}">
<meta name="Description" content="${product.description}">
<script src="<c:url value='/js/jquery-1.12.3.js'/>"></script>
<script src="<c:url value='/js/html5shiv.js'/>"></script>
<script src="<c:url value='/js/creaform.js'/>"></script>
<script src="<c:url value='/js/mc.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/animate.min.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/css/creaform.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/IconFont/iconfont.css'/>">
<script type="text/javascript">
	var fileName = '${product.fileName}';
	$(function(){
		function callBack(obj){
			parent.panEnd(obj);
		};
		var t = new RotateUtil("canvasDiv",{smallFolder:"smallimages",bigFolder:"bigimages",horizontalSize:72,verticalSize:72,startX:'${product.startX}',startY:'${product.startY}',createOperation:false,moveCallBack:callBack,showType:'${product.showType}'});
		
	});
</script>
</head>
<body onLoad="showmain()" style="background:${product.backgroundColor};">
	<!--遮罩背景开始-->
	<div id="main" class="main">
		<!--下面是放置图片的位置-->
		<div id="canvasDiv"></div>
	</div>
</body>
</html>
