<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:getAsString name="title"/></title>
</head>
<body class="flex h-full select-auto flex-col font-sans text-gray-900 antialiased dark:bg-gray-800 dark:text-gray-100">
<div id="__next">
	<tiles:insertAttribute name="header"/>
	<main class="mx-auto w-full max-w-7xl">
		<div class="mt-6 px-4 lg:mt-10 lg:px-0">
			<div class="divide-y divide-gray-500/30 dark:divide-gray-500/70 lg:grid lg:grid-cols-12 lg:divide-x lg:divide-y-0">
				<tiles:insertAttribute name="nav"/>
         	   
		            <tiles:insertAttribute name="body"/>
				
			</div>
		</div>
	</main>
</div>
</body>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/HJW/main.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>


<link rel="stylesheet" href="${pageContext.request.contextPath}/css/HJW/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/HJW/header.css">

<!-- fullcalendar CDN -->
 <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.10/index.global.min.js'></script>

<!-- 그 외 스크립트 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/HJW/member.profile.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/HJW/member.calendar.js"></script>







</html>