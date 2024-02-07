<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:getAsString name="title"/></title>
</head>
<body class="">
<div class="wrapper">
	<tiles:insertAttribute name="header"/>
	<tiles:insertAttribute name="nav"/>
	<tiles:insertAttribute name="body"/>
	<tiles:insertAttribute name="footer"/>
</div>
</body>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/HJW/admin.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/HJW/bootstrap_admin.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/HJW/admin2.css">


</html>

