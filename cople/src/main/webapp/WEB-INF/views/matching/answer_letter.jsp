<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<style>
 body {
            overflow: scroll !imporatant;  overflow-y: scroll !imporatant; 
        } 
 html{
 		overflow: scroll !imporatant;  overflow-y: scroll !imporatant; 
 }

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

	.abutton {
        margin-top: 20px;
        padding: 10px 20px; /* 버튼 크기 조정을 위한 패딩 */
        font-size: 16px; /* 버튼 텍스트 크기 조정 */
        background-color: #4CAF50; /* 전송 버튼의 초록색 배경 */
        color: #fff; /* 전송 버튼 텍스트의 흰색 색상 */
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }

    .abutton.cancel {
        background-color: #f44336; /* 취소 버튼의 빨간색 배경 */
    }
</style>
<h2>쪽지 보내기</h2>
<form:form action="answer_letter" method="post" id="send_insert" modelAttribute="letterVO">
	<input type="hidden" name="sender" value="${login_user.mem_num}">
	<input type="hidden" name="receiverId" value="${receive_user}">
	<table style="text-align:center;">
		<tr>
			<td colspan="4">보내는 사람</td>
			<td colspan="4">${login_user.id}</td>
		</tr>
		<tr>
			<td colspan="4">받는 사람</td>
			<td colspan="4">${receive_user}</td>
		</tr>
		<tr>
			<td colspan="4">내용</td>
			<td colspan="4">
				<form:textarea cols="80" rows="15" path="letter_content"/>
				<br>
				<form:errors path="letter_content"  cssClass="error-color"/>
			</td>
		</tr>
	</table>
	<div class="button" style="text-align:center">
		<form:button class="abutton">전송</form:button>
		<input type="button" value="취소" id="cancleButton" class="abutton cancel">
	</div>
</form:form>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
$(document).ready(function() {
    $('#cancleButton').on('click', function() {
        window.close();
    });
});
</script>