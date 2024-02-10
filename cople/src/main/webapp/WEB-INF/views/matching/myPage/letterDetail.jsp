<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>쪽지 읽기</title>
    <style>
    	title{
    	magin-top:100px;
    	}
        .page-main {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: #f9f9f9;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        h2 {
            font-size: 24px;
            color: #333;
            margin-bottom: 20px;
        }
        ul {
            list-style-type: none;
            padding: 0;
        }
        li {
            margin-bottom: 10px;
        }
        input[type="button"] {
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        input[type="button"]:hover {
            background-color: #0056b3;
        }
        .content{
        text-size:20pt;
        }
    </style>
</head>
<body>
    <div class="page-main">
        <h2>쪽지 읽기</h2>
        <ul class="content">
            <li>보낸 사람 
                <c:if test="${sender == userId}">나</c:if>
                <c:if test="${sender != userId}">${sender}님</c:if>
            </li>
            <li>받은 사람 
                <c:if test="${receiver == userId}">나</c:if>
                <c:if test="${receiver != userId}">${receiver}님</c:if>
            </li>
            <li>보낸 날짜 ${letter.date_sent}</li>
            <li>내용 <br>
            ${letter.letter_content}
            </li>
        </ul>
        <div>
            <input type="button" value="답장" onclick="location.href='${pageContext.request.contextPath}/myPage/letterAnswer?letter_num=${letter.letter_num}&senderId=${sender}'">
            <input type="button" value="삭제" onclick="location.href=''">
            <input type="button" value="목록" onclick="location.href=''">
        </div>
    </div>
</body>
</html>