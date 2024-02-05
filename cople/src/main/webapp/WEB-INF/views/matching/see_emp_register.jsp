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

<h2>${empVO.id}님의 취업정보</h2>
	<table>
		<tr>
			<td>아이디</td>
			<td colspan="5">${empVO.id}</td>
		</tr>
		<tr>
			<td>회사규모</td>
			<td colspan="5">${empVO.comsize}</td>
		</tr>
		<tr>
			<td>기업인력규모</td>
			<td colspan="5">${empVO.compeople}</td>
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
				${empVO.career}
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
				${emoVO.education}
			</td>
		</tr>
		<tr>
			<td>전공 유무</td>
			<td colspan="5">
				${emoVO.major}
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
		    	<input type="hidden" id="location_api" name="location_api" value="${empVO.location_api}">
		    	<input type="hidden" id="location_api_lat" name="location_api_lat" value="${empVO.location_api_lat}">
		    	<input type="hidden" id="location_api_lng" name="location_api_lng" value="${empVO.location_api_lng}">
		    	<input type="hidden" id="user_num" name="user_num" value="${user.mem_num}">
		    	<input type="hidden" id="user_id" name="user_id" value="${empVO.id}">
		</div>
			</td>
		</tr>
		<tr>
			<td><label for="workstart_status">취업일시</label>
			</td>
			<td colspan="5">
				${empVO.register_date}
			</td>
		</tr>
		<tr>
			<td>후배 쌍용인들에게 조언 한 마디!</td>
			<td colspan="5">
				${empVO.advice}
			</td>
		</tr>
		
	</table>
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4e592360b98e7e7af7c0620352a4709c&libraries=services"></script>

<script>

	//지도의 위치 정보 받아오기
	var api = $('#location_api').val();
	var lat = $('#location_api_lat').val();
	var lng = $('#location_api_lng').val();
	var user_num = $('#user_num').val();
	var user_id = $('#user_id').val();
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(lat,lng), // 지도의 중심좌표
	        level: 7 // 지도의 확대 레벨
	    };  
	
	 console.log(location_api);
	
	 var map = new kakao.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
		    center : new kakao.maps.LatLng(lat, lng), // 지도의 중심좌표 
		    level : 9 // 지도의 확대 레벨 
		});
	 
	
	 
 	var content = '<div class ="label"><span class="left"></span><span class="center">'
 				 +user_id+'님의 회사<br><img src="${pageContext.request.contextPath}/matching/viewProfile?userNum='
 				 +user_num+'" width="40" height="40" class="my-photo"></span><span class="right">'
 				 +'</span></div>';

 	// 커스텀 오버레이가 표시될 위치입니다 
 	var position = new kakao.maps.LatLng(lat,lng);  

 	// 커스텀 오버레이를 생성합니다
 	var customOverlay = new kakao.maps.CustomOverlay({
 	    position: position,
 	    content: content   
 	});

 	// 커스텀 오버레이를 지도에 표시합니다
 	customOverlay.setMap(map);
	
</script>
