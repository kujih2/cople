<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 내용 시작 -->
<div class="page-main">
	<br><br>
	<h2>받은 쪽지함</h2><br><br>
	<form action="/myPage/myLetter" id="lsearch_form" method="get">
		<ul class="search">
			<li>
				<select name="keyfield" id="keyfield" style="height:44px;">
					<option value="1" <c:if test="${param.keyfield==1}">selected</c:if>>보낸사람</option>
					<option value="2" <c:if test="${param.keyfield==2}">selected</c:if>>내용</option>
					<option value="3" <c:if test="${param.keyfield==3}">selected</c:if>>보낸사람+내용</option>
				</select>
			</li>
			<li>
				<input type="search" name="keyword" id="keyword" value="${param.keyword}">`
				<input type="submit" value="찾기">
				<input type="button" value="목록" onclick="location.href='list'">
			</li>
			<li>
			</li>
		</ul>
	</form>
	<br><br>
	<c:if test="${count == 0}">
	<div class="result-display">받은 쪽지함이 비었습니다.</div>
	</c:if>
	<c:if test="${count >0 }">
	<table class="striped-table">
		<tr>
			<td class="align-center">보낸사람</td>
			<td class="align-center" width="400">내용</td>
			<td class="align-center">날짜</td>
			<td class="align-center">읽은 날짜</td>
		</tr>
		<c:forEach var="letter" items="${list}">
		<tr>
			<td class="align-center">
				<a href="${pageContext.request.contextPath}/myPage/letterDetail?letter_num=${letter.letter_num}">
				${letter.id}
				</a>
			</td>
			<td class="align-center">
				<a href="${pageContext.request.contextPath}/myPage/letterDetail?letter_num=${letter.letter_num}">
			${letter.letter_content}
				</a>
			</td>
			<td class="align-center">
				<a href="${pageContext.request.contextPath}/myPage/letterDetail?letter_num=${letter.letter_num}">
			${letter.date_sent}
				</a>
			</td>
			<c:if test="${!empty letter.date_read}">
				<td class="align-center">${letter.date_read}</td>
			</c:if>
			<c:if test="${empty letter.date_read}">
				<td class="align-center">읽지 않음</td>
			</c:if>
		</tr>
		</c:forEach>
	</table>
	<div class="align-center">${page}</div>
	</c:if>
</div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
	<script>
	$(function(){
		//검색 유효성 체크
		$('#lsearch_form').submit(function(){
			if($('#keyword').val().trim()==''){
				alert('검색어를 입력하세요!');
				$('#keyword').val('').focus();
				return false;
			}	
		});//end of submit
	});
	</script>
<!-- 내용 끝 -->
