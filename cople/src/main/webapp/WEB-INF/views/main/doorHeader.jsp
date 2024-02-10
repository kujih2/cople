<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <c:if test="${empty user}">
 <div class="jsx-3556223936 dialog is-redesigned position-sticky">
 	<header class="jsx-3556223936 header">
 		<div class="jsx-3556223936 inner">
 			<div class="jsx-3556223936 logo-wrap">
 				<div id="header_nav_logo">
					<a href="${pageContext.request.contextPath}/main/main2">
						<span style="display:none;">Coding hub</span>
						<img id="logo" src="${pageContext.request.contextPath}/images/logo.png" alt="CodingHub Logo" style="height:40px;">
					</a>
				</div>
 			</div>
 			
 			<div class="jsx-3556223936 desktop-actions">
 				<div style="display:contents" class="jsx-1297766468 base_theme__7MTs2">
 					<nav class="desktopNav_nav__P7z6f" aria-label="메인">
 						<div class="desktopNav_navLeft__MgULi">
 							<div class="jsx-bfc18ca12fb5954b nav-left">
 								<ul aria-label="submenu" class="jsx-bfc18ca12fb5954b nav-list">
 									<li aria-expanded="false" class="jsx-548257223 nav-item">
 										<a tabindex="0" style="--hoverable-padding-x:0px;--hoverable-padding-y:0px" class="jsx-3fdf7790fe6c511b hoverable clickable has-action" href="${pageContext.request.contextPath}/wiki/detail?doc_num=82">
 											<div class="jsx-548257223 label">위키</div>
 										</a>
 									</li>
 								</ul>
 							</div>
 					</nav>
 				</div>
 			</div>
 						<div class="desktopNav_navRight__Eim9m">
 							<div class="jsx-4033560373 nav-right non-english">
 								<div class="jsx-4033560373 divider"></div>
 								<div id="g_id_onload" data-prompt_parent_id="g_id_onload" data-cancel_on_tap_outside="false" style="position: absolute; top: 50px; right: -7px;"></div>
 								<ul aria-label="submenu" class="jsx-4033560373 nav-list">
 									<li aria-expanded="false" class="jsx-548257223 nav-item">
 										<a tabindex="0" style="--hoverable-padding-x:0px;--hoverable-padding-y:0px" class="jsx-3fdf7790fe6c511b hoverable clickable has-action" href="${pageContext.request.contextPath}/member/login">
 											<div class="jsx-548257223 label">로그인</div>
 										</a>
 									</li>
 									<li class="jsx-4033560373 cta-item">
 										<a type="button" class="button_button__atjat button_buttonVariantPrimary__mUFQZ button_buttonSizeS__IYg0e" href="${pageContext.request.contextPath}/member/registerSelect">Coding Hub 사용하기</a>
 									</li>
 								</ul> 							
 							</div>
 						</div>		
 		</div>
 	</header>
 </div>
 </c:if>

 
 <c:if test="${!empty user}">

 <div class="jsx-3556223936 dialog is-redesigned position-sticky">
 	<header class="jsx-3556223936 header">
 		<div class="jsx-3556223936 inner">
 			<div class="jsx-3556223936 logo-wrap">
 				<div id="header_nav_logo">
					<a href="${pageContext.request.contextPath}/main/main2">
						<span style="display:none;">Coding hub</span>
						<img id="logo" src="${pageContext.request.contextPath}/images/logo.png" alt="CodingHub Logo" style="height:40px;">
					</a>
				</div>
 			</div>
 			
 			<div class="jsx-3556223936 desktop-actions">
 				<div style="display:contents" class="jsx-1297766468 base_theme__7MTs2">
 					<nav class="desktopNav_nav__P7z6f" aria-label="메인">
 						<div class="desktopNav_navLeft__MgULi">
 							<div class="jsx-bfc18ca12fb5954b nav-left">
 								<ul aria-label="submenu" class="jsx-bfc18ca12fb5954b nav-list">
 									<li aria-expanded="false" class="jsx-548257223 nav-item">
 										<a tabindex="0" style="--hoverable-padding-x:0px;--hoverable-padding-y:0px" class="jsx-3fdf7790fe6c511b hoverable clickable has-action" href="${pageContext.request.contextPath}/wiki/detail?doc_num=82">
 											<div class="jsx-548257223 label">위키</div>
 										</a>
 									</li>
 								</ul>
 							</div>
 								<div class="jsx-bfc18ca12fb5954b nav-left">
 								<ul aria-label="submenu" class="jsx-bfc18ca12fb5954b nav-list">
 									<li aria-expanded="false" class="jsx-548257223 nav-item">
 										<a tabindex="0" style="--hoverable-padding-x:0px;--hoverable-padding-y:0px" class="jsx-3fdf7790fe6c511b hoverable clickable has-action" href="${pageContext.request.contextPath}/community/commuMain">
 											<div class="jsx-548257223 label">커뮤니티</div>
 										</a>
 									</li>
 								</ul>
 							</div>
 								<div class="jsx-bfc18ca12fb5954b nav-left">
 								<ul aria-label="submenu" class="jsx-bfc18ca12fb5954b nav-list">
 									<li aria-expanded="false" class="jsx-548257223 nav-item">
 										<a tabindex="0" style="--hoverable-padding-x:0px;--hoverable-padding-y:0px" class="jsx-3fdf7790fe6c511b hoverable clickable has-action" href="${pageContext.request.contextPath}/market/list?category=0">
 											<div class="jsx-548257223 label">장터</div>
 										</a>
 									</li>
 								</ul>
 							</div>
 								<div class="jsx-bfc18ca12fb5954b nav-left">
 								<ul aria-label="submenu" class="jsx-bfc18ca12fb5954b nav-list">
 									<li aria-expanded="false" class="jsx-548257223 nav-item">
 										<a tabindex="0" style="--hoverable-padding-x:0px;--hoverable-padding-y:0px" class="jsx-3fdf7790fe6c511b hoverable clickable has-action" href="${pageContext.request.contextPath}/matching/mmain">
 											<div class="jsx-548257223 label">취업현황</div>
 										</a>
 									</li>
 								</ul>
 							</div>
 						</div>
 						
 						<div class="desktopNav_navRight__Eim9m">
 							<div class="jsx-4033560373 nav-right non-english">
 								<div class="jsx-4033560373 divider"></div>
 								<div id="g_id_onload" data-prompt_parent_id="g_id_onload" data-cancel_on_tap_outside="false" style="position: absolute; top: 50px; right: -7px;"></div>
 								<ul aria-label="submenu" class="jsx-4033560373 nav-list">
 									<li aria-expanded="false" class="jsx-548257223 nav-item">
 										<a tabindex="0" style="--hoverable-padding-x:0px;--hoverable-padding-y:0px" class="jsx-3fdf7790fe6c511b hoverable clickable has-action" href="${pageContext.request.contextPath}/member/logout">
 											<div class="jsx-548257223 label">로그아웃</div>
 										</a>
 									</li>
 									<c:if test="${!empty user && user.auth ==9}">
 									<li aria-expanded="false" class="jsx-548257223 nav-item">
 										<a tabindex="0" style="--hoverable-padding-x:0px;--hoverable-padding-y:0px" class="jsx-3fdf7790fe6c511b hoverable clickable has-action" href="${pageContext.request.contextPath}/admin/adminMain">
 											<div class="jsx-548257223 label">관리자</div>
 										</a>
 									</li>
 									</c:if>
 								</ul>
 								<div class="relative">
									<div class="relative">
										<a class="flex rounded-full bg-white focus:outline-none dark:bg-gray-800" href="${pageContext.request.contextPath}/member/myPage">
										<img style="max-width: 100%; height: auto;  display: block; vertical-align: middle; border: 0;" class="h-8 w-8 rounded-full" src="${pageContext.request.contextPath}/member/photoView" alt="프로필 사진">
										</a>
									</div>
								</div>
 							</div>
 						</div>
 						
 					</div>
 				</header>
 			</div>
 </c:if>