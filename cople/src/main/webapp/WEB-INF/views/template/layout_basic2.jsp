<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:getAsString name="title"/></title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout_basic2.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/HJW/sub.css">
<tiles:insertAttribute name="css" ignore="true"/>
<tiles:insertAttribute name="js" ignore="true"/>
</head>
<body>
<tiles:insertAttribute name="header"/>
<div id="main">
   <div id="main_header">
      
   </div>
   <div id="main_body">
      <tiles:insertAttribute name="body"/>
   </div>
   <div id="main_footer">
      <tiles:insertAttribute name="footer"/>
   </div>
</div>
</body>
</html>