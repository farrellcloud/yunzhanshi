<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(function(){
		$(".menu a").eq(0).click(function(e){
			if(typeof(selectCategory) != "undefined") {
				var domId =  selectCategory.attr("id");
				var cateId = domId.substring(4);
				$(e.target).attr("href",$(e.target).attr("href") + "?cateId=" + cateId);
			}
		});
		
		$(".menu a").eq(1).click(function(e){
			var productId = '${product.id}';
			if(typeof(productId) == "undefined" || productId == ''){
				alert("请选择要删除的项目");
				return false;
			}
			if(typeof(selectCategory) != "undefined") {
				var domId =  selectCategory.attr("id");
				var cateId = domId.substring(4);
				$(e.target).attr("href",$(e.target).attr("href") + "?cateId=" + cateId);
			}
		});
	});
</script>
<!--头部开始-->
<div id="topbar">
  <ul>
    <li>欢迎光临数字模创</li>
    <li class="f_right"><a href="#">网站首页</a><a href="#">加盟合作</a><a href="#">关于我们</a> </li>
  </ul>
</div>
<!---->
<header> <a href="#" class="logo"></a>
  <div class="u_center"> <strong class="icon iconfont">&#xe624;</strong><span>${ADMINUSER.username }</span><span><a href="<c:url value='/admin/exit'></c:url>">[退出]</a></span></div>
</header>
<!---->
<section class="title">
  <div class="manage_t"><strong class="icon iconfont">&#xe61b;</strong>项目管理</div>
  <ul class="menu">
    <li><strong class="icon iconfont">&#xe61b;</strong><a href="<c:url value="/admin/product"></c:url>">新建项目</a></li>
    <li><strong class="icon iconfont">&#xe626;</strong><a href="<c:url value="/admin/removeProduct/${product.id}"></c:url>">删除项目</a></li>
    <li class="f_right"><strong class="icon iconfont">&#xe622;</strong><a href="<c:url value='/admin/account'></c:url>">账户设置</a></li>
  </ul>
</section>
<!--头部结束-->
