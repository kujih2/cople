<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    

<!-- 내용 시작 -->
<div id="notion-app">
	<div class="notion-app-inner notion-light-theme" style="color: rgb(55, 53, 47); fill: currentcolor; line-height: 1.5; font-family: ui-sans-serif, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Helvetica, &quot;Apple Color Emoji&quot;, Arial, sans-serif, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; -webkit-font-smoothing: auto; background-color: white;">
		<div style="height: 100%;">
			<div>
				<div style="position: fixed; z-index: 99; font-family: inter, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Helvetica, &quot;Apple Color Emoji&quot;, Arial, sans-serif, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; width: 100%;">
					<div style="font-size: 15px; white-space: nowrap; top: 0px; width: 100%; background: rgb(255, 254, 252); display: flex; flex-direction: column; align-items: center; justify-content: center; box-shadow: none; padding-left: 20px; padding-right: 20px;">
						<nav style="display: flex; align-items: center; justify-content: space-between; width: 100%; height: 54px;">
							<div style="flex-shrink: 0;">								
								<a href="${pageContext.request.contextPath}/main/main2" style="display: block; color: inherit; text-decoration: none; user-select: none; cursor: pointer;">
									<span style="display:none;">Coding hub</span>
									<img id="logo" src="${pageContext.request.contextPath}/images/logo.png" alt="CodingHub Logo" style="height:40px; margin-top:15px;">
								</a>
							</div>
						</nav>
					</div>
				</div>
				<div style="width: 100%; height: 54px;"></div>
				
	
				<main style="color: rgb(4, 4, 4); fill: currentcolor; line-height: 1.5; font-family: inter, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Helvetica, &quot;Apple Color Emoji&quot;, Arial, sans-serif, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; background: rgb(255, 254, 252); font-size: 17px; -webkit-font-smoothing: antialiased;">
					<div style="display: flex; flex-direction: row; width: 100%;">
						<section style="padding-left: 40px; padding-right: 40px; width: 100%; margin: 0px auto; overflow: visible;">
							<div style="width: 100%; border-radius: 4px;">
								<div style="width: 100%; max-width: 1260px; margin: 0px auto;">
									<div style="display: flex; flex-direction: column; align-items: center;">
										<div style="font-size: 50px; margin-top: 12vh; font-weight: 700; margin-bottom: 24px; text-align: center; line-height: 1.1; max-width: 380px;">로그인
										</div>
										<div class="notion-login" style="width: 100%; display: flex; flex-direction: column; align-items: center; max-width: 320px; margin-bottom: 16vh;">
											<div style="display: flex; width: 100%; flex-direction: column;">
												<div>
													<form:form id="member_login" action="login" modelAttribute="memberVO">
														<form:label path="id" style="display: block; margin-bottom: 4px; font-size: 12px; color: rgba(55, 53, 47, 0.65); font-weight: 500;">아이디</form:label>
														<div class="notion-focusable-within" style="display: flex; align-items: center; width: 100%; font-size: 15px; line-height: 26px; position: relative; border-radius: 4px; box-shadow: rgba(15, 15, 15, 0.1) 0px 0px 0px 1px inset; background: rgba(242, 241, 238, 0.6); cursor: text; padding: 4px 10px; margin-top: 4px; margin-bottom: 8px;">
															<form:input path="id" placeholder="아이디를 입력하세요." cssClass="form-input" autocomplete="off" aria-label="아이디를 입력하세요." style="font-size: inherit; line-height: inherit; border: none; background: none; width: 100%; display: block; resize: none; padding: 0px;"/>
															<form:errors path="id" element="div" cssClass="error-color"/>
														</div>
														<form:label path="passwd" style="display: block; margin-bottom: 4px; font-size: 12px; color: rgba(55, 53, 47, 0.65); font-weight: 500;">비밀번호</form:label>
														<div class="notion-focusable-within" style="display: flex; align-items: center; width: 100%; font-size: 15px; line-height: 26px; position: relative; border-radius: 4px; box-shadow: rgba(15, 15, 15, 0.1) 0px 0px 0px 1px inset; background: rgba(242, 241, 238, 0.6); cursor: text; padding: 4px 10px; margin-top: 4px; margin-bottom: 8px;">
															<form:password path="passwd" placeholder="비밀번호를 입력하세요." cssClass="form-input" aria-label="비밀번호를 입력하세요." style="font-size: inherit; line-height: inherit; border: none; background: none; width: 100%; display: block; resize: none; padding: 0px;"/>
															<form:errors path="passwd" element="div" cssClass="error-color"/>
														</div>
														
														<form:button class="login-btn" aria-disabled="false" role="button" tabindex="0" style="border:none; user-select: none; transition: background 20ms ease-in 0s; cursor: pointer; display: inline-flex; align-items: center; justify-content: center; white-space: nowrap; height: 36px; border-radius: 4px; font-size: 14px; line-height: 1; padding-left: 12px; padding-right: 12px; font-weight: 500; background: rgb(35, 131, 226); box-shadow: rgba(15, 15, 15, 0.1) 0px 0px 0px 1px inset, rgba(15, 15, 15, 0.1) 0px 1px 2px; color: white; margin-top: 6px; margin-bottom: 12px; width: 100%;">로그인</form:button>
														</div>
													</form:form>
																										
													<div style="font-size: 14px; color: rgb(235, 87, 87); text-align: center; display: none; width: 100%;"></div>
													<div style="color: rgba(55, 53, 47, 0.65); font-size: 14px; line-height: 1.6; margin-top: 8px; margin-bottom: 8px; text-align: center;">
														<a href="#" class="notion-link" style="display: inline; color: inherit; text-decoration: underline; user-select: none; cursor: pointer;">비밀번호 찾기</a>
													</div>
													<div style="color: rgba(55, 53, 47, 0.65); font-size: 14px; line-height: 1.6; margin-top: 8px; margin-bottom: 8px; text-align: center;">
														<a href="${pageContext.request.contextPath}/member/registerUser" class="notion-link" style="display: inline; color: inherit; text-decoration: underline; user-select: none; cursor: pointer;">회원가입</a>를 사용하여 계속할 수도 있습니다.
													</div>
												</div>
											</div>
											
										</div>
									</div>
								</div>
							</div>
						</section>
					</div>
				</main>
			</div>
		</div>
</div>










