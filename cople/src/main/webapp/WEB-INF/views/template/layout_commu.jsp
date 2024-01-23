<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
</head>
<body>
	<div class="main">
		<div class="main_header">
			<tiles:insertAttribute name="header" />
		</div>
		<ul>
			<li><a href="${pageContext.request.contextPath}/community/boardNotice">공지사항</a></li>
			<li><a href="${pageContext.request.contextPath}/community/boardList">자유게시판</a></li>
			<li><a href="${pageContext.request.contextPath}/community/boardQ&A">Q & A</a></li>
		</ul>
	</div>
</body>
</html>