<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="main_content">
	<h2 class="align-center">CodingHub에 오신것을 환영합니다!</h2>
	<form action="registerUser2" id="member_register_auth_index">
		<input type="hidden" name="auth_index" value="${auth_index}">
	</form>
	<form:form action="registerUser2" id="member_register" modelAttribute="memberVO">
		<form:errors element="div" cssClass="error-color" />
			<div class="text-between-lines">
			  <span class="line"></span>
			  회원가입에 필요한 기본정보를 입력해주세요
			  <span class="line"></span>
			</div><br>
			
			<form:label path="id">아이디</form:label>
			<input type="button" id="confirmId" value="ID중복체크" class="default-btn">
			<span id="message_id"></span><br>
			<form:input path="id" placeholder="영문,숫자만 4~12자" autocomplete="off" /><br>
			<form:errors path="id" cssClass="error-color" />
					
					
			<form:label path="name">이름</form:label><br>
			<form:input path="name"/><br>
			<form:errors path="name" cssClass="error-color" />
			
			<form:label path="nick_name">닉네임</form:label><br>
			<form:input	path="nick_name" /><br>
			
			<form:label path="passwd">비밀번호</form:label><br>
			<form:password path="passwd" placeholder="영문,숫자만 4~12자" /><br>
			<form:errors path="passwd" cssClass="error-color" />
			
			<form:label path="phone">전화번호</form:label><br>
			<form:input path="phone" /><br>
			<form:errors path="phone" cssClass="error-color" />
			
			<form:label path="email">이메일</form:label><br>
			<form:input path="email" /><br>
			<form:errors path="email" cssClass="error-color" />
			
			
			<form:label path="birth">생년월일</form:label><br>
			<form:input path="birth" /> <form:errors path="birth" cssClass="error-color" /><br>
			
			<form:label path="zipcode">우편번호</form:label>
			<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기" class="default-btn" id="zipcode_btn"><br>
			<form:input path="zipcode" /><br>
			<form:errors path="zipcode" cssClass="error-color" />
			
			<form:label path="address1">주소</form:label><br>
			<form:input path="address1" /><br>
			<form:errors path="address1" cssClass="error-color" />
			
			<form:label path="address2">상세주소</form:label><br>
			<form:input path="address2" /><br>
			<form:errors path="address2" cssClass="error-color" />
			
			<form:label path="gender">성별</form:label><br>
			<input type="radio" name="gender" value="1">남자
			<input type="radio" name="gender" value="2">여자<br>
			
			<form:label path="push">알림수신여부</form:label><br>
			<input type="radio" name="push" value="1">예
			<input type="radio" name="push" value="2">아니오<br>
			
			<form:label path="certify_photo_name">
			<c:if test="${auth_index==1}">수강생 인증사진</c:if>
			<c:if test="${auth_index==2}">수강생 인증사진</c:if>
			<c:if test="${auth_index==3}">현직자 인증사진</c:if>
			</form:label><br>
			<input type="file" name="certify_photo_name" id="certify_photo_name"><br>

	</form:form>
	<c:if test="${auth_index==2}">

		<form action="empInsert" method="post" enctype="multipart/form-data">
			<div class="text-between-lines">
			  <span class="line"></span>
			  취업 정보를 입력해주세요
			  <span class="line"></span>
			</div><br>
			
			<label for="comsize">회사규모</label><br>
			<input type="radio" id="comsize" name="comsize" value="스타트업">스타트업
			<input type="radio" id="comsize" name="comsize" value="중소">중소
			<input type="radio" id="comsize" name="comsize" value="중견">중견
			<input type="radio" id="comsize" name="comsize" value="대기업">대기업<br>
			
			<label for="compeople_status">기업인력규모</label><br>
			<input type="radio" id="compeople" name="compeople" value="5~10인">5~10인
			<input type="radio" id="compeople" name="compeople" value="10~30인">10~30인
			<input type="radio" id="compeople" name="compeople" value="30~50인">30~50인
			<input type="radio" id="compeople" name="compeople" value="50~100인">50~100인
			<input type="radio" id="compeople" name="compeople" value="100인 이상">100인 이상<br>

			<label for="field_status">지원분야</label><br>
			<input type="radio" id="field" name="field" value="0">SI 
			<input type="radio" id="field" name="field" value="1">SM
			<input type="radio" id="field" name="field" value="2">솔루션
			<input type="radio" id="field" name="field" value="3">서비스
			<input type="radio" id="field" name="field" value="4">기타
			<input type="radio" id="field" name="field"	value="5">기타(非IT)<br>

			<label for="role_status">직무</label><br>
			<input type="radio" id="role" name="role" value="0">백엔드
			<input type="radio" id="role" name="role" value="1">프론트엔드
			<input type="radio" id="role" name="role" value="2">풀스택
			<input type="radio" id="role" name="role" value="3">데브옵스
			<input type="radio" id="role" name="role" value="4">임베디드
			<input type="radio" id="role" name="role" value="5">DBA
			<input type="radio" id="role" name="role" value="6">기타<br>
				
			<label for="career_status">지원형태</label><br>
			<input type="radio" id="career" name="career" value="신입">신입
			<input type="radio" id="career"	name="career" value="중고신입">중고신입
			<input type="radio" id="career" name="career" value="기타">기타<br>
			
			<label for="salary_status">연봉</label>
			<select id="salary_status" name="salary_status">
				<option value="0">공개</option>
				<option value="1">비공개</option>
			</select><br>
			
			<input type="radio" id="salary" name="salary" value="0">~2,600만원
			<input type="radio" id="salary" name="salary" value="1">2,600~3,000만원
			<input type="radio" id="salary" name="salary" value="2">3,000~3,400만원
			<input type="radio" id="salary" name="salary" value="3">3,400~3,800만원
			<input type="radio" id="salary" name="salary" value="4">3,800~4,200만원
			<input type="radio" id="salary" name="salary" value="5">4,200만원~<br>
			
			<label for="periodtime_status">수료 후 준비기간</label><br>
			<input type="radio" id="periodtime" name="periodtime" value="0">수료 전
			<input type="radio" id="periodtime" name="periodtime" value="1">수료 후 1개월 이내
			<input type="radio" id="periodtime" name="periodtime" value="2">수료 후 1개월~3개월
			<input type="radio" id="periodtime" name="periodtime" value="3">수료 후 3개월~6개월
			<input type="radio" id="periodtime" name="periodtime" value="4">수료 후 6개월~1년
			<input type="radio" id="periodtime" name="periodtime" value="5">수료 후 1년~<br>
			
			<label for="edcation_status">학력</label><br>
			<input type="radio" id="education" name="education" value="0">~고졸
			<input type="radio" id="education" name="education" value="1">전문대졸
			<input type="radio" id="education" name="education" value="2">대학교졸(수도권) *졸업예정포함
			<input type="radio" id="education" name="education" value="3">대학교졸(비수도권)
			<input type="radio" id="education" name="education" value="4">대학원
			<input type="radio" id="education" name="education" value="5">기타<br>
			
			<label for="major_status">전공 유무</label><br>
			<input type="radio" id="major" name="major" value="전공">전공
			<input type="radio" id="major" name="major" value="비전공">비전공<br>
			
			<label for="certification_status">취업 당시 보유 자격증</label><br>
			<input type="checkbox" id="certification" name="certification" value="0">없음
			<input type="checkbox" id="certification" name="certification" value="1">정보처리기사(필기)
			<input type="checkbox" id="certification" name="certification" value="2">정보처리기사(실기)
			<input type="checkbox" id="certification" name="certification" value="3">SQLD
			<input type="checkbox" id="certification" name="certification" value="4">AWS
			<input type="checkbox" id="certification" name="certification" value="5">기타<br>

			<label for="location_status">취업회사 지역</label><br>
			<input type="radio" id="location" name="location" value="0">구로/가산 디지털단지
			<input type="radio" id="location" name="location" value="1">강남
			<input type="radio" id="location" name="location" value="2">판교
			<input type="radio" id="location" name="location" value="3">DMC(상암)
			<input type="radio" id="location" name="location" value="4">영등포
			<input type="radio" id="location" name="location" value="5">시청,종로
			<input type="radio" id="location" name="location" value="6">기타<br>
				
			<label for="location_status">지도에서 선택하기</label> <br>
				<div class="map_wrap">
					<div id="map" style="width: 430px; height: 270px; position: relative; overflow: hidden;"></div>
					<p>지도에서 회사의 <b>대략적인</b> 위치를 클릭해주세요!</p>
					<div class="hAddr">
					</div>
					<input type="hidden" id="location_api" name="location_api" value="">
					<input type="hidden" id="location_api_lat" name="location_api_lat" value="">
					<input type="hidden" id="location_api_lng" name="location_api_lng" value="">
				</div>
			
			<label for="workstart_status">취업일시</label> <br>
			<select id="workstart_status" name="workstart_status">
					<option value="0">공개</option>
					<option value="1">비공개</option>
			</select> <br>
			<input type="month" id="workstart" name="workstart" value="취업일시"><br>
			
			<label for="filename">합격인증</label> <br>
			최종합격 문자/메일 혹은 명함을 첨부해주세요!
			<input type="file" id="upload" name="upload"><br>
				
			<label for="advice">후배 쌍용인들에게 조언 한 마디!</label><br>
			<textarea cols="50" rows="5" id="advice" name="advice"></textarea>
				
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

