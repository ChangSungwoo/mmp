<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
		<!--=== Header ===-->
		<div class="header">
			<div class="container">
				<!-- Logo -->
				<a class="logo" href="index.html">
					<h1>M.M.P</h1>
					<h6>Administrator</h6>
				</a>
				<!-- End Logo -->

				<!-- Topbar -->
				<div class="topbar">&nbsp;</div>
				<!-- End Topbar -->

			</div><!--/end container-->

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse mega-menu navbar-responsive-collapse">
				<div class="container">
					<ul class="nav navbar-nav">
						<!-- 영화관리 Start -->
						<li class="dropdown">
							<a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown">영화관리</a>
							<ul class="dropdown-menu">
								<!-- 영화 데이터 관리 Start -->
								<li><a href="/admin/movie/movieList">영화 목록조회</a></li>
								<li><a href="/admin/movie/moviePersonList">영화인 목록조회</a></li>
									<!-- ul class="dropdown-menu">
										<li><a href="/mmp/admin/movie/movieList">영화목록 조회</a></li>
										<li><a target="_blank" href="One-Pages/Classic/one_page_dark.html">외부 데이터 관리</a></li>
										<li><a target="_blank" href="One-Pages/Classic/one_page_dark.html">영화 신규 등록</a></li>
									</ul-->
								<!-- 영화 데이터 관리 End -->

								<!-- 영화인 관리 Start -->
								<!-- li class="dropdown-submenu">
									<a href="javascript:void(0);">영화인 관리</a>
									<ul class="dropdown-menu">
										<li><a target="_blank" href="One-Pages/Classic/index.html">배우 관리</a></li>
										<li><a target="_blank" href="One-Pages/Classic/one_page_dark.html">감독 관리</a></li>
									</ul>
								</li-->
								<!-- 영화인 관리 End -->
							</ul>
						</li>
						<!-- 영화관리 End -->

						<!-- Pages -->
						<li class="dropdown active">
							<a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown">회원관리</a>
							<ul class="dropdown-menu">
								<!-- About Pages -->
								<li class="dropdown-submenu">
									<a href="javascript:void(0);">회원 관리</a>
									<ul class="dropdown-menu">
										<li><a href="page_about2.html">회원 목록</a></li>
										<li><a href="page_about3.html">비밀번호 초기화 및 메일 발송</a></li>
										<li><a href="page_about1.html">블랙리스트 관리</a></li>
									</ul>
								</li>
								<!-- End About Pages -->

								<!-- Service Pages -->
								<li class="dropdown-submenu">
									<a href="javascript:void(0);">회원 컨텐츠 관리</a>
									<ul class="dropdown-menu">
										<li><a href="page_services.html">Our Services</a></li>
										<li><a href="page_services1.html">Our Services 1</a></li>
										<li><a href="page_services2.html">Our Services 2</a></li>
										<li><a href="page_services3.html">Our Services 3</a></li>
									</ul>
								</li>
								<!-- End Service Pages -->
							</ul>
						</li>
						<!-- End Pages -->

						<!-- Blog -->
						<li class="dropdown">
							<a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown">
								서비스 관리
							</a>
							<ul class="dropdown-menu">
								<li class="dropdown-submenu">
									<a href="javascript:void(0);">메인화면 관리</a>
									<ul class="dropdown-menu">
										<li><a href="blog_large_right_sidebar1.html">Right Sidebar</a></li>
										<li><a href="blog_large_left_sidebar1.html">Left Sidebar</a></li>
										<li><a href="blog_large_full_width1.html">Full Width</a></li>
									</ul>
								</li>
								<li class="dropdown-submenu">
									<a href="javascript:void(0);">평론가 감상평</a>
									<ul class="dropdown-menu">
										<li><a href="blog_medium_right_sidebar1.html">Right Sidebar</a></li>
										<li><a href="blog_medium_left_sidebar1.html">Left Sidebar</a></li>
										<li><a href="blog_medium_full_width1.html">Full Width</a></li>
									</ul>
								</li>
								<li class="dropdown-submenu">
									<a href="javascript:void(0);">서비스 기준 정책관리</a>
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
								<li><a href="#">관리자 목록</a></li>
								<li><a href="#">게시판 관리</a></li>
								<li><a href="#">공통코드 관리</a></li>
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