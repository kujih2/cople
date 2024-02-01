<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><tiles:getAsString name="title" /></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/HJW/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/HJW/header.css">
    <tiles:insertAttribute name="css" ignore="true"/>
</head>
<body>
    <div id="main">
        <div id="main_body">
            <tiles:insertAttribute name="body"/>
        </div>
    </div>
</body>
</html>
