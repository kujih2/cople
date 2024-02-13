<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
#keyfield{
	width:80px;
	height:30px;
	background-color:white;
	border-radius:8px 0 0 8px;
	border:1px solid #CCCCCC;
	box-sizing:border-box;
	margin-right:0;
	padding-right:5px;
	border-right:none;
	
}
#keyfield:focus{
	outline:none;
}
#keyword{
	width:200px;
	height:30px;
	background-color:white;
	border-radius:0 8px 8px 0;
	border:1px solid #CCCCCC;
	padding-left:10px;
	box-sizing:border-box;
	margin-left:0;
	transform:translateX(-6px) translateY(1px);
}
#keyword:focus{
	outline:none;
}
#wiki_search_btn{
	width:40px;
	height:29px;
	background-color:white;
	border-radius:8px;
	border:1px solid #CCCCCC;
	transform:translateX(-6px) translateY(1px);
	cursor:pointer;
}
#wiki_search_btn:hover{
	background-color:#CCCCCC;
	
}
#write_guide p{
	padding-top:7px;

}
#direct_btn{
	width:150px;
	height:35px;
	background-color:white;
	border-radius:8px;
	border:1px solid #CCCCCC;
	cursor:pointer;
}
#direct_btn:hover{
	background-color:#CCCCCC;
}
.search-item-container{
	width:100%;
	height:100px;
	border-bottom:1px solid black;
	padding-top:10px;
	padding-bottom:10px;
}
.searched-doc-name{
	font-size:25px;
	font-weight:bold;
}
.search-item-content{
	margin-top:10px;
	margin-left:30px;
	overflow:hidden;
	height:62px;
}
#search_list{
	clear:both;
	margin-top:80px;

}
#page_area{
	display:flex;
	align-items:center;
	justify-content:center;
}
</style>