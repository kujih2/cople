<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.align-center{
   text-align:center;
}
.align-right{
   text-align:right;
}
#options_cover{
	display:flex;
	justify-content: center; /* 수평 */
    align-items: center; /* 수직*/
}
#options{
	position:relative;
	display:flex;
	justify-content: center; /* 수평 */
    align-items: center; /* 수직*/
    width:800px;
    height:450px;
}
.select-option{
	width:200px;
	height:400px;
	display:flex;
	flex-direction: column;
	justify-content:center;
	align-items:center;
	transition: width 0.5s ease-in-out,height 0.5s ease-in-out;
	cursor:pointer;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.3); /* Add a subtle box shadow */
	border:none;
	overflow:hidden;
	
}
#option1{
	background-color:#0090f9;
	border-radius:15px 0 0 15px;
}
#option2{
	background-color:white;
}
#option3{
	background-color:#0090f9;
	border-radius:0 15px 15px 0;
}
#option1:hover,#option2:hover,#option3:hover{
	width: 400px;
	height:420px;
	border:2px solid #CCCCCC;
}
.select-option h3{
	color:white;
	font-size:35px;
	text-align:center;
}
#option2 h3{
	color:black;
}
.select-option span{
	width:350px;
  	font-size:20px;
  	font-weight:bold;
}
.fade-in-element {
  opacity: 0;
  transition: opacity 0.5s ease-in-out;
}

.fade-in-element.visible {
  opacity: 1;
}

</style>