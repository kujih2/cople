<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div id="root">
	<div class="app">
		<div class="sc-hGoxap bInodS">
			<div class="sc-dfVpRl fxYqEy">
				<div class="sc-gzOgki ciqSeg">
					<div class="sc-iyvyFf kPWKwK">
					
						<a class="sc-hwwEjo bNjUuQ" href="/">
							<img src="${pageContext.request.contextPath}/images/logo_market.png" style="width:136px; height:40;" alt="코딩허브 로고">
						</a>
						
						<form action="list" id="search_form"  method="get">
							<div class="sc-jKJlTe keyjxL">
								<div class="sc-eNQAEJ voMyM">
									<input type="search" placeholder="상품명, 내용 입력" maxlength="40" class="sc-hMqMXs cLfdog"  name="market_keyword"  id="market_keyword" style="padding: -0.5rem .75rem;">
									<a class="sc-kEYyzF gfWKdx" id="submit-btn" type="submit">
										<img src="${pageContext.request.contextPath}/images/search_icon.png" width="16" height="16" alt="검색 버튼 아이콘">
									</a>
								</div>
							</div>
						<div class="category-box" style="visibility:hidden;">
  							<c:if test="${category == 0}">
  								<span class="category0">중고 상품</span>/<span class="category1">나눔 상품</span>
  							</c:if>
  							<c:if test="${category == 1}">
  								<span class="category0" style="color:gray;font-weight:none">중고 상품</span>/<span class="category1" style="color:black;font-weight:bold">나눔 상품</span>
  							</c:if>
  								<input type="hidden" name="category" id="category" value="${category}">
  							</div>
						</form>
			
			
						<!-- 오른쪽 상단 버튼 -->							
						<div class="sc-esjQYD eqbkiv">
							<c:if test="${!empty user && user.id != market.seller_id}">
								<button class="sc-kIPQKe foChwP" onclick="location.href='marketChatRoom'">
									<img src="${pageContext.request.contextPath}/images/talk_icon.png" width="23" height="24" alt="허브톡버튼 이미지">허브톡
								</button>
							</c:if>
							<c:if test="${!empty user}">
								<button class="sc-eXEjpC BltZS" >
									<img src="${pageContext.request.contextPath}/member/photoView" width="23" height="24" alt="내상점버튼 이미지">
										<c:if test="${empty user.nick_name}">
											<p>${user.id}</p>
										</c:if>
										<c:if test="${!empty user.nick_name}">
											<p>${user.nick_name}</p>
										</c:if>
								</button>
							</c:if>
								<button class="sc-eXEjpC BltZS" onclick="location.href='write'">
									<img src="${pageContext.request.contextPath}/images/sell_icon.png" width="23" height="26" alt="판매하기버튼 이미지">판매하기
								</button>
						</div>
					</div>
					
					
					<div class="sc-kPVwWT gwGdGE">
					
						<div style="display: flex; align-items: center; gap: 4px;">
							<form action="list" id="search_form"  method="get">
							<div class="category-box">
  							<c:if test="${category == 0}">
  								<span class="category0">중고 상품</span>/<span class="category1">나눔 상품</span>
  							</c:if>
  							<c:if test="${category == 1}">
  								<span class="category0" style="color:gray;font-weight:none">중고 상품</span>/<span class="category1" style="color:black;font-weight:bold">나눔 상품</span>
  							</c:if>
  								<input type="hidden" name="category" id="category" value="${category}">
  							</div>
							
							</form></div>
					</div>
				</div>




<div class="sc-ibxdXY bzAoPK">
</div>
</div>

</div>
<div class="sc-giadOv fanqbi">
<section class="styled__Wrapper-sc-1g9ugl4-0 dCIUug">
<h2>상품</h2>
	<c:if test="${!empty list}">
		<div class="styled__Wrapper-sc-32dn86-0 kSnlsd"">
		<c:forEach var="market" items="${list}">
				<div class="list-box" onclick="location.href='detail?product_num='+${market.product_num}">
					<div class="styled__Wrapper-sc-32dn86-0 kSnlsd">
				<input type="hidden" class="product_num" value="${market.product_num}">
				
					<div class="styled__ProductWrapper-sc-32dn86-1 eCFZgW">
						<a data-pid="243493400" target="_blank" rel="noopener noreferrer" class="sc-dEoRIm iizKix">
							<div class="sc-jtggT eSpfym">
								<img src="${pageContext.request.contextPath}/upload/${market.filename0}" width="194" height="194" alt="상품 이미지">
								<div class="styled__BadgeArea-sc-3zkh6z-0 dwFxLs">
								</div>
								<div class="sc-cooIXK gLQiSe">
								</div>
							</div>
							<div class="sc-ebFjAB ikEnr">
								<div class="sc-jKVCRD gwleiO">${market.product_title}</div>
									<div class="sc-LKuAh ldPLFl">
										<div class="sc-kaNhvL moVyh">
		<c:if test="${category == 0}">
			<fmt:formatNumber value="${market.product_price}" pattern="#,###" />원
		</c:if> 
	</div>
	<div class="sc-iBEsjs eYNXkt">
		<span>  
			<c:if test="${category == 1}">나눔</c:if> &nbsp;&nbsp;&nbsp;&nbsp;
			<c:if test="${empty market.seller_nickname}">${market.seller_id}</c:if>
			<c:if test="${!empty market.seller_nickname}">${market.seller_nickname}</c:if>
		</span>
		<span style="color:red;font-weight:bold;"><c:if test="${!empty market.product_sale && market.product_sale == 1}">판매 완료</c:if></span>
	</div>
	<c:if test="${status.index eq 3}">
					<br>
				</c:if>
	
</div>
</div>
</a>
</div>
</div>
<div>
</div>
</div>
		</c:forEach>
	
	</c:if>
</section>
</div>
</div></div>





<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>	
<script type="text/javascript">
$(function(){
	$('.category0').click(function(){
		$('#category').val(0);
		$(this).css({"font-weight": "bold", "color": "black"});
		$('.category1').css({"font-weight": "normal", "color": "gray"});
		$('#search_form').submit();
	});
	$('.category1').click(function(){
		$('#category').val(1);
		$(this).css({"font-weight": "bold", "color": "black"});
		$('.category0').css({"font-weight": "normal", "color": "gray"});
		$('#search_form').submit();
	});
	
	$('.list-box:gt(3)').each(function(index) {
	      $(this).after('<br>');
	    });
	//검색 유효성 체크
	$('#submit-btn').click(function(){
		if($('#market_keyword').val().trim()==''){
			alert('검색어를 입력하세요!');
			$('#market_keyword').val('').focus();
			return false;
		}
		$('#search_form').submit();
	});//end of submit
	
});
</script>
