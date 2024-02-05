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
				
			</div>
		</li>
	</ul>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>