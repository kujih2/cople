<!DOCTYPE html>
<html lang="ko">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
body {
            overflow: scroll !imporatant;  overflow-y: scroll !imporatant; 
        } 
 html{
 		overflow: scroll !imporatant;  overflow-y: scroll !imporatant; 
 }

table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
}

th, td {
    border: 1px solid #ddd;
    padding: 8px;
    text-align: left;
}

th {
    background-color: #f2f2f2;
}

tr:nth-child(even) {
    background-color: #f9f9f9;
}

select {
    padding: 6px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

.form-container {
    position: relative;
    overflow: hidden;
}

.form-container:before {
    content: "";
    position: absolute;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    background: linear-gradient(to right, #fff 0%, rgba(255, 255, 255, 0) 100%);
    z-index: 1;
}

form {
    position: relative;
    z-index: 2;
}

	.abutton {
        margin-top: 20px;
        padding: 10px 20px; /* 버튼 크기 조정을 위한 패딩 */
        font-size: 16px; /* 버튼 텍스트 크기 조정 */
        background-color: #4CAF50; /* 전송 버튼의 초록색 배경 */
        color: #fff; /* 전송 버튼 텍스트의 흰색 색상 */
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }

    .abutton.cancel {
        background-color: #f44336; /* 취소 버튼의 빨간색 배경 */
    }
</style>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://cdn.tiny.cloud/1/t3uy2nxa803mx017b91y9xkrrreyjff02vlga126sum11bpa/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
    <script>
      tinymce.init({
        selector: '#mytextarea'
      });
    </script>
<h2>첨삭 요청하기</h2>
<form action="send_advice" method="post" id="send_insert"  enctype="multipart/form-data">
	<input type="hidden" name="sender" value="${login_user.mem_num}">
	<input type="hidden" name="receiver" value="${receive_user.mem_num}">
	<table style="text-align:center;">
		<tr>
			<td colspan="4">보내는 사람</td>
			<td colspan="4">${login_user.id}</td>
		</tr>
		<tr>
			<td colspan="4">받는 사람</td>
			<td colspan="4">${receive_user.id}</td>
		</tr>
		<tr>
			<td colspan="4">내용</td>
			<td colspan="4">
			<textarea id="advice_content" name="advice_content" style="display:none;"></textarea>
			<div class="container">
				 <textarea id="editor"></textarea>
			</div>
			</td>
		</tr>
		<tr>
			<td colspan="4">파일첨부</td>
			<td colspan="4">
				파일업로드
				<input type="file" name="upload" id="upload"><br>
				<p style="color:red;" id="uploadMessage">첨삭받으실 이력서 또는 포트폴리오를 첨부해주세요!</p>
			</td>
		</tr>
	</table>
	<div class="button" style="text-align:center">
		<input type="submit" class="abutton" id="transmit" value="전송">
		<input type="button" value="취소" id="cancleButton" class="abutton cancel">
	</div>
</form>
<script>
$(function(){
    var plugins = [
        "advlist", "autolink", "lists", "link", "image", "charmap", "print", "preview", "anchor",
        "searchreplace", "visualblocks", "code", "fullscreen", "insertdatetime", "media", "table",
        "paste", "code", "help", "wordcount", "save"
    ];
    var edit_toolbar = 'formatselect fontselect fontsizeselect |'
               + ' forecolor backcolor |'
               + ' bold italic underline strikethrough |'
               + ' alignjustify alignleft aligncenter alignright |'
               + ' bullist numlist |'
               + ' table tabledelete |'
               + ' link image';

    tinymce.init({
    	language: "ko_KR", //한글판으로 변경
        selector: '#editor',
        height: 380,
        menubar: false,
        plugins: plugins,
        toolbar: edit_toolbar,
        
        /*** image upload ***/
        image_title: true,
        /* enable automatic uploads of images represented by blob or data URIs*/
        automatic_uploads: true,
        /*
            URL of our upload handler (for more details check: https://www.tiny.cloud/docs/configure/file-image-upload/#images_upload_url)
            images_upload_url: 'postAcceptor.php',
            here we add custom filepicker only to Image dialog
        */
        file_picker_types: 'image',
        /* and here's our custom image picker*/
        file_picker_callback: function (cb, value, meta) {
            var input = document.createElement('input');
            input.setAttribute('type', 'file');
            input.setAttribute('accept', 'image/*');

            /*
            Note: In modern browsers input[type="file"] is functional without
            even adding it to the DOM, but that might not be the case in some older
            or quirky browsers like IE, so you might want to add it to the DOM
            just in case, and visually hide it. And do not forget do remove it
            once you do not need it anymore.
            */
            input.onchange = function () {
                var file = this.files[0];

                var reader = new FileReader();
                reader.onload = function () {
                    /*
                    Note: Now we need to register the blob in TinyMCEs image blob
                    registry. In the next release this part hopefully won't be
                    necessary, as we are looking to handle it internally.
                    */
                    var id = 'blobid' + (new Date()).getTime();
                    var blobCache =  tinymce.activeEditor.editorUpload.blobCache;
                    var base64 = reader.result.split(',')[1];
                    var blobInfo = blobCache.create(id, file, base64);
                    blobCache.add(blobInfo);

                    /* call the callback and populate the Title field with the file name */
                    cb(blobInfo.blobUri(), { title: file.name });
                };
                reader.readAsDataURL(file);
            };
            input.click();
        },
        /*** image upload ***/
        
        content_style: 'body { font-family:Helvetica,Arial,sans-serif; font-size:14px }'
    });
});

$(document).ready(function() {
    $('#cancleButton').on('click', function() {
        window.close();
    });
	
	$("#transmit").click(function(){
		
		let fileName = $('#upload').val();
        
        // 파일이 선택되었는지 확인
        if (!fileName) {
            alert('첨삭받으실 파일을 선택해주세요.');
            return false; // 전송 중단
        }
        
        var content = tinymce.activeEditor.getContent();
        $('#advice_content').val(content);
        
        if($('#advice_content').val().trim()==''){
        	alert('내용을 입력하세요!');
        	return;
        }
	});	
	
	$("#upload").change(function() {
        var fileName = $(this).val();

        // 파일이 선택되었는지 확인
        if (fileName) {
            // 파일이 선택되었을 때 메시지 숨기기
            $("#uploadMessage").hide();
        } else {
            // 파일이 선택되지 않았을 때 메시지 보이기
            $("#uploadMessage").show();
        }
    });
 
});

</script>
</html>
