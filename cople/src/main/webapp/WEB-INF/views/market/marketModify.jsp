<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 내용 시작 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/JJH/market.modify.js"></script>
<div class="page-main">
<h1>상품 등록</h1>
	<form:form action="modify" modelAttribute="marketVO" id="register_form"
	                                      enctype="multipart/form-data">
		<form:errors element="div" cssClass="error-color"/>
		<form:input path="product_num" type="hidden" value="${market.product_num}"/>
		<div class="marketWrite1">
			<ul>
				<li>
					<div class="market_photo">
						<form:label path="upload" class="camera-click"><img src="${pageContext.request.contextPath}/images/camera icon.png" width="50"></form:label>
						<br>
						<span id="count">0/4</span>
					</div>
					<div class="file-list">
						<div id="photo0" class="filebox">
	             			 <input type="hidden" name="fileName0" value="market.filename0">
							 <img width="50" height="50" class="pr-photo0 pr-image" src="${pageContext.request.contextPath}/upload/${market.filename0}"> <div class="delete-button" data-num="0" >x</div>
	               		</div>
						<c:if test="${!empty market.filename1}">
							<div id="photo1" class="filebox">
	             			 <input type="hidden" name="fileName1" value="market.filename1">
							 <img width="50" height="50" class="pr-photo1 pr-image" src="${pageContext.request.contextPath}/upload/${market.filename1}"> <div class="delete-button" data-num="1" >x</div>
	               			</div>
						</c:if>
						<c:if test="${!empty market.filename2}">
							<div id="photo2" class="filebox">
	             			 <input type="hidden" name="fileName2" value="market.filename2">
							 <img width="50" height="50" class="pr-photo2 pr-image" src="${pageContext.request.contextPath}/upload/${market.filename2}"> <div class="delete-button" data-num="2" >x</div>
	               			</div>
						</c:if>
						<c:if test="${!empty market.filename3}">
							<div id="photo3" class="filebox">
	             			 <input type="hidden" name="fileName3" value="market.filename3">
							 <img width="50" height="50" class="pr-photo3 pr-image" src="${pageContext.request.contextPath}/upload/${market.filename3}"> <div class="delete-button" data-num="3" >x</div>
	               			</div>
						</c:if>
					</div>
					
					<input type="file" id="upload" name="upload" 
									accept="image/gif,image/png,image/jpeg"  multiple>
					<input type="hidden" name="count" id="photo_count">
										
					<span id="photo_valid" class="valid-message"></span>
				</li>
				<li>
					<form:label path="product_title"><h2>제목</h2></form:label>
				</li>
				<li>
					<span class="letter-count" id="title_count"></span>
					<form:input path="product_title" value="${market.product_title}" placeholder="제목을 입력해 주세요." autocomplete='off'/>
					<span id="title_valid" class="valid-message"></span>
				</li>
				<li>
					<form:label path="product_category"><h2>거래 방식</h2></form:label>
				</li>
				<li>
					<input type="button" value="판매하기" class="sale-button">
					<input type="button" value="나눔하기" class="share-button">
					<form:input path="product_category" value="${market.product_category}" type="hidden"/>
				</li>
				<li>
					<form:input path="product_price" value="${market.product_price}" placeholder="가격을 입력해 주세요." autocomplete='off'/>
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
					<span class="letter-count" id="content_count"></span>
					<form:textarea path="product_content" placeholder="신뢰할 수 있는 거래를 위해 자세히 적어주세요.
비속어,유해한 내용,허위 사실은 신고 조치 대상이 될 수 있습니다." rows="7" cols="50"/>
					<span id="content_valid" class="valid-message"></span>
					<input type="hidden" id="content" value="${market.product_content}">
					<script>
						$(function(){
							var content = $('#content').val();
							$('#product_content').val(content);
						});
					</script>
				</li>
				<li>
					<h2>거래 희망 장소</h2>
				</li>
				<li>
					<input type="button" id="map-button" value="장소 선택 ">
					<input type="hidden" name="placeAddress" id="placeAddress">
					<input type="hidden" name="placeDetail" id="placeDetail">
					<span id="output"><c:if test="${!empty market.product_place}">${market.product_place}</c:if></span><br>
					<span id="output2"><c:if test="${!empty market.product_placeDetail}">${market.product_placeDetail}</c:if></span>
				</li>
			</ul>
		</div>
		<div class="align-center clear">
			<form:button>작성 완료</form:button>
			<input type="button" value="작성 취소" onclick="location.href='detail?product_num='+${market.product_num}">
		</div>	
	</form:form>
</div>
<!-- 내용 끝 -->
<div class="hide">
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/market/marketMap.jsp"/>
</div>
                               
	                                     