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
<meta name="viewport" content="width=device-width,minimum-scale=1,maximum-scale=5,user-scalable=no">
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
<script src="<c:url value='/admin/js/menu.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<c:url value='/admin/css/animate.min.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/admin/IconFont/iconfont.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/admin/css/user.css'/>">
<script type="text/javascript">
	$(function(){
		$("#accountForm").validate({
			submitHandler:function(form){
	            form.submit();
	        },
	        rules: {
	        	password:"required"
	        },
	        messages: {
	        	password: "请输入密码"
	  	    },
			errorElement: "span"
		});
		
		setTimeout(function(){
			$(".f_ul span").fadeOut("slow");
		}, 3000);
	});
</script>
</head>

<body>
<%@include file="../module/top.jsp"%>
<div class="main"> 
  <!---->
  <section> 
    <!---->
    <%@include file="../module/left.jsp"%>
    <!----> 
    <!---->
    <article>
      <div class="head">
        <h1>账户设置</h1>
      </div>
      <form action="<c:url value='/admin/setAccount'></c:url>" method="post" id="accountForm">
		<input type="hidden" name="token" value="${token}"/>
        <ul class="f_ul">
          <li><strong>账户名称</strong>
            <input type="text" readonly="readonly" value="${ADMINUSER.username }" name="username">
          </li>
          <li><strong>密码</strong>
            <input type="password" name="password">
            <sf:errors path="userVO.password" cssClass="error"></sf:errors>
          </li>
          <li>
            <input class="sub_btn" type="submit" value="确定">
          </li>
        </ul>
      </form>
    </article>
    <!----> 
    
  </section>
  <!----> 
</div>

<!---->
<%@include file="../module/foot.jsp"%>
<!---->
</body>
</html>
