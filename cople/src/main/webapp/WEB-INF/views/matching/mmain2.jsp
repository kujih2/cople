<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<main class="mx-auto mt-10 w-full max-w-7xl px-4 lg:mt-[42px] lg:px-0">
	<div class="flex">
		<div class="w-full min-w-0 flex-auto lg:static lg:max-h-full lg:overflow-visible">
			<div class="min-w-0 flex-auto">
				<div class="relative mb-12 flex flex-col-reverse items-center justify-center gap-x-10 gap-y-9 sm:mb-20 sm:flex-row">
					<div class="max-w-2xl space-y-4 sm:space-y-6">
						<div class="flex flex-col gap-y-2">
							<h1 class="text-[28px] leading-9 sm:text-[38px] sm:leading-[48px]">
								<span class="font-medium">
									코린이들 모두가 
									<br class="sm:hidden">
									정보를 공유하며
									<br class="hidden sm:block">
									만나는 곳,
									<br class="sm:hidden">
									<span class="font-bold text-violet-500">
									Coding Hub
									</span>
								</span>
							</h1>
							<span class="text-base font-normal text-gray-600 sm:text-lg">
							Coding Hub는 코린이를 위해 존재하는
								<br class="inline sm:hidden">
								개발자 플랫폼입니다.
							</span>
						</div>
						<p class="flex flex-col gap-x-2.5 text-base sm:flex-row sm:text-lg sm:leading-6">
							<a class="text-gray-900 hover:text-violet-500" href="https://okky.kr/articles/1487248">
								#Coding_Hub_정식오픈!
							</a>
						</p>
					</div>
					<img src="${pageContext.request.contextPath}/images/Matching.svg" class="w-[204px] sm:w-auto" alt="">
				</div>
				<div class="border-3 relative my-9 hidden w-full flex-col items-center rounded-2xl border-violet-500 text-center sm:flex">
					<div class="relative h-full w-full overflow-hidden py-6">
						<div>
							<div class="text-xl font-medium leading-[26px] text-violet-500">
								Coding Hub 취업현황
							</div>
							<div class="m-0 text-3xl font-semibold leading-[48px]">
								지금 여기에서 멋진 만남이 시작됩니다.
							</div>
							<div class="text-lg font-medium leading-[26px] text-gray-600">
								"Coding Hub를 통해 새로운 기회를 만들어보세요!"
							</div>
						</div>
						<img src="${pageContext.request.contextPath}/images/Matching_2.svg" alt="" class="absolute -bottom-5 right-20 w-[216px]">
					</div>
					<div class="border-b-3 border-l-3 absolute -bottom-3.5 right-[300px] h-6 w-6 -rotate-45 transform border-violet-500 bg-white">
					</div>
				</div>
				<!-- 여기서 부터 추가 -->
				<c:if test="${user.auth==1}">
				<button class="emp_register" onclick="emp_register()">현직자 신청하기</button>
				</c:if>
				<c:if test="${user.auth==2}">
				<button class="my_emp_register" onclick="my_emp_register()">나의
					현직자 신청 정보 보기
				</button>
				</c:if>
				<!-- 지도 부분 -->
				<div id="map" style="width: 100%; height: 350px;"></div>
				<!-- 지도 끝 -->
			</div>
		</div>
		
	</div>
	
</main>
			




<h2>현직자 프로필</h2>
<c:if test="${count>0}">
	<div class="swiper-container">
		<div class="swiper-wrapper">
			<c:forEach var="member" items="${memberList}">
				<div class="swiper-slide">
					<a href="#" data-id="${member.mem_num}">
					</a>					    
					 <div class="profile-dropdown">
						<img src="${pageContext.request.contextPath}/matching/viewProfile?userNum=${member.mem_num}" width="200" height="200" class="photo_list">
					    <div class="profile-dropdown-content">
					        <a class="detail" href="#" onclick="see_emp_register('${member.mem_num}')" data-id="${member.mem_num}">프로필 보기</a>
					        <a class="detail" href="#" onclick="send_letter('${member.mem_num}')" data-id="${member.mem_num}">쪽지 보내기</a>
					        <a class="detail" href="#" onclick="send_advice('${member.mem_num}')" data-id="${member.mem_num}">첨삭 요청하기</a>
					    </div>
					</div>
				</div>
			</c:forEach>
		</div>
		<!-- 네비게이션 -->
		<div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
		<div class="swiper-button-prev"></div><!-- 이전 버튼 -->
	
		<!-- 페이징 -->
		<div class="swiper-pagination"></div>
	</div>
</c:if>
<c:if test="${count==0}">
등록된 현직자가 존재하지 않습니다.
</c:if>





<br>
<h2>취업 현황 데이터</h2>


<div class="echartMain">
	<div id="container1" style="height: 300px"></div>
	<div id="container2" style="height: 300px"></div>
</div>
<br><br><br>
<button id="moreChart" class="chartButton">데이터 차트 더 보기</button>
<button id="hideChart" class="chartButton" style="display: none;">데이터 차트 접어두기</button>

<div class="chart-container clearfix" id="chartBundle"
	style="display: none;">
	<div class="chart" id="donutchart1"></div>
	<div class="chart" id="donutchart2"></div>
	<div class="chart" id="donutchart4"></div>
	<div class="chart" id="donutchart5"></div>
	<div class="chart" id="donutchart7"></div>
	<div class="chart" id="donutchart8"></div>
	<div class="chart" id="donutchart9"></div>
	<div class="chart" id="donutchart10"></div>
	<div class="chart" id="donutchart11"></div>
	<div class="chart" id="barchart_values"
		style="width: 900px; height: 300px;"></div>
</div>
	