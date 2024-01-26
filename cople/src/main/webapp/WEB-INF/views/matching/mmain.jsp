<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
function emp_register() {
    var width = '700';
    var height = '700';

    var left = (window.innerWidth - width) / 2;
    var top = (window.innerHeight - height) / 2;

    // 팝업 창 열기
    var popupWindow = window.open("emp_register", "현직자 신청하기", "width=" + width + ",height=" + height + ",left=" + left + ",top=" + top + ",scrollbars=yes");

    // 팝업 내용 스타일 조절
    if (popupWindow) {
        popupWindow.onload = function () {
            var popupContent = popupWindow.document.body; // 팝업 창 내용이 들어가는 부분
            popupContent.style.overflowY = 'auto'; // 세로 스크롤바를 항상 표시하도록 설정
            popupContent.style.maxHeight = '80vh'; // 팝업 창의 최대 높이를 설정 (가능하면 vh 단위 사용)
        };
    }
}
function my_emp_register() {
    var width = '700';
    var height = '700';

    var left = (window.innerWidth - width) / 2;
    var top = (window.innerHeight - height) / 2;

    // 팝업 창 열기
    var popupWindow = window.open("my_emp_register", "현직자 신청하기", "width=" + width + ",height=" + height + ",left=" + left + ",top=" + top + ",scrollbars=yes");

    // 팝업 내용 스타일 조절
    if (popupWindow) {
        popupWindow.onload = function () {
            var popupContent = popupWindow.document.body; // 팝업 창 내용이 들어가는 부분
            popupContent.style.overflowY = 'auto'; // 세로 스크롤바를 항상 표시하도록 설정
            popupContent.style.maxHeight = '80vh'; // 팝업 창의 최대 높이를 설정 (가능하면 vh 단위 사용)
        };
    }
}

</script>

<c:if test="${user.auth==1}">
<button class="emp_register" onclick="emp_register()">현직자 신청하기</button>
</c:if>
<c:if test="${user.auth==2}">
<button class="my_emp_register" onclick="my_emp_register()">나의 현직자 신청 정보 보기</button>
</c:if>
<h2>취업 현황 지도</h2>


<div id="map" style="width:100%;height:350px;"></div>
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4e592360b98e7e7af7c0620352a4709c&libraries=clusterer"></script>
<script>
var map = new kakao.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
    center : new kakao.maps.LatLng(37.50642899040794, 126.97303712266464), // 지도의 중심좌표 
    level : 10 // 지도의 확대 레벨 
});

// 마커 클러스터러를 생성합니다 
var clusterer = new kakao.maps.MarkerClusterer({
    map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
    averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
    minLevel: 9 // 클러스터 할 최소 지도 레벨 
});

// 데이터를 가져오기 위해 jQuery를 사용합니다
// 데이터를 가져와 마커를 생성하고 클러스터러 객체에 넘겨줍니다
	 /* 모델에서 전달한 JSON 데이터 가져오기 */
	var ajaxMapData = JSON.parse('${ajaxMapData}');
	
	/* JSON 문자열을 JavaScript 객체로 파싱 */
    var jsonData = ajaxMapData.positions;
       
	
    // 데이터에서 좌표 값을 가지고 마커를 표시합니다
    // 마커 클러스터러로 관리할 마커 객체는 생성할 때 지도 객체를 설정하지 않습니다
    var markers = jsonData.map(function(position) {
        return new kakao.maps.Marker({
            position: new kakao.maps.LatLng(position.lat, position.lng),
        });
    });

    // 클러스터러에 마커들을 추가합니다
    clusterer.addMarkers(markers);

</script>

