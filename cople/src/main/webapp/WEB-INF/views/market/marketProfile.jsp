<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="profile-main">
	<div class="market-profile">
		<img src="${pageContext.request.contextPath}/member/viewProfile?mem_num=${mem_num}" width="150" height="150" class="my-photo">
		<h2> <span style="font-size:30px;"><c:if test="${empty memVO.nick_name}">${memVO.id}</c:if> <c:if test="${!empty memVO.nick_name}">${memVO.nick_name}</c:if></span> 님의 장터 프로필</h2>
		<div class="profile_category">
  			<span class="pcategory" onclick="location.href='marketProfile?pcategory=0&mem_num=${mem_num}'">내가 올린 상품</span>/<span class="pcategory" onclick="location.href='marketProfile?pcategory=1&mem_num=${mem_num}'">내가 판매한 상품</span>/<span class="pcategory" onclick="location.href='marketProfile?pcategory=2&mem_num=${mem_num}'">내가 구매한 상품</span>
  		</div>
	</div>
	<div class="profile-content">
		<c:if test="${!empty list}">
					<c:forEach var="list" items="${list}">
						<div class="profileListBox" onclick="location.href='detail?product_num=${list.product_num}'">
								<span class="profile_title">${list.product_title}</span> 
								<span class="profile_price"><fmt:formatNumber value="${list.product_price}" pattern="#,###" /> 원</span>
								<br>
								<b>판매자:</b><c:if test="${empty list.seller_nickname}">${list.seller_id}</c:if>
									 <c:if test="${!empty list.seller_nickname}">${list.seller_nickname}</c:if>
									 <img src="${pageContext.request.contextPath}/upload/${list.filename0}" width="55" height="55">
						</div>
					</c:forEach>
				</c:if>
				<c:if test="${empty list}">
					<div class="align-center" style="margin-top:50px;">조회된 글이 없습니다.</div>
				</c:if>
	</div>
</div>