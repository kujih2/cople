<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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