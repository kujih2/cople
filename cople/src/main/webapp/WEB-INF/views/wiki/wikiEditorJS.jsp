<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script> 
<script type="text/javascript">
$(document).ready(function() {

	$('#editor').on('click', '.clickable', function() {
        var link = $(this).data('link');
        // Open the link in a new window or perform any other desired action
        window.open(link, '_blank');
    });
	//데이터베이스의 내용 불러오기
	$('#editor').html($('#textarea').val());
	$('#update_summary').val('');
	//수정 제출 시 에디터폼에서 다시 내용 주기
	$('#btn_submit').on('click',function(){
		event.preventDefault();

    	$('#editor .parag-index').remove();
  		$('#textarea').val($('#editor').html());
    
    	$('#update_form').submit();
	});
	
	//페이지 업로드시 문단별 인덱스부여
	const editor = $('#editor');
	addSpanTagsToHeadings();

	
	
	//에디터 수정시
	$('#editor').on('keydown', function (event) {
	    // Remove all empty tags

	
	    // Check for backspace key
/* 	    if (event.keyCode === 8 || event.key === "Backspace") {
	    	$('#editor *').filter(function() {
	    	    // Filter elements that are either empty or contain only br tags
	    	    return ($(this).is(':empty') || ($(this).children().length === 1 && $(this).children('br').length === 1));
	    	}).remove();
	        addSpanTagsToHeadings();
	    } */
	});
	
	
	
	

	
	
	
	//버튼들 기능
	$('#btn_undo').on('click',function(){
		event.preventDefault();
		document.execCommand('undo');
	});
	$('#btn_redo').on('click',function(){
		event.preventDefault();
		document.execCommand('redo');
	});
		//문단
	let headingStatus = 0;
	$('#btn_headings').on('click',function(){
		if(headingStatus==0){
	    	event.preventDefault();
			headingStatus=1;
			$("#sub_headings").show();
		}else if(headingStatus==1){
	    	event.preventDefault();
			headingStatus=0;
			$("#sub_headings").hide();
		}	
	});
    $('#btn_heading1').on('click',function(){
    	event.preventDefault();
	    document.execCommand('formatBlock', false, '<h2>');
	    addSpanTagsToHeadings();
	    $("#sub_headings").hide();
    })
    $('#btn_heading2').on('click',function(){
    	event.preventDefault();
	    document.execCommand('formatBlock', false, '<h3>');
	    addSpanTagsToHeadings();
	    $("#sub_headings").hide();
    })
    $('#btn_heading3').on('click',function(){
    	event.preventDefault();
	    document.execCommand('formatBlock', false, '<h4>');
	    addSpanTagsToHeadings();
	    $("#sub_headings").hide();
    })
    	//글자색
   	$('#btn_color').on('click',function(){
		event.preventDefault();
		setStyle('forecolor','#123456')
   	});
    	//볼드체
    $('#btn_bold').on('click',function(){
    	event.preventDefault();
        setStyle('bold');
    });
    	//이탤릭체
    $('#btn_italic').on('click',function(){
    	event.preventDefault();
        setStyle('italic');
    });
    	//언더라인
    $('#btn_underline').on('click',function(){
    	event.preventDefault();
        setStyle('underline');
    });
    	//취소선
    $('#btn_strike').on('click',function(){
    	event.preventDefault();
        setStyle('strikeThrough')
    });
    	//리스트들
    $('#btn_ordered_list').on('click',function(){
    	event.preventDefault();
        setStyle('insertOrderedList');
    });
    $('#btn_unordered_list').on('click',function(){
    	event.preventDefault();
        setStyle('insertUnorderedList');
    });
    //링크연결
    let linksStatus=0;
	$('#btn_links').on('click',function(){
		if(linksStatus==0){
	    	event.preventDefault();
	    	linksStatus=1;
			$("#sub_links").show();
		}else if(linksStatus==1){
	    	event.preventDefault();
	    	linksStatus=0;
			$("#sub_links").hide();
		}	
	});
	$('#sub_links_menu :nth-child(1)').on('click',function(){
		$('#sub_links_menu_item1').show();
		$('#sub_links_menu_item2').hide();
	});
	$('#sub_links_menu :nth-child(2)').on('click',function(){
		$('#sub_links_menu_item1').hide();
		$('#sub_links_menu_item2').show();
	});
	$('#btn_alignLeft').on('click',function(){

		event.preventDefault();
	    document.execCommand('justifyLeft');
	});
	$('#btn_alignCenter').on('click',function(){
		event.preventDefault();
	    document.execCommand('justifyCenter');
	});
	$('#btn_alignRight').on('click',function(){
		alert('클릭됨');
		event.preventDefault();
	    document.execCommand('justifyRight');
	});

    
	
	//함수들
	function addSpanTagsToHeadings() {
		$('.parag-index').remove();
		const headings = $('#editor h2, #editor h3, #editor h4');
		let mainHeadingCount = 0;
		let subHeadingCount = 0;
		let subSubHeadingCount = 0;
		
		headings.each(function(index, heading){
			if($(heading).is('h2')){
				mainHeadingCount++;
				subHeadingCount = 0;
				$(heading).attr('id', mainHeadingCount);
				$(heading).prepend(mainHeadingCount+".")
				$(heading).contents().filter(function() {
				    return this.nodeType === 3 && this.nodeValue.trim() === mainHeadingCount+".";
				}).wrap('<a class=\"parag-index clickable\"></a>');
			}else if($(heading).is('h3')){
				subHeadingCount++;
				subSubHeadingCount = 0;
				$(heading).attr('id', mainHeadingCount+subHeadingCount);
				$(heading).prepend(mainHeadingCount+"."+subHeadingCount+".")
				$(heading).contents().filter(function() {
				    return this.nodeType === 3 && this.nodeValue.trim() === mainHeadingCount+"."+subHeadingCount+".";
				}).wrap('<a class=\"parag-index clickable\"></a>');
			}else if($(heading).is('h4')){
				subSubHeadingCount++;
				$(heading).attr('id', mainHeadingCount + subHeadingCount + subSubHeadingCount);
				$(heading).prepend(mainHeadingCount+"."+subHeadingCount+"."+subSubHeadingCount+".")
				$(heading).contents().filter(function() {
				    return this.nodeType === 3 && this.nodeValue.trim() === mainHeadingCount+"."+subHeadingCount+"."+subSubHeadingCount+".";
				}).wrap('<a class=\"parag-index clickable\"></a>');
			}
		});
	}

	//스타일세팅
    function setStyle(style) {
        document.execCommand(style);
        focusEditor();
    }


    // 버튼 클릭 시 에디터가 포커스를 잃기 때문에 다시 에디터에 포커스를 해줌
    function focusEditor() {
        editor.focus({preventScroll: true});
    }

});
</script>