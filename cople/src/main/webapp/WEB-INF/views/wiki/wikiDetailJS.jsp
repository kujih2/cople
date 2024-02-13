<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
$(document).ready(function(){
	$('#total_search_box').on('keydown', function(event) {
	    if (event.which === 13) {
	    	event.preventDefault();
	    	window.location.href = 'detail?doc_name='+$('#total_search_box').val();
	    }
	});
	
	var queryString = window.location.search;
    var urlParams = new URLSearchParams(queryString);
    
    // Get the value of the 'from' parameter
    var from1 = urlParams.get('from1');
    var from2 = urlParams.get('from2');
    if(from1 !== null && from1.trim() !== ''){
	    $('#editor').before('<div id="notice_message"><a href="detail?doc_num='+from2+'&noredirect=1">'+from1+'</a>로부터 넘어옴</div>');

    }
    var noredirect = urlParams.get('noredirect');
    if (noredirect == null && $('#redirect_to').length) {
    	window.location.href = 'detail?doc_num='+$('#redirect_to').attr('data-redirect')+'&from1='+$('#redirect_to').attr('data-name')+'&from2='+$('#redirect_to').attr('data-num');
    }
    
}); 
</script>