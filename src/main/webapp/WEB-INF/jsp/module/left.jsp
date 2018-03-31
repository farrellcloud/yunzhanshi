<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
	var selectCategory;
	$(function(){
		var productId = '${product.id}';
		var baseRemoveUrl = '<c:url value="/admin/removeCategory/"/>';
		if( productId != ''){
			$("#pro" + productId).parent().delay(400).slideDown(700);
			$("#pro" + productId).parent().prev("h1").addClass("one");
			$("#pro" + productId).addClass('chosen');
			selectCategory = $("#pro" + productId).parent().prev("h1");
		}
		var categoryId = '${category.id }';
		if( categoryId != ''){
			$("#cate" + categoryId).next(".submenu").delay(400).slideDown(700);
			$("#cate" + categoryId).addClass("one");
			selectCategory = $("#cate" + categoryId);
		}
		$("#cz_btn a").eq(1).bind("click",function(e){
			if(typeof(selectCategory) == "undefined") {
				alert("请现选中分类");
				return;
			}
			var domId =  selectCategory.attr("id");
			var cateId = domId.substring(4);
			$(e.target).attr("href",$(e.target).attr("href") + "/" + cateId);
		})
		
		$("#cz_btn li").eq(2).click(function(e){
			if(typeof(selectCategory) == "undefined") {
				alert("请现选中分类");
				return;
			}
			var li_length = selectCategory.next(".submenu").find("li").length;
			if(li_length != 0){
				alert("该分类下有项目不能删除");
				return;
			}
			var domId =  selectCategory.attr("id");
			var cateId = domId.substring(4);
			var result = confirm("确定要删除该分类么？")
			if ( result == true){
				$.ajax({
				   type: "POST",
				   url: baseRemoveUrl + cateId,
				   success: function(msg){
					   var obj = jQuery.parseJSON(msg);
					   if(obj.returnValue){
						   selectCategory.next(".submenu").remove();
						   selectCategory.remove();
					   }else{
						   alert("该分类下有项目不能删除");
					   }
				   }
				});
			}else{
				
			}
		});
	});
</script>	
<aside>
	<!---->
	<div class="mainmenu">
		<c:forEach items="${categorys }" var="category">
			<h1 id="cate${category.id }">
				<strong class="icon iconfont">&#xe623;</strong><span>${category.cateName }</span>
			</h1>
			<ul class="submenu">
				<c:forEach items="${category.products }" var="product">
					<li id="pro${product.id}"><a href="<c:url value='/admin/product/${product.id}'/>" ><span>&#8250;${product.productName}</span></a></li>
				</c:forEach>
			</ul>
		</c:forEach>
	</div>
	<!---->
	<div class="h_40px"></div>
	<!---->
	<ul id="cz_btn">
		<li><strong class="icon iconfont">&#xe61b;</strong><a href="<c:url value='/admin/category'/>">新建类别</a></li>
		<li><strong class="icon iconfont">&#xe62a;</strong><a href="<c:url value='/admin/category'/>">修改类别</a></li>
		<li style="cursor: pointer;"><strong class="icon iconfont">&#xe631;</strong><a>删除类别</a></li>
	</ul>
	<!---->
</aside>


