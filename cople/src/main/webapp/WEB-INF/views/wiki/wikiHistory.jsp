<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<div>
	<h2>${wiki.doc_name}<span style="font-size:15px;">(문서역사)</span></h2>
	<table id="history">
	<tr id="index_line">
		<td class="index-content"><b>변경 일자</b></td>
		<td class="index-content"><b>기여자</b></td>
		<td class="index-content"><b>업데이트 식별 번호</b></td>
		<td ></td>
		<td ></td>
		<td class="index-content"><b>요약</b></td>
		
	</tr>
	<c:forEach var="history" items="${list}">
		<tr>
			<td>${history.update_date}</td>
			<td>${history.update_writer}</td>
			<td>${history.doc_num}-${history.update_num}</td>
			<td>
				<button class="sng-history" onclick="location.href='detail?doc_num=${history.doc_num}&update_num=${history.update_num}'">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
					  <path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z"/>
					  <path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/>
					</svg>
					보기
				</button>
			</td>
			<td>
				<button class="rewind-btn" onclick="location.href='undo?doc_num=${history.doc_num}&update_num=${history.update_num}'">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-counterclockwise" viewBox="0 0 16 16">
						<path fill-rule="evenodd" d="M8 3a5 5 0 1 1-4.546 2.914.5.5 0 0 0-.908-.417A6 6 0 1 0 8 2v1z"/>
						<path d="M8 4.466V.534a.25.25 0 0 0-.41-.192L5.23 2.308a.25.25 0 0 0 0 .384l2.36 1.966A.25.25 0 0 0 8 4.466z"/>
					</svg>
						이 버전으로 되돌리기
				</button>
			</td>
			<td>${history.update_summary}</td>
		</tr>
	</c:forEach>
	</table>  
</div>