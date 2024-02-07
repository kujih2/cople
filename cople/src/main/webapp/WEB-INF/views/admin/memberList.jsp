<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<section>
	<div class="content-wrapper">
		<header class="content-heading">일반회원 관리
    		<small></small>
		</header>    
	</div>
	<div class="container-fluid" id="list-order">
  		<div class="row">
    		<div class="col-md-12"></div>
  		</div>
		<div class="row">
    		<div class="col-md-12">
        		<header class="clearfix pb-lg mb-sm">
                    <div class="pull-left">
                		<div class="list-total">1페이지</div>
            		</div>
        		</header>
    		</div>
		</div>  
		<div class="row">
    		<div class="col-md-12">
      			<div class="panel panel-default">
					<div class="table-responsive">
          				<table id="table-ext-1" class="table table-bordered table-hover">
            				<colgroup>
              					<col width="14%">
              					<col width="14%">
              					<col width="14%">
              					<col width="30%">
              					<col width="20%">
              					<col width="14%">
            				</colgroup>
            				<thead>
            				
            					<tr>
              						<th class="text-center">ID</th>
              						<th class="text-center" style="vertical-align: middle">이름</th>
              						<th class="text-center">전화번호</th>
              						<th class="text-center">이메일</th>
              						<th class="text-center">가입일</th>
              						<th class="text-center">등급</th>
            					</tr>
            				</thead>
            				
            				<tbody>
            				<c:forEach var="member" items="${list}">
                				<tr style="background: white; border-top: 4px solid #eee; border-bottom: 2px solid #eee;">
                  					<td class="text-center">${member.id}</td>
                  					<td class="text-center">${member.name}</td>
                  					<td class="text-center">${member.phone}</td>
                  					<td class="text-center">${member.email}</td>
                  					<td class="text-center">${member.reg_date}</td>
                  					<td class="text-center">
                  						<c:if test="${member.auth == 0}">탈퇴</c:if>
										<c:if test="${member.auth == 1}">일반회원</c:if>
										<c:if test="${member.auth == 2}">현직자</c:if>
										<c:if test="${member.auth == 3}">강사</c:if>
										<c:if test="${member.auth == 4}">정지</c:if>
										<c:if test="${member.auth == 9}">관리자</c:if>
                					</td>
                				</tr>
                				</c:forEach>                 
            				</tbody>
            				
          				</table>
        			</div>
      </div>
    </div>
  </div>
</div>
</section>