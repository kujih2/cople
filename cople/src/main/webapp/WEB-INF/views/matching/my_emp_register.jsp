<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
  
    .map_wrap {position:relative;width:100%;height:350px;}
    .title {font-weight:bold;display:block;}
    .hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
    #centerAddr {display:block;margin-top:2px;font-weight: normal;}
    .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
.submit{
	text-align:center;
}
	.my-photo{
	object-fit:cover;
	object-position:top;
	border-radius:50%;
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
	<table>
		<tr>
			<td>아이디(닉네임)</td>
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
			<td>회사규모
			</td>
			<td colspan="5">
				<c:if test="${empVO.comsize=='스타트업'}">스타트업</c:if>
				<c:if test="${empVO.comsize=='중소'}">중소</c:if>
				<c:if test="${empVO.comsize=='중견'}">중견</c:if>
				<c:if test="${empVO.comsize=='대기업'}">대기업</c:if>
			</td>
		</tr>
		<tr>
			<td><label for="compeople_status">기업인력규모</label>
			</td>
			<td colspan="5">
				<c:if test="${empVO.compeople=='5~10인'}">5~10인</c:if>
				<c:if test="${empVO.compeople=='10~30인'}">10~30인</c:if>
				<c:if test="${empVO.compeople=='30~50인'}">30~50인</c:if>
				<c:if test="${empVO.compeople=='50~100인'}">50~100인</c:if>
				<c:if test="${empVO.compeople=='100인 이상'}">100인 이상</c:if>
			</td>
		</tr>
		<tr>
			<td><label for="field_status">지원분야</label>
			</td>
			<td colspan="5">
				<c:if test="${empVO.field=='0'}">SI</c:if>
				<c:if test="${empVO.field=='1'}">SM</c:if>
				<c:if test="${empVO.field=='2'}">솔루션</c:if>
				<c:if test="${empVO.field=='3'}">서비스</c:if>
				<c:if test="${empVO.field=='4'}">기타</c:if>
				<c:if test="${empVO.field=='5'}">기타(非IT)</c:if>
			</td>
		</tr>
		<tr>
			<td><label for="role_status">직무</label>
			</td>
			<td colspan="5">
				<c:if test="${empVO.role=='0'}">백엔드</c:if>
				<c:if test="${empVO.role=='1'}">프론트엔드</c:if>
				<c:if test="${empVO.role=='2'}">풀스택</c:if>
				<c:if test="${empVO.role=='3'}">데브옵스</c:if>
				<c:if test="${empVO.role=='4'}">임베디드</c:if>
				<c:if test="${empVO.role=='5'}">DBA</c:if>
				<c:if test="${empVO.role=='6'}">기타</c:if>
			</td>
		</tr>
		<tr>
			<td><label for="career_status">지원형태</label>
			</td>
			<td colspan="5">				
				<c:if test="${empVO.career=='신입'}">신입</c:if>
				<c:if test="${empVO.career=='중고신입'}">중고신입</c:if>
				<c:if test="${empVO.career=='기타'}">기타</c:if>
			</td>
		</tr>
		<tr>
			<td><label for="salary_status">연봉</label>
			<br>공개유무 : <c:if test="${empVO.salary_status=='0'}">공개</c:if>
						 <c:if test="${empVO.salary_status=='1'}">비공개</c:if>
			</td>
			<td colspan="5">
				<c:if test="${empVO.salary_status=='0'}">
					<c:if test="${empVO.salary=='0'}">~2,600만원</c:if>
					<c:if test="${empVO.salary=='1'}">2,600~3,000만원</c:if>
					<c:if test="${empVO.salary=='2'}">3,000~3,400만원</c:if>
					<c:if test="${empVO.salary=='3'}">3,400~3,800만원</c:if>
					<c:if test="${empVO.salary=='4'}">3,800~4,200만원</c:if>
					<c:if test="${empVO.salary=='5'}">4,200만원~</c:if>
				</c:if>
				<c:if test="${empVO.salary_status=='1'}">-</c:if>
			</td>
		</tr>
		<tr>
			<td><label for="periodtime_status">수료 후 준비기간</label>
			</td>
			<td colspan="5">
				<c:if test="${empVO.periodtime=='0'}">수료 전</c:if>
				<c:if test="${empVO.periodtime=='1'}">수료 후 1개월 이내</c:if>
				<c:if test="${empVO.periodtime=='2'}">수료 후 1개월~3개월</c:if>
				<c:if test="${empVO.periodtime=='3'}">수료 후 3개월~6개월</c:if>
				<c:if test="${empVO.periodtime=='4'}">수료 후 6개월~1년</c:if>
				<c:if test="${empVO.periodtime=='5'}">수료 후 1년~</c:if>
			</td>
		</tr>
		<tr>
			<td>학력</td>
			<td colspan="5">
				<c:if test="${empVO.education=='0'}">~고졸</c:if>
				<c:if test="${empVO.education=='1'}">전문대</c:if>
				<c:if test="${empVO.education=='2'}">대학교(수도권)</c:if>
				<c:if test="${empVO.education=='3'}">대학교(비수도권)</c:if>
				<c:if test="${empVO.education=='4'}">대학원</c:if>
				<c:if test="${empVO.education=='5'}">기타</c:if>
			</td>
		</tr>
		<tr>
			<td>전공 유무</td>
			<td colspan="5">
				<c:out value="${empVO.major}" />
			</td>
		</tr>
		<tr>
			<td><label for="certification_status">취업 당시 보유 자격증</label>
			</td>
			<td colspan="5">
				<c:if test="${empVO.certification=='0'}">~고졸</c:if>
				<c:if test="${empVO.certification=='1'}">전문대</c:if>
				<c:if test="${empVO.certification=='2'}">대학교(수도권)</c:if>
				<c:if test="${empVO.certification=='3'}">대학교(비수도권)</c:if>
				<c:if test="${empVO.certification=='4'}">대학원</c:if>
				<c:if test="${empVO.certification=='5'}">기타</c:if>
			</td>
		</tr>
		<tr>
			<td><label for="location_status">취업회사 지역</label>
			</td>
			<td colspan="5">
				${empVO.location_api}
				<input type="radio" name="location" value="0">구로/가산 디지털단지
				<input type="radio" name="location" value="1">강남
				<input type="radio" name="location" value="2">판교
				<input type="radio" name="location" value="3">DMC(상암)
				<input type="radio" name="location" value="4">영등포
				<input type="radio" name="location" value="5">시청,종로
				<input type="radio" name="location" value="6">기타
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
<br>
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
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

function searchDetailAddrFromCoords(coords, callback) {
    // 좌표로 법정동 상세 주소 정보를 요청합니다
    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
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
