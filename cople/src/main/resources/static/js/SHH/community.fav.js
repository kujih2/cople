$(function(){
	/*----------------------
	 * 좋아요 / 싫어요 읽기
	 *---------------------*/
	//좋아요 싫어요 선택여부와 선택한 총개수 표기
	function selectFav(board_num){
		$.ajax({
			url:'getFav',
			type:'post',
			data:{board_num:board_num},
			dataType:'json',
			success:function(param){
				
				var favbutton =  '.favicon[data-num="' + param.board_num + '"][data-favStatus="1"]';
				var hatebutton = '.favicon[data-num="' + param.board_num + '"][data-favStatus="2"]';
				
				if(param.status=='yesFav'){//초기값 좋아요 선택되어 있는것
			  		$(favbutton).attr('src', '../images/fav_alt.png');
				}else if(param.status == 'yesHate'){//초기값 싫어요 선택 되어 있는것
			 		$(hatebutton).attr('src', '../images/hate_alt.png');
				}else if(param.status == 'emptyFav'){//초기값 좋아요 싫어요 아무것도 선택되어 있지않은것
					$(favbutton).attr('src', '../images/fav.png');
					$(hatebutton).attr('src', '../images/hate.png');
				}
				displayFav(param);
			},
			error:function(){
				alert('네트워크 오류');
			}
		});	
	}
	/*----------------------
	 * 좋아요 / 싫어요 등록,삭제
	 *---------------------*/
	$('.favicon').click(function(){
		//콘솔에서 데이터 확인
		console.log('board_num:', $(this).attr('data-num'));
		console.log('fav_status:', $(this).attr('data-favStatus'));
		console.log('fav_date:', $(this).attr('data-favDate'));
		
		$.ajax({
			url:'writeFav',
			type:'post',
			data:{board_num:$(this).attr('data-num'),
				  fav_status:$(this).attr('data-favStatus'),
				  fav_date:$(this).attr('data-favDate')
				  },
			dataType:'json',
			success:function(param){
				if(param.result == 'logout'){
					alert('로그인 후 좋아요를 눌러주세요.');
				}else if(param.result == 'success'){
					displayFav(param);
					console.log('좋아요등록성공');
				}else{
					alert('등록/삭제 시 오류 발생');
				}
			},
			error:function(){
				alert('네트워크 오류!');
			} 
		})
	});

	/*----------------------
	 * 좋아요 표시 공통 함수
	 *---------------------*/
	function displayFav(param){
		let output,output2;
		if(param.status=='yesFav'){//좋아요 선택
			output = '../images/fav_alt.png';
			output2 = '../images/hate.png';
		}else if(param.status == 'yesHate'){//싫어요 선택
			output = '../images/fav.png';
			output2 = '../images/hate_alt.png';
		}else if(param.status == 'noFav'){//좋아요 삭제
			output = '../images/fav.png';
			output2 = '../images/hate.png';
		}else if(param.status == 'noHate'){//싫어요 삭제
			output = '../images/fav.png';
			output2 = '../images/hate.png';
		}
		//문서 객체에 설정
		$('#output_fav').attr('src',output);
		$('#output_hate').attr('src',output2);
		$('#favCount').text(param.favCount);
		$('#hateCount').text(param.hateCount);
		$('#favHateSum').text(param.favHateSum);
	}

	//초기 데이터 표시
	selectFav($('#output_fav').attr('data-num'));
});