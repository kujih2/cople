<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="side-bar">
	<ul>
		<li>
			<div class="chat_profile">
			<c:if test="${!empty user}">
				<img src="${pageContext.request.contextPath}/member/photoView" width="50" height="50" class="my-photo">
				<c:if test="${empty user.nick_name}">
					<div>${user.id}<span>님의 채팅방</span></div>
				</c:if>
				<c:if test="${!empty user.nick_name}">
					<div>${user.nick_name}<span>님의 채팅방</span></div>
				</c:if>
			</c:if>
			</div>       
		</li>
	</ul>
	<ul>
		<li>
			<div class="chat_list">
				<c:if test="${!empty chatList}">
					<c:forEach var="chatList" items="${chatList}">
						<div class="chatListBox">
								<input type="hidden" class="chatRoomNum" value="${chatList.chatRoom_num}">
								<span class="chat_title">${chatList.product_title}</span> 
								<span class="chat_price"><fmt:formatNumber value="${chatList.product_price}" pattern="#,###" /> 원</span>
								<br>
								<b>판매자:</b><c:if test="${empty chatList.seller_nickname}">${chatList.seller_id}</c:if>
									 <c:if test="${!empty chatList.seller_nickname}">${chatList.seller_nickname}</c:if>
								<b>구매자:</b><c:if test="${empty chatList.buyer_nickname}">${chatList.buyer_id}</c:if>
									 <c:if test="${!empty chatList.buyer_nickname}">${chatList.buyer_nickname}</c:if>
									 <img src="${pageContext.request.contextPath}/upload/${chatList.filename0}" width="30" height="30">
									<div class="chat_count">${chatList.chat_count}</div>
									<div class="chat_delete">x</div>
								
						</div>
					</c:forEach>
				</c:if>
				<c:if test="${empty chatList}">
					<div class="align-center">채팅방이 없습니다.</div>
				</c:if>
			</div>
		</li>
	</ul>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
