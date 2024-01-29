<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			
		</c:if>
	</div>
		<ul class="search-ul">
			<li>
				<input type="search" name="market_keyword" id="market_keyword"
				                                  value="${param.keyword}">
				 <input type="submit" value="검색" class="market-search">
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
	
	<div class="market-list">
		<c:forEach var="market" items="${list}">
			<div>
				${market.product_title}
				
			</div>
		</c:forEach>
	</div>
	
	
	
	
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>	
<script type="text/javascript">
$(function(){
	$('.category0').click(function(){
		$('#category').val(0);
		$('.category0').css({"font-weight": "bold", "color": "black"});
		$('.category1').css({"font-weight": "normal", "color": "gray"});
		window.location.href="${pageContext.request.contextPath}/market/list?category=0";
	});
	$('.category1').click(function(){
		$('#category').val(1);
		$(this).css({"font-weight": "bold", "color": "black"});
		$('.category0').css({"font-weight": "normal", "color": "gray"});
		window.location.href="${pageContext.request.contextPath}/market/list?category=1";
	});
});
</script>
