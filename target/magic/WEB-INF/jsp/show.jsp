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
		var t = new RotateUtil("canvasDiv",{smallFolder:"smallimages",bigFolder:"bigimages",horizontalSize:72,verticalSize:72,startX:'${product.startX}',startY:'${product.startY}',showType:'${product.showType}'});
	});
</script>
</head>
<body onLoad="showmain()" style="background:${product.backgroundColor};">
	<!--遮罩背景开始-->
	<div id="main" class="main">
		<!---->
		<div id="mask"></div>
		<!---->
		<div id="aboutus">
			<h1>关于我们</h1>
			<p>关于数字模创</p>
			<span class="close_box" onClick="hideaboutus()">关闭窗口</span>
		</div>
		<!---->
		<!---->
		<div id="describe">
			<h1>简介描述</h1>
			<p>通高3.96米，含底座、树身、龙三部分。底座圈上三个拱形足如同树根，主干上三层树枝，均弯曲下垂，树枝尖端有花朵果实，其上均有立鸟，全树共九只鸟。主干侧有一身似绳索的残龙。这株铸造于3000年前的青铜神树，极为壮观，真可算是独树一帜，举世无双。</p>
			<span class="close_box" onClick="hidedescribe()">关闭窗口</span>
		</div>
		<!---->
		<div id="switch_bg">
			<ul>
				<li class="hei" onClick="showhei()">纯黑</li>
				<li class="ganlan" onClick="showganlan()">橄榄</li>
				<li class="zongse" onClick="showzongse()">棕色</li>
			</ul>
		</div>
		<!---->
		<!---->
		<div id="switch_music">
			<ul>
				<li class="icon iconfont music_1" onClick="showmusic_1()">高山流水</li>
				<li class="icon iconfont music_2" onClick="showmusic_2()">笛子独奏</li>
				<li class="icon iconfont music_3" onClick="closeusic()">关闭音乐</li>
			</ul>
		</div>
		<!--
  <div id="music_list">
    <audio src="images/gaoshan.mp3" autoplay="autoplay" loop="loop"></audio>
  </div>
  -->
		<!---->
		<div class="menu">
			<ul>
				<!-- <li onClick="showswitch_bg()"><span class="icon iconfont">&#xe614;</span><i>切换背景</i></li>
      <li onClick="showswitch_music()"><span class="icon iconfont">&#xe608;</span><i>音乐设置</i></li> -->
				<li onClick="showdescribe()"><span class="icon iconfont">&#xe61b;</span><i>描述</i></li>
				<li onClick="showaboutus()"><span class="icon iconfont">&#xe615;</span><i>关于我们</i></li>
			</ul>
		</div>
		<!---->
		<!---->
		<!---->
		<!--下面是放置图片的位置-->
		<div id="canvasDiv"></div>
		<!---->
	</div>
</body>
</html>
