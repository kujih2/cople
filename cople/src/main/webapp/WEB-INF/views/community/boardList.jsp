<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!---내용 시작 -->
<div id="page-list">
	<!-- 검색 폼 시작 -->
	<form action="boardList" id="search_form" method="get">
		<ul class="search">
			<li>
			<c:if test="${!empty user}">
				<input type="button" value="글쓰기" class="sub-btn" onclick="location.href='boardWrite'">
			</c:if>
			</li>
			<li>
				<input class="search-bar" type="search" name="keyword" id="keyword" value="${param.keyword}" placeholder="검색할 내용을 입력하세요">
			</li>
			<li>
				<select id="order" name="order" class="sub-btn2" style ="height:40px">
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
		<li class="title-main">
			<div class="title-elements">
				<input type="button" class="refresh-button" onclick="location.href=location.href">
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
					<div><img src="${pageContext.request.contextPath}/images/commu_eye_1.png" width="20"> ${board.hit}</div>
					<div>
						<c:if test="${board.favhate_cnt == 0}"> 
						<img src="${pageContext.request.contextPath}/images/fav.png" width="20">${board.favhate_cnt}
						</c:if>
						<c:if test="${board.favhate_cnt > 0 }">
						<img src="${pageContext.request.contextPath}/images/fav_alt.png" width="20">${board.favhate_cnt}
						</c:if>
						<c:if test="${board.favhate_cnt < 0 }"> 
						<img src="${pageContext.request.contextPath}/images/hate_alt.png" width="20">${board.favhate_cnt}
						</c:if>
					</div>
					<div><img src="${pageContext.request.contextPath}/images/commu_reply_1.png" width="20"> ${board.re_cnt}</div>
				</div>
				<hr size="1" width="100%">
			</c:forEach>
			</li>
		</ul>
		<p>
		<div class="align-center">${page}</div>
	</c:if>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	//검색 유효성 체크
	$('#search_form').submit(function(){
		if($('#keyword').val().trim()==''){
			alert('검색어를 입력하세요!');
			$('#keyword').val('').focus();
			return false;
		}
	});//end of submit
	
	//정렬 선택
	$('#order').change(function(){
		location.href='boardList?keyfield='+$('#keyfield').val()+'&keyword='+$('#keyword').val()+'&order='+$('#order').val();
	});
});
</script>
<!---내용 끝 -->  