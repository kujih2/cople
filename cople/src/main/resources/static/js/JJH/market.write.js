$(function(){
var fileNo = 0;
/* 첨부파일 추가 */
  $('#upload').change(function(){
	var count = 0;
    var maxFileCnt = 4;   // 첨부파일 최대 개수
    var attFileCnt = document.querySelectorAll('.filebox').length;    // 기존 추가된 첨부파일 개수
    var remainFileCnt = maxFileCnt - attFileCnt;    // 추가로 첨부가능한 개수
    var curFileCnt = this.files.length;  // 현재 선택된 첨부파일 개수

    // 첨부파일 개수 확인
    

   if(this.files.length==1){
		if(count+this.files.length>4){
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
		if(count+this.files.length>4){
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
            	 htmlData += '<div id="photo' + fileNo + '" class="filebox">';
                 htmlData += '<input type="hidden" value="'+ file.name+'">' ;
			     htmlData += '<img width="50" height="50" class="pr-photo' + fileNo + ' pr-image" > <div class="delete-button" data-num="'+fileNo+'" >x</div>';
                 htmlData += '</div>';
				 $('.file-list').append(htmlData);
			
				$('.pr-photo' + fileNo).attr('src',reader.result);
				count++;
				//선택한 이미지수 변경
				$('#count').text(count + "/4");
                fileNo++;
		};
	}
			/* 첨부파일 삭제 */
			$(document).on('click','.delete-button',function() {
				let num = $(this).attr('data-num');
				console.log("before delcount:" + count);
			   $("#photo" + num).remove();
				count--;
				//선택한 이미지수 변경
				$('#count').text(count + "/4");
				console.log("count:" + count);
			});
    // 초기화
   $("input[type=file]").val("");
  });


	/*---------------
	 판매/나눔 버튼 클릭 메서드
	------------------*/
	$('.sale-button').click(function(){
		$("#product_category").val(0);
		$('#product_price').attr('type','text');
	});
	$('.share-button').click(function(){
		$("#product_category").val(0);
		$('#product_price').attr('type','hidden');
		$('#product_price').val('');
		
	});
	


});