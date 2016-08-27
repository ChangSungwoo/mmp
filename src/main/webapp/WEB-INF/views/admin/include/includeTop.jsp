<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<body>
	<div class="wrapper">
		<!--=== Header ===-->
		<div class="header">
			<div class="container">
				<!-- Logo -->
				<a class="logo" href="/admin/main">
					<img src="/img/mmp_logo.jpg" width="100" alt="Logo">
				</a>
				<!-- End Logo -->
				<!-- Topbar -->
				<div class="topbar">
					<ul class="loginbar pull-right">
						<li class="hoverSelector">
							<i class="fa fa-globe"></i>
							<a><%=session.getAttribute("member.userNick")%></a>
							<ul class="languages hoverSelectorBlock">
								<li class="active">
									<a href="#">비밀번호 변경<i class="fa fa-check"></i></a>
								</li>
								<li><a href="#">Front</a></li>
								<li><a href="#">Logout</a></li>
							</ul>
						</li>
						<li class="topbar-devider"></li>
						<li><a href="page_faq.html">Logout</a></li>
					</ul>
				</div>
				<!-- End Topbar -->

				<!-- Toggle get grouped for better mobile display -->
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-responsive-collapse">
					<span class="sr-only">Toggle navigation</span>
					<span class="fa fa-bars"></span>
				</button>
				<!-- End Toggle -->
			</div><!--/end container-->

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse mega-menu navbar-responsive-collapse">
				<div class="container">
					<ul class="nav navbar-nav">
						<!-- 영화관리 Start -->
						<li class="dropdown  active">
							<a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown">적정관람료</a>
							<ul class="dropdown-menu">
								<!-- 영화 데이터 관리 Start -->
								<li><a href="/admin/movie/movieList">영화 등록</a></li>
								<li><a href="/admin/movie/movieImageList">이미지 등록</a></li>
								<li><a href="/admin/review/moviePriceList">적정관람료 작성</a></li>
								<li><a href="/admin/movie/movieDSearch">Daum 영화정보</a></li>
								<!-- 영화 데이터 관리 End -->
							</ul>
						</li>
						<!-- 영화관리 End -->

						<!-- Pages -->
						<li class="dropdown">
							<a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown">회원관리</a>
							<ul class="dropdown-menu">
								<li><a href="/admin/member/memberList">회원 리스트</a></li>
								<li><a href="page_services.html">회원 적정관람료</a></li>
							</ul>
						</li>
						<!-- End Pages -->

						<!-- Blog -->
						<li class="dropdown">
							<a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown">기타 관리</a>
							<ul class="dropdown-menu">
								<li><a href="/admin/service/mainContentList">메인 화면</a></li>
								<li><a href="/admin/reader/readerList">읽을거리</a></li>
								<li class="dropdown-submenu">
									<a href="javascript:void(0);">정책관리</a>
									<ul class="dropdown-menu">
										<li><a href="blog_large_right_sidebar_item1.html">User평 기준 상한선</a></li>
									</ul>
								</li>
							</ul>
						</li>
						<!-- End Blog -->

						<!-- Portfolio -->
						<li class="dropdown">
							<a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown">
								시스템 관리
							</a>
							<ul class="dropdown-menu">
								<li><a href="/admin/member/memberAdminList">관리자 리스트</a></li>
								<li><a href="/admin/common/commonCodeList">공통코드 관리</a></li>
							</ul>
						</li>
						<!-- End Portfolio -->
						<!-- Portfolio -->
						<li class="dropdown">
							<a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown">
								통계
							</a>
							<ul class="dropdown-menu">
								<li><a href="#">접속자 통계</a></li>
								<li><a href="#">About</a></li>
							</ul>
						</li>
						<!-- End Portfolio -->
					</ul>
				</div><!--/end container-->
			</div><!--/navbar-collapse-->
		</div>
		<!--=== End Header ===-->
	</div>
</body>