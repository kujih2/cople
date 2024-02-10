<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/HJW/main.css">
<!-- 상단시작 -->
	<header class="sticky top-0 z-20 flex h-16 items-center border-b border-b-gray-500/30 bg-white py-5 text-sm font-medium leading-6 dark:border-b-gray-500/70 dark:bg-gray-800" data-headlessui-state="">
		<nav aria-label="Global" class="mx-auto flex w-full max-w-7xl px-4 lg:px-0">
			<div class="flex w-full items-center justify-between">
				<div class="flex">
					<a class="flex items-center" href="${pageContext.request.contextPath}/main/main2">
						<span class="sr-only">Coding hub</span>
						<img class="h-7" src="${pageContext.request.contextPath}/images/logo.png" alt="COPLE Logo">
					</a>
					
					<div class="ml-3 hidden items-center space-x-7 md:flex lg:ml-[105px]">
					<c:if test="${empty user}">
						<div class="shrink-0">
							<a class="text-gray-900 hover:text-blue-500" href="${pageContext.request.contextPath}/wiki/detail?doc_num=82">위키</a>
						</div>
						<div class="shrink-0" style="margin-left:560px"></div>
					</c:if>
					<c:if test="${!empty user}">
						<div class="shrink-0">
							<a class="text-gray-900 hover:text-blue-500" href="${pageContext.request.contextPath}/wiki/detail?doc_num=82">위키</a>
						</div>
						<div class="shrink-0">
							<a class="text-gray-900 hover:text-blue-500" href="${pageContext.request.contextPath}/community/commuMain">커뮤니티</a>
						</div>
						<div class="shrink-0">
							<a class="text-gray-900 hover:text-blue-500" href="${pageContext.request.contextPath}/market/list?category=0">장터</a>
						</div>
					
						<div class="h-3 w-[1px] bg-gray-400"></div>
							<div class="shrink-0">
								<a class="text-violet-500 hover:text-violet-700 relative text-sm font-medium" href="${pageContext.request.contextPath}/matching/mmain">
									<span class="hover:no-underline">JOBS</span>
									<img class="absolute bottom-3 right-3" src="${pageContext.request.contextPath}/images/new-badge.svg" alt="">
								</a>
							</div>
							<div class="h-3 w-[1px] bg-gray-400"></div>
						</div>
						</c:if>
					</div> 
					
					<div class="hidden items-center md:flex">
						<div class="flex items-center gap-x-6">
							<div class="w-40 lg:w-[235px]"></div>
						</div>
						<c:if test="${empty user}">
						<a class="ml-2 hidden h-[35px] w-[85px] items-center justify-center rounded-3xl border border-gray-500/30 bg-white text-center text-xs font-medium text-gray-900 shadow-sm hover:bg-gray-100 focus:outline-none sm:flex lg:ml-10" href="${pageContext.request.contextPath}/member/login">로그인</a>
						<a class="ml-2.5 hidden h-[35px] w-[85px] items-center justify-center rounded-3xl border border-transparent bg-blue-500 px-2 py-0.5 text-xs font-medium text-white hover:bg-blue-400 focus:outline-none focus:ring-offset-0 sm:flex" href="${pageContext.request.contextPath}/member/registerUser">회원가입</a>
						</c:if>
						
						<div class="hidden items-center md:flex">
								<div class="mr-5">
								<div class="relative">
								<c:if test="${!empty user}">
								<a href="${pageContext.request.contextPath}/member/logout">
									<button class="relative -my-1 flex h-8 w-6 items-center justify-center rounded-sm text-gray-400 hover:text-blue-500 focus:outline-0 focus:ring-0 dark:hover:text-blue-200" id="headlessui-popover-button-:r3:" type="button" aria-expanded="false" style="font-family:inherit;font-feature-settings:inherit;font-variation-settings:inherit;font-size:100%;font-weight:inherit;line-height:inherit;color:inherit;margin:0;padding:0;text-transform:none;-webkit-appearance:button;background-color:transparent;background-image:none">
										<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true" class="bi bi-box-arrow-right">
											<path stroke-linecap="round" stroke-linejoin="round" d="M15.75 9V5.25A2.25 2.25 0 0013.5 3h-6a2.25 2.25 0 00-2.25 2.25v13.5A2.25 2.25 0 007.5 21h6a2.25 2.25 0 002.25-2.25V15m3 0l3-3m0 0l-3-3m3 3H9">
											</path>
										</svg>
									</button>
								</a>
								</div>
							</div>
							<c:if test="${!empty user && user.auth ==9}">
							<div class="mr-5">
								<div class="relative">
								<a href="${pageContext.request.contextPath}/admin/adminMain">
									<button class="relative -my-1 flex h-8 w-6 items-center justify-center rounded-sm text-gray-400 hover:text-blue-500 focus:outline-0 focus:ring-0 dark:hover:text-blue-200" id="headlessui-popover-button-:r3:" type="button" aria-expanded="false" data-headlessui-state="" style="font-family:inherit;font-feature-settings:inherit;font-variation-settings:inherit;font-size:100%;font-weight:inherit;line-height:inherit;color:inherit;margin:0;padding:0;text-transform:none;-webkit-appearance:button;background-color:transparent;background-image:none">
										<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="#9CA3AF" class="bi bi-person-fill-gear" viewBox="0 0 16 16">
					  						<path d="M11 5a3 3 0 1 1-6 0 3 3 0 0 1 6 0Zm-9 8c0 1 1 1 1 1h5.256A4.493 4.493 0 0 1 8 12.5a4.49 4.49 0 0 1 1.544-3.393C9.077 9.038 8.564 9 8 9c-5 0-6 3-6 4Zm9.886-3.54c.18-.613 1.048-.613 1.229 0l.043.148a.64.64 0 0 0 .921.382l.136-.074c.561-.306 1.175.308.87.869l-.075.136a.64.64 0 0 0 .382.92l.149.045c.612.18.612 1.048 0 1.229l-.15.043a.64.64 0 0 0-.38.921l.074.136c.305.561-.309 1.175-.87.87l-.136-.075a.64.64 0 0 0-.92.382l-.045.149c-.18.612-1.048.612-1.229 0l-.043-.15a.64.64 0 0 0-.921-.38l-.136.074c-.561.305-1.175-.309-.87-.87l.075-.136a.64.64 0 0 0-.382-.92l-.148-.045c-.613-.18-.613-1.048 0-1.229l.148-.043a.64.64 0 0 0 .382-.921l-.074-.136c-.306-.561.308-1.175.869-.87l.136.075a.64.64 0 0 0 .92-.382l.045-.148ZM14 12.5a1.5 1.5 0 1 0-3 0 1.5 1.5 0 0 0 3 0Z"/>
										</svg>
									</button>
									</a>
								</div>
							</div>
							</c:if>
							<div class="relative">
								<div class="relative">
									<a class="flex rounded-full bg-white focus:outline-none dark:bg-gray-800" href="${pageContext.request.contextPath}/member/myPage">
									<img class="h-8 w-8 rounded-full" src="${pageContext.request.contextPath}/member/photoView" alt="프로필 사진">
									</a>
									</c:if>
								</div>
							</div>
						</div>
						
					</div>
				</div>
			</nav>
		</header>

<!-- 상단끝 -->