<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<style>
table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
}

th, td {
    border: 1px solid #ddd;
    padding: 8px;
    text-align: left;
}

th {
    background-color: #f2f2f2;
}

tr:nth-child(even) {
    background-color: #f9f9f9;
}

select {
    padding: 6px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

.form-container {
    position: relative;
    overflow: hidden;
}

.form-container:before {
    content: "";
    position: absolute;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    background: linear-gradient(to right, #fff 0%, rgba(255, 255, 255, 0) 100%);
    z-index: 1;
}

form {
    position: relative;
    z-index: 2;
}

.button {
    margin-top: 20px;
}
</style>
<script src="/smarteditor/js/HuskyEZCreator.js" charset="UTF-8"></script>
<h2>첨삭 요청하기</h2>
<form:form action="send_advice" method="post" id="send_insert" modelAttribute="adviceVO" encType="multipart/form-data">
	<input type="hidden" name="sender" value="${login_id}">
	<input type="hidden" name="receiver" value="${receive_id}">
	<table style="text-align:center;">
		<tr>
			<td colspan="4">보내는 사람</td>
			<td colspan="4">${login_id.id}</td>
		</tr>
		<tr>
			<td colspan="4">받는 사람</td>
			<td colspan="4">${receive_id.id}</td>
		</tr>
		<tr>
			<td colspan="4">내용</td>
			<td colspan="4">
				<div id="smarteditor">
					<textarea name="editorTxt" id="editorTxT" rows="20" cols="10" placeholder="내용을 입력해주세요" style="width:500px;"></textarea>
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="4">파일첨부</td>
			<td colspan="4">
				<form:label path='upload'>파일업로드</form:label>
				<input type="file" name="upload" id="upload">
				<form:errors path="upload" cssClass="error-color"/>
			</td>
		</tr>
	</table>
	<div class="button" style="text-align:center">
		<form:button>전송</form:button>
		<input type="button" value="취소" id="cancleButton">
	</div>
</form:form>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
let oEditors=[];
smartEditor=function(){
	console.log("Naver SmartEditor");
	nhn.husky.EZCreator.createInIFrame({
		oAppRef:oEditors,
		elPlaceHolder:"editorTxT",
		sSkinURI:"/smarteditor/SmartEditor2Skin.html",
		fCreator:"createSEditor2"
	})
}

$(document).ready(function() {
    $('#cancleButton').on('click', function() {
        window.close();
    });
    
    smartEditor();
});

submitPost=function(){
	oEditors.getById["editorTxT"].exec("UPDATE_CONTENTS_FIELD",[])
	let content = document.getElementById("editorTxT").value();
	
	if(content==''){
		alert('내용을 입력해주세요');
		oEditors.getById["editorTxT"].exec("FOCUS")
		return
	}else{
		console.log(content);
	}
}


</script>