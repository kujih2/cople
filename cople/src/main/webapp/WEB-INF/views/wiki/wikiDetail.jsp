<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!-- 내용시작 -->
<h2>${wiki.doc_name}</h2>
<c:if test="${wiki.doc_status == 0}">
	작성된 내용이 없습니다.
	
	<button onclick="location.href='update?doc_num=${wiki.doc_num}&update_num=${wiki.update_num}'">편집</button>
	<button>역사</button>
</c:if>
<c:if test="${wiki.doc_status == 2}">
	<button onclick="location.href='update?doc_num=${wiki.doc_num}&update_num=${wiki.update_num}'">편집</button>
	<button>역사</button>
	${wiki.update_content}
</c:if>
<!-- 내용끝 -->