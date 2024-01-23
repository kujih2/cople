<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- 내용 시작 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<div class="page-main">
<h1>상품 등록</h1>
	<form:form action="write" modelAttribute="marketVO" id="register_form"
	                                      enctype="multipart/form-data">
		<form:errors element="div" cssClass="error-color"/>
		<div class="marketWrite1">
			<ul>
				<li>
					<div class="market_photo">
						<img src="${pageContext.request.contextPath}/images/camera icon.png" width="50">
						<br>
						<div class="align-center"><b><span>0</span>/4</b></div>
					</div>
					<small>※1개이상의 사진은 필수로 넣어주세요!</small>
				</li>
				<li>
					<form:label path="product_title"><h2>제목</h2></form:label>
				</li>
				<li>
					<form:input path="product_title" placeholder="제목을 입력해 주세요."/>
					<form:errors path="product_title" cssClass="error-color"/>
				</li>
				<li>
					<form:label path="product_category"><h2>거래 방식</h2></form:label>
				</li>
				<li>
					<input type="button" value="판매하기">
					<input type="button" value="나눔하기">
				</li>
				<li>
					<form:input path="product_price" placeholder="가격을 입력해 주세요."/>
					<form:errors path="product_price" cssClass="error-color"/>
				</li>
			</ul>
		</div>
		<div class="marketWrite2">
			<ul>
				<li>
					<h3>상품에 대한 자세한 설명을 적어주세요</h3>
				</li>
				<li>
					<form:textarea path="product_content" placeholder="신뢰할 수 있는 거래를 위해 자세히 적어주세요.
비속어,유해한 내용,허위 사실은 신고 조치 대상이 될 수 있습니다." rows="7" cols="50"/>
					<form:errors path="product_content" cssClass="error-color"/>
				</li>
				<li>
					<h2>거래 희망 장소</h2>
				</li>
				<li>
					<input type="button" value="장소 선택">
				</li>
			</ul>
		</div>
		<div class="align-center clear">
			<form:button>작성 완료</form:button>
			<input type="button" value="작성 취소" onclick="">
		</div>	
	</form:form>
</div>
<!-- 내용 끝 -->



	                                      
	                                      
	                                     