<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="main_content">
	<h2 class="align-center">CodingHub에 오신것을 환영합니다!</h2>

	<form action="registerUser1" id="member_register" enctype="multipart/form-data">
		<input type="hidden" name="auth_index" value="${auth_index}">
		<div class="text-between-lines">
			<span class="line"></span>
				회원가입에 필요한 기본정보를 입력해주세요
			<span class="line"></span>
		</div><br>
			
		<label for="id">아이디</label>
		<span id="message_id"></span><br>
		<input class="register-input" type="text" placeholder="영문,숫자만 4~12자" autocomplete="off" id="id" name="id" /><br>
		
					
					
		<label for="name">이름</label>
		<span></span><br>
		<input class="register-input" type="text" id="name" name="name"/><br>
			
		<label for="nick_name">닉네임</label>
		<span></span><br>
		<input class="register-input" type="text" id="nick_name" name="nick_name"/><br>
			
		<label for="passwd">비밀번호</label>
		<span></span><br>
		<input class="register-input" type="password" id="passwd" placeholder="영문,숫자만 4~12자" name="passwd"/><br>
		
		<label for="phone">전화번호</label>
		<span></span><br>
		<input class="register-input" type="text" id="phone" name="phone"/><br>
			
		<label for="email">이메일</label>
		<span></span><br>
		<input class="register-input" type="text" id="email" name="email"/><br>
			
			
		<label for="birth">생년월일</label>
		<span></span><br>
		<input class="register-input" type="text" id="birth" name="birth"/><br>
			
		<label for="zipcode">우편번호</label>
		<span></span>
		<input class="register-input" type="text" id="zipcode" name="zipcode"/><br>
			
		<label for="address1">주소</label>
		<span></span><br>
		<input class="register-input" type="text" id="address1" name="address1"/><br>
			
		<label for="address2">상세주소</label>
		<span></span><br>
		<input class="register-input" type="text" id="address2" name="address2"/><br>
			
		<label for="gender">성별</label>
		<span></span><br>
		<input class="register-input" type="hidden" name="gender" id="gender">
		<div class="select-box">
			<div data-index="M">남자</div>
			<div data-index="F">여자</div>
		</div>
			
		<label for="push">알림수신여부</label>
		<span></span><br>
		<input class="register-input" type="hidden" name="push" id="push">
		<div class="select-box">
			<div data-index="Y">예</div>
			<div data-index="N">아니오</div>
		</div>
			
		<label for="certify_photo_name">
		<c:if test="${auth_index==1}">수강생 인증사진</c:if>
		<c:if test="${auth_index==2}">수강생 인증사진</c:if>
		<c:if test="${auth_index==3}">강사 인증사진</c:if>
		</label>
		<span></span><br>
		<div class="file-select-container" id="file-select-container1">
			<div class="file-select" id="file-select1">파일 선택</div>
			<div class="uploaded-file" id="uploaded_file1">선택된 파일이 없습니다.</div>
		</div>
		<input type="file" name="uploaded_certify_photo" id="uploaded_certify_photo" style="display:none;"><br>

	</form>
	<c:if test="${auth_index==2}">

		<form action="registerUser2" method="post" enctype="multipart/form-data" id="emp_register">
			<input type="hidden" name="auth_index" value="${auth_index}">		
			<input type="hidden" name="mem_num" id="mem_num">
			<div class="text-between-lines">
			  <span class="line"></span>
			  취업 정보를 입력해주세요
			  <span class="line"></span>
			</div><br>
			
			<label for="comsize">회사규모</label>
			<span></span><br>
			<input class="register-input" type="hidden" name="comsize" id="comsize">
			<div class="select-box">
				<div data-index="스타트업">스타트업</div>
				<div data-index="중소">중소</div>
				<div data-index="중견">중견</div>
				<div data-index="대기업">대기업</div>
			</div>

			
			<label for="compeople">기업인력규모</label>
			<span></span><br>
			<input class="register-input" type="hidden" name="compeople" id="compeople">
			<div class="select-box">
				<div data-index="5~10인">5~10인</div>
				<div data-index="10~30인">10~30인</div>
				<div data-index="30~50인">30~50인</div>
				<div data-index="50~100인">50~100인</div>
			</div>
			<label for="field">지원분야</label>
			<span></span><br>
			<input class="register-input" type="hidden" name="field" id="field">
			<div class="select-box">
				<div data-index="0">SI</div>
				<div data-index="1">SM</div>
				<div data-index="2">솔루션</div>
				<div data-index="3">서비스</div>
				<div data-index="4">기타</div>
				<div data-index="5">기타(非IT)</div>
			</div>

			<label for="role">직무</label>
			<span></span><br>
			<input class="register-input" type="hidden" name="role" id="role">
			<div class="select-box">
				<div data-index="0">백엔드</div>
				<div data-index="1">프론트엔드</div>
				<div data-index="2">풀스택</div>
				<div data-index="3">데브옵스</div>
				<div data-index="4">임베디드</div>
				<div data-index="5">DBA</div>
				<div data-index="6">기타</div>
			</div>
				
			<label for="career">지원형태</label>
			<span></span><br>
			<input class="register-input" type="hidden" name="career" id="career">
			<div class="select-box">
				<div data-index="신입">신입</div>
				<div data-index="중고신입">중고신입</div>
				<div data-index="기타">기타</div>
			</div>

			
			<label for="salary_status">연봉 공개 여부</label>
			<span></span>
			<input class="register-input" type="hidden" name="salary_status" id="salary_status">
			<div class="select-box">
				<div data-index="0">공개</div>
				<div data-index="1">비공개</div>
			</div>
			<label for="salary">연봉(만원)</label>
			<span></span>
			<input class="register-input" type="hidden" name="salary" id="salary">
			<div class="select-box">
				<div data-index="0">~2,600</div>
				<div data-index="1">2,600~3,000</div>
				<div data-index="2">3,000~3,400</div>
				<div data-index="3">3,400~3,800</div>
				<div data-index="4">3,800~4,200</div>
				<div data-index="5">4,200~</div>
			</div>
			
			<label for="periodtime">수료 후 준비기간</label>
			<span></span><br>
			<input class="register-input" type="hidden" name="periodtime" id="periodtime">
			<div class="select-box">
				<div data-index="0">수료 전</div>
				<div data-index="1">1개월 이내</div>
				<div data-index="2">1~3개월</div>
				<div data-index="3">3~6개월</div>
				<div data-index="4">6~12개월</div>
				<div data-index="5">12개월 이상</div>
			</div>
			
			<label for="education">학력(*졸업예정 포함)</label>
			<span></span><br>
			<input class="register-input" type="hidden" name="education" id="education">
			<div class="select-box">
				<div data-index="0">~고졸</div>
				<div data-index="1">전문대졸</div>
				<div data-index="2">대졸(수도권)</div>
				<div data-index="3">대졸(지방)</div>
				<div data-index="4">대학원</div>
				<div data-index="5">기타</div>
			</div>
			
			<label for="major">전공 유무</label>
			<span></span><br>
			<input class="register-input" type="hidden" name="major" id="major">
			<div class="select-box">
				<div data-index="전공">전공</div>
				<div data-index="비전공">비전공</div>
			</div>
			
			<label for="certification">취업 당시 보유 자격증</label>
			<span></span><br>
			<input class="register-input" type="hidden" name="certification" id="certification">
			<div class="multiple-choice">
				<div data-index="0">없음</div>
				<div data-index="1">정보처리기사(필기)</div>
				<div data-index="2">정보처리기사(실기)</div>
				<div data-index="3">SQLD</div>
				<div data-index="4">AWS</div>
				<div data-index="5">기타</div>
			</div>

			<label for="location">취업회사 지역</label>
			<span></span><br>
			<input class="register-input" type="hidden" name="location" id="location">
			<div class="select-box">
				<div data-index="0">구로/가산<br>디지털단지</div>
				<div data-index="1">강남</div>
				<div data-index="2">판교</div>
				<div data-index="3">DMC(상암)</div>
				<div data-index="4">영등포</div>
				<div data-index="5">시청,종로</div>
				<div data-index="6">기타</div>
			</div>

				
			<label for="location_status">지도에서 선택하기</label>
			<span></span><br>
				<div class="map_wrap">
					<div id="map" style="width: 100%; height: 300px; position: relative; overflow: hidden;"></div>
					<div class="hAddr">
						<span class="title" style="display:none;">지도중심기준 행정동 주소정보</span>
        				<span id="centerAddr" style="display:none;"></span>
					</div>
					<input type="hidden" id="location_api" name="location_api" value="">
					<input type="hidden" id="location_api_lat" name="location_api_lat" value="">
					<input type="hidden" id="location_api_lng" name="location_api_lng" value="">
				</div>
				<br>
			<label for="workstart_status">취업일시</label>
			<span></span><br>
			<div id="workstart_container">
				<input type="month" id="workstart" name="workstart" value=""><br>
				<input class="register-input" type="hidden" name="workstart_status" id="workstart_status">
				<div class="select-box" id="workstart_box">
					<div data-index="0">공개</div>
					<div data-index="1">비공개</div>
				</div>
			</div>
			
			<label for="filename">합격인증</label>
			<span></span><br>
			<span id="certify_instructor">최종합격 문자/메일 혹은 명함을 첨부해주세요!</span>
		<div class="file-select-container" id="file-select-container2">
			<div class="file-select">파일 선택</div>
			<div class="uploaded-file" id="uploaded_file2">선택된 파일이 없습니다.</div>
		</div>
			<input type="file" id="upload" name="upload" style="display:none;"><br>
				
			<label for="advice">후배 쌍용인들에게 조언 한 마디!</label>
			<span></span><br>
			<input type="text" id="advice" name="advice">
				
		</form>


		<br>
		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4e592360b98e7e7af7c0620352a4709c&libraries=services"></script>
		<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new kakao.maps.LatLng(37.499372511200875,
						127.0332593788492), // 지도의 중심좌표
				level : 7
			// 지도의 확대 레벨
			};

			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption);

			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();

			var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
			infowindow = new kakao.maps.InfoWindow({
				zindex : 1
			}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

			// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
			searchAddrFromCoords(map.getCenter(), displayCenterInfo);

			// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
			kakao.maps.event
					.addListener(
							map,
							'click',
							function(mouseEvent) {
								searchDetailAddrFromCoords(
										mouseEvent.latLng,
										function(result, status) {
											if (status === kakao.maps.services.Status.OK) {
												var detailAddr = !!result[0].road_address ? '<div>도로명주소 : '
														+ result[0].road_address.address_name
														+ '</div>'
														: '';
												detailAddr += '<div>지번 주소 : '
														+ result[0].address.address_name
														+ '</div>';

												var content = '<div class="bAddr">'
														+ '<span class="title">법정동 주소정보</span>'
														+ detailAddr + '</div>';
												//주소정보를 입력폼에 저장
												var result = result[0].address.address_name;

												document
														.getElementById('location_api').value = result;

												// 마커를 클릭한 위치에 표시합니다 
												marker
														.setPosition(mouseEvent.latLng);
												marker.setMap(map);

												// 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
												infowindow.setContent(content);
												infowindow.open(map, marker);
											}
										});
							});

			// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
			kakao.maps.event.addListener(map, 'idle', function() {
				searchAddrFromCoords(map.getCenter(), displayCenterInfo);
			});

			function searchAddrFromCoords(coords, callback) {
				// 좌표로 행정동 주소 정보를 요청합니다
				geocoder.coord2RegionCode(coords.getLng(), coords.getLat(),
						callback);
			}

			//좌표의 lat, lng 값 얻어내기
			var lat;
			var lng;

			function searchDetailAddrFromCoords(coords, callback) {
				// 좌표로 법정동 상세 주소 정보를 요청합니다
				geocoder.coord2Address(coords.getLng(), coords.getLat(),
						callback);
				lat = coords.getLat();
				lng = coords.getLng();

				//좌표 정보를 입력폼에 hidden으로 저장
				document.getElementById('location_api_lat').value = lat;
				document.getElementById('location_api_lng').value = lng;
			}

			// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
			function displayCenterInfo(result, status) {
				if (status === kakao.maps.services.Status.OK) {
					var infoDiv = document.getElementById('centerAddr');

					for (var i = 0; i < result.length; i++) {
						// 행정동의 region_type 값은 'H' 이므로
						if (result[i].region_type === 'H') {
							infoDiv.innerHTML = result[i].address_name;
							break;
						}
					}
				}
			}
		</script>
	</c:if>
	<div class="align-center">
		<input type="button" class="default-btn" id="submit_btn" value="회원가입">
	</div>
</div>

<!-- 우편번호 검색 시작 -->
<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
<div id="layer"
	style="display: none; position: fixed; overflow: hidden; z-index: 1; -webkit-overflow-scrolling: touch;">
	<img src="//t1.daumcdn.net/postcode/resource/images/close.png"
		id="btnCloseLayer"
		style="cursor: pointer; position: absolute; right: -3px; top: -3px; z-index: 1"
		onclick="closeDaumPostcode()" alt="닫기 버튼">
</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	// 우편번호 찾기 화면을 넣을 element
	var element_layer = document.getElementById('layer');

	function closeDaumPostcode() {
		// iframe을 넣은 element를 안보이게 한다.
		element_layer.style.display = 'none';
	}

	function execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					//(주의)address1에 참고항목이 보여지도록 수정
					// 조합된 참고항목을 해당 필드에 넣는다.
					//(수정) document.getElementById("address2").value = extraAddr;

				}
				//(수정) else {
				//(수정)    document.getElementById("address2").value = '';
				//(수정) }

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('zipcode').value = data.zonecode;
				//(수정) + extraAddr를 추가해서 address1에 참고항목이 보여지도록 수정
				document.getElementById("address1").value = addr + extraAddr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("address2").focus();

				// iframe을 넣은 element를 안보이게 한다.
				// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
				element_layer.style.display = 'none';
			},
			width : '100%',
			height : '100%',
			maxSuggestItems : 5
		}).embed(element_layer);

		// iframe을 넣은 element를 보이게 한다.
		element_layer.style.display = 'block';

		// iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
		initLayerPosition();
	}

	// 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
	// resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
	// 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
	function initLayerPosition() {
		var width = 300; //우편번호서비스가 들어갈 element의 width
		var height = 400; //우편번호서비스가 들어갈 element의 height
		var borderWidth = 5; //샘플에서 사용하는 border의 두께

		// 위에서 선언한 값들을 실제 element에 넣는다.
		element_layer.style.width = width + 'px';
		element_layer.style.height = height + 'px';
		element_layer.style.border = borderWidth + 'px solid';
		// 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
		element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width) / 2 - borderWidth)
				+ 'px';
		element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height) / 2 - borderWidth)
				+ 'px';
	}
</script>
<!-- 우편번호 검색 끝 -->
<!-- 내용 끝 -->

