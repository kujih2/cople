$(function(){
var fileNo = 0;
var filesArr = new Array();
var count = 0;
/* 첨부파일 추가 */
  $('#upload').change(function(){
    var maxFileCnt = 4;   // 첨부파일 최대 개수
    var attFileCnt = document.querySelectorAll('.filebox').length;    // 기존 추가된 첨부파일 개수
    var remainFileCnt = maxFileCnt - attFileCnt;    // 추가로 첨부가능한 개수
    var curFileCnt = this.files.length;  // 현재 선택된 첨부파일 개수

    // 첨부파일 개수 확인
    

   if(this.files.length==1){
		if(filesArr.length+this.files.length>4){
			alert("첨부파일은 최대 " + maxFileCnt + "개 까지 첨부 가능합니다.1");
			return;
		}
	    for (var i = 0; i < Math.min(curFileCnt, remainFileCnt); i++) {
   			 // 파일 배열에 담기,미리보기 처리
            let reader = new FileReader();
			reader.readAsDataURL(this.files[0]);
			
			loadImage(reader,this.files[0]);
		}
    }else if(this.files.length>1 && this.files.length <=4){
		if(filesArr.length+this.files.length>4){
			alert("첨부파일은 최대 " + maxFileCnt + "개 까지 첨부 가능합니다.2");
			return;
		}
		for(let i=0;i<this.files.length;i++){
				let reader = new FileReader();
				reader.readAsDataURL(this.files[i]);
				
				loadImage(reader,this.files[i]);
		}
	}else if(this.files.length>4){
		alert("첨부파일은 최대 " + maxFileCnt + "개 까지 첨부 가능합니다.3");
			return;
	}

	function loadImage(reader,file){
		reader.onload = function () {
				//console.log("after push:", filesArr);
				//console.log("check fileNo:", fileNo);
				// 목록 추가
           		 let htmlData = '';
            	 htmlData += '<div id="photo' + fileNo + '" class="filebox" style="display: inline-block;">';
                 htmlData += '<input type="hidden" name="fileName'+ count +'" value="'+ file +'">' ;
			     htmlData += '<img width="50" height="50" class="pr-photo' + fileNo + ' pr-image" > <div class="delete-button" data-num="'+fileNo+'" >x</div>';
                 htmlData += '</div>';
				 $('.file-list').append(htmlData);
				count++;
				filesArr.push(file);
				$('.pr-photo' + fileNo).attr('src',reader.result);
				//선택한 이미지수 변경
				$('#count').text(filesArr.length + "/4");
				console.log("addcount:" + count);
				$('#photo_count').val(count);
                fileNo++;
				
		};
	}
   
  });
	
			/* 첨부파일 삭제 */
			$(document).on('click','.delete-button',function() {
				let num = $(this).attr('data-num');
			   $("#photo" + num).remove();
				
				filesArr.splice(0,1);
				count--;
			
					
				//선택한 이미지수 변경
				$('#count').text(filesArr.length + "/4");
				$('#photo_count').val(count);
				if(filesArr.length== 0){
					// 초기화
   					$("input[type=file]").val("");
				}
			});	

	/*---------------
	사진 개수 유효성 체크
	------------------*/
	$('button[type="submit"]').click(function(){
		if($('.file-list').children().length == 0){
			$('#photo_valid').text("※1개이상의 사진은 필수로 넣어주세요!");
			return false;
		}else{
			$('#photo_valid').text('');
		}
	});
	
	/*---------------
	제목 작셩 유효성 체크
	------------------*/
	$('button[type="submit"]').click(function(){
		if($('#product_title').val().trim()==''){
			$('#title_valid').text("※제목은 필수로 입력해주세요!");
			$('#product_title').val('').focus();
			return false;
		}else{
			$('#title_valid').text('');
		}
	});
	
	/*---------------
	글 내용 유효성 체크
	------------------*/
	$('button[type="submit"]').click(function(){
		if($('#product_content').val().trim()==''){
			$('#content_valid').text("※설명은 필수로 적어주세요!");
			$('#product_content').val('').focus();
			return false;
		}else{
			$('#content_valid').text('');
		}
	});
	
	
	/*---------------
	가격 숫자 유효성 체크
	------------------*/
	$('button[type="submit"]').click(function(){
		var priceValue = $('#product_price').val();
		var priceIsNum = isNaN(parseFloat(priceValue));
		if(priceIsNum){
			$('#price_valid').text("※가격을 입력해주세요!(숫자만 작성 가능)");
			$('#product_price').val('');
			return false;
		}else{
			$('#price_valid').text('');
		}
	});
	
	

	/*---------------
	 판매/나눔 버튼 클릭 메서드
	------------------*/
	$('.sale-button').click(function(){
		$("#product_category").val(0);
		$('#product_price').attr('type','text');
		$('#product_price').val('');
	});
	$('.share-button').click(function(){
		$("#product_category").val(1);
		$('#product_price').attr('type','hidden');
		$('#product_price').val(0);
		
	});

	/*---------------
	입력 글자수 보여주기
	------------------*/
	
	//input에 내용 입력시 글자 수 체크
	$(document).on('keyup','input[type="text"]',function(){
		//입력한 글자수 구하기
		let inputLength = $(this).val().length;
		
		if(inputLength>15){//300자를 넘어선 경우
			$(this).val($(this).val().substring(0,15));
		}else{//15자 이하인 경우
			//남은 글자수 구하기
			let remain = 0 +inputLength;
			remain += '/15';
			 if($(this).attr('id')=='product_title'){
				//수정폼 글자수
				$('#title_count').text(remain);
			}
		  }
		});
	//textarea에 내용 입력시 글자수 체크
	$(document).on('keyup','textarea',function(){
		//입력한 글자수 구하기
		let inputLength = $(this).val().length;
		
		if(inputLength>300){//300자를 넘어선 경우
			$(this).val($(this).val().substring(0,300));
		}else{//300자 이하인 경우
			//남은 글자수 구하기
			let remain = 0 +inputLength;
			remain += '/300';
			 if($(this).attr('id')=='product_content'){
				//수정폼 글자수
				$('#content_count').text(remain);
			}
		}
		
		
	});
	
	
	/*---------------
	지도 버튼 클릭 이벤트
	------------------*/
	$('#map-button').click(function(){
	     	$('.hide').show();
			$('.page-main').hide();
	     });
	
	 // 취소버튼 클릭 이벤트
    $('#reset_btn').click(function () {
        $('.hide').hide();
		$('.page-main').show();
		$('#output').text('');
		$('#output2').text('');
        $('#placeDetail').val('');
        $('#placeAddress').val('');
    });

    // 등록버튼 클릭 이벤트
    $('#submit_btn').click(function () {
        if ($('#placeAddress').val().trim() == '') {
            alert('지도에서 거래 장소를 클릭해 주세요.');
            return false;
        }
        if ($('#detail').val().trim() == '') {
            alert('상세 장소명을 입력해주세요. ');
            $('#detail').val('').focus();
            return false;
        }
        $('#output2').text($('#detail').val());
        $('#placeDetail').val($('#detail').val());
        $('.hide').hide();
		$('.page-main').show();
    });
	
	

});