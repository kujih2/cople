<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:getAsString name="title"/></title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/LKW.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<tiles:insertAttribute name="css" ignore="true"/>
<tiles:insertAttribute name="js" ignore="true"/>

</head>
<body>
<div id="main">
	<div id="main_header">
		<tiles:insertAttribute name="header"/>
		<tiles:insertAttribute name="subHeader"/>
	</div>
	<div id="side_branch">
		<div id="main_body">
			<tiles:insertAttribute name="body"/>
		</div>
		<div id="side_body">
		
		</div>
	</div>
</div>
	<div id="main_footer" class="page-clear">
		<tiles:insertAttribute name="footer"/>
	</div>

</body>
</html>