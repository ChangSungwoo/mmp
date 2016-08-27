<%@ page contentType="text/html;charset=UTF-8" language="java" session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<!--=== Header v8 ===-->
	<div class="header-v8 header-sticky">
		<!-- Topbar blog -->
		<div class="blog-topbar">
			<div class="topbar-search-block">
				<div class="container">
					<form action="">
						<input type="text" class="form-control" placeholder="Search">
						<div class="search-close"><i class="icon-close"></i></div>
					</form>
				</div>
			</div>
			<div class="container">
				<c:choose>
					<c:when test="${empty loginInfo}">
						<div class="row">
							<div class="col-sm-8 col-xs-8">
							<div class="header" style="padding-left:400px;">
								<a class="logo" href="/">
									<img src="/img/logo_black.jpg" width="100" alt="Logo">
								</a>
							</div>
								<div class="topbar-toggler"><span class="fa fa-angle-down"></span></div>
								<ul class="topbar-list topbar-menu">
									<li class="cd-log_reg hidden-sm hidden-md hidden-lg"><strong><a class="cd-signin" href="/member/login">로그인</a></strong></li>
									<li class="cd-log_reg hidden-sm hidden-md hidden-lg"><strong><a class="cd-signup" href="/member/regist">회원가입</a></strong></li>
								</ul>
							</div>
							<div class="col-sm-4 col-xs-4 clearfix">
								<i class="fa fa-search search-btn pull-right"></i>
								<ul class="topbar-list topbar-log_reg pull-right visible-sm-block visible-md-block visible-lg-block">
									<li class="cd-log_reg home"><a class="cd-signin" href="/member/login">로그인</a></li>
									<li class="cd-log_reg"><a class="cd-signup" href="/member/regist">회원가입</a></li>
								</ul>
							</div>
						</div><!--/end row-->				
					</c:when>
					<c:otherwise>
						<div class="row">
							<div class="col-sm-8 col-xs-8">
							<div class="header">
								<a class="logo" href="/">
									<img src="/img/logo_black.jpg" width="100" alt="Logo">
								</a>
							</div>
								<div class="topbar-toggler"><span class="fa fa-angle-down"></span></div>
								<ul class="topbar-list topbar-menu">
									<li class="cd-log_reg hidden-sm hidden-md hidden-lg"><strong><a class="cd-signin" href="/member/myPage">I'm <%=session.getAttribute("member.userNick")%></a></strong></li>
									<li class="cd-log_reg hidden-sm hidden-md hidden-lg"><strong><a class="cd-signup" href="/member/logOut">로그아웃</a></strong></li>
								</ul>
							</div>
							<div class="col-sm-4 col-xs-4 clearfix">
								<i class="fa fa-search search-btn pull-right"></i>
								<ul class="topbar-list topbar-log_reg pull-right visible-sm-block visible-md-block visible-lg-block">
									<li class="cd-log_reg home"><a class="cd-signin" href="/member/login">I'm <%=session.getAttribute("member.userNick")%></a></li>
									<li class="cd-log_reg"><a class="cd-signup" href="/member/logOut">로그아웃</a></li>
								</ul>
							</div>
						</div><!--/end row-->						
					</c:otherwise>
				</c:choose>
							

			</div><!--/end container-->
		</div>
		<!-- End Topbar blog -->