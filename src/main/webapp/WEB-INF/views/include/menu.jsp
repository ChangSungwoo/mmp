<%@ page contentType="text/html;charset=UTF-8" language="java"%>
		<!-- Navbar -->
		<div class="navbar mega-menu" role="navigation">
			<div class="container">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="res-container">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-responsive-collapse">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>

					<div class="navbar-brand">
						<!--a href="index.html">
							<img src="img/themes/logo-news-dark-default.png" alt="Logo">
						</a-->
					</div>
				</div><!--/end responsive container-->

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse navbar-responsive-collapse">
					<div class="res-container">
						<ul class="nav navbar-nav">
							<!-- 개봉관 -->
							<li><a href="/review/reviewListByEditor">최근 영화</a></li>
							<!-- End 개봉관 -->
							<!-- 추억의 명화관 -->
							<li><a href="/review/oldReviewListByEditor">지난 영화</a></li>
							<!-- End 추억의 명화관 -->
							<!-- 팝콘 -->
							<li><a href="/reader/readerList">읽을 거리</a></li>
							<!-- End 팝콘 -->
							<!-- 적관매기기 UI는 고려가 필요하다. >
							<li><a href="/review/reviewWrite">적관 매기기</a></li-->
							<!-- End FAQ -->
							<!-- 마이페이지 -->
							<li><a href="/member/myPage">마이페이지</a></li>
							<!-- End 마이페이지 -->
						</ul>
					</div><!--/responsive container-->
				</div><!--/navbar-collapse-->
			</div><!--/end contaoner-->
		</div>
		<!-- End Navbar -->