<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 내용 시작 -->
<script type="text/javascript" src="${pageContetx.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="http://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContetx.request.contextPath}/js/ckeditor.js"></script>
<script type="text/javascript" src="${pageContetx.request.contextPath}/js/uploadAdapter.js"></script>
<div class="page-main">
	<h2>글 수정</h2>
	<form:form action="boardUpdate" modelAttribute="boardVO" 
	        id="update_form" enctype="multipart/form-data">
	    <form:hidden path="board_num"/>    
		<form:errors element="div" cssClass="error-color"/>
		<ul>
			<li>
				제목
				<form:input path="title" placeholder="제목을 입력하세요."/>
				<form:errors path="title" cssClass="error-color"/>
			</li>
			<li>
				내용
				<form:textarea path="content" placeholder="내용을 입력하세요."/>
				<form:errors path="content" cssClass="error-color"/>
				<script>
					function MyCustomUploadAdapterPlugin(editor){
						editor.plugins.get('FileRepository').createUploadAdapter =(loader) => {
							return new UploadAdapter(loader);
						}
					}	
					
					ClassicEditor
						.create(document.querySelector('#content'),{
						  	extraPlugins:[MyCustomUploadAdapterPlugin]
						})
						.then(editor => {
							window.editor = editor;
						})						
						.catch(error => {
							console.error(error);
						});
				</script>
			</li>
		</ul>
		<div class="align-center">
			<form:button class="commu-btn" >전송</form:button>
			<input class="commu-btn" type="button" value="글 상세" 
			   onclick="location.href='boardDetail?board_num=${boardVO.board_num}'">
		</div>	
	</form:form>
</div>
<!-- 내용 끝 -->


