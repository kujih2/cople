<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<aside class="aside">
  <div class="aside-inner">
    <nav data-sidebar-anyclick-close="" class="sidebar">
      <ul class="nav">
            <!-- ROLE -->
		<li class="nav-heading ">
        	<span data-localize="sidebar.heading.HEADER">회원관리</span>
        </li>
        <li class="">
        	<a href="${pageContext.request.contextPath}/admin/adminMain" title="일반회원 관리">
            	<em class="icon-people"></em>
                <span>일반회원 관리</span>
            </a>
        </li>
        <li class="">
        	<a href="${pageContext.request.contextPath}/admin/adminIncumbent" title="현직자 관리">
            	<em class="icon-people"></em>
                <span>현직자 관리</span>
            </a>
        </li>
		<li class="">
           <a href="${pageContext.request.contextPath}/admin/adminTeacher" title="강사 관리">
            	<em class="icon-people"></em>
                <span>강사 관리</span>
           </a>
        </li>
		<li class="">
        	<a href="/admin/adminAuthCertify" title="관리자 관리">
                <em class="icon-people"></em>
                <span>관리자 승인</span>
            </a>
        </li>
      </ul>
    </nav>
  </div>
</aside>