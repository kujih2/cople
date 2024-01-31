<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<style>
.marquee {
            white-space: nowrap;
            overflow: hidden;
            position: absolute;
            top: 50%;
            right: 100%;
            animation: marqueeAnimation 10s linear infinite; /* 애니메이션 속성 설정 */
        }
@keyframes marqueeAnimation {
            to {
                right: 100%; /* 오른쪽에서 왼쪽으로 이동하는 효과를 위해 right 속성 사용 */
            }
        }
 body {
            overflow: hidden;
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
  
    .map_wrap {position:relative;width:100%;height:350px;}
    .title {font-weight:bold;display:block;}
    .hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
    #centerAddr {display:block;margin-top:2px;font-weight: normal;}
    .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
.submit{
	text-align:center;
}
</style>
<script>

	function closePopup(){
		window.close();
	}
</script>

<h2>현직자 신청 양식</h2>
<div class="marquee">
        <p><b>${user.name}</b>님의 취업을 진심으로 축하드립니다!</p>
    </div>
<form action="empInsert" method="post" enctype="multipart/form-data">
	<table>
		<tr>
			<td>아이디</td>
			<c:if test="${!user.nick_name}">
				<td colspan="5">${user.id}</td>
			</c:if>
			<c:if test="${user.nick_name}">
				<td colspan="5">${user.nick_name}</td>
			</c:if>
		</tr>
		<tr>
			<td>이름</td>
			<td colspan="5">${user.name}</td>
		</tr>
		<tr>
			<td><label for="comsize">회사규모</label>
			</td>
			<td colspan="5">
				<input type="radio" id="comsize" name="comsize" value="스타트업">스타트업
				<input type="radio" id="comsize" name="comsize" value="중소">중소
				<input type="radio" id="comsize" name="comsize" value="중견">중견
				<input type="radio" id="comsize" name="comsize" value="대기업">대기업
			</td>
		</tr>
		<tr>
			<td><label for="compeople_status">기업인력규모</label>
			</td>
			<td colspan="5">
				<input type="radio" id="compeople" name="compeople" value="5~10인">5~10인
				<input type="radio" id="compeople" name="compeople" value="10~30인">10~30인
				<input type="radio" id="compeople" name="compeople" value="30~50인">30~50인
				<input type="radio" id="compeople" name="compeople" value="50~100인">50~100인
				<input type="radio" id="compeople" name="compeople" value="100인 이상">100인 이상
			</td>
		</tr>
		<tr>
			<td><label for="field_status">지원분야</label>
			</td>
			<td colspan="5">
				<input type="radio" id="field" name="field" value="0">SI
				<input type="radio" id="field" name="field" value="1">SM
				<input type="radio" id="field" name="field" value="2">솔루션
				<input type="radio" id="field" name="field" value="3">서비스
				<input type="radio" id="field" name="field" value="4">기타
				<input type="radio" id="field" name="field" value="5">기타(非IT)
			</td>
		</tr>
		<tr>
			<td><label for="role_status">직무</label>
			</td>
			<td colspan="5">
				<input type="radio" id="role" name="role" value="0">백엔드
				<input type="radio" id="role" name="role" value="1">프론트엔드
				<input type="radio" id="role" name="role" value="2">풀스택
				<input type="radio" id="role" name="role" value="3">데브옵스
				<input type="radio" id="role" name="role" value="4">임베디드
				<input type="radio" id="role" name="role" value="5">DBA
				<input type="radio" id="role" name="role" value="6">기타
			</td>
		</tr>
		<tr>
			<td><label for="career_status">지원형태</label>
			</td>
			<td colspan="5">
				<input type="radio" id="career" name="career" value="신입">신입
				<input type="radio" id="career" name="career" value="중고신입">중고신입
				<input type="radio" id="career" name="career" value="기타">기타
			</td>
		</tr>
		<tr>
			<td><label for="salary_status">연봉</label>
			<br>
				<select id="salary_status" name="salary_status">
					<option value="0">공개</option>
					<option value="1">비공개</option>
				</select>
			</td>
			<td colspan="5">
				<input type="radio" id="salary" name="salary" value="0">~2,600만원
				<input type="radio" id="salary" name="salary" value="1">2,600~3,000만원
				<input type="radio" id="salary" name="salary" value="2">3,000~3,400만원
				<input type="radio" id="salary" name="salary" value="3">3,400~3,800만원
				<input type="radio" id="salary" name="salary" value="4">3,800~4,200만원
				<input type="radio" id="salary" name="salary" value="5">4,200만원~
			</td>
		</tr>
		<tr>
			<td><label for="periodtime_status">수료 후 준비기간</label>
			</td>
			<td colspan="5">
				<input type="radio" id="periodtime" name="periodtime" value="0">수료 전
				<input type="radio" id="periodtime" name="periodtime" value="1">수료 후 1개월 이내
				<input type="radio" id="periodtime" name="periodtime" value="2">수료 후 1개월~3개월
				<input type="radio" id="periodtime" name="periodtime" value="3">수료 후 3개월~6개월
				<input type="radio" id="periodtime" name="periodtime" value="4">수료 후 6개월~1년
				<input type="radio" id="periodtime" name="periodtime" value="5">수료 후 1년~
			</td>
		</tr>
		<tr>
			<td><label for="edcation_status">학력</label>
			</td>
			<td colspan="5">
				<input type="radio" id="education" name="education" value="0">~고졸
				<input type="radio" id="education" name="education" value="1">전문대졸
				<input type="radio" id="education" name="education" value="2">대학교졸(수도권) *졸업예정포함
				<input type="radio" id="education" name="education" value="3">대학교졸(비수도권)
				<input type="radio" id="education" name="education" value="4">대학원
				<input type="radio" id="education" name="education" value="5">기타
			</td>
		</tr>
		<tr>
			<td><label for="major_status">전공 유무</label>
			</td>
			<td colspan="5">
				<input type="radio" id="major" name="major" value="전공">전공
				<input type="radio" id="major" name="major" value="비전공">비전공
			</td>
		</tr>
		<tr>
			<td><label for="certification_status">취업 당시 보유 자격증</label>
			</td>
			<td colspan="5">
				<input type="checkbox" id="certification" name="certification" value="0">없음
				<input type="checkbox" id="certification" name="certification" value="1">정보처리기사(필기)
				<input type="checkbox" id="certification" name="certification" value="2">정보처리기사(실기)
				<input type="checkbox" id="certification" name="certification" value="3">SQLD
				<input type="checkbox" id="certification" name="certification" value="4">AWS
				<input type="checkbox" id="certification" name="certification" value="5">기타
			</td>
		</tr>
		<tr>
			<td><label for="location_status">취업회사 지역</label>
			</td>
			<td colspan="5">
				<input type="radio" id="location" name="location" value="0">구로/가산 디지털단지
				<input type="radio" id="location" name="location" value="1">강남
				<input type="radio" id="location" name="location" value="2">판교
				<input type="radio" id="location" name="location" value="3">DMC(상암)
				<input type="radio" id="location" name="location" value="4">영등포
				<input type="radio" id="location" name="location" value="5">시청,종로
				<input type="radio" id="location" name="location" value="6">기타
			</td>
		</tr>
		<tr>
			<td><label for="location_status">지도에서 선택하기</label>
			<br>
				
			</td>
			<td colspan="5">
				<div class="map_wrap">
    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
    <div class="hAddr">
        <span class="title">지도중심기준 행정동 주소정보</span>
        <span id="centerAddr"></span>
    </div>
    	<input type="hidden" id="location_api" name="location_api" value="">
    	<input type="hidden" id="location_api_lat" name="location_api_lat" value="">
    	<input type="hidden" id="location_api_lng" name="location_api_lng" value="">
</div>
			</td>
		</tr>
		<tr>
			<td><label for="workstart_status">취업일시</label>
			<br>
				<select id="workstart_status" name="workstart_status">
					<option value="0">공개</option>
					<option value="1">비공개</option>
				</select>
			<br>
			</td>
			<td colspan="5">
				<input type="month" id="workstart" name="workstart" value="취업일시">
			</td>
		</tr>
		<tr>
			<td><label for="filename">합격인증</label>
			<br>
			</td>
			<td colspan="5">
				최종합격 문자/메일 혹은 명함을 첨부해주세요!
				<input type="file" id="upload" name="upload">
			</td>
		</tr>
		<tr>
			<td><label for="advice">후배 쌍용인들에게 조언 한 마디!</label>
			</td>
			<td colspan="5">
				<textarea cols="50" rows="5" id="advice" name="advice"></textarea>
			</td>
		</tr>
		
	</table>
		<div class="submit">
			<input type="submit" value="제출">
			<input type="button" value="취소" onclick="closePopup()">
		</div>
</form>
<br>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4e592360b98e7e7af7c0620352a4709c&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.499372511200875, 127.0332593788492), // 지도의 중심좌표
        level: 7 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
    infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
searchAddrFromCoords(map.getCenter(), displayCenterInfo);

// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
    searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
        if (status === kakao.maps.services.Status.OK) {
            var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
            detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
            
            var content = '<div class="bAddr">' +
                            '<span class="title">법정동 주소정보</span>' + 
                            detailAddr + 
                        '</div>';
            //주소정보를 입력폼에 저장
			var result = result[0].address.address_name;
            
            document.getElementById('location_api').value=result;
           
           
            
            // 마커를 클릭한 위치에 표시합니다 
            marker.setPosition(mouseEvent.latLng);
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
    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
}

//좌표의 lat, lng 값 얻어내기
var lat;
var lng;

function searchDetailAddrFromCoords(coords, callback) {
    // 좌표로 법정동 상세 주소 정보를 요청합니다
    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
    lat = coords.getLat();
    lng = coords.getLng();
    
	//좌표 정보를 입력폼에 hidden으로 저장
	document.getElementById('location_api_lat').value=lat;
	document.getElementById('location_api_lng').value=lng;
}



// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
function displayCenterInfo(result, status) {
    if (status === kakao.maps.services.Status.OK) {
        var infoDiv = document.getElementById('centerAddr');

        for(var i = 0; i < result.length; i++) {
            // 행정동의 region_type 값은 'H' 이므로
            if (result[i].region_type === 'H') {
                infoDiv.innerHTML = result[i].address_name;
                break;
            }
        }
    }    
}
</script>
