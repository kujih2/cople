<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:getAsString name="title"/></title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/JJH/JJH.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>	
<script type="text/javascript" src="${pageContext.request.contextPath}/js/JJH/marketChat.js"></script>	
</head>
<body>
<div id="main2">
	<div id="main_header">
		<tiles:insertAttribute name="header"/>
	</div>
	<div class="side-height">
		<div id="page_nav2">
			<tiles:insertAttribute name="nav"/>
		</div>
		<div id="page_body2">
			<tiles:insertAttribute name="body"/>
		</div>
	</div>
	<div id="main_footer" class="page_clear">
		<tiles:insertAttribute name="footer"/>
	</div>

</div>
</body>
</html>