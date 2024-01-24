<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>



<!-- 내용시작 -->
<div id="content_header">
	<h2>${wiki.doc_name}
		<c:if test="${wiki.update_status==0}">
			(${wiki.doc_num}-${wiki.update_num}판)
		</c:if>
	</h2>
		<c:if test="${wiki.update_status==0}">
			<button onclick="location.href='undo?doc_num=${wiki.doc_num}&update_num=${wiki.update_num}'">이 버전으로 되돌리기</button>
		</c:if>
		<c:if test="${wiki.update_status==1}">
			<button onclick="location.href='update?doc_num=${wiki.doc_num}&update_num=${wiki.update_num}'">편집</button>
		</c:if>
		
		<button onclick="location.href='history?doc_num=${wiki.doc_num}'">역사</button>
</div> 
	
<div id="content_main">
<c:if test="${wiki.update_status == 0}">
	<h3> 지난 버전의 내용을 보고 있습니다.</h3>
</c:if>
<c:if test="${wiki.doc_status == 0}">
	작성된 내용이 없습니다.
</c:if>
<c:if test="${wiki.doc_status == 2}">
	<div id="editor">
		${wiki.update_content}
	</div>
</c:if>
</div>
<!-- 내용끝 -->