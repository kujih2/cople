<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<Style>

/* 페이지 기본 레이아웃
-------------------------*/
.page-detail{
	background-color:#FFFFFF;
	border-radius: 10px;
	box-shadow: 2px 2px 4px rgba(0, 0, 0, 0.1);
	width:65%;
	margin: 0 auto;
	margin-bottom: 100px;
	padding-left: 40px;
	padding-right: 40px;
	padding-top: 40px;
	padding-bottom: 40px;
	margin:0 auto;/*중앙 정렬*/
	margin-bottom:100px;
	list-style-type: none;
}
.page-one{
	width:600px;
	margin:0 auto;
}
#page_board{
	width:25%;
	display:inline-block;
	margin:0 auto;
}
#page-list{
	background-color:#FFFFFF;
	border-radius: 10px;
	box-shadow: 2px 2px 4px rgba(0, 0, 0, 0.1);
	width:65%;
	margin: 0 auto;
	margin-bottom: 100px;
	padding-right: 40px;
	padding-bottom: 40px;
}

/* 공통 메시지 및 버튼
-------------------------*/
.result-display{
	width:400px;
	height:200px;
	margin:100px auto;/*상하 좌우*/
	border:1px solid #000;/*테두리*/
	display: flex;/*하위 요소를 수직으로 쌓을 수 있는 공간을 만듬*/
  	align-items: center;/*세로 정렬*/
  	justify-content: center;/*가로 정렬*/
}
.error-color{
	color:#ff0000;
}
.commu-btn{
	padding:5px 10px;
	border:3px solid #4fa1e0;
	border-radius:5px;
	color:#fff;
	background-color:#4fa1e0;
	font-size:11pt;
	font-weight:bold;
	cursor:pointer;
}
/* 공통 정렬
-------------------------*/
.align-center{
	text-align:center;
}
.align-right{
	text-align:right;
}

/* 공통 등록, 수정 폼
-------------------------*/
form{
	width:600px;
	margin:0 auto;
	border:none;
	padding:20px 10px 10px 10px;
}
ul{
	list-style:none;
}

form ul li{
	clear:both;
}

button[type="submit"],[type="button"]{
	height:33px;
}
/*글 작성*/
.form-main ul li form{
	width:600px;
	margin:0 auto;
	padding:20px 10px 10px 10px;
	list-style-type: none;
}

/*검색 창*/
ul.search li{
	margin:0 0 9px 0;
	padding:0;
	display:inline;
}
.search-bar {
	height:40px;
	width:350px;
	border:3px solid #9e9e9e;
	border-radius:10px;
	padding-left:20px;
	font-size:13pt;
}
.search-button {
	position: relative;
}
.sub-btn {
	height:40px;
	width:90px;
	background-color:#4fa1e0;
	border:2px solid #4fa1e0;
	border-radius:5px;
	font-weight: bold;
	font-size:11pt;
	margin-right:5px;
	color:white;
	cursor: pointer;
}
.sub-btn2 {
	width:90px;
	border:2px solid #bdbdbd;
	border-radius:5px;
	font-weight: bold;
	font-size:11pt;
	padding-left:10px;
	cursor: pointer;
}
hr {
	border: 0;
    height: 2px;
    background: #ccc;}

/*게시판 목록
-----------------------*/
form#search_form #order{
	height:32px;
}
.title-main {
	background-image: url('${pageContext.request.contextPath}/images/commu_title_1.png');
	background-size:cover;
	border:1.5px solid #eceff1;
	border-radius:10px;
	height:110px;
}
.title-elements {
	position: relative;
    top:30px;
}
.title-elements span{
	font-weight:bold;
	font-size:30pt;
	color:#757575;
}

div.board_list div{
	float:left;
	width:auto;
	padding-right:10px;
	margin-top:15px;
	margin-bottom:5px;
}
div.board_list div img{
	padding-right:5px;
	position: relative;
	top: 2px;
}

.both{
	clear:both;
}
.refresh-button {
    width: 30px; 
    height: 30px; 
    background-image: url('${pageContext.request.contextPath}/images/commu_refersh_1.png');
    background-size: cover; 
    background-repeat: no-repeat;
    background-position: center;
    border: none; 
    cursor: pointer;
    margin-left:10px; 
}

/*게시판 폼
---------------------*/
form#register_form, form#update_form{
	padding:0 0 10px 0;
	width:800px;
}
form#register_form ul, form#update_form ul{
	padding:20px;
}
/*게시판 글 상세
---------------------*/
.title-detail{
	font-weight:bold;
	font-size:27pt;
	color:#757575;
	margin-right:16.5em;
}
ul.detail-info{
	list-style:none;
	margin:0;
	padding:0;
}
ul.detail-info li{
	margin:0;
	padding-top:5px;
	display:inline-block;
}
ul.detail-info li:last-child{
	vertical-align:top;
}
.detail-img{
	max-width:500px;
}
.detail-content img{
	max-width:940px;
}
#output_hate{
   cursor:pointer;
}
#output_fav{
   cursor:pointer;
}
#output_fcount{
   width:50px;
   display:inline-block;
}
div#reply_div{
	padding:5px 10px 40px 10px;
	margin-top:10px;
	margin-bottom:10px;
	border:2.5px solid #6d7073;
	border-radius:6px;
}
form#re_form{
	width:650px;
	border:none;
}
span.re-title{
	color:#000;
	font-size:12pt;
	line-height:200%;
}
span.letter-count{
	font-size:10pt;
	color:#999;
}
textarea.rep-content{
	width:90%;
	height:50px;
	margin:10px 10px;
}
div#re_first,div#mre_first{
	float:left;
	width:70%;
	padding-left:15px;
	margin-bottom:10px;
}
div#loading{
	width:100px;
	height:50px;
	/*정 중앙에 div를 배치하기 위한 설정*/
	position:absolute;
	top:50%;
	left:50%;
	transform:translate(-50%,-50%);
	/*하위 요소를 수직으로 쌓을 수 있는 공간을 만듬*/
	display:flex;
	/*세로정렬*/
	align-items:center;
	/*가로정렬*/
	justify-content:center;
}
div.paging-button{
	text-align:right;
}
div#output{
	clear:both;
}
form#mre_form{
	border:none;
	margin:5px;
}
div.editable {
    width: 300px;
    height: 200px;
    border: 1px solid #dcdcdc;
    overflow-y: auto;
}

/*프로필*/
.my-photo{
   object-fit:cover;
   object-position:top;
   border-radius:50%;
   margin-right:10px;
}









</Style>