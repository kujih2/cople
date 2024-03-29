<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div>
	<h2>검색</h2>
	<form action="list" id="search_form" method="get">
		<div class="search">
				<select name="keyfield" id="keyfield">
					<option value="1" <c:if test="${param.keyfield==1}">selected</c:if>>제목+내용</option>
					<option value="2" <c:if test="${param.keyfield==2}">selected</c:if>>제목</option>
					<option value="3" <c:if test="${param.keyfield==3}">selected</c:if>>내용</option>
				</select>
				<input type="search" name="keyword" id="keyword" value="${param.keyword}">
				<input type="submit" value="검색" id="wiki_search_btn">
		</div>
	
	</form> 
		<div id="write_guide">
			<p>찾는 문서가 없나요? 문서로 바로 가보세요</p>
				<button id="direct_btn" onclick="location.href='write?doc_name=${param.keyword}'">'${param.keyword}' 문서로 바로가기</button>
		</div>
		
		

		
		<div id="search_list">
		<p>전체 : ${count}건</p>
		<hr width="100%">
		<c:forEach var="wiki" items="${list}">
		<div class="search-item-container">
			<div class="search-item-name">
				<svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" fill="currentColor" class="bi bi-file-earmark" viewBox="0 0 16 16">
				  <path d="M14 4.5V14a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h5.5L14 4.5zm-3 0A1.5 1.5 0 0 1 9.5 3V1H4a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V4.5h-2z"/>
				</svg>
				<a href="detail?doc_num=${wiki.doc_num}" class="searched-doc-name">${wiki.doc_name}</a></div>
			<div class="search-item-content">${wiki.update_content}</div>
		</div>
		</c:forEach>
		</div>
	<div id="page_area">${page}</div>

</div>