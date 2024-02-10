$(function(){
	let message_socket; //웹소켓 식별자
	
	$('.chatListBox').click(function(){
		var chatRoomNum = $(this).find('.chatRoomNum').val();;
		$('#chatRoom_num').val(chatRoomNum);
		
		connectWebSocket();//웹소켓 생성

		
});
	
	
		
	/*-----------------------
	 * 웹소켓 연결
     *-----------------------*/
	function connectWebSocket(){
		message_socket = new WebSocket("ws://localhost:8000/message-ws");
		message_socket.onopen=function(evt){
			console.log("채팅페이지 접속 : " + $('#talkDetail').length);
			if($('#talkDetail').length == 1){
				message_socket.send("msg:");
			}
		};
		//서버로부터 메시지를 받으면 호출되는 함수 지정
		message_socket.onmessage=function(evt){
			let data = evt.data;
			if($('#talkDetail').length == 1 && 
			                data.substring(0,4) == 'msg:'){
				selectMsg();
			}
		};
		message_socket.onclose=function(evt){
			//소켓이 종료된 후 부과적인 작업이 있을 경우 명시
			console.log('chat close');
		}
		// 소켓 연결 중에 오류가 발생한 경우 처리
    	message_socket.onerror = function (evt) {
        console.error('WebSocket 오류 발생:', evt);
    	};
	}
	
	/*-----------------------
	 * 채팅하기
     *-----------------------*/
	//채팅 데이터 읽기
	function selectMsg(){
		//서버와 통신
		$.ajax({
			url:'../market/marketChatDetailAjax',
			type:'post',
			data:{chatRoom_num:$('#chatRoom_num').val()},
			dataType:'json',
			success:function(param){
				if(param.result == 'logout'){
					alert('로그인 후 사용하세요!');
					message_socket.close();
				}else if(param.result == 'success'){
					
					//메시지 표시 UI 초기화
					$('#chatting_message').empty();
					$('#product_detail').empty();
						let output_product ='';
					$(param.product_detail).each(function(index,item){
						let product_sale = '판매중';
						if(item.product_sale==1){
							product_sale == '판매 완료'
						}
						output_product += '<div class="product_detailBox"> <span class="title">'+item.product_title+'</span> <br>';
						output_product +='<span class="price">'+item.product_price+' 원</span>';
						output_product += '<div class="sale">'+product_sale+'</div>';
						output_product += '<img src="/upload/'+item.filename0+'" width="70" height="70"></div>';
						$('#product_detail').append(output_product);
					});
					
					let chat_date = '';
					$(param.list).each(function(index,item){
						let output = '';
						//날짜 추출
						if(chat_date != item.chat_regDate.split(' ')[0]){
							chat_date = item.chat_regDate.split(' ')[0];
							output += '<div class="date-position"><span>'+chat_date+'</span></div>';
						}
						
					
							//멤버등록 메시지가 아닌 일반 메시지
							if(item.mem_num == param.user_num){
								output += '<div class="from-position">'+item.mem_id;
								output += '<div>';
							}else{
								output += '<div class="to-position">';
								output += '<div class="space-photo">';
								output += '<img src="../member/viewProfile?mem_num='+item.mem_num+'" width="40" height="40" class="my-photo">';
								output += '</div><div class="space-message">';
								output += item.mem_id;
							}
							output += '<div class="item">';
							output += item.chat_readCheck + '<span>' + item.chat_message.replace(/\r\n/g,'<br>').replace(/\r/g,'<br>').replace(/\n/g,'<br>') + '</span>';
							//시간 추출
							output += '<div class="align-right">'+item.chat_regDate.split(' ')[1]+'</div>';
							output += '</div>';
							output += '</div><div class="space-clear"></div>';
							output += '</div>';
					
						
						//문서 객체에 추가
						$('#chatting_message').append(output);
						//스크롤을 하단에 위치시킴
						$('#chatting_message').scrollTop($('#chatting_message')[0].scrollHeight);
					});
				}else{
					alert('채팅 메시지 읽기 오류 발생');
					message_socket.close();
				
				}
			},
			error:function(){
				alert('네트워크 오류 발생');
				message_socket.close();
				
			}
		});
	}
	//메시지 입력 후 enter 이벤트 처리
	$('#chat_message').keydown(function(event){
		if(event.keyCode == 13 && !event.shiftKey){
			$('#detail_form').trigger('submit');
		}
	});
	//채팅 메시지 등록
	$('#detail_form').submit(function(event){
		if($('#chat_message').val().trim()==''){
			alert('메시지를 입력하세요');
			$('#chat_message').val('').focus();
			return false;
		}
		
		if($('#chat_message').val().length>1333){
			alert('메시지를 1333자까지만 입력 가능합니다.');
			return false;
		}
		
		//form 이하의 태그에 입력한 데이터를 모두 읽어옴
		let form_data = $(this).serialize();
		
		//서버와 통신
		$.ajax({
			url:'../market/writeChatAjax',
			type:'post',
			data:form_data,
			dataType:'json',
			success:function(param){
				if(param.result == 'logout'){
					alert('로그인해야 작성할 수 있습니다.');
					message_socket.close();
				}else if(param.result == 'success'){
					//폼 초기화
					$('#message').val('').focus();
					//메시지가 저장되었다고 소켓에 신호를 보냄
					message_socket.send('msg:');
				}else{
					alert('채팅 메시지 등록 오류');
					message_socket.close();
				}
			},
			error:function(){
				alert('네트워크 오류');
		
			}
		});		
		
		//기본 이벤트 제거
		event.preventDefault();
	});
	
});