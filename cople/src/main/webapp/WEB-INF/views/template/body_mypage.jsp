<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!-- MyPage 메뉴 시작 -->
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

									
<!-- MyPage 메뉴 끝 -->