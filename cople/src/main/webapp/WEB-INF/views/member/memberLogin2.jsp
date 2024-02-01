<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<!-- 내용 시작 -->
<div class="flex h-full select-auto flex-col font-sans text-gray-900 antialiased dark:bg-gray-800 dark:text-gray-100">
	<div id="__next">
		<div class="mt-20 flex justify-center px-6 pb-16 sm:mt-32 sm:px-0">
			<div class="w-full max-w-md">
				<a href="/">
					<img class="mx-auto h-12 w-auto" src="${pageContext.request.contextPath}/images/logo.png" alt="Coding Hub">
				</a>
				<h2 class="mt-6 text-center text-2xl font-bold sm:text-3xl">Coding Hub에 오신것을 환영합니다.</h2>
				<p class="mt-2 text-center text-sm text-gray-600 dark:text-gray-400">Coding Hub는 소프트웨어 개발자를 위한 지식공유 플랫폼입니다.</p>
				<div class="mx-4 sm:mx-0">
					<div class="relative mt-7">
						<div class="absolute inset-0 flex items-center">
							<div class="w-full border-t border-gray-500/30 dark:border-gray-500/70"></div>
						</div>
						<div class="relative flex justify-center text-sm">
							<span class="bg-white px-2 text-gray-500 dark:bg-gray-800">Coding Hub 아이디로 로그인</span>
						</div>
					</div>
					<form class="mt-8 space-y-6" id="member_login" action="login" modelAttribute="memberVO">
						<form:errors element="div" cssClass="error-color"/>
					<div>
						<div class="space-y-6 rounded-md shadow-sm">
							<div>
								<label id="id" class="block text-sm font-medium text-gray-700 dark:text-gray-300">아이디</label>
								<div class="mt-1">
									<form:input path="id" type="text" autocomplete="" cssClass="form-input" class="block w-full appearance-none rounded-md border border-gray-500/30 px-3 py-2 text-sm placeholder-gray-500/80 shadow-sm focus:border-gray-500 focus:outline-none focus:ring-0 dark:bg-gray-500/20 sm:text-base"autocomplete="off"/>
								</div>
								<form:errors path="id" element="div" cssClass="error-color"/>
							</div>
							<div>
								<label id="passwd"class="block text-sm font-medium text-gray-700 dark:text-gray-300">비밀번호</label>
								<div class="mt-1">
									<password id="passwd"  class="block w-full appearance-none rounded-md border border-gray-500/30 px-3 py-2 text-sm placeholder-gray-500/80 shadow-sm focus:border-gray-500 focus:outline-none focus:ring-0 dark:bg-gray-500/20 sm:text-base"/>
								</div>
								<form:errors path="passwd" element="div" cssClass="error-color"/>
							</div>
						</div>
					</div>
					<div class="flex items-center justify-end">
						<div class="space-x-2 text-sm">
							<a class=" text-blue-500 hover:text-blue-400" href="/forgot">계정찾기</a>
						</div>
					</div>
					<div>
						<button type="submit" class="relative flex w-full justify-center rounded-md border border-transparent bg-blue-500 px-4 py-2 text-sm font-medium text-white hover:bg-blue-400 focus:outline-none">로그인</button>
					</div>
						<p class="flex items-center justify-center space-x-1 text-sm">
							<span>아직 회원이 아니신가요?</span>
							<a class="flex items-center text-blue-500 underline hover:text-blue-400" href="/signup">회원가입</a>
						</p>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div id="portal-root">
	</div>
</div>
<!-- 내용 끝 -->










