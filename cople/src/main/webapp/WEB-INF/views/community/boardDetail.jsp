<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 내용 시작 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/videoAdapter.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/SHH/community.fav.js"></script>
<div class="page-main">
	<h1><a href="boardList">자유게시판</a></h1>
	<hr size="1" width="100%">
	<ul class="detail-info">
		<li>
			<img src="${pageContext.request.contextPath}/member/viewProfile?mem_num=${board.mem_num}" width="40" height="40" class="my-photo">
		</li>
		<li>
			<c:if test="${empty board.nick_name}">${board.id}</c:if>
			<c:if test="${!empty board.nick_name}">${board.nick_name}</c:if>
			<c:if test="${board.auth == 1}">유저</c:if>
			<c:if test="${board.auth == 2}">현직자</c:if>
			<c:if test="${board.auth == 9}">관리자</c:if>
			<br>
			<c:if test="${!empty board.modify_date}">
			최근 수정일 : ${board.modify_date}
			</c:if>
			<c:if test="${empty board.modify_date}">
			작성일 : ${board.reg_date}
			</c:if>
			조회 : ${board.hit}
		</li>
	</ul>
	<h1>${board.title}</h1>
	<div class="detail-content">
		${board.content}
	</div>
	<div>
	<ul>
		<%-- 좋아요 싫어요 --%>
		<li>
			좋아요
			<img id="output_fav" class="favicon" data-num="${board.board_num}" data-favStatus="1"
				 src="${pageContext.request.contextPath}/images/fav.png" width="40">
			<span id="favCount"></span>	 
		</li>
		<li>
			싫어요
			<img id="output_hate" class="favicon" data-num="${board.board_num}" data-favStatus="2"
			src="${pageContext.request.contextPath}/images/hate.png" width="35">
			<span id="hateCount"></span>	
		</li>
	</ul>	
		<%-- 댓글수 --%>
		
	</div>
	<hr size="1" width="100%">
	<div class="align-right">
		<c:if test="${!empty user && user.mem_num == board.mem_num}">
		<input type="button" value="수정" onclick="location.href='boardUpdate?board_num=${board.board_num}'">
		<input type="button" value="삭제" id="delete_btn">
		<script type="text/javascript">
			let delete_btn = document.getElementById('delete_btn');
			delete_btn.onclick=function(){
				let choice = confirm('삭제하시겠습니까?');
				if(choice){
					location.href='boardDelete?board_num=${board.board_num}'; 		
				}
			};
		</script>
		</c:if>
	</div>
	<hr size="1" width="100%">
	<!-- 댓글 시작 -->
	
	<!-- 댓글 목록 출력 -->
	
	<!-- 댓글 목록 끝 -->
	
	<!-- 댓글 끝 -->
</div>
<!-- 내용 끝 -->	