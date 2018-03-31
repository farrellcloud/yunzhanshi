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
<script src="<c:url value='/admin/js/jquery-1.12.3.js'/>"></script>
<script src="<c:url value='/admin/js/html5shiv.js'/>"></script>
<script src="<c:url value='/admin/js/jquery.validate.min.js'/>"></script>
<script src="<c:url value='/admin/js/menu.js'/>"></script>
<script src="<c:url value='/admin/js/jquery-ui.min.js'/>"></script>
<script src="<c:url value='/admin/js/evol-colorpicker.min.js'/>"></script>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/admin/css/animate.min.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/admin/IconFont/iconfont.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/admin/css/user.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/admin/css/loader.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/admin/css/jquery-ui.min.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/admin/css/evol-colorpicker.css'/>">
<script type="text/javascript">
	$(function() {
		var product_step = '${product_step}';
		if(product_step == '1'){
			$("#list_b").show().siblings().hide();
			$("#step_2").addClass("one").siblings().removeClass("one");
		}else if(product_step == '2'){
			$("#list_c").show().siblings().hide();
			$("#step_3").addClass("one").siblings().removeClass("one");
		}
		
		$(".main .head").bind("click",function(e){
			if(e.target.tagName.toLowerCase() != "span") return;
			if($(e.target).index() > 0 && eval('${product == null}')){
				alert("请先完成基本设置");
				return;
			}
			$(e.target).addClass("one").siblings().removeClass("one");
			$("form").eq($(e.target).index()).show().siblings().hide();
		});
		
		$("#list_a").validate({
			submitHandler:function(form){
	            form.submit();
	        },
	        rules: {
	        	productName:{
	        		required: true,
	        		remote: {
                        url: '<c:url value="/admin/validatePN/"/>',
                        type: "post",
                        data: {
                        	productName: function () {
                                return $("#productName").val();//这个是取要验证的密码
                            },
                            productId:'${product.id}'
                        },
                        dataFilter: function (data) {//判断控制器返回的内容
                        	console.log(data);
                            if (data == "true") {
                                return true;
                            }
                            else {
                                return false;
                            }
                        }
                    }
	        	},
	        	cateId:"required",
	        	backgroundColor:"required",
	        	title:"required",
	        	keywords:"required",
	        	description:"required",
	        	fileName:"required",
	        	thumbFileName:"required"
	        },
	        messages: {
	        	productName: {
	        		required: "请输入项目名称！",
	                remote: "项目名称已注册！"
	            },
	        	cateId: "请选择类别",
	        	backgroundColor: "请输入背景颜色",
	        	title: "请输入标题",
	        	keywords: "请输入关键字",
	        	description: "请输入网站描述",
	        	fileName: "请选择上传文件",
	        	thumbFileName:"请选择缩略图"
	  	    },
			errorElement: "span"
		});
		
		$("#mask").height($(document).height());
		$("#mask").width($(document).width());
		
		$("input[name='backgroundColor']").colorpicker({
			color:'${product.backgroundColor}'
		});
	});
	
	function panEnd(obj){
		$("#list_b .f_ul li input").eq(0).val("X:" + obj.x);
		$("#list_b .f_ul li input").eq(1).val("Y:" + obj.y);
	}
</script>
</head>

<body>
	  <!---->
  <div id="mask" style="display:none;"></div>
  <div class="loaders" style="display:none;">
      <div class="loader">
         <div class="ball-spin-fade-loader">
           <div></div>
           <div></div>
           <div></div>
           <div></div>
           <div></div>
           <div></div>
           <div></div>
           <div></div>
         </div>
      </div>
  </div>  
  <!---->
	<%@include file="../module/top.jsp"%>
	<div class="main">
		<!---->
		<section>
			<!---->
			<%@include file="../module/left.jsp"%>
			<!---->
			<!---->
			<article>
				<!---->
				<div class="head">
					<span class="one" id="step_1">基本设置</span> <span id="step_2">视角设置</span>
					<span id="step_3">网址生成</span>
				</div>
				<!---->
				<div>
					<form id="list_a" action="<c:url value='/admin/doProduct'></c:url>" enctype="multipart/form-data" method="post" >
						<input type="hidden" name="token" value="${token}"/>
						<input type="hidden" value="${product.id}" name="productId">
						<ul class="f_ul">
							<li><strong>项目名称</strong> <input id="productName" type="text" name="productName" value="${product.productName}"><sf:errors path="productVO.productName" cssClass="error"></sf:errors></li>
							<li>
								<strong>选择类别</strong> 
								<select name="cateId">
									<c:forEach items="${categorys }" var="cate">
										<c:choose>
											<c:when test="${cate.id == product.cateId || cate.id == category.id}">
												<option value="${cate.id}" selected="selected">${cate.cateName}</option>											
											</c:when>
											<c:otherwise>
												<option value="${cate.id}">${cate.cateName}</option>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</select>
								<sf:errors path="productVO.cateId" cssClass="error"></sf:errors>
							</li>
							<li>
								<strong>选择显示方式</strong> 
								<select name="showType">
									<c:choose>
										<c:when test="${product.showType == 1}">
											<option value="1" selected="selected">全球</option>
										</c:when>
										<c:otherwise>
											<option value="1">全球</option>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${product.showType == 2}">
											<option value="2" selected="selected">半球</option>
										</c:when>
										<c:otherwise>
											<option value="2">半球</option>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${product.showType == 3}">
											<option value="3" selected="selected">1/4球</option>
										</c:when>
										<c:otherwise>
											<option value="3">1/4球</option>
										</c:otherwise>
									</c:choose>
								</select>
								<sf:errors path="productVO.cateId" cssClass="error"></sf:errors>
							</li>
							<li><strong>背景颜色</strong>
								<input type="text" name="backgroundColor">
								<sf:errors path="productVO.backgroundColor" cssClass="error"></sf:errors>
							</li>
							<li><strong>标题设置</strong> <input type="text" name="title" value="${product.title}"><sf:errors path="productVO.title" cssClass="error"></sf:errors></li>
							<li><strong>关键字设置</strong><textarea name="keywords">${product.keywords}</textarea><sf:errors path="productVO.keywords" cssClass="error"></sf:errors></li>
							<li><strong>网站描述</strong> <textarea name="description">${product.description}</textarea><sf:errors path="productVO.description" cssClass="error"></sf:errors></li>
							<li><strong>上传文件包</strong> <input type="text" id="textfield" value="${product.fileName}" name="fileName">
								<input type="button" class="filebtn" value="选择文件包"> <input name="compressedFile"
								type="file" class="fileo"
								onchange="document.getElementById('textfield').value=this.value">
								<sf:errors path="productVO.compressedFile" cssClass="error"></sf:errors>
							</li>
							<li><strong>上传缩略图</strong> <input type="text" id="thumbtextfield" value="${product.thumbImage}" name="thumbFileName">
								<input type="button" class="filebtn" value="选择缩略图"> <input name="thumbFile"
								type="file" class="fileo"
								onchange="document.getElementById('thumbtextfield').value=this.value">
								<sf:errors path="productVO.thumbFile" cssClass="error"></sf:errors>
							</li>
							<li>
								<p>注：打包上传文件包，大图名称为bigimages、小图名称为smallimages；两个文件夹打包在一起！</p>
							</li>
							<li><input class="sub_btn" type="submit" value="确定">
							</li>
						</ul>
					</form>
					<!---->
					<!---->
					<form id="list_b" action="<c:url value='/admin/setStartXY'></c:url>" method="post">
						<input type="hidden" name="token" value="${token}"/>
						<input type="hidden" value="${product.id}" name="productId">
						<ul class="f_ul">
							<li><strong>坐标</strong> <input type="text" class="w_input"
								value="X:${product.startX}" readonly="readonly" name="startX"> <input type="text" class="w_input m_l_10"
								value="Y:${product.startY}" readonly="readonly" name="startY"></li>
							<li>
								<strong>调整视角</strong> 
								<c:choose>
									<c:when test="${product != null}">
										<iframe class="iframe_c" src="/magic/admin/rehearse/${product.id}" scrolling="no"></iframe>
									</c:when>
									<c:otherwise>
										<iframe class="iframe_c" src="" scrolling="no"></iframe>
									</c:otherwise>
								</c:choose>
								
							</li>
							<li><input class="sub_btn" type="submit" value="确定">
							</li>
						</ul>
					</form>
					<!---->
					<!---->
					<form id="list_c">
						<ul class="f_ul">
							<li><strong>地址</strong> <input type="text"
								name="example_url" id="example_url" value="${url}">
								<input type="button" class="copy_url" value="复制网址"></li>
							<li><strong>二维码</strong>
								<figure class="erweima">
									<c:choose>
										<c:when test="${product != null}">
											<img src="<c:url value='/image/QRCode/${product.productName}'></c:url>" alt="">
										</c:when>
									</c:choose>
									
								</figure></li>
							<li>
								<p>使用手机App（比如微信）扫描下方二维码，可以直接在手机上查看模型，并分享给朋友。</p>
							</li>
						</ul>
					</form>
					<!---->
				</div>
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
