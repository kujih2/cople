<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 내용 시작 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/videoAdapter.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/SHH/community.fav.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/SHH/community.reply.js"></script>
<div class="page-detail">
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
			수정됨
			</c:if>
			<c:if test="${empty board.modify_date}">
			작성일 : ${board.reg_date}
			</c:if>
			<img src="${pageContext.request.contextPath}/images/commu_eye_1.png" width="20"> ${board.hit}
		</li>
	</ul>
	<h1>${board.title}</h1>
	<div class="detail-content">
		${board.content}
	</div>
	<div>
	<ul class="detail-info">
		<%-- 좋아요 싫어요 --%>
		<li>
			<img id="output_fav" class="favicon" data-num="${board.board_num}" data-favStatus="1"
				 src="${pageContext.request.contextPath}/images/fav.png" width="24">
		</li>
		<li>
			<span id="favHateSum"></span>
		</li>
		<li>
			<img id="output_hate" class="favicon" data-num="${board.board_num}" data-favStatus="2"
			src="${pageContext.request.contextPath}/images/hate.png" width="21">
		</li>
	</ul>
	</div>
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
	<ul>
		<%-- 댓글 + 대댓글 수 --%>
	</ul>
	<!-- 댓글 시작 -->
	<div id="reply_div">
		<span class="re-title">댓글 달기</span>
		<form id="re_form">
			<input type="hidden" name="board_num" 
			                value="${board.board_num}" id="board_num">
			<textarea rows="3" cols="50" name="re_content"
			    id="re_content" class="rep-content" 
			    <c:if test="${empty user}">disabled="disabled"</c:if>
			    ><c:if test="${empty user}">로그인해야 작성할 수 있습니다.</c:if></textarea>	
			<c:if test="${!empty user}">
			<div id="re_first">
				<span class="letter-count">300/300</span>
			</div>
			<div id="re_second" class="align-right">
				<input type="submit" value="전송">
			</div>
			</c:if>
		</form>
	</div>
	<!-- 댓글 목록 출력 시작 -->
	<div id="output"></div>
	<div class="paging-button" style="display:none;">
		<input type="button" value="더보기">
	</div>
	<div id="loading" style="display:none;">
		<img src="${pageContext.request.contextPath}/images/loading.gif"
		                                 width="100" height="100">
	</div>
	<!-- 댓글 목록 출력 끝 -->
	<!-- 댓글 끝 -->
</div>
<!-- 내용 끝 -->	