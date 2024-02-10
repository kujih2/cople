<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>    
<script type="text/javascript">
$(document).ready(function() {
	/*======================================
	* 폼 제출 시작
	========================================*/
	$('#submit_btn').click(function(){
		$('label').next().text('')
		/*======================================
		* 유효성체크
		========================================*/
		let items = document.querySelectorAll('.register-input');

		for(let i = 0; i<items.length;i++){
			if(items[i].value.trim()==''){
				let label = document.querySelector('label[for="'+items[i].id+'"]');
				$('label[for="' + items[i].id + '"]').next('span').text(label.textContent + ' 항목은 필수 입력')[0].scrollIntoView();
				return;
			}else{
				$('label[for="' + items[i].id + '"]').next('span').text('');
			}
		}
		if(!/^[A-Za-z0-9]{4,12}$/.test($('#passwd').val())){
			$('label[for="passwd"]').next().text('영문,숫자만 4~12자 입력해야합니다.')[0].scrollIntoView()
			return;
		}
		if(!/^\d{3}-\d{4}-\d{4}$/.test($('#phone').val())){
			$('label[for="phone"]').next().text('000-0000-0000 형식으로 입력해야합니다.')[0].scrollIntoView()
			return;
		}
		if(!/^\S+@\S+\.\S+$/.test($('#email').val())){			
			$('label[for="email"]').next().text('XXX@XXX.XXX 형식으로 입력해야합니다.')[0].scrollIntoView()
			return;
		}
		if(!/^\d{6}$/.test($('#birth').val())){			
			$('label[for="birth"]').next().text('900514 와 같은 식으로 입력하세요')[0].scrollIntoView()
			return;
		}
		if($('#uploaded_certify_photo')[0].files.length==0){
			$('label[for="certify_photo_name"]').next().text('파일을 업로드해야 합니다')[0].scrollIntoView()
			return;
		}
		if($('#upload')[0].files.length==0){
			$('label[for="filename"]').next().text('파일을 업로드해야 합니다')[0].scrollIntoView()
			return;
		}
		if($('#location_api').val()==''){
			$('label[for="location_status"]').next().text('위치를 선택해야 합니다.')[0].scrollIntoView()
			return;
		}
		if($('#advice').val()==''){
			$('label[for="advice"]').next().text('한마디 해주세요!')[0].scrollIntoView()
			return;
		}
		if($('#workstart').val()=== "" ){
			$('label[for="workstart_status"]').next().text('일시를 선택해야 합니다')[0].scrollIntoView()
			return;
		}


		
		/*======================================
		* 폼 제출 비동기통신 실행
		========================================*/
		
		var form1Data = new FormData($('#member_register')[0]);
		//서버와 통신
		$.ajax({
			url:'registerUser1',
			type:'post',
			data: form1Data,
			dataType:'json',
	        processData: false,  // Prevent jQuery from processing the data
	        contentType: false,
			success:function(param){
				if(param.result == 'success1'){
					window.location.href = '/member/result';
				}else if(param.result == 'success2'){
					$('#mem_num').val(param.mem_num);
					submit_secondForm();
				}
			},
			error:function(){
				alert('네트워크 오류 발생 ajax registerUSer1')
			}
		});

	});
	
	function submit_secondForm() {
		var form2Data = new FormData($('#emp_register')[0]);
		//서버와 통신
		$.ajax({
			url:'registerUser2',
			type:'post',
			data: form2Data,
			dataType:'json',
	        processData: false,  // Prevent jQuery from processing the data
	        contentType: false,
			success:function(param){
				if(param.result=='success'){
					window.location.href = '/member/result';
				}
			},
			error:function(){
				alert('네트워크 오류 발생2')
			}
		});
	}
	/*======================================
	* ID 중복검사 체크
	========================================*/
	let idChecked=0;
	let timeoutId;
	$('#id').keydown(function(){
		idChecked = 0;
		
		if (timeoutId) {
	        clearTimeout(timeoutId); // Clear any previously set timeout
	    }
		
		timeoutId = setTimeout(function(){
			if(!/^[A-Za-z0-9]{4,12}$/.test($('#id').val())){
				document.getElementById('message_id').textContent = '영문 또는 숫자 사용, 최소 4자 ~ 최대 12자를 사용하세요!';
				document.getElementById('message_id').scrollIntoView();
				return;
			}else{
				$.ajax({
					url:'/member/confirmId',
					type:'post',
					data:{id:$('#id').val()},
					dataType:'json',
					success:function(param){
						if(param.result == 'idNotFound'){
							document.getElementById('message_id').textContent = ''
						}else if(param.result == 'idDuplicated'){
							document.getElementById('message_id').textContent = '중복된 ID'
						}
					},
					error:function(){
						idChecked = 0;
						alert('네트워크 오류 발생')
					}
				});
			}
			
			
		},200);
		
		
		
	});
	/*======================================
	* 우편번호 검색
	========================================*/
	$('#zipcode').click(function(){
		execDaumPostcode();
	});
	
	
	/*======================================
	* 폼 선택
	========================================*/
	$('.select-box div').click(function(){
		$(this).parent().children('div').css("background-color","");
		$(this).parent().children('div').css("color","");
		$(this).css("background-color","#0090F9");
		$(this).css("color","white");
		$(this).parent().prev().val($(this).data('index'))
	});
	$('.allow-multiple').click(function(){
		if($(this).hasClass('chosen-box')){
			$(this).removeClass('chosen-box')
		}else{
			$(this).addClass('chosen-box');
			$('.non-multiple').removeClass('chosen-box');
		}
		var chosenBoxes = $('.chosen-box');
		var totalChosen = '';
		$(this).parent().prev().val('');
		for(var i = 0; i< chosenBoxes.length; i++){
			if(i==0){
				totalChosen += $(chosenBoxes[i]).data('index');
			}else{
				totalChosen += ","+$(chosenBoxes[i]).data('index');
			
			}
		}
			$(this).parent().prev().val(totalChosen);
	});
	$('.non-multiple').click(function(){
		if($(this).hasClass('chosen-box')){
			$(this).removeClass('chosen-box')
		}else{
			$('.allow-multiple').removeClass('chosen-box');
			$(this).addClass('chosen-box');
		}
		var chosenBoxes = $('.chosen-box');
		var totalChosen = '';
		$(this).parent().prev().val('');
		for(var i = 0; i< chosenBoxes.length; i++){
			if(i==0){
				totalChosen += $(chosenBoxes[i]).data('index');
			}else{
				totalChosen += ","+$(chosenBoxes[i]).data('index');
			
			}
		}
			$(this).parent().prev().val(totalChosen);
	});
	$('.file-select-container').hover(
		function(){
			$('.file-select').css('background-color',"#e5e7eb")
		},
		function(){
			$('.file-select').css('background-color',"")
		}
	)
	$('#file-select-container1').click(function(){
		$('#uploaded_certify_photo').click();
	});
	$('#uploaded_certify_photo').on('change',function(){
	    if (this.files && this.files.length > 0) {
			let uploadedFileName = $(this)[0].files[0].name;
			$('#uploaded_file1').text(uploadedFileName);
	    }else{
			$('.uploaded-file').text("선택된 파일이 없습니다.");
	    }
	});
	$('#file-select-container2').click(function(){
		$('#upload').click();
	});
	$('#upload').on('change',function(){
	    if (this.files && this.files.length > 0) {
			let uploadedFileName = $(this)[0].files[0].name;
			$('#uploaded_file2').text(uploadedFileName);
	    }else{
			$('.uploaded-file').text("선택된 파일이 없습니다.");
	    }
	});
	
	
	
	
	
	


});
</script>