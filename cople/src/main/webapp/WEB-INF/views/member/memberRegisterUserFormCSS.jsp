<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
#main_body{
	padding-bottom:40px;
}
#main_content{
	width:47%;
	margin:0 auto;
	border:1px solid #e5e7eb;
	border-radius:15px;
	background-color:white;
	padding:20px;
}
.text-between-lines {
  display: inline-flex;
  align-items: center;
  width:100%;
  color:#6B7280;
  margin:20px 0 20px 0;
}

.line {
  flex: 1;
  border-top: 1px solid black;
  margin: 0 5px; /* Adjust margin as needed */
}
#main_content label{
	font-weight:bold;
	font-size:17px;
}
#main_content input[type="text"],#main_content input[type="password"]{
	width:100%;
	height:40px;
	border:1px solid #e5e7eb;
	border-radius:8px;
	margin:5px 0 20px 0;
	padding-left:10px;
	font-size:15px;
	
}
#main_content input[type="text"]:focus,#main_content input[type="password"]:focus{
	outline:2px solid #0090F9;
}
#confirmId,#zipcode_btn{
	width:100px;
	height:28px;
	border:1px solid #e5e7eb;
	border-radius:2px;
	background-color:white;
}
#submit_btn{
	width:100%;
	height:50px;
	border:1px solid #0090F9;
	background-color:#0090F9;
	border-radius:8px;
	color:white;
	font-weight:bold;
	font-size:20px;
}
.select-box{
	display:flex;
	width:100%;
	height:50px;
	border-top:1px solid #e5e7eb;
	border-bottom:1px solid #e5e7eb;
	border-left:1px solid #e5e7eb;
	border-radius:8px;
	margin:5px 0 20px 0;
	overflow:hidden;
}
.select-box div{
	flex:1;
	display:flex;
	align-items:center;
	justify-content:center;
	border-right:1px solid #e5e7eb;
	text-align:center;
	cursor:pointer
}
.select-box div:hover{
	background-color:#e5e7eb;
	
}
.multiple-choice{
	display:flex;
	width:100%;
	height:50px;
	border-top:1px solid #e5e7eb;
	border-bottom:1px solid #e5e7eb;
	border-left:1px solid #e5e7eb;
	border-radius:8px;
	margin:5px 0 20px 0;
	overflow:hidden;
}
.multiple-choice div{
	flex:1;
	display:flex;
	align-items:center;
	justify-content:center;
	border-right:1px solid #e5e7eb;
	text-align:center;
	cursor:pointer
}
.multiple-choice div:hover{
	background-color:#e5e7eb;
	
}
#workstart_container{
	width:100%;
	height:50px;
	display:flex;
	position:relative;
	
}
#workstart{
	width:20%;
	height:50px;
	border:1px solid #e5e7eb;
	background-color:white;
	border-radius:8px;
	color:black;
	padding:10px;
	box-sizing:border-box;
}
#workstart_box{
	width:80%;
	margin:0;
	box-sizing:border-box;
	margin-left:10px;
}
#advice{
	width:100%;
	height:50px;
	border:1px solid #e5e7eb;
	background-color:white;
	border-radius:8px;
	color:black;
	padding:10px;
	box-sizing:border-box;
	resize:none;
}
#advice:focus{
	outline:none;
	border:1px solid #0090F9;
}
#map{
	border-radius:8px;
	margin-top:10px;
}
.file-select-container{
	width:100%;
	height:50px;
	border:1px solid #e5e7eb;
	background-color:white;
	border-radius:8px;
	color:black;
	box-sizing:border-box;
	display:flex;
	cursor:pointer;
}
.file-select{
	display:flex;
	align-items:center;
	justify-content:center;
	width:20%;
	border-right:1px solid #e5e7eb;
	border-radius:8px 0 0 8px;
	
}
.uploaded-file{
	display:flex;
	align-items:center;
	justify-content:center;
	width:80%;
	border-radius:0 8px 8px 0;
}
.chosen-box{
	background-color:#0090F9;
	color:white;
}
.chosen-box:hover{
	background-color:#0090F9;
}
form span{
	color:red;
}

</style>