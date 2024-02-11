<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:getAsString name="title"/></title>
</head>
<body class="flex h-full select-auto flex-col font-sans text-gray-900 antialiased dark:bg-gray-800 dark:text-gray-100">
<tiles:insertAttribute name="header"/>
<div id="root">
	<div class="app">
		<div class="sc-hGoxap bInodS">
			<tiles:insertAttribute name="body"/>
		</div>
	</div>
</div>
</body>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/HJW/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/HJW/market.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/JJH/market.write.js"></script>
</html>