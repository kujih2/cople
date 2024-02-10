<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 내용 시작 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/JJH/market.write.js"></script>

<div id="root">
	<div class="app">
		<div class="sc-hGoxap bInodS">
			<div class="sc-dfVpRl fxYqEy">
				<div class="sc-gzOgki ciqSeg">
					<div class="sc-iyvyFf kPWKwK">
					
						<a class="sc-hwwEjo bNjUuQ" href="/">
							<img src="${pageContext.request.contextPath}/images/logo_market.png" style="width:136px; height:40;" alt="코딩허브 로고">
						</a>
						
						<form action="list" id="search_form"  method="get">
							<div class="sc-jKJlTe keyjxL">
								<div class="sc-eNQAEJ voMyM">
									<input type="search" placeholder="상품명, 내용 입력" maxlength="40" class="sc-hMqMXs cLfdog"  name="market_keyword"  id="market_keyword" style="padding: -0.5rem .75rem;">
									<a class="sc-kEYyzF gfWKdx" id="submit-btn" type="submit">
										<img src="${pageContext.request.contextPath}/images/search_icon.png" width="16" height="16" alt="검색 버튼 아이콘">
									</a>
								</div>
							</div>
						<div class="category-box" style="visibility:hidden;">
  							<c:if test="${category == 0}">
  								<span class="category0">중고 상품</span>/<span class="category1">나눔 상품</span>
  							</c:if>
  							<c:if test="${category == 1}">
  								<span class="category0" style="color:gray;font-weight:none">중고 상품</span>/<span class="category1" style="color:black;font-weight:bold">나눔 상품</span>
  							</c:if>
  								<input type="hidden" name="category" id="category" value="${category}">
  							</div>
						</form>
			
			
						<!-- 오른쪽 상단 버튼 -->							
						<div class="sc-esjQYD eqbkiv">
							<c:if test="${!empty user && user.id != market.seller_id}">
								<button class="sc-kIPQKe foChwP" onclick="location.href='marketChatRoom'">
									<img src="${pageContext.request.contextPath}/images/talk_icon.png" width="23" height="24" alt="허브톡버튼 이미지">허브톡
								</button>
							</c:if>
							<c:if test="${!empty user}">
								<button class="sc-eXEjpC BltZS" >
									<img src="${pageContext.request.contextPath}/member/photoView" width="23" height="24" alt="내상점버튼 이미지">
										<c:if test="${empty user.nick_name}">
											<p>${user.id}</p>
										</c:if>
										<c:if test="${!empty user.nick_name}">
											<p>${user.nick_name}</p>
										</c:if>
								</button>
							</c:if>
								<button class="sc-eXEjpC BltZS" onclick="location.href='write'">
									<img src="${pageContext.request.contextPath}/images/sell_icon.png" width="23" height="26" alt="판매하기버튼 이미지">판매하기
								</button>
						</div>
					</div>
					
					
					<div class="sc-kPVwWT gwGdGE">
					
						<div style="display: flex; align-items: center; gap: 4px;"></div>
					</div>
				</div>
	
				<div class="sc-ibxdXY bzAoPK">
				</div>
				</div>
				</div>








				<div class="sc-hjRWVT jIRTJW">
					<div class="ProductNewstyle__Wrapper-sc-7fge4a-0 hmUNzn">
						<main class="ProductNewstyle__Main-sc-7fge4a-2 hjRvIo">
							<section class="ProductNewstyle__Basic-sc-7fge4a-3 bsIKMq">
							
								<h2 class="ProductNewstyle__SectionTitle-sc-7fge4a-1 fGSdXi">기본정보<span>*필수항목</span></h2>
								<form:form action="write" modelAttribute="marketVO" id="register_form" enctype="multipart/form-data">
									<form:errors element="div" cssClass="error-color"/>
										<ul class="ProductNewstyle__Groups-sc-7fge4a-4 hcyuoc">
											<li class="ProductNewstyle__Group-sc-7fge4a-5 iZffvT">
												<div class="ProductNewstyle__Label-sc-7fge4a-6 cosfJW">상품이미지<span>*</span><small>(0/12)</small></div>
												<div class="ProductNewstyle__Content-sc-7fge4a-7 nqDMw">
													<ul class="sc-jKVCRD czzFIC">
														<li class="sc-kaNhvL bgRkND">이미지 등록										
															<form:label path="upload" class="camera-click"></form:label>
															<b><span id="count">0/4</span></b>										
														</li>
														<li class="sc-LKuAh dnaPgQ">
															<div class="file-list"></div>
															<input class="sc-LKuAh dnaPgQ" type="hidden" name="count" id="photo_count">
															<input class="sc-LKuAh dnaPgQ hidden" type="file" id="upload" name="upload" class="hide" accept="image/gif,image/png,image/jpeg"  multiple>
															<input class="sc-LKuAh dnaPgQ" type="hidden" name="count" id="photo_count">
															<span id="photo_valid" class="valid-message"></span>													
														</li>
													</ul>
													<div class="sc-iBEsjs doQsrA">상품 이미지는 PC에서는 1:1, 모바일에서는 1:1.23 비율로 보여져요.</div>
													<li class="ProductNewstyle__Group-sc-7fge4a-5 iZffvT">
														<form:label path="product_title"><h2 class="ProductNewstyle__Label-sc-7fge4a-6 jwlElY">상품명<span>*</span></h2></form:label>
														<div class="ProductNewstyle__Content-sc-7fge4a-7 nqDMw">
															<div class="ProductNewstyle__TitleWrapper-sc-7fge4a-10 iIJDsQ">
																<div class="ProductNewstyle__WithDeleteAll-sc-7fge4a-8 gfrBou">
																	<form:input path="product_title" placeholder="제목을 입력해 주세요."  class="ProductNewstyle__NameInput-sc-7fge4a-11 lmDUxi" autocomplete='off'/>
																	<span id="title_valid" class="valid-message"></span>
							
																</div>
										
															</div>
														</div>
													</li>
								
													<li class="ProductNewstyle__Group-sc-7fge4a-5 iZffvT">
														<form:label path="product_category"><h2 class="ProductNewstyle__Label-sc-7fge4a-6 lbBrxT">거래 방식<span>*</span></h2></form:label>	
														<div class="ProductNewstyle__Content-sc-7fge4a-7 nqDMw">
															<div class="sc-fQejPQ uRmYL">
																<input type="button" value="판매하기" class="sale-button">
																<input type="button" value="나눔하기" class="share-button">
																<form:input path="product_category"  type="hidden"/>
									
															</div>
														</div>
													</li>
													<li class="ProductNewstyle__Group-sc-7fge4a-5 iZffvT">
														<div class="ProductNewstyle__Label-sc-7fge4a-6 jwlElY">가격<span>*</span></div>
														<div class="ProductNewstyle__Content-sc-7fge4a-7 nqDMw">
															<div class="ProductNewstyle__PriceInputWrapper-sc-7fge4a-16 hvsHYk">
																<form:input path="product_price" placeholder="가격을 입력해 주세요." class="ProductNewstyle__PriceInput-sc-7fge4a-17 gZdwcQ" value="" type="text" autocomplete='off'/>
																<form:errors path="product_price" cssClass="error-color"/>
																<span id="price_valid" class="valid-message"></span>
															</div>
														</div>
													</li>
													<li class="ProductNewstyle__Group-sc-7fge4a-5 iZffvT">
														<div class="ProductNewstyle__Label-sc-7fge4a-6 jwlElY">거래지역<span>*</span></div>
														<div class="ProductNewstyle__Content-sc-7fge4a-7 nqDMw">
															<div class="ProductNewstyle__LocationButtons-sc-7fge4a-13 csejSP">
																<input type="button" id="map-button" class="ProductNewstyle__LocationButton-sc-7fge4a-14 gSQyxP" value="장소 선택">
																<input type="hidden" name="placeAddress" id="placeAddress">
																<input type="hidden" name="placeDetail" id="placeDetail">		
																<span id="output"></span>
																<span id="output2"></span>
															</div>
														</div>
														<div class="hide">
															<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/market/marketMap.jsp"/>
														</div>			
			
													</li>
									
													<li class="ProductNewstyle__Group-sc-7fge4a-5 iZffvT">
														<div class="ProductNewstyle__Label-sc-7fge4a-6 hOhSsv">설명<span>*</span></div>
														<div class="ProductNewstyle__Content-sc-7fge4a-7 nqDMw">
															<span class="letter-count" id="content_count">0/300</span>
															<form:textarea  path="product_content" rows="6" class="ProductNewstyle__Description-sc-7fge4a-21 gQnFKF" placeholder="구매시기, 브랜드/모델명, 제품의 상태 (사용감, 하자 유무) 등을 입력해 주세요.
																	<br>
																	서로가 믿고 거래할 수 있도록, 자세한 정보와 다양한 각도의 상품 사진을 올려주세요.
																	<br>
																	<span>* 안전하고 건전한 거래 환경을 위해 코딩허브가 함께 합니다.</span>"/>
															<span id="content_valid" class="valid-message"></span>
														</div>
													</li>
												</div>
												<form:button type="button" class="ProductNewstyle__RegisterButton-sc-7fge4a-29 fbBXvz" style="background:rgb(216, 12, 24)">등록하기</form:button>
												<input type="button" value="작성 취소" onclick="location.href='list?category=0'">
											</div>
										</li>
									</ul>
									</form:form>			
								</section>
							</main>
						</div>
					</div>
						