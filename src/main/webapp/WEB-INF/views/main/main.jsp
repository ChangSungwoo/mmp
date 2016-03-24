<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	<!-- Web Fonts -->
	<link rel='stylesheet' type='text/css' href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600&amp;subset=cyrillic,latin'>

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
	<link rel="stylesheet" href="/plugins/cubeportfolio/css/cubeportfolio.min.css">
	<link rel="stylesheet" href="/plugins/cubeportfolio/custom/custom-cubeportfolio.css">

	<!-- CSS Theme -->
	<link rel="stylesheet" href="/css/theme-colors/default.css" id="style_color">
	<link rel="stylesheet" href="/css/theme-skins/dark.css">

	<!-- CSS Customization -->
	
</head>
<body class="header-fixed header-fixed-space-v2">
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
	<div class="cube-portfolio">
		<div class="content-xs">
			<div id="filters-container" class="cbp-l-filters-text content-xs">
				<div data-filter="*" class="cbp-filter-item-active cbp-filter-item"> All </div> |
				<div data-filter=".identity" class="cbp-filter-item"> 개봉일순 </div> |
				<div data-filter=".web-design" class="cbp-filter-item"> 최고가 </div> |
				<div data-filter=".graphic" class="cbp-filter-item"> 댓글순 </div> |
				<div data-filter=".logos" class="cbp-filter-item"> 좋아요! </div>
			</div><!--/end Filters Container-->
		</div>

		<div id="grid-container" class="cbp-l-grid-agency">
			<div class="cbp-item graphic">
				<div class="cbp-caption" >
					<div class="cbp-caption-defaultWrap">
						<img src="/img/movie/movie001.jpg" alt="">
					</div>
					<div class="cbp-caption-activeWrap">
						<div class="cbp-l-caption-alignCenter">
							<div class="cbp-l-caption-body">
								<ul class="link-captions">
									<li><a href="/movie/movieDetail"><i class="rounded-x fa fa-link"></i></a></li>
									<li><a href="/img/movie/movie001.jpg" class="cbp-lightbox" data-title="Design Object"><i class="rounded-x fa fa-search"></i></a></li>
								</ul>
								<div class="cbp-l-grid-agency-title">헤일 시져</div>
								<div class="cbp-l-grid-agency-desc">Hail, caesar! (2016.03.24)</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="cbp-item web-design logos">
				<div class="cbp-caption">
					<div class="cbp-caption-defaultWrap">
						<img src="/img/movie/movie002.jpg" alt="">
					</div>
					<div class="cbp-caption-activeWrap">
						<div class="cbp-l-caption-alignCenter">
							<div class="cbp-l-caption-body">
								<ul class="link-captions">
									<li><a href="/movie/movieDetail"><i class="rounded-x fa fa-link"></i></a></li>
									<li><a href="/img/movie/movie002.jpg" class="cbp-lightbox" data-title="Design Object"><i class="rounded-x fa fa-search"></i></a></li>
								</ul>
								<div class="cbp-l-grid-agency-title">사울의 아들</div>
								<div class="cbp-l-grid-agency-desc">Saul fia, Son of Saul(2016.02.25)</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="cbp-item graphic logos">
				<div class="cbp-caption">
					<div class="cbp-caption-defaultWrap">
						<img src="/img/movie/movie003.jpg" alt="">
					</div>
					<div class="cbp-caption-activeWrap">
						<div class="cbp-l-caption-alignCenter">
							<div class="cbp-l-caption-body">
								<ul class="link-captions">
									<li><a href="/movie/movieDetail"><i class="rounded-x fa fa-link"></i></a></li>
									<li><a href="/img/movie/movie003.jpg" class="cbp-lightbox" data-title="Design Object"><i class="rounded-x fa fa-search"></i></a></li>
								</ul>
								<div class="cbp-l-grid-agency-title">주토피아</div>
								<div class="cbp-l-grid-agency-desc">Zootopia (2016.02.17)</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="cbp-item web-design graphic">
				<div class="cbp-caption">
					<div class="cbp-caption-defaultWrap">
						<img src="/img/movie/movie004.jpg" alt="">
					</div>
					<div class="cbp-caption-activeWrap">
						<div class="cbp-l-caption-alignCenter">
							<div class="cbp-l-caption-body">
								<ul class="link-captions">
									<li><a href="/movie/movieDetail"><i class="rounded-x fa fa-link"></i></a></li>
									<li><a href="/img/movie/movie004.jpg" class="cbp-lightbox" data-title="Design Object"><i class="rounded-x fa fa-search"></i></a></li>
								</ul>
								<div class="cbp-l-grid-agency-title">스포트라이트</div>
								<div class="cbp-l-grid-agency-desc">Spotlight (2016.02.24)</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="cbp-item identity web-design">
				<div class="cbp-caption">
					<div class="cbp-caption-defaultWrap">
						<img src="/img/movie/movie005.jpg" alt="">
					</div>
					<div class="cbp-caption-activeWrap">
						<div class="cbp-l-caption-alignCenter">
							<div class="cbp-l-caption-body">
								<ul class="link-captions">
									<li><a href="/movie/movieDetail"><i class="rounded-x fa fa-link"></i></a></li>
									<li><a href="/img/movie/movie005.jpg" class="cbp-lightbox" data-title="Design Object"><i class="rounded-x fa fa-search"></i></a></li>
								</ul>
								<div class="cbp-l-grid-agency-title">남과 여</div>
								<div class="cbp-l-grid-agency-desc">A Man and A Woman (2016.02.25)</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="cbp-item identity web-design">
				<div class="cbp-caption">
					<div class="cbp-caption-defaultWrap">
						<img src="/img/movie/movie006.jpg" alt="">
					</div>
					<div class="cbp-caption-activeWrap">
						<div class="cbp-l-caption-alignCenter">
							<div class="cbp-l-caption-body">
								<ul class="link-captions">
									<li><a href="/movie/movieDetail"><i class="rounded-x fa fa-link"></i></a></li>
									<li><a href="/img/movie/movie006.jpg" class="cbp-lightbox" data-title="Design Object"><i class="rounded-x fa fa-search"></i></a></li>
								</ul>
								<div class="cbp-l-grid-agency-title">동주</div>
								<div class="cbp-l-grid-agency-desc">DongJu; The Portrait of A Poet (2016.02.17)</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div><!--/end Grid Container-->
	</div>
	<!--=== End Contents ===-->

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
<script src="/plugins/cubeportfolio/js/jquery.cubeportfolio.min.js"></script>

<!-- JS Page Level -->
<script src="/js/app.js"></script>
<script src="/plugins/cubeportfolio/js/cube-portfolio-2-ns.js"></script>

<!-- JS Customization -->
<script src="/js/main/main.js"></script>

<!--[if lt IE 9]>
	<script src="plugins/respond.js"></script>
	<script src="plugins/html5shiv.js"></script>
	<script src="plugins/placeholder-IE-fixes.js"></script>
<![endif]-->
</body>
</html>