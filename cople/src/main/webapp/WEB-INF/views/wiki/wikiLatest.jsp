<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<h2>최근 변경</h2>
<table>
	<c:forEach var="latest" items="${latest}">

				<tr onclick="location.href='detail?doc_num=${latest.doc_num}'" style="cursor:pointer;">
					<td>${latest.doc_name}</td>
					<td>${latest.update_date}</td>
				</tr>

	</c:forEach>
</table>