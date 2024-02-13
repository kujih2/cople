<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    
<!DOCTYPE html>
<section>
<div class="content-wrapper">
		<header class="content-heading">회원등급 관리자 승인
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
    					<thead>
                        <tr>
                            <th class="text-center">ID</th>
                            <th style="width:120px" class="text-center">등급</th>
                            <th class="text-center">성명</th>
                            <th class="text-center">모바일</th>
                            <th class="text-left">이메일</th>
                            <th style="width:100px" class="text-center">탈퇴여부</th>
                            <th style="width:80px" class="text-center">Actions</th>
                        </tr>
                        </thead>
                        <tbody>
						<c:forEach var="member" items="${list}">
                            <tr>
                                <td class="text-center">${member.id}</td>
                                <td class="text-center">
                                		<c:if test="${member.auth == 0}">탈퇴</c:if>
										<c:if test="${member.auth == 1}">수강생</c:if>
										<c:if test="${member.auth == 2}">현직자</c:if>
										<c:if test="${member.auth == 3}">강사</c:if>
										<c:if test="${member.auth == 4}">정지</c:if>
										<c:if test="${member.auth == 5}">일반회원</c:if>
										<c:if test="${member.auth == 9}">관리자</c:if>
                                </td>
                                <td class="text-center">${member.name}</td>
                                <td class="text-center">${member.phone}</td>
                                <td class="text-left">${member.email}</td>

                                <td class="text-center">
                                       <c:if test="${member.auth == 0}">
                                        <div class="label label-success">
                                        	탈퇴
                                        </div>
                                </c:if>
                                <c:if test="${member.auth != 0}">
                                        <div class="label label-success">
                                        	회원
                                        </div>
                                </c:if>
                                </td>
                                <td class="text-center">
                                    <a href="/admin/user/USER/update/299554" class="btn btn-sm btn-default" data-toggle="tooltip" data-placement="top" title="" data-original-title="상세 보기 및 수정">
                                        <em class="fa fa-pencil"></em>
                                    </a>
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