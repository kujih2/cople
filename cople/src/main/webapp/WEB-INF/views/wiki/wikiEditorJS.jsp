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

		/*$('#editor .parag-index').remove();*/
		$('#textarea').val($('#editor').html());
    
    	$('#update_form').submit();
	});
	
	//페이지 업로드시 문단별 인덱스부여
	const editor = $('#editor');
	addSpanTagsToHeadings();

	
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
	//에디터 수정시
	$('#editor').on('click', function (event) {
		hideSubMenus();
 		if(linksStatus==0){
 			$('span[style*="background-color: rgb(210, 210, 210)"]').each(function() {
 			    $(this).replaceWith($(this).html());
 			});
 			$('a[style*="background-color: rgb(210, 210, 210)"]').each(function() {
 			    $(this).css('background-color', 'white');
 			});
 			//$('span[style*="background-color: rgb(210, 210, 210)"]').unwrap();
			//$('a[style*="background-color: rgb(210, 210, 210)"]').css('background-color', 'white');

		}

	
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
    //////////////////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////////
    //링크연결
    let linksStatus=0;
	$('#btn_links').on('click',function(){
		if(linksStatus==0){
			document.execCommand("BackColor",false,"#D2D2D2");
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

	//내부문서 검색
	 $('#internal_search').keyup(function(){
		if($('#internal_search').val().trim()==''){
			$('#internal_search').empty();
			return;
		}
		//서버와 통신
		$.ajax({
			url:'internalSearchAjax',
			type:'post',
			data:{doc_name:$('#internal_search').val()},
			dataType:'json',
			success:function(param){
				if(param.result == 'success'){
					$('#search_area').empty();
					$(param.wikiList).each(function(index,item){
						let output = '';
						output += '<li data-num="'+item.doc_num+'">';
						output += item.doc_name;
						output += '</li>';
						$('#search_area').append(output);
					});
		
				}else{
					alert('내부문서 검색 오류 발생');
				}
			},
			error:function(){
				alert('네트워크 오류 발생')
			}
		});
	}); 

		//검색된 문서 선택하기
		$(document).on('click','#search_area li',function(){
			let doc_num = $(this).attr('data-num');//선택한 문서 번호
			if($('span[style*="background-color: rgb(210, 210, 210)"]').length){
				//첫번째로 링크 줄때
				$('span[style*="background-color: rgb(210, 210, 210)"]').wrap('<a href="detail?doc_num='+doc_num+'"></a>');
			}else if($('a[style*="background-color: rgb(210, 210, 210)"]').length){
				//두번째로 링크줄때
				$('a[style*="background-color: rgb(210, 210, 210)"]').attr('href', 'detail?doc_num='+doc_num);
			}
			$('#internal_search').empty();
			hideSubMenus();
	
		
		});
	

	
	
	//정렬
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

    
	
	

	//스타일세팅
    function setStyle(style) {
        document.execCommand(style);
        focusEditor();
    }


    // 버튼 클릭 시 에디터가 포커스를 잃기 때문에 다시 에디터에 포커스를 해줌
    function focusEditor() {
        editor.focus({preventScroll: true});
    }
	
/*     function updateEditorMenuPosition(){
		var marginLeftValue = $('#side_branch').css('margin-left');
		$('.editor-menu').css('left',marginLeftValue);
    }
    updateEditorMenuPosition();
    $(window).resize(updateEditorMenuPosition);
     */
    
    function hideSubMenus(){
    	 headingStatus=0;
    	 $("#sub_headings").hide();
    	 linksStatus=0;
    	 $("#sub_links").hide();
     	 $('#internal_search').empty();


     }
    
    
    
});
</script>