<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<div class="sc-hjRWVT jIRTJW">
	<div class="ProductNewstyle__Wrapper-sc-7fge4a-0 hmUNzn">	
		<form:form action="write" modelAttribute="marketVO" id="register_form" enctype="multipart/form-data">
		<form:errors element="div" cssClass="error-color"/>
		<main class="ProductNewstyle__Main-sc-7fge4a-2 hjRvIo">
			<section class="ProductNewstyle__Basic-sc-7fge4a-3 bsIKMq">
				<h2 class="ProductNewstyle__SectionTitle-sc-7fge4a-1 fGSdXi">
					기본정보
					<span>*필수항목</span>
				</h2>

				
				<ul class="ProductNewstyle__Groups-sc-7fge4a-4 hcyuoc">
					<li class="ProductNewstyle__Group-sc-7fge4a-5 iZffvT">
						<div class="ProductNewstyle__Label-sc-7fge4a-6 cosfJW">
							상품이미지
							<span>*</span>
							<small><span id="count">(0/4)</span></small>
						</div>
						<div class="ProductNewstyle__Content-sc-7fge4a-7 nqDMw">
							<ul class="sc-jKVCRD czzFIC">
								<li class="sc-kaNhvL bgRkND">이미지 등록										
								<form:label path="upload" class="camera-click"><img src="${pageContext.request.contextPath}/images/camera_icon.svg" width="50"></form:label>								
									<li class="sc-LKuAh dnaPgQ">
										<div class="file-list"></div>
										<input class="sc-LKuAh dnaPgQ" type="hidden" name="count" id="photo_count">
										<input class="sc-LKuAh dnaPgQ hidden" type="file" id="upload" name="upload" accept="image/gif,image/png,image/jpeg"  multiple>
										<input class="sc-LKuAh dnaPgQ" type="hidden" name="count" id="photo_count">
																						
									</li>
								</li>
							</ul>
							<div class="sc-iBEsjs doQsrA">상품 이미지는 PC에서는 1:1, 모바일에서는 1:1.23 비율로 보여져요.</div>
							<span id="photo_valid" class="valid-message"></span>	
							<div class="sc-hmXxxW eLNyPZ">
								<div class="sc-cqCuEk flONoi">
								</div>
								<button type="button" class="sc-kLIISr cFkqkV">
									<img src="/pc-static/resource/4e53b895bb4145d54acb.png" width="34" height="32" alt="닫기 버튼 아이콘">
								</button>
								<div class="sc-dliRfk gVrZwd">
								<div class="sc-qrIAp fEFubV">
									<div class="sc-iqzUVk gGnUJx">상품이미지</div>
									<div class="sc-ipZHIp cwfbcp">
								</div>
								<div class="sc-bmyXtO bgpPdB"></div>
								</div>
							</div>
						</div>
					</li>
					
					<li class="ProductNewstyle__Group-sc-7fge4a-5 iZffvT">
						<form:label path="product_title">
						<div class="ProductNewstyle__Label-sc-7fge4a-6 jwlElY">
							상품명
							<span>*</span>
						</div>
						</form:label>
						<div class="ProductNewstyle__Content-sc-7fge4a-7 nqDMw">
							<div class="ProductNewstyle__TitleWrapper-sc-7fge4a-10 iIJDsQ">
								<div class="ProductNewstyle__WithDeleteAll-sc-7fge4a-8 gfrBou">
									<form:input path="product_title" placeholder="제목을 입력해 주세요."  class="ProductNewstyle__NameInput-sc-7fge4a-11 lmDUxi" autocomplete='off'/>
									
								</div>
								<div class="ProductNewstyle__Counter-sc-7fge4a-12 kFKyjR" id="title_count">
									0/15
								</div>
								
							</div>
							<span style="margin-top:8px;" id="title_valid" class="valid-message"></span>
						</div>
					</li>
					<li class="ProductNewstyle__Group-sc-7fge4a-5 iZffvT">
						<div class="ProductNewstyle__Label-sc-7fge4a-6 jwlElY">
							거래지역
							<span>*</span>
						</div>
						<div class="ProductNewstyle__Content-sc-7fge4a-7 nqDMw">
							<div class="ProductNewstyle__LocationButtons-sc-7fge4a-13 csejSP">
								<button id="map-button" type="button" class="ProductNewstyle__LocationButton-sc-7fge4a-14 gSQyxP">장소선택</button>
								<input type="hidden" name="placeAddress" id="placeAddress">
								<input type="hidden" name="placeDetail" id="placeDetail">		
								<span id="output"></span>
								<span id="output2"></span>
								
								<div class="hide">
									<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/market/marketMap.jsp"/>
								</div>		
							</div>
						</div>
	
					</li>
					<li class="ProductNewstyle__Group-sc-7fge4a-5 iZffvT">
						<form:label path="product_category">
						<div class="ProductNewstyle__Label-sc-7fge4a-6 lbBrxT">
							거래 방식
							<span>*</span>
						</div>
						</form:label>	
						<div class="ProductNewstyle__Content-sc-7fge4a-7 nqDMw">
							<div class="sc-fQejPQ uRmYL">
								<label for="판매" class="sc-clNaTc glleKD">
									<input id="판매" type="radio" value="0" class="sale-button" checked="">판매
								</label>
								<label for="나눔" class="sc-clNaTc jtsyFl">
									<input id="나눔" type="radio" value="0" class="share-button">나눔
								</label>
								<form:input path="product_category"  type="hidden"/>
							</div>
						</div>
					</li>
					<li class="ProductNewstyle__Group-sc-7fge4a-5 iZffvT">
						<div class="ProductNewstyle__Label-sc-7fge4a-6 jwlElY">
							가격
							<span>*</span>
						</div>
						<div class="ProductNewstyle__Content-sc-7fge4a-7 nqDMw">
							<div class="ProductNewstyle__PriceInputWrapper-sc-7fge4a-16 hvsHYk">
								<form:input path="product_price" placeholder="가격을 입력해 주세요." class="ProductNewstyle__PriceInput-sc-7fge4a-17 gZdwcQ" value="" type="text" autocomplete='off'/>
								<form:errors path="product_price" cssClass="error-color"/>
							</div>
							<span id="price_valid" class="valid-message"></span>
						</div>
					</li>
					<li class="ProductNewstyle__Group-sc-7fge4a-5 iZffvT">
						<div class="ProductNewstyle__Label-sc-7fge4a-6 hOhSsv">
							설명
							<span>*</span>
						</div>
						<div class="ProductNewstyle__Content-sc-7fge4a-7 nqDMw">
							<form:textarea  path="product_content" rows="6" class="ProductNewstyle__Description-sc-7fge4a-21 gQnFKF"/>
							<div class="ProductNewstyle__DescriptionPlaceholder-sc-7fge4a-22 jGuSEs">
								구매시기, 브랜드/모델명, 제품의 상태 (사용감, 하자 유무) 등을 입력해 주세요.
								<br>
								서로가 믿고 거래할 수 있도록, 자세한 정보와 다양한 각도의 상품 사진을 올려주세요.
								<br>
								<span>
								* 안전하고 건전한 거래 환경을 위해 코딩허브가 함께 합니다.
								</span>
							</div>
							<div class="ProductNewstyle__DescriptionInfo-sc-7fge4a-23 jquLBX">
								<span class="Commonstyle__GuideText-sc-1tiw3ig-0 eevTjd">
									<span id="content_valid" class="valid-message"></span>
								</span>
								<div class="ProductNewstyle__DescCounter-sc-7fge4a-24 letter-count cQWFja" id="content_count">
									0/300
								</div>
							</div>
							
						</div>
					</li>
				</ul>
			</section>
		</main>
		<footer class="ProductNewstyle__FloatingFooter-sc-7fge4a-27 bOkXJa">
			<div class="ProductNewstyle__RegisterButtonWrapper-sc-7fge4a-28 hDtjVn">
				<button type="button" class="ProductNewstyle__TempSaveButton-sc-7fge4a-37 eQoStg"onclick="location.href='list?category=0'">작성취소</button>
				<form:button class="ProductNewstyle__RegisterButton-sc-7fge4a-29 fbBXvz">등록하기</form:button>
			</div>
		</footer>
		</form:form>
	</div>
</div>
				
				
