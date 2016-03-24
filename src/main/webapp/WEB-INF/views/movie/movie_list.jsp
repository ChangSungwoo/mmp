<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->
<head>
	<title>My Movie Price</title>

	<!-- Meta -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">

	<!-- Favicon -->
	<link rel="shortcut icon" href="favicon.ico">

	<!-- Web Fonts -->
	<link rel="stylesheet" href="//fonts.googleapis.com/css?family=Open+Sans:400,300,600&amp;subset=cyrillic,latin">

	<!-- CSS Global Compulsory -->
	<link rel="stylesheet" href="/plugins/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/style.css">

	<!-- CSS Header and Footer -->
	<link rel="stylesheet" href="/css/headers/header-v8.css">
	<link rel="stylesheet" href="/css/footers/footer-v8.css">

	<!-- CSS Implementing Plugins -->
	<link rel="stylesheet" href="/plugins/animate.css">
	<link rel="stylesheet" href="/plugins/line-icons/line-icons.css">
	<link rel="stylesheet" href="/plugins/font-awesome/css/font-awesome.min.css">

	<!-- CSS Theme -->
	<link rel="stylesheet" href="/css/theme-colors/default.css" id="style_color">
	<link rel="stylesheet" href="/css/theme-skins/dark.css">

	<!-- CSS Customization -->
	<link rel="stylesheet" href="/css/movie/movie_list.css">
</head>
<body class="header-fixed header-fixed-space-v2">
	<!--=== Start Header v8 ===-->
	<div class="wrapper">
		<jsp:include page="/WEB-INF/views/include/header.jsp" flush="false">
			<jsp:param name="dummy" value=""/>
		</jsp:include>
		<jsp:include page="/WEB-INF/views/include/menu.jsp" flush="false">
			<jsp:param name="dummy" value=""/>
		</jsp:include>
	</div>
	<!--=== End Header v8 ===-->
	
	<!--=== Start Contents ===-->
	<div class="container content">
		<div class="sort-xs">
			<div id="sort_condition" class="cbp-l-filters-text sort-xs">
				<div class="cbp-filter-item-active cbp-filter-item"> 개봉일순 </div> |
				<div class="cbp-filter-item"> 높은 관람료 순 </div> |
				<div class="cbp-filter-item"> 낮은 관람료 순 </div> |
			</div><!--/end Filters Container-->
		</div>
		<div class="row">
		<!-- Tab v2 -->
			<div class="tab-v2">
				<ul class="nav nav-tabs">
					<li class="active"><a href="#home-1" data-toggle="tab">한동원</a></li>
					<li><a href="#profile-1" data-toggle="tab">관객평</a></li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane fade in active" id="home-1">
						<p>
							<!-- News v3 -->
							<div class="row margin-bottom-5">
								<div class="col-sm-5 sm-margin-bottom-5">
									<img class="img-responsive" src="/img/movie/movie001.jpg" alt="">
								</div>
								<div class="col-sm-7">
									<div class="news-v3">
										<ul class="list-inline posted-info">
											<li>By 에단 코엔, 조엘 코엔</li>
											<li>개봉일 : 2016-03-24</li>
										</ul>
										<h2><a href="/movie/movieDetail">헤일 시저 (Hail, Caesar!)</a></h2>
										<p>시나리오도 있다! 돈도 있다! 그런데 주연배우가 없다? 1950년, 할리우드 최대 무비 스캔들을 해결하라! 올해 최고 대작 ‘헤일, 시저!’ 촬영 도중 무비 스타 ‘베어드 휘트록’이 납치되고 정체불명의 ‘미래’로부터 협박 메시지가 도착한다...</p>
										<ul class="post-shares">
											<li class="movie-prices text-highlights text-highlights-purple rounded tooltips">9,150원</li>
											<span aria-hidden="true" class="icon-arrow-up"></span>&nbsp;<li class="movie-small-prices price-red">+450원</li>
											<span aria-hidden="true" class="icon-arrow-down"></span>&nbsp;<li class="movie-small-prices price-blue">-300원</li>
										</ul>
									</div>
								</div>
							</div><!--/end row-->
							<!-- End News v3 -->
							<div class="clearfix margin-bottom-5"><hr></div>

							<div class="row margin-bottom-5">
								<div class="col-sm-5 sm-margin-bottom-5">
									<img class="img-responsive" src="/img/movie/movie002_002.jpg" alt="">
								</div>
								<div class="col-sm-7">
									<div class="news-v3">
										<ul class="list-inline posted-info">
											<li>By 라즐로 네메스</li>
											<li>개봉일 : 2016-02-25</li>
										</ul>
										<h2><a href="/movie/movieDetail">사울의 아들 (Saul fia, Son of Saul)</a></h2>
										<p>압도적인 집요함과 유구한 끈질김으로 해볼 건 웬만하면 다 해본 듯하여 이제는 더 이상 나올 게 없어보였던 나치만행 고발무비에서, 보란 듯 등장한 혁신과 진일보를 앞에 두고 그만 무어라 드릴 말씀을 잊는 와중에도 계속해서 떠오르는 것은...</p>
										<ul class="post-shares">
											<li class="movie-prices text-highlights text-highlights-purple rounded tooltips" style="text-align:center">11,650원 <br/>OR<br/> 7,150원</li>
											<span aria-hidden="true" class="icon-arrow-up"></span>&nbsp;<li class="movie-small-prices price-red">+3,100원</li>
											<span aria-hidden="true" class="icon-arrow-down"></span>&nbsp;<li class="movie-small-prices price-blue">-450원 or -4,950원</li>
										</ul>
									</div>
								</div>
							</div><!--/end row-->
							<!-- End News v3 -->
							<div class="clearfix margin-bottom-5"><hr></div>
							
							<div class="row margin-bottom-5">
								<div class="col-sm-5 sm-margin-bottom-5">
									<img class="img-responsive" src="/img/movie/movie003.jpg" alt="">
								</div>
								<div class="col-sm-7">
									<div class="news-v3">
										<ul class="list-inline posted-info">
											<li>By 바이론 하워드, 리치 무어</li>
											<li>개봉일 : 2016-02-17</li>
										</ul>
										<h2><a href="/movie/movieDetail"> 주토피아 (Zootopia)</a></h2>
										<p>교양 있고 세련된 라이프 스타일을 주도하는 도시 주토피아. 이 곳을 단숨에 혼란에 빠트린 연쇄 실종사건이 발생한다! 주토피아 최초의 토끼 경찰관 주디 홉스는 48시간 안에 사건 해결을 지시 받자 뻔뻔한 사기꾼 여우 닉 와일드에게 협동 수사를 제안하는데...</p>
										<ul class="post-shares">
											<li class="movie-prices text-highlights text-highlights-purple rounded tooltips">9,300원</li>
											<span aria-hidden="true" class="icon-arrow-up"></span>&nbsp;<li class="movie-small-prices price-red">+900원</li>
											<span aria-hidden="true" class="icon-arrow-down"></span>&nbsp;<li class="movie-small-prices price-blue">-600원</li>
										</ul>
									</div>
								</div>
							</div><!--/end row-->
							<!-- End News v3 -->
							<div class="clearfix margin-bottom-5"><hr></div>
							
							<div class="row margin-bottom-5">
								<div class="col-sm-5 sm-margin-bottom-5">
									<img class="img-responsive" src="/img/movie/movie004.jpg" alt="">
								</div>
								<div class="col-sm-7">
									<div class="news-v3">
										<ul class="list-inline posted-info">
											<li>By 토마스 맥카시</li>
											<li>개봉일 : 2016-02-24</li>
										</ul>
										<h2><a href="/movie/movieDetail">스포트라이트 (Spotlight)</a></h2>
										<p>미국의 3대 일간지 중 하나인 보스턴 글로브 내 ‘스포트라이트’팀은 가톨릭 보스턴 교구 사제들의 아동 성추행 사건을 취재한다.하지만 사건을 파헤치려 할수록 더욱 굳건히 닫히는 진실의 장벽....</p>
										<ul class="post-shares">
											<li class="movie-prices text-highlights text-highlights-purple rounded tooltips">9,150원</li>
											<span aria-hidden="true" class="icon-arrow-up"></span>&nbsp;<li class="movie-small-prices price-red">+450원</li>
											<span aria-hidden="true" class="icon-arrow-down"></span>&nbsp;<li class="movie-small-prices price-blue">-300원</li>
										</ul>
									</div>
								</div>
							</div><!--/end row-->
							<!-- End News v3 -->
							<div class="clearfix margin-bottom-5"><hr></div>
							<!-- Pager v3 -->
							<ul class="pager pager-v3 pager-md no-margin-bottom">
								<li class="previous"><a href="#">&larr; Older</a></li>
								<li class="page-amount">1 of 7</li>
								<li class="next"><a href="#">Newer &rarr;</a></li>
							</ul>
							<!-- End Pager v3 -->
						</p>
					</div>
					<div class="tab-pane fade in" id="profile-1">
						<p>
							<!-- News v3 -->
							<div class="row margin-bottom-5">
								<div class="col-sm-5 sm-margin-bottom-5">
									<img class="img-responsive" src="/img/movie/movie005.jpg" alt="">
								</div>
								<div class="col-sm-7">
									<div class="news-v3">
										<ul class="list-inline posted-info">
											<li>By 이윤기</li>
											<li>개봉일 : 2016-02-25</li>
										</ul>
										<h2><a href="#">남과 여</a></h2>
										<p>눈 덮인 핀란드에서 만나 뜨거운 끌림에 빠져드는 남자와 여자의 이야기. 헬싱키. 아이들의 국제학교에서 만난 상민(전도연)과 기홍(공유)은, 먼 북쪽의 캠프장을 향해 우연히 동행하게 된다. 폭설로 도로가 끊기고, 아무도 없는 하얀 숲 속의 오두막에서...</p>
										<ul class="post-shares">
											<li class="movie-prices text-highlights text-highlights-purple rounded tooltips">9,150원</li>
											<span aria-hidden="true" class="icon-arrow-up"></span>&nbsp;<li class="movie-small-prices price-red">+450원</li>
											<span aria-hidden="true" class="icon-arrow-down"></span>&nbsp;<li class="movie-small-prices price-blue">-300원</li>
										</ul>
									</div>
								</div>
							</div><!--/end row-->
							<!-- End News v3 -->
							<div class="clearfix margin-bottom-5"><hr></div>

							<div class="row margin-bottom-5">
								<div class="col-sm-5 sm-margin-bottom-5">
									<img class="img-responsive" src="/img/movie/movie006.jpg" alt="">
								</div>
								<div class="col-sm-7">
									<div class="news-v3">
										<ul class="list-inline posted-info">
											<li>By 라즐로 네메스</li>
											<li>개봉일 : 2016-02-25</li>
										</ul>
										<h2><a href="#">동주</a></h2>
										<p>시 따위는 오래 전부터 죽어도 쌌다는 시대에, 시를 접할 일이라곤 드라마 주인공이 화장 고치듯 꺼내드는 시집 제목을 검색해 볼 일밖엔 없는 요즘에, 그래도 시를 읊어주는 영화라도 드물게 만나는 것을 위안으로 삼아야 할까. 아니면 윤동주마저도 영화의 도움 없이는 떠올리기 어려워진 지금을 외려 서글퍼해야 할까...</p>
										<ul class="post-shares">
											<li class="movie-prices text-highlights text-highlights-purple rounded tooltips">10,890원</li>
											<span aria-hidden="true" class="icon-arrow-up"></span>&nbsp;<li class="movie-small-prices price-red">+2,220원</li>
											<span aria-hidden="true" class="icon-arrow-down"></span>&nbsp;<li class="movie-small-prices price-blue">-330원</li>
										</ul>
									</div>
								</div>
							</div><!--/end row-->
							<!-- End News v3 -->
							<div class="clearfix margin-bottom-5"><hr></div>
							
							<div class="row margin-bottom-5">
								<div class="col-sm-5 sm-margin-bottom-5">
									<img class="img-responsive" src="/img/movie/movie003.jpg" alt="">
								</div>
								<div class="col-sm-7">
									<div class="news-v3">
										<ul class="list-inline posted-info">
											<li>By 바이론 하워드, 리치 무어</li>
											<li>개봉일 : 2016-02-17</li>
										</ul>
										<h2><a href="#"> 주토피아 (Zootopia)</a></h2>
										<p>교양 있고 세련된 라이프 스타일을 주도하는 도시 주토피아. 이 곳을 단숨에 혼란에 빠트린 연쇄 실종사건이 발생한다! 주토피아 최초의 토끼 경찰관 주디 홉스는 48시간 안에 사건 해결을 지시 받자 뻔뻔한 사기꾼 여우 닉 와일드에게 협동 수사를 제안하는데...</p>
										<ul class="post-shares">
											<li class="movie-prices text-highlights text-highlights-purple rounded tooltips">9,300원</li>
											<span aria-hidden="true" class="icon-arrow-up"></span>&nbsp;<li class="movie-small-prices price-red">+900원</li>
											<span aria-hidden="true" class="icon-arrow-down"></span>&nbsp;<li class="movie-small-prices price-blue">-600원</li>
										</ul>
									</div>
								</div>
							</div><!--/end row-->
							<!-- End News v3 -->
							<div class="clearfix margin-bottom-5"><hr></div>
							
							<div class="row margin-bottom-5">
								<div class="col-sm-5 sm-margin-bottom-5">
									<img class="img-responsive" src="/img/movie/movie004.jpg" alt="">
								</div>
								<div class="col-sm-7">
									<div class="news-v3">
										<ul class="list-inline posted-info">
											<li>By 토마스 맥카시</li>
											<li>개봉일 : 2016-02-24</li>
										</ul>
										<h2><a href="#">스포트라이트 (Spotlight)</a></h2>
										<p>미국의 3대 일간지 중 하나인 보스턴 글로브 내 ‘스포트라이트’팀은 가톨릭 보스턴 교구 사제들의 아동 성추행 사건을 취재한다.하지만 사건을 파헤치려 할수록 더욱 굳건히 닫히는 진실의 장벽....</p>
										<ul class="post-shares">
											<li class="movie-prices text-highlights text-highlights-purple rounded tooltips">9,150원</li>
											<span aria-hidden="true" class="icon-arrow-up"></span>&nbsp;<li class="movie-small-prices price-red">+450원</li>
											<span aria-hidden="true" class="icon-arrow-down"></span>&nbsp;<li class="movie-small-prices price-blue">-300원</li>
										</ul>
									</div>
								</div>
							</div><!--/end row-->
							<!-- End News v3 -->
							<div class="clearfix margin-bottom-5"><hr></div>
							<!-- Pager v3 -->
							<ul class="pager pager-v3 pager-md no-margin-bottom">
								<li class="previous"><a href="#">&larr; Older</a></li>
								<li class="page-amount">1 of 7</li>
								<li class="next"><a href="#">Newer &rarr;</a></li>
							</ul>
							<!-- End Pager v3 -->
						</p>
					</div>
				</div>
			</div>
		<!-- End Tab v2 -->
		</div>
	</div>
	
	<!--=== Footer v8 ===-->
	<div class="footer-v8">
		<jsp:include page="/WEB-INF/views/include/footer.jsp" flush="false">
			<jsp:param name="dummy" value=""/>
		</jsp:include>
	</div>
	<!--=== End Footer v8 ===-->

<!-- JS Global Compulsory -->
<script src="/plugins/jquery/jquery.min.js"></script>
<script src="/plugins/jquery/jquery-migrate.min.js"></script>
<script src="/plugins/bootstrap/js/bootstrap.min.js"></script>

<!-- JS Implementing Plugins -->
<script src="/plugins/back-to-top.js"></script>
<script src="/plugins/smoothScroll.js"></script>

<!-- JS Page Level -->
<script src="/js/app.js"></script>

<!-- JS Customization -->
<script src="/js/movie/movie_list.js"></script>

<!--[if lt IE 9]>
	<script src="plugins/respond.js"></script>
	<script src="plugins/html5shiv.js"></script>
	<script src="plugins/placeholder-IE-fixes.js"></script>
<![endif]-->
</body>
</html>