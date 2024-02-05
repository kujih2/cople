<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<Style>

/* 페이지 기본 레이아웃
-------------------------*/
.page-main{
	width:98%;
	margin:0 auto;/*중앙 정렬*/
}
.page-one{
	width:600px;
	margin:0 auto;
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
.default-btn{
	padding:5px 20px;
	border:1px solid #09aa5c;
	border-radius:2px;
	color:#fff;
	background-color:#09aa5c;
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
	padding:10px 10px 30px 10px;
}
ul{
	list-style:none;
}

form ul li{
	clear:both;
}
form ul li label{
	padding-top:10px;
	width:110px;
	float:left;
}
input{
	margin-top:8px;
	margin-bottom:10px;
	padding:5px;
}
input[type="text"],input[type="textarea"]{
	font-size:15px;
	width:746px;
	height:30px;
	padding-left:10px;
}
input[type="checkbox"]{
	margin:11px 0 10px 0;
}
button[type="submit"],[type="button"]{
	height:33px;
}
/*공통목록*/
form#search_form{
	width:98%;
	padding-bottom:0;
	border:none;
}
ul.search{
	width:380px;
	list-style:none;
	padding:0;
	margin:0 auto;
}
ul.search li{
	margin:0 0 9px 0;
	padding:0;
	display:inline;
}
ul.search li select{
	height:30px;
}
table.basic-table{
	width:100%;
	margin:7px 0;
	border:1px solid #000;
	border-collapse:collapse;
}
table.basic-table td, table.basic-table th{
	border:1px solid #000;
	padding:5px;
}
table.striped-table{
	width:100%;
	margin:7px 0;
	border:1px solid #FFF;
	font-size:15px;
	border-collapse:collapse;
}
table.striped-table td, table.striped-table th{
	padding:.7em .5em;
	vertical-align:middle;
}
table.striped-table th{
	font-weight:bold;
	background:#E1E1E1;
}
table.striped-table td{
	border-bottom:1px solid rgba(0,0,0,.1);
}
table.striped-table tr:nth-child(odd){
	background-color:rgb(250,250,247);
}
/*게시판 목록
-----------------------*/
form#search_form #order{
	height:32px;
}
div.board_list div{
	float:left;
	width:auto;
	padding-right:10px;
	margin-top:5px;
	margin-bottom:5px;
}
div.both{
	clear:both;
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
	background-color:#eeeeee;
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
/*프로필*/
.my-photo{
   object-fit:cover;
   object-position:top;
   border-radius:50%;
}









</Style>