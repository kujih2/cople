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
	min-width:786px;
    top: 142px;
	height:38px;
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
    position:relative;

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
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	
	
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
#btn_image{
}
#img-selector{
	display:none;
}
#editor img {
    max-width: 100%;
}
#sub_map{
	display:none;
	position:absolute;
	z-index:30;
	width:400px;
	height:400px;
	top:37px;
	left:-180px;
	padding:10px;
	padding-top:20px;
	border:1px solid #CCCCCC;
	background-color:white;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	
}
#map_selecter_container{
	
}
#choose_loc_btn{
	width:40px;
	height:30px;
	border-radius:3px;
	background-color:#b3cefd;
	float:right;
	display:flex;
	justify-content: center;
    align-items: center;
    transform: translateY(-10px);
	
}
#map_container{
	border:1px solid #CCCCCC;
	clear:both;
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
padding-bottom:10px;
border-bottom:1px solid #CCCCCC;
margin-bottom:5px;
}
/*=======================================================================
*문서 연결하기
*=======================================================================*/ 
#sub_links{
	position:absolute;
	top:37px;
	left:360px;
	display:none;
	border:solid 1px #CCCCCC;
	background-color:white;
	box-sizing:border-box;
	padding:10px 10px 0 10px;
	width:250px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);

}
#sub_links_menu_title1 {
	float:left;
	height:27px;
	cursor:pointer;
	margin-right:10px;
	box-sizing:border-box;
	border-bottom:solid black 2px;
	
}
#internal_search{
	width:190px;
	height:33px;
	border:solid 1px #CCCCCC;
	border-radius:0 5px 5px 0;
	box-sizing:border-box;
	float:left;
	margin-right:20px;
	padding-left:10px;
	margin-bottom:10px;
}
#internal_search:focus{
	outline:none;
    border-color: #4d90fe;
	
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
    padding-top:10px;
}
#sub_links_menu_item1 svg{
	padding:8px;
	border:1px solid #CCCCCC;
	border-radius:5px 0 0 5px;
	box-sizing:border-box;
	width:33px;
	height:33px;
	background-color:#CCCCCC;
	float:left;
}
#sub_links_menu_item1 ul{
	list-style: none;
	padding-left:33px;
	padding-top:30px;
}
#sub_links_menu_item1 ul li{
	width:190px;
	padding:10px 0 10px 0;
	cursor:pointer;
	border-top:1px solid #CCCCCC;
	
}
#sub_links_menu_item1 ul li:hover{
	background-color:rgba(77, 144, 254, 0.5);
	
}


#sub_links_menu_item2{
	clear:both;
	display:none;
	width:250px;
    padding-top:10px;
	
}
#sub_links_menu_item2 svg{
	padding:8px;
	border:1px solid #CCCCCC;
	border-radius:5px 0 0 5px;
	box-sizing:border-box;
	width:33px;
	height:33px;
	background-color:#CCCCCC;
	float:left;
}
#external_import{
	width:150px;
	height:33px;
	border:solid 1px #CCCCCC;
	border-radius:0 5px 5px 0;
	box-sizing:border-box;
	float:left;
	margin-right:8px;
	padding-left:10px;
	margin-bottom:10px;
}
#external_import:focus{
	outline:none;
    border-color: #4d90fe;
	
}
#sub_links_menu_item2 button{
	width:40px;
	height:33px;
	border-radius:5px;
	border:1px solid #b3cefd;
	background-color:#b3cefd;
	display:flex;
	justify-content: center;
    align-items: center;
}

/*=======================================================================
*문서 넘겨주기
*=======================================================================*/
#sub_toss{
	position:absolute;
	top:37px;
	left:420px;
	display:none;
	border:solid 1px #CCCCCC;
	background-color:white;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	padding:10px 10px 0 10px;
	
	width:250px;
}
#sub_toss_title{
	margin-bottom:10px;
}

#sub_toss svg{
	padding:8px;
	border:1px solid #CCCCCC;
	border-radius:5px 0 0 5px;
	box-sizing:border-box;
	width:33px;
	height:33px;
	background-color:#CCCCCC;
	float:left;
}
#sub_toss ul{
	list-style: none;
	padding-left:33px;
	padding-top:30px;
}
#sub_toss ul li{
	width:190px;
	padding:10px 0 10px 0;
	cursor:pointer;
	border-top:1px solid #CCCCCC;
	
}
#sub_toss ul li:hover{
	background-color:rgba(77, 144, 254, 0.5);
	
}
#toss_search{
	width:190px;
	height:33px;
	border:solid 1px #CCCCCC;
	border-radius:0 5px 5px 0;
	box-sizing:border-box;
	float:left;
	margin-right:20px;
	padding-left:10px;
	margin-bottom:10px;
}
#toss_search:focus{
	outline:none;
    border-color: #4d90fe;
	
}

#editor ul{
padding-left:20px;
}

</style>