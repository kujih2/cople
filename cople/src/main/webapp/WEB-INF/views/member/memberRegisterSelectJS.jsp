<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>    
<script type="text/javascript">
$(document).ready(function() {
	$('.select-option').hover(
		function(){
			$(this).find('span').addClass('visible');
		},
		function(){
			$(this).find('span').removeClass('visible');
		}
	);
	
	 $('#option1').click(function() {
	      redirectToURL('/member/registerUser2?auth_index=1');
	 });
	 $('#option2').click(function() {
	      redirectToURL('/member/registerUser2?auth_index=2');
	 });
	 $('#option3').click(function() {
	      redirectToURL('/member/registerUser2?auth_index=3');
	 });
	
	function redirectToURL(url) {
		    window.location.href = url;
	}
});
</script>