<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!-- MyPage 메뉴 시작 -->
<main class="mx-auto w-full max-w-7xl">
	<div class="mt-6 px-4 lg:mt-10 lg:px-0">
		<div class="divide-y divide-gray-500/30 dark:divide-gray-500/70 lg:grid lg:grid-cols-12 lg:divide-x lg:divide-y-0">
			<aside class="lg:col-span-3 lg:pr-16">
				<h2 class="text-xl font-semibold leading-6">내 계정</h2>
				<nav class="my-4 space-y-2 lg:my-10">
					<a class="bg-gray-200 text-gray-800 dark:bg-gray-700 dark:text-gray-200 group flex items-center rounded-md px-3 py-2 font-medium hover:bg-gray-200 hover:text-gray-800 dark:hover:bg-gray-700 dark:hover:text-gray-300" aria-current="page" href="${pageContext.request.contextPath}/member/myPage">
						<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true" class="text-gray-600 dark:text-gray-400 -ml-1 mr-3 h-6 w-6 shrink-0 group-hover:text-gray-800 dark:group-hover:text-gray-200">
							<path stroke-linecap="round" stroke-linejoin="round" d="M17.982 18.725A7.488 7.488 0 0012 15.75a7.488 7.488 0 00-5.982 2.975m11.963 0a9 9 0 10-11.963 0m11.963 0A8.966 8.966 0 0112 21a8.966 8.966 0 01-5.982-2.275M15 9.75a3 3 0 11-6 0 3 3 0 016 0z"></path>
						</svg>
						<span class="truncate">프로필</span>
					</a>
					<a class="text-gray-500 group flex items-center rounded-md px-3 py-2 font-medium hover:bg-gray-200 hover:text-gray-800 dark:hover:bg-gray-700 dark:hover:text-gray-300" href="/settings/account">
						<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true" class=" text-gray-400 dark:text-gray-600 -ml-1 mr-3 h-6 w-6 shrink-0 group-hover:text-gray-800 dark:group-hover:text-gray-200">
							<path stroke-linecap="round" stroke-linejoin="round" d="M10.343 3.94c.09-.542.56-.94 1.11-.94h1.093c.55 0 1.02.398 1.11.94l.149.894c.07.424.384.764.78.93.398.164.855.142 1.205-.108l.737-.527a1.125 1.125 0 011.45.12l.773.774c.39.389.44 1.002.12 1.45l-.527.737c-.25.35-.272.806-.107 1.204.165.397.505.71.93.78l.893.15c.543.09.94.56.94 1.109v1.094c0 .55-.397 1.02-.94 1.11l-.893.149c-.425.07-.765.383-.93.78-.165.398-.143.854.107 1.204l.527.738c.32.447.269 1.06-.12 1.45l-.774.773a1.125 1.125 0 01-1.449.12l-.738-.527c-.35-.25-.806-.272-1.203-.107-.397.165-.71.505-.781.929l-.149.894c-.09.542-.56.94-1.11.94h-1.094c-.55 0-1.019-.398-1.11-.94l-.148-.894c-.071-.424-.384-.764-.781-.93-.398-.164-.854-.142-1.204.108l-.738.527c-.447.32-1.06.269-1.45-.12l-.773-.774a1.125 1.125 0 01-.12-1.45l.527-.737c.25-.35.273-.806.108-1.204-.165-.397-.505-.71-.93-.78l-.894-.15c-.542-.09-.94-.56-.94-1.109v-1.094c0-.55.398-1.02.94-1.11l.894-.149c.424-.07.765-.383.93-.78.165-.398.143-.854-.107-1.204l-.527-.738a1.125 1.125 0 01.12-1.45l.773-.773a1.125 1.125 0 011.45-.12l.737.527c.35.25.807.272 1.204.107.397-.165.71-.505.78-.929l.15-.894z"></path>
							<path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"></path>
						</svg>
						<span class="truncate">계정 관리</span>
					</a>
					<a class="text-gray-500 group flex items-center rounded-md px-3 py-2 font-medium hover:bg-gray-200 hover:text-gray-800 dark:hover:bg-gray-700 dark:hover:text-gray-300" href="${pageContext.request.contextPath}/calendar/calendarMain">
						<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true" class=" text-gray-400 dark:text-gray-600 -ml-1 mr-3 h-6 w-6 shrink-0 group-hover:text-gray-800 dark:group-hover:text-gray-200">
							<path stroke-linecap="round" stroke-linejoin="round" d="M10.343 3.94c.09-.542.56-.94 1.11-.94h1.093c.55 0 1.02.398 1.11.94l.149.894c.07.424.384.764.78.93.398.164.855.142 1.205-.108l.737-.527a1.125 1.125 0 011.45.12l.773.774c.39.389.44 1.002.12 1.45l-.527.737c-.25.35-.272.806-.107 1.204.165.397.505.71.93.78l.893.15c.543.09.94.56.94 1.109v1.094c0 .55-.397 1.02-.94 1.11l-.893.149c-.425.07-.765.383-.93.78-.165.398-.143.854.107 1.204l.527.738c.32.447.269 1.06-.12 1.45l-.774.773a1.125 1.125 0 01-1.449.12l-.738-.527c-.35-.25-.806-.272-1.203-.107-.397.165-.71.505-.781.929l-.149.894c-.09.542-.56.94-1.11.94h-1.094c-.55 0-1.019-.398-1.11-.94l-.148-.894c-.071-.424-.384-.764-.781-.93-.398-.164-.854-.142-1.204.108l-.738.527c-.447.32-1.06.269-1.45-.12l-.773-.774a1.125 1.125 0 01-.12-1.45l.527-.737c.25-.35.273-.806.108-1.204-.165-.397-.505-.71-.93-.78l-.894-.15c-.542-.09-.94-.56-.94-1.109v-1.094c0-.55.398-1.02.94-1.11l.894-.149c.424-.07.765-.383.93-.78.165-.398.143-.854-.107-1.204l-.527-.738a1.125 1.125 0 01.12-1.45l.773-.773a1.125 1.125 0 011.45-.12l.737.527c.35.25.807.272 1.204.107.397-.165.71-.505.78-.929l.15-.894z"></path>
							<path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"></path>
						</svg>
						<span class="truncate">캘린더</span>
					</a>
				</nav>
			</aside>
			<form class="divide-y divide-gray-500/30 dark:divide-gray-500/70 lg:col-span-9">
				<div class="my-10 lg:my-0 lg:pl-20">
					<h2 class="text-xl font-semibold leading-6">회원정보</h2>
					<div class="my-10 flex flex-col lg:flex-row">
						<div class="flex-grow space-y-6"><div>
						<label class="block text-sm font-medium text-gray-700 dark:text-gray-300">이름</label>
						<div class="mt-1 flex">
							${member.name}
						</div>
					</div>
					<div>
						<label class="block text-sm font-medium text-gray-700 dark:text-gray-300">닉네임</label>
						<div class="mt-1 flex">
						${member.nick_name}
						</div>
					</div>
					<div>
						<label class="block text-sm font-medium text-gray-700 dark:text-gray-300">전화번호</label>
						<div class="mt-1 flex">
						${member.phone}
						</div>
					</div>
					<div>
						<label class="block text-sm font-medium text-gray-700 dark:text-gray-300">이메일</label>
						<div class="mt-1 flex">
						${member.email}
						</div>
					</div>
					<div>
						<label class="block text-sm font-medium text-gray-700 dark:text-gray-300">우편번호</label>
						<div class="mt-1 flex">
						${member.zipcode}
						</div>
						<label class="block text-sm font-medium text-gray-700 dark:text-gray-300">상세주소</label>
						<div class="mt-1 flex">
						${member.address1} ${member.address2}
						</div>
					</div>
					<div>
						<label class="block text-sm font-medium text-gray-700 dark:text-gray-300">가입날짜</label>
						<div class="mt-1 flex">
						${member.reg_date}
						</div>
					</div>
					<c:if test="${!empty member.modify_date}">
					<div>
						<label class="block text-sm font-medium text-gray-700 dark:text-gray-300">정보 수정일</label>
						<div class="mt-1 flex">
						${member.modify_date}
						</div>
					</div>
					</c:if>
				</div>
				<div class="mt-6 flex-grow lg:ml-52 lg:mt-0 lg:shrink-0 lg:grow-0">
				
					<p class="text-sm font-medium text-gray-700 dark:text-gray-300 sm:hidden" aria-hidden="true">프로필 사진</p>
					
					<div class="relative" data-headlessui-state="">
					
						<div class="mt-1 lg:hidden">
						
							<div class="flex items-center">
								<div class="inline-block h-12 w-12 flex-shrink-0 overflow-hidden rounded-full" aria-hidden="true">
									<img class="h-full w-full rounded-full border-2 border-gray-200" src="${pageContext.request.contextPath}/member/photoView" alt="프로필 사진">
								</div>
							</div>
						</div>
						
						<div class="relative my-1 hidden overflow-hidden rounded-full lg:block">
							<img class="h-40 w-40 rounded-full border-2 border-gray-200" src="${pageContext.request.contextPath}/member/photoView" alt="프로필 사진">
								<button class="absolute inset-0" id="headlessui-popover-button-:r1h:" type="button" aria-expanded="false" data-headlessui-state="">
									<label for="photo_btn" class="flex h-full w-full items-center justify-center bg-gray-900 bg-opacity-75 text-sm font-medium text-gray-100 opacity-0 focus-within:opacity-100 hover:opacity-100">
										<span>변경</span>
										<span class="sr-only">프로필 사진</span>
										<input id="photo_btn" name="user-photo" class="absolute inset-0 h-full w-full cursor-pointer rounded-md border-gray-300 opacity-0">
									</label>
								</button>
								<button id="headlessui-focus-sentinel-:rb:" type="button" aria-hidden="true" style="position: fixed; top: 1px; left: 1px; width: 1px; height: 0px; padding: 0px; margin: -1px; overflow: hidden; clip: rect(0px, 0px, 0px, 0px); white-space: nowrap; border-width: 0px;"></button>
							</div>
							
							<button id="headlessui-focus-sentinel-before-:rt:" type="button" aria-hidden="true" style="position: fixed; top: 1px; left: 1px; width: 1px; height: 0px; padding: 0px; margin: -1px; overflow: hidden; clip: rect(0px, 0px, 0px, 0px); white-space: nowrap; border-width: 0px;"></button>
							
							
							
							<div class="absolute inset-x-0 top-0 z-10 w-full origin-top transform transition opacity-100 scale-100" id="photo_choice" tabindex="-1" data-headlessui-state="open" style="display: none;">
								<div class="overflow-hidden rounded-lg bg-white py-1 shadow-lg ring-1 ring-gray-900 ring-opacity-5 dark:bg-black">
									<div class="flex flex-col -space-y-2">
									
										
										<div class="group relative flex-1 cursor-pointer px-3 py-2">
    <div class="mt-1 flex items-center space-x-1">
        <label for="upload" class="relative flex h-full w-full items-center justify-center rounded-md bg-blue-500 py-2 text-white shadow-sm hover:bg-blue-600 cursor-pointer">
            <p class="flex flex-col text-center">
                <span class="text-sm font-semibold">이미지 업로드</span>
                <span class="text-xs">권장 사이즈 150px<br>최대 250KB</span>
            </p>
            <input type="file" accept="image/bmp, image/jpg, image/jpeg, image/png, image/webp" id="upload" class="hidden">
        </label>
    </div>
    <input type="button" class="btn" value="전송" id="photo_submit">
    <input type="button" class="btn" value="취소" id="photo_reset">
</div>

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>		
			</div>
			<div class="divide-y divide-gray-500/30 dark:divide-gray-500/70">
				<div class="my-10 flex justify-end py-5 lg:my-10 lg:pl-20">
				
					<input type="button" class="bg-blue-500" value="수정" onclick="location.href='update'">
				</div>
			</div>
		</form>
	</div>
</div>
							
							
										
						
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/HJW/member.profile.js"></script>
									</main>
									
<!-- MyPage 메뉴 끝 -->