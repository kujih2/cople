var fileNo = 0;
var filesArr = new Array();

/* 첨부파일 추가 */
function addFile(obj){
    var maxFileCnt = 4;   // 첨부파일 최대 개수
    var attFileCnt = document.querySelectorAll('.filebox').length;    // 기존 추가된 첨부파일 개수
    var remainFileCnt = maxFileCnt - attFileCnt;    // 추가로 첨부가능한 개수
    var curFileCnt = obj.files.length;  // 현재 선택된 첨부파일 개수

    // 첨부파일 개수 확인
    if (curFileCnt > remainFileCnt) {
        alert("첨부파일은 최대 " + maxFileCnt + "개 까지 첨부 가능합니다.");
    }

    for (var i = 0; i < Math.min(curFileCnt, remainFileCnt); i++) {

        const file = obj.files[i];

   			 // 파일 배열에 담기,미리보기 처리
            var reader = new FileReader();
			reader.readAsDataURL(file);
			
			reader.onload = function () {
                filesArr.push(file);
				$('.pr-photo').attr('src',reader.result);
            };
           
			//선택한 이미지수 변경
			$('#count').text(fileNo+1 + "/4");
			
            // 목록 추가
            let htmlData = '';
            htmlData += '<div id="photo' + fileNo+ '" class="filebox">';
            htmlData += '<input type="hidden" value="'+ file.name+'">' ;
			htmlData += '<img src="" width="50" height="50" class="pr-photo" id="photo1"> <div class="delete-button" onclick="deleteFile(' + fileNo + ');">x</div>';
            htmlData += '</div>';
            $('.file-list').append(htmlData);
            fileNo++;
       		
			/* 첨부파일 삭제 */
			function deleteFile(num) {
			    document.querySelector("#photo" + num).remove();
			    filesArr[num].is_delete = true;
			}

           
	   
    }
    // 초기화
    document.querySelector("input[type=file]").value = "";
}

