<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>    
<script type="text/javascript">
$(document).ready(function() {
	$('#submit_btn').click(function(){
		alert('클릭됨')
		console.log('클림됨');
		$('#member_register').submit();
		$('#member_register_auth_index').submit();
		console.log('클림됨2');
	});


});
</script>