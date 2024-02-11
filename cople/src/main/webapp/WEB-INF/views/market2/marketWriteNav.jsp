<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<div class="sc-dfVpRl fxYqEy">
	<div class="sc-gzOgki ciqSeg">
		<div class="sc-iyvyFf kPWKwK">
			<a class="sc-hwwEjo bNjUuQ" href="#">
				<img src="${pageContext.request.contextPath}/images/logo_market.png" style="width:136px; height:40;" alt="코딩허브 로고">
			</a>
			<div class="sc-jKJlTe keyjxL">
				<form action="list" id="search_form"  method="get">
				<div class="sc-eNQAEJ voMyM">
					<input type="search" placeholder="상품명, 내용 입력" maxlength="40" class="sc-hMqMXs cLfdog"  name="market_keyword"  id="market_keyword" style="padding: -0.5rem .75rem;">
					<a class="sc-kEYyzF gfWKdx" id="submit-btn" type="submit">
						<img src="${pageContext.request.contextPath}/images/search_icon.png" width="16" height="16" alt="검색 버튼 아이콘">
					</a>
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
			</div>							
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
			<div style="display: flex; align-items: center; gap: 4px;"></div>
		</div>
	</div>
</div>
	
