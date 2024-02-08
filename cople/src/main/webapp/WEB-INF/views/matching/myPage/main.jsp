<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<<<<<<< HEAD
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
		<form class="divide-y divide-gray-500/30 dark:divide-gray-500/70 lg:col-span-9">
				<div class="my-10 lg:my-0 lg:pl-20">
					<h2 class="text-xl font-semibold leading-6">나의 활동</h2>
						<div class="my-10 flex flex-col lg:flex-row">
							<div class="flex-grow space-y-6"><div>
								<div class="gnb-menu">
									<a href="">쪽지함</a>
									<a href="">첨삭관리함</a>
									<a href="">내가 쓴 글</a>
								</div>
							</div>
						</div>
					</div>		
				</div>
				
				
				
				
				 
				
				
				
				
				
				
				
		</form>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
*{
	margin:0;
	padding:0;
}

.gnb-menu {
	background:white;
	height:60px;
	display:flex;
	justify-content:space-around;
	align-items:center;
	border: 2px solid #8581c9;
	flex-direction: row;
	width:100%
}

.gnb-menu a {
	font-size:30px;
	color:#4674e0;
	text-decoration:none;
	position:relative;
	padding:6px 12px;
	flex-direction: row;
}

.gnb-menu a::after {
	content:"";
	position:absolute;
	bottom:0;
	left:50%;
	transform:translateX(-50%);
	width:0;
	height:4px;
	background:#f1c40f;
	transition:all .5s ease-out;
}

.gnb-menu a:hover::after {
	width:100%;
}
</style>
<body>
	<nav class="gnb-menu">
		<a href="">쪽지함</a>
		<a href="">첨삭관리함</a>
		<a href="">내가 쓴 글</a>
	</nav>
</body>
>>>>>>> branch 'main' of https://github.com/kujih2/cople.git
