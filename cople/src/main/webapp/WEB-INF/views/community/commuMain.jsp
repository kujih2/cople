<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<div>
	<div id="main_notice">
		<h3><a href="${pageContext.request.contextPath}/community/boardNotice">공지사항</a></h3>
			<ul>
				<li>내용</li>
				<li>내용</li>
			</ul>
		<hr size="1" width="100%">
	</div>
	<div class="align-center">
		<div id="page_board">
			<h3><a href="${pageContext.request.contextPath}/community/boardList">자유게시판</a></h3>
				<c:if test="${count == 0}">
		<div class="result-display">표시할 게시물이 없습니다.</div>
	</c:if>
	<c:if test="${count > 0}">
		<ul>
			<li>
			<c:forEach var="board" items="${list}">
				<div class="board_list" >
					<div>
					<img src="${pageContext.request.contextPath}/member/viewProfile?mem_num=${board.mem_num}" width="25" height="25" class="my-photo">
					</div>
					<div>
						<c:if test="${empty board.nick_name}">${board.id}</c:if>
						<c:if test="${!empty board.nick_name}">${board.nick_name}</c:if>
					</div>	
					<div>
						<c:if test="${board.auth == 1}">수강생</c:if>
						<c:if test="${board.auth == 2}">현직자</c:if>
						<c:if test="${board.auth == 3}">강사</c:if>
						<c:if test="${board.auth == 9}">관리자</c:if>
					</div>
					<div>${board.reg_date}</div>
				</div>
				<div class="both">
					<a href="boardDetail?board_num=${board.board_num}">${board.title}</a>
				</div>
				<div class="board_list both">
					<div>조회 ${board.hit}</div>
					<div>
						<c:if test="${board.favhate_cnt == 0}">눌러 ${board.favhate_cnt}</c:if>
						<c:if test="${board.favhate_cnt > 0 }">좋아요 ${board.favhate_cnt}</c:if>
						<c:if test="${board.favhate_cnt < 0 }">싫어요 ${board.favhate_cnt}</c:if>
					</div>
					<div>댓글 ${board.re_cnt}</div>
				</div>
				<hr size="1" width="100%">
			</c:forEach>
			</li>
		</ul>
	</c:if>
		</div>
	</div>
</div>


