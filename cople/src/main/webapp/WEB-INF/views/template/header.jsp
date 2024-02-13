<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 상단시작 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
<script>
document.addEventListener('DOMContentLoaded', function() {
    var totalSearchBox = document.getElementById('total_search_box');
    if (totalSearchBox) {
        totalSearchBox.addEventListener('keydown', function(event) {
            if (event.keyCode === 13) {
                event.preventDefault();
                window.location.href = '/wiki/detail?doc_name=' + totalSearchBox.value;
            }
        });
    }
    document.getElementById('total_search_box_btn').onclick = function() {
        var totalSearchBox = document.getElementById('total_search_box');
        if (totalSearchBox) {
            window.location.href = '/wiki/detail?doc_name=' + totalSearchBox.value;
        }
    };
    
});
</script>
<div id="header">
	<div id="header_nav_logo">
			<a href="${pageContext.request.contextPath}/main/main2">
				<span style="display:none;">Coding hub</span>
				<img id="logo" src="${pageContext.request.contextPath}/images/logo.png" alt="CodingHub Logo">
			</a>
	</div>
	<div id="header_nav_menu">
		<ul>
			<li><a href="${pageContext.request.contextPath}/wiki/detail?doc_num=82">위키</a></li>
			<li><a href="${pageContext.request.contextPath}/community/boardList">자유게시판</a></li>
			<li><a href="${pageContext.request.contextPath}/market/list?category=0">장터</a></li>
			<li><a href="${pageContext.request.contextPath}/matching/mmain">취업현황</a></li>
		</ul>
	</div>
	<div id="header_nav_search">
		<div>
			<input id="total_search_box" type="text">
			<button id="total_search_box_btn">	
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
				  <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
				</svg>
			</button>
		</div>
	</div>
	<div id="header_nav_user">
		<ul>
			<c:if test="${!empty user}">
				<li><a href="${pageContext.request.contextPath}/member/logout"><svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="#9CA3AF" class="bi bi-box-arrow-right" viewBox="0 0 16 16"><path fill-rule="evenodd" d="M10 12.5a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v2a.5.5 0 0 0 1 0v-2A1.5 1.5 0 0 0 9.5 2h-8A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-2a.5.5 0 0 0-1 0v2z"/><path fill-rule="evenodd" d="M15.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 0 0-.708.708L14.293 7.5H5.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z"/></svg></a></li>	
				<li><a><svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="#9CA3AF" class="bi bi-bell" viewBox="0 0 16 16"><path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zM8 1.918l-.797.161A4.002 4.002 0 0 0 4 6c0 .628-.134 2.197-.459 3.742-.16.767-.376 1.566-.663 2.258h10.244c-.287-.692-.502-1.49-.663-2.258C12.134 8.197 12 6.628 12 6a4.002 4.002 0 0 0-3.203-3.92L8 1.917zM14.22 12c.223.447.481.801.78 1H1c.299-.199.557-.553.78-1C2.68 10.2 3 6.88 3 6c0-2.42 1.72-4.44 4.005-4.901a1 1 0 1 1 1.99 0A5.002 5.002 0 0 1 13 6c0 .88.32 4.2 1.22 6z"/></svg></a></li>
				<c:if test="${!empty user && user.auth ==9}">
				<li><a href="${pageContext.request.contextPath}/admin/adminMain">
					<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="#9CA3AF" class="bi bi-person-fill-gear" viewBox="0 0 16 16">
					  <path d="M11 5a3 3 0 1 1-6 0 3 3 0 0 1 6 0Zm-9 8c0 1 1 1 1 1h5.256A4.493 4.493 0 0 1 8 12.5a4.49 4.49 0 0 1 1.544-3.393C9.077 9.038 8.564 9 8 9c-5 0-6 3-6 4Zm9.886-3.54c.18-.613 1.048-.613 1.229 0l.043.148a.64.64 0 0 0 .921.382l.136-.074c.561-.306 1.175.308.87.869l-.075.136a.64.64 0 0 0 .382.92l.149.045c.612.18.612 1.048 0 1.229l-.15.043a.64.64 0 0 0-.38.921l.074.136c.305.561-.309 1.175-.87.87l-.136-.075a.64.64 0 0 0-.92.382l-.045.149c-.18.612-1.048.612-1.229 0l-.043-.15a.64.64 0 0 0-.921-.38l-.136.074c-.561.305-1.175-.309-.87-.87l.075-.136a.64.64 0 0 0-.382-.92l-.148-.045c-.613-.18-.613-1.048 0-1.229l.148-.043a.64.64 0 0 0 .382-.921l-.074-.136c-.306-.561.308-1.175.869-.87l.136.075a.64.64 0 0 0 .92-.382l.045-.148ZM14 12.5a1.5 1.5 0 1 0-3 0 1.5 1.5 0 0 0 3 0Z"/>
					</svg>
				</a></li>
			</c:if>	
				<li><img id="my_page" width="50" height="50" src="${pageContext.request.contextPath}/member/photoView" onclick="window.location.href='${pageContext.request.contextPath}/member/myPage';" class="my-photo"></li>
			</c:if>		
			<c:if test="${empty user}">
				<li><div id="register_btn"><a href="${pageContext.request.contextPath}/member/registerSelect">회원가입</a></div></li>
				<li><div id="login_btn"><a href="${pageContext.request.contextPath}/member/login">로그인</a></div></li>
			</c:if>
			
		</ul>
	</div>
	
		


</div>
<!-- 상단끝 -->