<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
#editor {

        padding: 10px;
        min-height: 200px;
}
#editor:focus {
    outline: none;
}
.editor-menu{
	position:relative;
	width:1000px;
}
#btn_headings{
position:relative;
}
#sub_headings{
position:absolute;}
#editor p{ 
clear:both;
}
#editor h2,#editor h3,#editor h4{
padding-bottom:20px;
border-bottom:1px solid black;
}
/*=======================================================================
*문서 연결하기
*=======================================================================*/
#sub_links{
position:absolute;
left:100px;
display:none;
border:1px solid black;
border-radius:3px;
background-color:#efefef;
}
#sub_links_menu div:nth-child(1) {
	float:left;
	cursor:pointer;
}
#sub_links_menu div:nth-child(2) {
	float:left;
	cursor:pointer;
}
#sub_links_menu_item1{
	clear:both;
}
#sub_links_menu_item2{
	clear:both;
	display:none;
}
/*=======================================================================
*문서 넘겨주기
*=======================================================================*/
#sub_toss{
	position:absolute;
	left:200px;
	display:none;
	border:1px solid black;
	border-radius:3px;
	background-color:#efefef;
}



</style>