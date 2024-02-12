<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="page-main">
<div class="carousel_main">
	<!-- 캐러셀 시작 -->
    <div class="carousel_wrapper">
        <div class="carousel_slide">
            <img src="${pageContext.request.contextPath}/upload/${market.filename0}" alt="상품이미지" />
        </div>
        <c:if test="${!empty market.filename1}">
	        <div class="carousel_slide">
	           <img src="${pageContext.request.contextPath}/upload/${market.filename1}" alt="상품이미지" />
	        </div>
        </c:if>
        <c:if test="${!empty market.filename2}">
	        <div class="carousel_slide">
	           <img src="${pageContext.request.contextPath}/upload/${market.filename2}" alt="상품이미지" />
	        </div>
        </c:if>
        <c:if test="${!empty market.filename3}">
	        <div class="carousel_slide">
	           <img src="${pageContext.request.contextPath}/upload/${market.filename3}" alt="상품이미지" />
	           <input type="hidden" id="maxlength" value="3">
	        </div>
	        
        </c:if>
        <c:if test="${empty market.filename3 && !empty market.filename2}"><input type="hidden" id="maxlength" value="2"></c:if>
        <c:if test="${empty market.filename3 && empty market.filename2 && !empty market.filename1}"><input type="hidden" id="maxlength" value="1"></c:if>
    </div>
    <c:if test="${!empty market.filename1}">
	    <div class="carousel_button_container">
	        <button type="button" class="carousel_prev">
	          <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-chevron-double-left" viewBox="0 0 16 16">
                <path fill-rule="evenodd" d="M8.354 1.646a.5.5 0 0 1 0 .708L2.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/>
                <path fill-rule="evenodd" d="M12.354 1.646a.5.5 0 0 1 0 .708L6.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/>
             </svg>
	        </button>
	        <button type="button" class="carousel_next">
	           <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-chevron-double-right" viewBox="0 0 16 16">
                <path fill-rule="evenodd" d="M3.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L9.293 8 3.646 2.354a.5.5 0 0 1 0-.708z"/>
                <path fill-rule="evenodd" d="M7.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L13.293 8 7.646 2.354a.5.5 0 0 1 0-.708z"/>
            </svg>
	        </button>
	    </div>
    </c:if>
    
    <div class="carousel_pagination">
        <div class="carousel_circle"></div>
        <c:if test="${!empty market.filename1}">
        <div class="carousel_circle"></div>
        </c:if>
        <c:if test="${!empty market.filename2}">
        <div class="carousel_circle"></div>
        </c:if>
        <c:if test="${!empty market.filename3}">
        <div class="carousel_circle"></div>
        </c:if>
    </div>
</div>
<!-- 캐러셀 끝 -->
	<div class="seller_profile">
	<img src="${pageContext.request.contextPath}/member/viewProfile?mem_num=${market.product_seller}" width="35" height="35" class="my-photo">
		<span class="seller_id">
			<c:if test="${empty market.seller_nickname}">${market.seller_id }</c:if>
			${market.seller_nickname}
		</span>
		<br>
		<div class="score_box">
		<c:if test="${market.market_score > 30}">
				<span style=" color:blue; font-weight:bold; margin-left:-10px;">${market.market_score}점 </span>
				<span class="score_desc">장터점수</span>
			</c:if>
			<c:if test="${market.market_score < 30}">
				<span style=" color:red; font-weight:bold; margin-left:-10px;">${market.market_score}점 </span>
				<span class="score_desc">장터점수</span>
			</c:if>
		</div>
	</div>
	<c:if test="${!empty user && user.id .equals(market.seller_id)}">
			<div class="modify_box">
				<button id="delete_btn" onclick="location.href='delete?product_num=${market.product_num}'">글 삭제</button>
			</div>
		</c:if>
	<hr width="80%" style="margin:0 auto;">
	<div class="detail_main">
		<div class="detail_title">
			<span class="title_span">${market.product_title}</span>
			<c:if test="${empty market.product_modifyDate}"><span class="reg_date">작성일 : ${market.product_regDate}</span></c:if>
		</div>
		<div class="detail_price">
			<c:if test="${market.product_price != 0}">
				<fmt:formatNumber value="${market.product_price}" pattern="#,###" />원
			</c:if>
			<c:if test="${market.product_price == 0}">
				나눔(0원)
			</c:if>
		</div>
		<div class="detail_content">
				${market.product_content}
		</div>
		<div class="content_foot">
			<span class="report">신고</span>
			<c:if test="${!empty user && user.id != market.seller_id}">
			<button class="chat_btn" onclick="location.href='marketChatRoom?product_num=${market.product_num}&product_seller=${market.product_seller}'">채팅하기</button>
			</c:if> 
		</div>
	</div>
	<hr width="80%" style="margin:0 auto;">
<!-- 지도 -->
<c:if test="${!empty market.product_place}">	
<div class="detail_map">
<h2>거래 희망 장소</h2>
<div class="detail_address">
	<span id="product_place">${market.product_place}</span>
	<span id="product_placeDetail">${market.product_placeDetail}</span>
</div>
<div id="map" style="width:100%;height:350px;"></div>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=048460332c8dbe7e307c61feabc65146&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.49819, 127.0280), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch($('#product_place').text(), function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+$('#product_place').text()+'</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>
	</div>
</c:if>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/JJH/market.detail.js"></script>




