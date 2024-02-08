<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
$(document).ready(function() {
	var mainBodyWidth = $('#main_body').outerWidth();
	
    $('.editor-menu').css({
        'width': mainBodyWidth + 'px',
        'transform': 'translateX(-20.5px)'

    });
	
	//에디터 메뉴 위치 조절
    var initialPosition = 142; // Initial fixed position
    var scrollThreshold = 200; // Distance to scroll before the menu stays fixed

    $(window).scroll(function() {
        var scrollTop = $(this).scrollTop();

        // Calculate the new position based on the scroll distance
        var newPosition = Math.max(initialPosition - scrollTop, 0);
        mainBodyWidth = $('#main_body').outerWidth();
        
        // Set the new position for the menu
        $('.editor-menu').css({
            'top': newPosition + 'px', 
            'width': mainBodyWidth + 'px',
            'transform':'translateX(-20.5px)'
        });

        // If scroll distance is beyond the threshold, fix the menu
        if (scrollTop > scrollThreshold) {
            $('.editor-menu').css({
                'top': '0',
                'width': mainBodyWidth + 'px',
                'transform': 'translateX(-20.5px)'

            });
        }
    });

	
	//헤더에서 엔터를 눌러 검색할때
	$('#keyword').on('keydown', function(event) {
	    if (event.which === 13) {
	    	event.preventDefault();
	    	window.location.href = 'detail?doc_name='+$('#keyword').val();
	    }
	});
	
	//링크를 클릭할때
	$('#editor').on('click', '.clickable', function() {
        var link = $(this).data('link');
        // Open the link in a new window or perform any other desired action
        window.open(link, '_blank');
    });
	
	//처음 페이지가 로드될때 데이터베이스의 내용 불러오기
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
		}
 		if(mapStatus==0){
			$('#position_of_map').parent().remove();
 		}
 		$('#position_of_img').remove();
	});
	

	
	

	
	
	
	//버튼들 기능
		//문단
	let headingStatus = 0;
	$('#btn_headings').on('click',function(){
		if(headingStatus==0){
	    	event.preventDefault();
			hideSubMenus();
			headingStatus=1;
			$("#sub_headings").show();
		}else if(headingStatus==1){
	    	event.preventDefault();
			hideSubMenus();
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
    
    $('#btn_image').on('click',function(){
    	event.preventDefault();
    	let htmlToInsert = '<div class="img-elements" id="position_of_img"></div>';
    	insertHtmlAfterCaret(htmlToInsert);
    	$('#img-selector').click();
    });
    $('#img-selector').on('change',function(e){
    	    const files = e.target.files;
    	    if (!!files) {
    	        insertImageDate(files[0]);
    	    }


    	
    });
    function insertImageDate(file) {
	    const reader = new FileReader();
	    reader.onload = function (e) {
	        $('#editor').focus();

	        if (reader.result) {
	            let inserted_tags = "<img src=\""+reader.result+"\" alt=\"Image\" />";

	            $('#position_of_img').append(inserted_tags);
	            $('.img-elements').removeAttr('id');
	        } else {
	            console.error('Failed to read the file.');
	        }
	    };

	    reader.onerror = function (e) {
	        console.error('Error reading the file.');
	    };

	    reader.readAsDataURL(file);
	}
    //=======================================
    //지도 버튼
    //=======================================
    let mapStatus=0;
    $('#btn_map').on('click',function(){
    	event.preventDefault();
		if(mapStatus==0){
			let htmlToInsert = '<div class="map-elements" id="position_of_map"></div>';
		    insertHtmlAfterCaret(htmlToInsert);
			hideSubMenus();
			mapStatus=1;
			$('#sub_map').show();
		}else if(mapStatus==1){
			hideSubMenus();
			mapStatus=0;
			$('#sub_map').hide();
			
		}
    });
    function insertHtmlAfterCaret(html) {
        var editableDiv = document.getElementById('myEditableDiv');
        var range, node;

        if (window.getSelection && (range = window.getSelection().getRangeAt(0))) {
          node = document.createElement('div');
          node.innerHTML = html;

          range.collapse(false);
          range.insertNode(node);

          // Move the caret after the inserted content
          range.setStartAfter(node.lastChild);
          range.collapse(true);

          var selection = window.getSelection();
          selection.removeAllRanges();
          selection.addRange(range);
        }
      }
    
    $('#map').on('click', function(event) {
        event.stopPropagation(); // Stop the event from propagating to parent elements
    });
    $('#pac-input').on('click', function(event) {
    	event.preventDefault();
    	event.stopPropagation();
    });
    $('#choose_loc_btn').on('click', function(event) {
		if($('#pac-input').val().trim()==''){
			$('#pac-input').val('').focus();
	    	$('#position_of_map').parent().remove();
			return;	
		}
    	event.preventDefault();
    	event.stopPropagation();
    	hideSubMenus();
    	$('#editor').focus();
    	let inserted_tags = "<iframe class=\"map-iframe\"width=\"300\" height=\"300\" style=\"border:1px solid #CCCCCC;\" loading=\"lazy\" allowfullscreen referrerpolicy=\"no-referrer-when-downgrade\" src=\"https://www.google.com/maps/embed/v1/place?key=AIzaSyAC4McV0RQma1mFznuFnW4paXEXkLhTZ2c&q="+$('#pac-input').val()+"\"></iframe>"	
    
    	$('#position_of_map').append(inserted_tags);
    	$('.map-elements').removeAttr('id');
    	$('#pac-input').val('');
    });
    $('#map > *').on('click', function(event) {
    	event.preventDefault();
    });

    
    //링크연결
    let linksStatus=0;
	$('#btn_links').on('click',function(){
	    	event.preventDefault();
		if(linksStatus==0){
			document.execCommand("BackColor",false,"#D2D2D2");
			hideSubMenus();
	    	linksStatus=1;
			$("#sub_links").show();

		}else if(linksStatus==1){
			hideSubMenus();
	    	linksStatus=0;
			$("#sub_links").hide();
		}	
	});
	$('#sub_links_menu_title1').on('click',function(){
		$('#sub_links_menu_item1').show();
		$('#sub_links_menu_title1').css('border-bottom', 'solid black 2px');
		$('#sub_links_menu_item2').hide();
		$('#sub_links_menu_title2').css('border-bottom', 'none');
	});
	$('#sub_links_menu_title2').on('click',function(){
		$('#sub_links_menu_item1').hide();
		$('#sub_links_menu_title1').css('border-bottom', 'none');
		$('#sub_links_menu_item2').show();
		$('#sub_links_menu_title2').css('border-bottom', 'solid black 2px');
	});

	//문서연결-내부문서 검색
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
			$('#internal_search').val('');
			$('#search_area').empty();
			hideSubMenus();
		});
	//외부문서 연결
	$('#btn_linkImport').on('click',function(){
		event.preventDefault();
		let external_addr = $('#external_import').val();
		let external_import_logo = '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-arrow-right" viewBox="0 0 16 16">'+
								   		'<path fill-rule="evenodd" d="M10 12.5a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v2a.5.5 0 0 0 1 0v-2A1.5 1.5 0 0 0 9.5 2h-8A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-2a.5.5 0 0 0-1 0v2z"/>'+
								   		'<path fill-rule="evenodd" d="M15.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 0 0-.708.708L14.293 7.5H5.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z"/>'+
								   	'</svg>';
		if($('span[style*="background-color: rgb(210, 210, 210)"]').length){
			//첫번째로 링크 줄때
			$('span[style*="background-color: rgb(210, 210, 210)"]').wrap('<a href="'+external_addr+'"></a>');
			$('span[style*="background-color: rgb(210, 210, 210)"]').before(external_import_logo);
		}else if($('a[style*="background-color: rgb(210, 210, 210)"]').length){
			//두번째로 링크줄때
			$('a[style*="background-color: rgb(210, 210, 210)"]').attr('href', external_addr);
		}
		$('#external_addr').val('');
		hideSubMenus();
	});
	
	//문서 넘겨주기
	let tossStatus=0;
	$('#btn_docToss').on('click',function(){
	    	event.preventDefault();
		if(tossStatus==0){
			document.execCommand("BackColor",false,"#D2D2D2");
			hideSubMenus();
	    	tossStatus=1;
			$("#sub_toss").show();
		}else if(tossStatus==1){
			hideSubMenus();
	    	tossStatus=0;
			$("#sub_toss").hide();
		}
	});
	//문서넘겨주기-내부문서 검색
	 $('#toss_search').keyup(function(){
		if($('#toss_search').val().trim()==''){
			$('#toss_search').empty();
			return;
		}
		//서버와 통신
		$.ajax({
			url:'internalSearchAjax',
			type:'post',
			data:{doc_name:$('#toss_search').val()},
			dataType:'json',
			success:function(param){
				if(param.result == 'success'){
					$('#search_area2').empty();
					$(param.wikiList).each(function(index,item){

						if(item.doc_name!=$('#original_doc').data('name')){
							let output = '';
							output += '<li data-num="'+item.doc_num+'" data-name="'+item.doc_name+'">';
							output += item.doc_name;
							output += '</li>';
							$('#search_area2').append(output);
						}
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
	$(document).on('click','#search_area2 li',function(){
		let doc_num = $(this).attr('data-num');//선택한 문서 번호
		let doc_name = $(this).attr('data-name');//선택한 문서 이름
		$('#editor').html('');
		$('#editor').html('<div class="redirect"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-return-right" viewBox="0 0 16 16"> <path fill-rule="evenodd" d="M1.5 1.5A.5.5 0 0 0 1 2v4.8a2.5 2.5 0 0 0 2.5 2.5h9.793l-3.347 3.346a.5.5 0 0 0 .708.708l4.2-4.2a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 8.3H3.5A1.5 1.5 0 0 1 2 6.8V2a.5.5 0 0 0-.5-.5z"/></svg><a href="detail?doc_num='+doc_num+'&from1='+$('#original_doc').attr('data-name')+'&from2='+$('#original_doc').attr('data-num')+'">'+doc_name+'</a>으로 문서를 넘겨줌</div>');
		$('.redirect').prepend('<input type="hidden" id="redirect_to" data-num="'+$('#original_doc').attr('data-num')+'" data-name="'+$('#original_doc').attr('data-name')+'" data-redirect="'+doc_num+'">')
		
		
		$('#toss_search').val('');
		$('#search_area2').empty();
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
		tossStatus=0;
		$("#sub_toss").hide();
		mapStatus=0;
		$('#sub_map').hide();


     }
    
    
    
});
</script>