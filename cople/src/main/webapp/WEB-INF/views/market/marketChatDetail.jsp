<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id="talkDetail" class="page-main">
	<div id="product_detail">
		
	</div>
		
	<div id="chatting_message"></div>
	
	<form method="post" id="detail_form">
		<input type="hidden" name="chatRoom_num" id="chatRoom_num"
		                                value="${chatRoomNum}">
		<div id="textareaBox">
			<textarea rows="5" cols="40" name="chat_message" id="chat_message"></textarea>
				 <div id="message_btn">
					<input type="submit" value="전송">
				</div>    
		</div>
		                            
	</form>
	
</div>                        
