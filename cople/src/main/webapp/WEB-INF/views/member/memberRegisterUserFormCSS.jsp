<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
#main_content{
	width:30%;
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
	height:40px;
	border:1px solid #0090F9;
	background-color:#0090F9;
	border-radius:8px;
	color:white;
	font-weight:bold;
	font-size:20px;
}
</style>