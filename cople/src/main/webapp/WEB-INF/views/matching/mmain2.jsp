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
							<a class="text-gray-900 hover:text-violet-500">
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
				
				<!-- 지도 부분 -->
				<div id="map" style="width: 100%; height: 350px;"></div>
				<!-- 지도 끝 -->
			</div>
			<c:if test="${user.auth==1}">
				<div class="hidden flex-none sm:inline">
					<a class="flex h-9 items-center space-x-1 rounded-md bg-violet-500 px-3 py-2 text-white shadow-sm hover:bg-violet-600 sm:pr-4" href="${pageContext.request.contextPath}/matching/emp_register">
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true" class="h-4 w-4">
							<path fill-rule="evenodd" d="M7.5 6a4.5 4.5 0 119 0 4.5 4.5 0 01-9 0zM3.751 20.105a8.25 8.25 0 0116.498 0 .75.75 0 01-.437.695A18.683 18.683 0 0112 22.5c-2.786 0-5.433-.608-7.812-1.7a.75.75 0 01-.437-.695z" clip-rule="evenodd">
							</path>
						</svg>
						<span class="inline text-sm font-medium hover:no-underline sm:leading-5">
							현직자 신청하기
						</span>
					</a>
				</div>
				</c:if>
				<c:if test="${user.auth==2}">
				<div class="hidden flex-none sm:inline">
					<a class="flex h-9 items-center space-x-1 rounded-md bg-violet-500 px-3 py-2 text-white shadow-sm hover:bg-violet-600 sm:pr-4" href="${pageContext.request.contextPath}/matching/my_emp_register">
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true" class="h-4 w-4">
							<path fill-rule="evenodd" d="M7.5 6a4.5 4.5 0 119 0 4.5 4.5 0 01-9 0zM3.751 20.105a8.25 8.25 0 0116.498 0 .75.75 0 01-.437.695A18.683 18.683 0 0112 22.5c-2.786 0-5.433-.608-7.812-1.7a.75.75 0 01-.437-.695z" clip-rule="evenodd">
							</path>
						</svg>
						<span class="inline text-sm font-medium hover:no-underline sm:leading-5">
							나의 현직자 신청 정보 보기
						</span>
					</a>
				</div>
				</c:if>
		</div>
		
	</div>
	
</main>
<!-- 현직자 프로필 -->

						
				
				
<div class="main_container__H2cvg">

	<div class="my-7">
		<div class="relative h-36 rounded-xl bg-violet-50/10 sm:h-32 dark:bg-gray-700">
			<div class="h-full bg-left-bottom opacity-5" style="background-image: url('${pageContext.request.contextPath}/images/pattern.svg');">
			</div>
			<div class="flex w-full justify-center">
				<div class="absolute top-0 flex flex-col items-center gap-y-2 py-4 sm:gap-y-1 sm:py-5">
					<span class="w-full text-center text-base font-bold sm:text-lg">
						Coding Hub는 코린이들을 위한
						<br class="sm:hidden">개발자 Platform입니다
					</span>
					<div class="w-full space-y-0.5 text-center text-xs font-normal text-gray-500 sm:text-sm">
						<aside>
							<strong>Yes!</strong> 
							처음이라 어려운 사람도
						<span class="hidden sm:inline"> 
							자유로운 상담
						</span>
							, 1:1 첨삭지원
						<span class="hidden sm:inline"> 
							서비스
						</span>
					</aside>
					<aside>
						<strong>No!</strong> 
						불건전한 말투, 허위정보
					</aside>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="search_searchWrapper__gYQXu">
	<c:if test="${count > 0}">
    <div class="search_listWrapper__6N4FN" style="position: relative; height: 400px; width: 750px; overflow: auto; will-change: transform; direction: ltr;">
        <div style="display: flex; height: 100%; width: 25000px;">
            <c:forEach var="member" items="${memberList}">
                <div class="search_item_itemWrapper__8lq1L" style="width: 250px; flex-shrink: 0;">
                    <div class="search_item_imgWrapper__JDClR">
                        <a href="#" data-id="${member.mem_num}"></a>
                        <div class="profile-dropdown" style="box-sizing: border-box; display: inline-block; overflow: hidden; width: initial; height: initial; background: none; opacity: 1; border: 0px; margin: 0px; padding: 0px; position: relative; max-width: 100%;">
                            <span style="box-sizing: border-box; display: block; width: initial; height: initial; background: none; opacity: 1; border: 0px; margin: 0px; padding: 0px; max-width: 100%;">
                                <img alt="" aria-hidden="true" src="data:image/svg+xml,%3csvg%20xmlns=%27http://www.w3.org/2000/svg%27%20version=%271.1%27%20width=%27210%27%20height=%27210%27/%3e" style="display: block; max-width: 100%; width: initial; height: initial; background: none; opacity: 1; border: 0px; margin: 0px; padding: 0px;">
                            </span>
                            <img class="photo_list" src="${pageContext.request.contextPath}/matching/viewProfile?userNum=${member.mem_num}" style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%; object-fit: cover;">
                            <div class="profile-dropdown-content">
                                <a class="detail" href="#" onclick="see_emp_register('${member.mem_num}')" data-id="${member.mem_num}">프로필 보기</a>
                                <a class="detail" href="#" onclick="send_letter('${member.mem_num}')" data-id="${member.mem_num}">쪽지 보내기</a>
                                <a class="detail" href="#" onclick="send_advice('${member.mem_num}')" data-id="${member.mem_num}">첨삭 요청하기</a>
                            </div>
                        </div>
                    </div>            
                </div>
           	</c:forEach>
        	</div>
        	<div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
			<div class="swiper-button-prev"></div><!-- 이전 버튼 -->
			<!-- 페이징 -->
			<div class="swiper-pagination"></div>
    	</div>
	</c:if>
	<c:if test="${count==0}">
		등록된 현직자가 존재하지 않습니다.
	</c:if>
	</div>
	<div class="min-w-0 flex-auto space-y-8">
	<div class="relative flex flex-col items-center justify-center gap-y-2 rounded-xl border border-blue-100 bg-gray-100 bg-opacity-30 py-14 pb-0 xl:pb-14 dark:bg-gray-800 dark:bg-opacity-50 dark:text-gray-100">
		<h1 class="text-3xl font-bold">
			Coding Hub 취업 현황 데이터
		</h1>
		<p class="text-center text-sm">
			<strong>
				Coding Hub 회원님들의
			</strong> 
			궁금증 해소를 위한<br>실제 취업 현황 데이터를 제공합니다.
		</p>
		<div class="bottom-0 left-0 px-24 pt-8 xl:absolute xl:pt-0">
			<img src="${pageContext.request.contextPath}/images/lawyer_left.svg" alt="hero" class="">
		</div>
		<div class="absolute bottom-0 right-0 hidden px-24 xl:block">
			<img src="${pageContext.request.contextPath}/images/lawyer_right.svg" alt="hero" class="">
		</div>
	</div>
	<div class="mx-auto mt-8 max-w-7xl">
		<div class="rounded-xl bg-gray-100 px-6 py-6 pb-12 sm:px-14 sm:py-12 dark:bg-gray-800 dark:bg-opacity-50">
	
	
	
	<!-- 취업현황 데이터 -->
	<div class="echartMain">
		<div id="container1" style="height: 300px"></div>
		<div id="container2" style="height: 300px"></div>
	</div>
	<div class="allview_container__F0mAa">
		<div class="allview_txt__TkMlc">
			<div id="moreChart" class="chartButton">전체보기</div>
			<div id="hideChart" class="chartButton" style="display: none;">접어두기</div>
		</div>
	</div>
	
	
	<div class="chart-container clearfix" id="chartBundle" style="display: none;">
		<div class="chart" id="donutchart1"></div>
		<div class="chart" id="donutchart2"></div>
		<div class="chart" id="donutchart4"></div>
		<div class="chart" id="donutchart5"></div>
		<div class="chart" id="donutchart7"></div>
		<div class="chart" id="donutchart8"></div>
		<div class="chart" id="donutchart9"></div>
		<div class="chart" id="donutchart10"></div>
		<div class="chart" id="donutchart11"></div>
		<div class="chart" id="barchart_values" style="width: 900px; height: 300px;"></div>
	</div>
</div>		
</div>
</div>
</div>


	