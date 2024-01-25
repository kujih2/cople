<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!---내용 시작 -->
<div>
	<!-- 검색 폼 시작 -->
	<form action="boardList" id="search_form" method="get">
		<ul class="search">
			<li>
			<c:if test="${!empty user}">
				<input type="button" value="글쓰기" onclick="location.href='boardWrite'">
			</c:if>
			</li>
			<li>
				<input type="search" name="keyword" id="keyword" value="${param.keyword}" placeholder="검색할 내용을 입력하세요">
			</li>
			<li>
				<input type="submit" value="찾기">
			</li>
			<li>
				<select id="order" name="order">
					<option value="1" <c:if test="${param.order == 1}">selected</c:if>>최신순</option>
					<option value="2" <c:if test="${param.order == 2}">selected</c:if>>조회수</option>
					<option value="3" <c:if test="${param.order == 3}">selected</c:if>>좋아요</option>
					<option value="4" <c:if test="${param.order == 4}">selected</c:if>>댓글수</option>
				</select>	
			</li>
		</ul>
		<div class="align-right">
			
		</div>
	</form>
	<!-- 검색 폼 끝 -->
	<ul>
		<li style="border:1px solid #000;">
			<div>
				<input type="button" value="새로고침" onclick="location.href='boardList'">
				<span>자유게시판</span>
			</div>
		</li>
	</ul>
	<c:if test="${count == 0}">
		<div class="result-display">표시할 게시물이 없습니다.</div>
	</c:if>
	<c:if test="${count > 0}">
		<ul>
			<li>
			<c:forEach var="board" items="${list}">
				<div class="board_list" >
					<div>사진</div>
					<div>
						<c:if test="${empty board.nick_name}">${board.id}</c:if>
						<c:if test="${!empty board.nick_name}">${board.nick_name}</c:if>
					</div>	
					<div>${board.reg_date}</div>
				</div>
				<div class="both">
					<a href="detail?board_num=${board.board_num}">${board.title}</a>
				</div>
				<div class="board_list both">
					<div>조회 ${board.hit}</div>
					<div>좋아요</div>
					<div>댓글</div>
				</div>
				<hr size="1" width="100%">
			</c:forEach>
			</li>
		</ul>
		<p>
		<div class="align-center">${page}</div>
	</c:if>
</div>
<!---내용 끝 -->  