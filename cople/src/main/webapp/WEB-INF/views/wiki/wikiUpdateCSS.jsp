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
	position: fixed;
    top: 103px;
	height:38px;
	border-bottom:solid 1px #CCCCCC;
	border-top:solid 1px #CCCCCC;
	background-color:white;
	box-sizing:border-box;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
 
}
.editor-item{
	border:none;
	background-color:white;
	cursor:pointer;
	float:left;
	height:37px;
	box-sizing:border-box;
	width:45px;
	display: flex;
    justify-content: center; /* Center horizontally */
    align-items: center;

}
.editor-item:hover{
	background-color:#CCCCCC;
}
#btn_headings{
	width:100px;
	border-right:solid 1px #CCCCCC;
	display: flex;
    justify-content: center; /* Center horizontally */
    align-items: center;
    position:relative;    
}
#sub_headings{
	position:absolute;
	top:37px;
	border:solid 1px #CCCCCC;
	box-sizing:border-box;
	
}
#btn_heading1,#btn_heading2,#btn_heading3{
	width:150px;
	height:37px;
	border:none;
	border-bottom:solid 1px #CCCCCC;
	display: flex;
    justify-content: center; /* Center horizontally */
    align-items: center;
    background-color:white;
    box-sizing:border-box;
    cursor:pointer
}
#btn_heading1:hover,#btn_heading2:hover,#btn_heading3:hover{
	background-color:#CCCCCC;
	
}
#btn_heading3{
	border:none;
	
}
#btn_strike{
	border-right:solid 1px #CCCCCC;
}
#sub_links{
	box-sizing:border-box;
}

#btn_docToss{
	border-right:solid 1px #CCCCCC;
}
#btn_submit{
	width:100px;
	float:right;
	background-color:rgb(1, 144, 249);
	border:none;
}

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
top:37px;
left:415px;
display:none;
border:solid 1px #CCCCCC;
background-color:white;
box-sizing:border-box;
padding:10px;
width:250px;
}
#sub_links_menu_title1 {
	float:left;
	height:27px;
	cursor:pointer;
	margin-right:10px;
	box-sizing:border-box;
	border-bottom:solid black 2px;
	
}
#sub_links_menu_title2 {
	float:left;
	height:27px;
	cursor:pointer;
	box-sizing:border-box;
	
}
#sub_links_menu_title1:hover,
#sub_links_menu_title2:hover {
	border-bottom:solid black 2px;
}
#sub_links_menu_item1{
	clear:both;
	width:250px;
}
#sub_links_menu_item2{
	clear:both;
	display:none;
	width:250px;
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