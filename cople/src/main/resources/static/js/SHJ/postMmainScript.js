$(function(){
	var map = new kakao.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
	    center : new kakao.maps.LatLng(37.50642899040794, 126.97303712266464), // 지도의 중심좌표 
	    level : 10 // 지도의 확대 레벨 
	});
	
	// 마커 클러스터러를 생성합니다 
	var clusterer = new kakao.maps.MarkerClusterer({
	    map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
	    averageCenter: false, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
	    minLevel: 13 // 클러스터 할 최소 지도 레벨 
	});
	
	// 데이터를 가져오기 위해 jQuery를 사용합니다
	// 데이터를 가져와 마커를 생성하고 클러스터러 객체에 넘겨줍니다
	 /* 모델에서 전달한 JSON 데이터 가져오기 */
	var ajaxMapData = JSON.parse($("#mapData").attr("data-map"));
	
	/* JSON 문자열을 JavaScript 객체로 파싱 */
    var jsonData = ajaxMapData.positions;
       
	
   
  	
    // 데이터에서 좌표 값을 가지고 마커를 표시합니다
    // 마커 클러스터러로 관리할 마커 객체는 생성할 때 지도 객체를 설정하지 않습니다
    
   
    var markers = jsonData.map(function(position) {
    var userNum = position.user_num;
       
	var content ='<div class="mapProfile" data-num="'+userNum+'">'+
    '<a><img src="${pageContext.request.contextPath}/matching/viewProfile?userNum='+userNum+'" width="40" height="40" class="my-photo"></a>'
    + ' <div class="profileDetail">'+'<p></p>'+'</div></div>';
    	
    	return new kakao.maps.CustomOverlay({
            position: new kakao.maps.LatLng(position.lat, position.lng),
            content:content
        });
       
    });
    // 클러스터러에 마커들을 추가합니다
    clusterer.addMarkers(markers);
    
    
    
    
    // 이미지 컨테이너 요소를 가져옵니다.
    const imageContainer = document.querySelector('.my-photo');

    // 텍스트를 오버레이하는 요소를 가져옵니다.
    const overlayText = document.querySelector('.overlay-text');

    // 마우스가 이미지에 진입했을 때 텍스트를 보여주는 이벤트를 추가합니다.
    imageContainer.addEventListener('mouseenter', () => {
        overlayText.style.display = 'block';
    });

    // 마우스가 이미지에서 빠져나갈 때 텍스트를 숨기는 이벤트를 추가합니다.
    imageContainer.addEventListener('mouseleave', () => {
        overlayText.style.display = 'none';
    });
 

	$(document).on('mouseenter', '.my-photo', function() {
	    // 이미지에 마우스를 가져다 댔을 때의 동작
	    // 여기서는 해당 이미지를 감싸는 부모 요소의 클래스를 찾아 data-user-num 속성의 값을 설정합니다.
	    var userNum = $(this).closest('.mapProfile').data('num');
	    $(this).closest('.mapProfile').find('p').text(userNum);
	});
	
	$(document).on('mouseleave', '.my-photo', function() {
	    // 이미지에서 마우스가 빠져나갈 때의 동작
	    // 여기서는 텍스트를 원래대로 설정하거나 숨기는 등의 동작을 추가할 수 있습니다.
	    $(this).closest('.mapProfile').find('p').text('');
	});
});
