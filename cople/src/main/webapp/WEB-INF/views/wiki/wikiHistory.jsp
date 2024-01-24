<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<div>
	<h2>${wiki.doc_name}</h2><h3>문서역사</h3>
	<table>
	<c:forEach var="history" items="${list}">
		<tr>
			<td>${history.update_date}</td>
			<td>${history.update_writer}</td>
			<td>${history.doc_num}-${history.update_num}</td>
			<td><a href="detail?doc_num=${history.doc_num}&update_num=${history.update_num}">보기</a></td>
			<td><a href="undo?doc_num=${history.doc_num}&update_num=${history.update_num}">이 버전으로 되돌리기</a></td>
			<td>${history.update_summary}</td>
		</tr>
	</c:forEach>
	</table>
</div>