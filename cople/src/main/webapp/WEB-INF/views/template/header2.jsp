<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 상단시작 -->
<div id="__next">
	<header class="sticky top-0 z-20 flex h-16 items-center border-b border-b-gray-500/30 bg-white py-5 text-sm font-medium leading-6 dark:border-b-gray-500/70 dark:bg-gray-800" data-headlessui-state="">
		<nav aria-label="Global" class="mx-auto flex w-full max-w-7xl px-4 lg:px-0">
			<div class="flex w-full items-center justify-between">
				<div class="flex">
					<a class="flex items-center" href="${pageContext.request.contextPath}/main/main">
						<span class="sr-only">Coding hub</span>
						<img class="h-7" src="${pageContext.request.contextPath}/images/logo.png" alt="COPLE Logo">
					</a>
					<div class="ml-3 hidden items-center space-x-7 md:flex lg:ml-[105px]">
						<div class="shrink-0">
							<a class="text-gray-900 hover:text-blue-500" href="${pageContext.request.contextPath}/wiki/detail?doc_num=82">위키</a>
						</div>
						<div class="shrink-0">
							<a class="text-gray-900 hover:text-blue-500" href="${pageContext.request.contextPath}/community/commuMain">커뮤니티</a>
						</div>
						<div class="shrink-0">
							<a class="text-blue-500 text-sm font-medium hover:no-underline" href="${pageContext.request.contextPath}/market/list">장터</a>
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
					</div>
					<div class="hidden items-center md:flex">
						<div class="flex items-center gap-x-6">
							<div class="w-40 lg:w-[235px]"></div>
						</div>
						<c:if test="${empty user}">
						<a class="ml-2 hidden h-[35px] w-[85px] items-center justify-center rounded-3xl border border-gray-500/30 bg-white text-center text-xs font-medium text-gray-900 shadow-sm hover:bg-gray-100 focus:outline-none sm:flex lg:ml-10" href="${pageContext.request.contextPath}/member/login">로그인</a>
						<a class="ml-2.5 hidden h-[35px] w-[85px] items-center justify-center rounded-3xl border border-transparent bg-blue-500 px-2 py-0.5 text-xs font-medium text-white hover:bg-blue-400 focus:outline-none focus:ring-offset-0 sm:flex" href="${pageContext.request.contextPath}/member/registerUser">회원가입</a>
						</c:if>
						<c:if test="${!empty user}">
						<div class="hidden items-center md:flex">
							<div class="ml-[102px] mr-5">
								<a href="">
									<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true" class="h-5 w-5 text-gray-400 hover:cursor-pointer hover:text-blue-500 dark:hover:text-blue-200">
										<path stroke-linecap="round" stroke-linejoin="round" d="M17.593 3.322c1.1.128 1.907 1.077 1.907 2.185V21L12 17.25 4.5 21V5.507c0-1.108.806-2.057 1.907-2.185a48.507 48.507 0 0111.186 0z">
										</path>
									</svg>
								</a>
							</div>
							<div class="mr-5">
								<div class="relative" data-headlessui-state="">
									<button class="relative -my-1 flex h-8 w-6 items-center justify-center rounded-sm text-gray-400 hover:text-blue-500 focus:outline-0 focus:ring-0 dark:hover:text-blue-200" id="headlessui-popover-button-:r3:" type="button" aria-expanded="false" data-headlessui-state="">
										<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true" class="h-6 w-6">
											<path stroke-linecap="round" stroke-linejoin="round" d="M14.857 17.082a23.848 23.848 0 005.454-1.31A8.967 8.967 0 0118 9.75v-.7V9A6 6 0 006 9v.75a8.967 8.967 0 01-2.312 6.022c1.733.64 3.56 1.085 5.455 1.31m5.714 0a24.255 24.255 0 01-5.714 0m5.714 0a3 3 0 11-5.714 0"></path>
										</svg>
									</button>
								</div>
							</div>
							<div class="relative">
								<div class="relative">
									<a class="flex rounded-full bg-white focus:outline-none dark:bg-gray-800" href="${pageContext.request.contextPath}/member/myPage">
									<img class="h-8 w-8 rounded-full" src="${pageContext.request.contextPath}/member/photoView" alt="프로필 사진">
									</a>
								</div>
							</div>
						</div>
						</c:if>
					</div>
				</div>
			</nav>
		</header>
	</div>

<!-- 상단끝 -->