<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
$(document).ready(function(){
	$('#direct_btn').click(function(){
	
	});
	

    $('.search-item-content').each(function () {
        $(this).find('redirect').remove();
        $(this).html($(this).text());
    });
    $('#keyword').on('keydown', function(event) {
	    if (event.which === 13) {
	    	event.preventDefault();
	    	window.location.href = 'detail?doc_name='+$('#keyword').val();
	    } 
	});

}); 
</script>