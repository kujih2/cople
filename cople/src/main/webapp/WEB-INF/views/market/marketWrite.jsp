<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!-- 내용 시작 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/JJH/market.write.js"></script>
<link href="${pageContext.request.contextPath}/css/layout.css" rel="stylesheet" type="text/css" />
<div class="page-main">
<h1>상품 등록</h1>
	<form:form action="write" modelAttribute="marketVO" id="register_form"
	                                      enctype="multipart/form-data">
		<form:errors element="div" cssClass="error-color"/>
		<div class="marketWrite1">
			<ul>
				<li>
					<div class="market_photo">
						<form:label path="upload" class="camera-click"><img src="${pageContext.request.contextPath}/images/camera icon.png" width="50"></form:label>
						<br>
						<b><span id="count">0/4</span></b>
					</div>
					<div class="file-list">
					</div>
					
					<input type="hidden" name="count" id="photo_count">
					<input type="file" id="upload" name="upload" class="hide"
									accept="image/gif,image/png,image/jpeg"  multiple>
					<input type="hidden" name="count" id="photo_count">
										
					<span id="photo_valid" class="valid-message"></span>
				</li>
				<li>
					<form:label path="product_title"><h2>제목</h2></form:label>
				</li>
				<li>
					<span class="letter-count" id="title_count">0/15</span>
					<form:input path="product_title" placeholder="제목을 입력해 주세요." autocomplete='off'/>
					<span id="title_valid" class="valid-message"></span>
				</li>
				<li>
					<form:label path="product_category"><h2>거래 방식</h2></form:label>
				</li>
				<li>
					<input type="button" value="판매하기" class="sale-button" style="background-color:skyblue;color:white;font-weight:bold; border-radius:5px; cursor:pointer;">
					<input type="button" value="나눔하기" class="share-button" style="background-color:white;color:gray; border-radius:5px;cursor:pointer;">
					<form:input path="product_category"  type="hidden"/>
				</li>
				<li>
					<form:input path="product_price" placeholder="가격을 입력해 주세요." autocomplete='off'/>
					<form:errors path="product_price" cssClass="error-color"/>
					<span id="price_valid" class="valid-message"></span>
				</li>
			</ul>
		</div>
		<div class="marketWrite2">
			<ul>
				<li>
					<h3>상품에 대한 자세한 설명을 적어주세요</h3>
				</li>
				<li>
					<span class="letter-count" id="content_count">0/300</span>
					<form:textarea path="product_content" placeholder="신뢰할 수 있는 거래를 위해 자세히 적어주세요.
비속어,유해한 내용,허위 사실은 신고 조치 대상이 될 수 있습니다." rows="7" cols="50"/>
					<span id="content_valid" class="valid-message"></span>
				</li>
				<li>
					<h2>거래 희망 장소</h2>
				</li>
				<li>
					<input type="button" id="map-button" value="장소 선택 ">
					<input type="hidden" name="placeAddress" id="placeAddress">
					<input type="hidden" name="placeDetail" id="placeDetail">
					<span id="output"></span><br>
					<span id="output2"></span>
				</li>
			</ul>
		</div>
		<div class="align-center clear">
			<form:button style="background-color:skyblue; border-radius:5px;color:white;font-weight:bold;">작성 완료</form:button>
			<input type="button" value="작성 취소" onclick="location.href='list?category=0'" style="background-color:white; border-radius:5px;color:black;font-weight:bold;cursor:pointer;">
		</div>	
	</form:form>
</div>
<!-- 내용 끝 -->
<div class="hide">
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/market/marketMap.jsp"/>
</div>