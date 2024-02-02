<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="page-main">
	<form action="list" id="search_form"  method="get">
	<div class="market-profile">
		<c:if test="${!empty user}">
			<img src="${pageContext.request.contextPath}/member/photoView" width="35" height="35" class="my-photo">
			<c:if test="${empty user.nick_name}">
				<p>${user.id}</p>
			</c:if>
			<c:if test="${!empty user.nick_name}">
				<p>${user.nick_name}</p>
			</c:if>
			<c:if test="${user.market_score > 30}">
				<span style=" color:blue; font-weight:bold;">${user.market_score}점 </span>
				<span class="score_desc">장터점수</span>
			</c:if>
			<c:if test="${user.market_score < 30}">
				<span style=" color:red; font-weight:bold;">${user.market_score}점 </span>
				<span class="score_desc">장터점수</span>
			</c:if>
		</c:if>
	</div>
		<ul class="search-ul">
			<li>
				<input type="search" name="market_keyword" id="market_keyword"
				                                  value="${param.market_keyword}" placeholder="제목 또는 내용을 검색해주세요." autocomplete='off'>
				 <input type="submit" id="submit-btn" value="검색" class="market-search">
			</li>
		</ul>
			<div class="write-button">
				<c:if test="${!empty user}">
				    <input type="button" value="글쓰기" onclick="location.href='write'">
				</c:if>
  			</div>
  		<div class="category-box">
  		<c:if test="${category == 0}">
  			<span class="category0">중고 상품</span>/<span class="category1">나눔 상품</span>
  		</c:if>
  		<c:if test="${category == 1}">
  			<span class="category0" style="color:gray;font-weight:none">중고 상품</span>/<span class="category1" style="color:black;font-weight:bold">나눔 상품</span>
  		</c:if>
  			<input type="hidden" name="category" id="category" value="${category}">
  		</div>
	</form>
	<hr width="100%">
	<div class="market-list">
	<c:if test="${!empty list}">
		<c:forEach var="market" items="${list}">
	
				<div class="list-box" onclick="location.href='detail?product_num='+${market.product_num}">
				<input type="hidden" class="product_num" value="${market.product_num}">
					<img src="${pageContext.request.contextPath}/upload/${market.filename0}" width="200" height="200">
					<br><span class="list-span1">${market.product_title}</span>
					<br><span class="list-span2"><c:if test="${category == 0}"><fmt:formatNumber value="${market.product_price}" pattern="#,###" />원</c:if> 
							  <c:if test="${category == 1}">나눔</c:if> &nbsp;&nbsp;&nbsp;&nbsp;
					<c:if test="${empty market.seller_nickname}">${market.seller_id}</c:if>
					<c:if test="${!empty market.seller_nickname}">${market.seller_nickname}</c:if>
					</span>
					<span style="color:red;font-weight:bold;"><c:if test="${!empty market.product_sale && market.product_sale == 1}">판매 완료</c:if></span>
				</div>
			
				<c:if test="${status.index eq 3}">
					<br>
				</c:if>
			</c:forEach>
	
	</c:if>

		<c:if test="${empty list}">
			<div class="align-center">
				<h3>상품이 존재하지 않습니다.</h3>
			</div>
		</c:if>
	</div>
	
	<div class="align-center">${page}</div>
	
	
</div>

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
