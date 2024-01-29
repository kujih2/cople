$(function(){
	/*----------------------------
	 *          회원가입
	 *----------------------------*/
	//아이지 중복 여부 저장 변수 : 0은 아이지 중복 또는 중복 체크 미실행, 1은 아이디 미중복
	let checkId = 0;
	
	//아이디 중복 체크
	$('#confirmId').click(function(){
		if($('#id').val().trim()==''){
			$('#message_id').css('color','red').text('아이디를 입력하세요');
			$('#id').val('').focus();
			return;
		}
		
		//서버와 통신
		$.ajax({
			url:'confirmId',
			type:'post',
			data:{id:$('#id').val()},
			dataType:'json',
			success:function(param){
				if(param.result == 'idNotFound'){
					$('#message_id').css('color','#000').text('등록 가능 ID');
					checkId = 1;
				}else if(param.result == 'idDuplicated'){
					$('#message_id').css('color','red').text('중복된 ID');
					$('#id').val('').focus();
					checkId = 0;
				}else if(param.result == 'notMatchPattern'){
					$('#message_id').css('color','red').text('영문,숫자만 4~12자 입력');
					$('#id').val('').focus();
					checkId = 0;
				}else{
					checkId = 0;
					alert('ID 중복 체크 오류');
				}
			},
			error:function(){
				checkId=0;
				alert('네트워크 오류 발생')
			}
		});//end of ajax
	});//end of click
	
	//아이디 중복 안내 메시지 초기화 및 아이디 중복 값 초기화
	$('#member_register #id').keydown(function(){
		checkId=0;
		$('#message_id').text('');
	});//end of keydown
	
	//submit 이벤트 발생시 아이디 중복 체크 여부 확인
	$('#member_register').submit(function(){
		if(checkId==0){
			$('#message_id').css('color','red').text('아이디 중복 체크 필수');
			if($('#id').val().trim()==''){
				$('#id').val('').focus();
			}
			return false;
		}
	});//end of submit
	

	//인증하기 버튼을 눌렀을 때 동작
	$("#emailAuth").click(function() {
		
    	const email = $("#email").val(); //사용자가 입력한 이메일 값 얻어오기
    	
    	//Ajax로 전송
        $.ajax({
        	url : 'EmailAuth',
        	data : {
        		email : email
        	},
        	type : 'POST',
        	dataType : 'json',
        	success : function(param) {

        		$("#authCode").attr("disabled", false);
        		alert("인증 코드가 입력하신 이메일로 전송 되었습니다."+param.code);
       		},
       		error:function(){
				
				alert('네트워크 오류 발생')
			}
        }); //End Ajax
    });
	
	
	
	//인증 코드 비교
    $("#authCode").on("focusout", function() {
    	const inputCode = $("#authCode").val(); //인증번호 입력 칸에 작성한 내용 가져오기
    	
    	console.log("입력코드 : " + inputCode);
    	console.log("인증코드 : " + code);
    		
    	if(Number(inputCode) === code){
        	$("#emailAuthWarn").html('인증번호가 일치합니다.');
        	$("#emailAuthWarn").css('color', 'green');
    		$('#emailAuth').attr('disabled', true);
    		$('#email').attr('readonly', true);
    		$("#registerBtn").attr("disabled", false);
    	}else{
        	$("#emailAuthWarn").html('인증번호가 불일치 합니다. 다시 확인해주세요!');
        	$("#emailAuthWarn").css('color', 'red');
        	$("#registerBtn").attr("disabled", true);
    	}
    });

});


