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
	
	<!-- CSS Page Style -->
	<link rel="stylesheet" href="/css/pages/shortcode_timeline2.css">

	<!-- CSS Implementing Plugins -->
	<link rel="stylesheet" href="/plugins/animate.css">
	<link rel="stylesheet" href="/plugins/line-icons/line-icons.css">
	<link rel="stylesheet" href="/plugins/font-awesome/css/font-awesome.min.css">

	<!-- CSS Theme -->
	<link rel="stylesheet" href="/css/theme-colors/default.css" id="style_color">
	<link rel="stylesheet" href="/css/theme-skins/dark.css">

	<!-- CSS Customization -->
	<link rel="stylesheet" href="/css/member/myPage.css">
</head>
<body class="header-fixed header-fixed-space-v2">
	<!--=== Start Header v8 ===-->
	<div class="wrapper">
		<jsp:include page="/common/header" flush="false">
			<jsp:param name="dummy" value=""/>
		</jsp:include>
		<jsp:include page="/WEB-INF/views/include/menu.jsp" flush="false">
			<jsp:param name="dummy" value=""/>
		</jsp:include>
	</div>
	<!--=== End Header v8 ===-->

	<!--=== Breadcrumbs ===-->
	<div class="breadcrumbs breadcrumbs-light">
		<div class="container">
			<h1 class="pull-left">마이 페이지</h1>
			<ul class="pull-right breadcrumb">
				<li>JESSI</li>
			</ul>
		</div>
	</div>
	<!--/breadcrumbs-->

		<!--=== Content Part ===-->
		<div class="container content">
			<div class="row">
				<!-- Begin Sidebar Menu -->
				<div class="col-md-3">
					<ul class="list-group sidebar-nav-v1" id="sidebar-nav">
						<!-- 내가 작성한 적정 관람료 -->
						<li class="list-group-item active"><a href="shortcode_thumbnails.html">내가 작성한 적정 관람료</a></li>
						<!-- End 내가 작성한 적정 관람료 -->
						<!-- 나의 공감유져들 -->
						<li class="list-group-item list-toggle">
							<a class="accordion-toggle" href="#collapse-maps" data-toggle="collapse">나의 공감유져들</a>
							<ul id="collapse-maps" class="collapse">
								<li>
									<span class="badge badge-u">New</span>
									<a href="shortcode_maps_google.html"><i class="fa fa-map-marker"></i>내가 공감하는 User</a>
								</li>
								<li>
									<span class="badge badge-u">New</span>
									<a href="shortcode_maps_vector.html"><i class="fa fa-align-center"></i>나를 공감하는 User</a>
								</li>
							</ul>
						</li>
						<!-- End 나의 공감유져들 -->
						<!-- 나의 댓글모음 -->
						<li class="list-group-item"><a href="shortcode_thumbnails.html">나의 댓글모음</a></li>
						<!-- End 나의 댓글모음 -->
						<!-- 나의 개인정보수정 -->
						<li class="list-group-item"><a href="shortcode_thumbnails.html">개인정보수정</a></li>
						<!-- End 개인정보수정 -->
					</ul>
				</div>
				<!-- End Sidebar Menu -->

				<!-- Begin Content -->
				<div class="col-md-9">
					<ul class="timeline-v2">
						<li class="equal-height-columns">
							<div class="cbp_tmtime equal-height-column"><span>2016/03/25</span> <span class="font-red">7,660원</span></div>
							<i class="cbp_tmicon rounded-x hidden-xs"></i>
							<div class="cbp_tmlabel equal-height-column">
								<span class="label label-danger">적정관람료</span>&nbsp;<h2>배트맨 대 슈퍼맨 : 저스티스의 시작</h2>
								<div class="row">
									<div class="col-md-4">
										<img class="img-responsive" src="/img/movie/movie_010.jpg" alt="">
										<div class="md-margin-bottom-20"></div>
									</div>
									<div class="col-md-8">
										<p>뭔가 그리스 신화적 또는 셰익스피어적 모티브를 차용한 듯한 냄새 짙게 흩뿌리며, 이 영화는 절대 애들 영화가 아니에요, 슈퍼 히어로 무비의 탈을 쓰고 신과 인간의 대결이라는 인류 궁극의 테마를 탐구한 액션 철학 영화예요, 를 온몸으로 부르짖고 있는 당 영화였다만, 됐고...</p>
									</div>
								</div>
							</div>
						</li>
						<li class="equal-height-columns">
							<div class="cbp_tmtime equal-height-column"><span>2016/03/22</span> <span>7,530원</span></div>
							<i class="cbp_tmicon rounded-x hidden-xs"></i>
							<div class="cbp_tmlabel equal-height-column">
								<h2><span class="label label-danger">적정관람료</span>&nbsp;글로리데이</h2>
								<div class="row">
									<div class="col-md-4">
										<img class="img-responsive" src="/img/movie/movie_011.jpg" alt="">
										<div class="md-margin-bottom-20"></div>
									</div>
									<div class="col-md-8">
										<p>드넓은 바다를 향해 환희에 찬 사자후 토해내며 한껏 질주하는 네 청년의 슬로우모션으로 공익광고협의회 ‘청춘 힘내라’ 광고를 방불케 하는 인트로로 시작하여, 전설의 청춘무비 <트레인스포팅>의 질주장면을 연상케 하는 도주장면을 이어감으로써, 그 출발부터 靑하고도 春 무비임을 온몸으로...</p>
									</div>
								</div>
							</div>
						</li>
						<li class="equal-height-columns">
							<div class="cbp_tmtime equal-height-column"><span>2016/03/03</span> <span>11,650원</span></div>
							<i class="cbp_tmicon rounded-x hidden-xs"></i>
							<div class="cbp_tmlabel equal-height-column">
								<h2><span class="label label-danger">적정관람료</span>&nbsp;사울의 아들</h2>
								<div class="row">
									<div class="col-md-4">
										<img class="img-responsive" src="/img/movie/movie002.jpg" alt="">
										<div class="md-margin-bottom-20"></div>
									</div>
									<div class="col-md-8">
										<p>압도적인 집요함과 유구한 끈질김으로 해볼 건 웬만하면 다 해본 듯하여 이제는 더 이상 나올 게 없어보였던 나치만행 고발무비에서, 보란 듯 등장한 혁신과 진일보를 앞에 두고 그만 무어라 드릴 말씀을 잊는 와중에도 계속해서 떠오르는 것은, 이만하면 됐으니 이제 과거는 웬만하면 다 털고 가자는 목소리들....</p>
									</div>
								</div>
							</div>
						</li>
						<li class="equal-height-columns">
							<div class="cbp_tmtime equal-height-column"><span>2015/11/20</span> <span>-</span></div>
							<i class="cbp_tmicon rounded-x hidden-xs"></i>
							<div class="cbp_tmlabel equal-height-column">
								<h2><span class="label label-info">읽을거리</span>&nbsp;원조 ‘스파이 영화’의 서글픈 쇠락</h2>
								<div class="row">
									<div class="col-md-4">
										<img class="img-responsive" src="/img/movie/movie_009.jpg" alt="">
										<div class="md-margin-bottom-20"></div>
									</div>
									<div class="col-md-8">
										<p>‘겉 먹자는 송편, 속 먹자는 만두’라는 고래의 경구로 비추어보아 007 시리즈는 단연 전자에 속하는 영화다. 다시 말해, 007 시리즈는 치밀한 이야기나 묵직한 주제의식 등이 아닌, 느끼미 및 섹시미로 무장한 남녀배우들과 그들의 딱 떨어지고도 화려한 의상과....</p>
									</div>
								</div>
							</div>
						</li>
						<li class="equal-height-columns">
							<div class="cbp_tmtime equal-height-column"><span>2015/11/12</span> <span>6,870원</span></div>
							<i class="cbp_tmicon rounded-x hidden-xs"></i>
							<div class="cbp_tmlabel equal-height-column">
								<h2><span class="label label-danger">적정관람료</span>&nbsp;007 스펙터</h2>
								<div class="row">
									<div class="col-md-4">
										<img class="img-responsive" src="/img/movie/movie_009_02.jpg" alt="">
										<div class="md-margin-bottom-20"></div>
									</div>
									<div class="col-md-8">
										<p>‘겉 먹자는 송편, 속 먹자는 만두’라는 고래의 경구에 비추어 생각할 때, 007 시리즈는 단연 ‘겉 먹자’는 영화. 즉, 내용의 치밀함이나 영양가보다는 그 기상천외한 은근 코믹액션과 장비와 배우와 갑빠와 약식 훌러덩 등에 주안점을 두는 영화일 것인 바...</p>
									</div>
								</div>
							</div>
						</li>
						<li class="equal-height-columns">
							<div class="cbp_tmtime equal-height-column"><span>18/7/13</span> <span>-</span></div>
							<i class="cbp_tmicon rounded-x hidden-xs"></i>
							<div class="cbp_tmlabel equal-height-column">
								<h2><span class="label label-info">읽을거리</span>&nbsp;더 셰프</h2>
								<div class="row">
									<div class="col-md-4">
										<img class="img-responsive" src="/img/movie/movie_012.jpg" alt="">
										<div class="md-margin-bottom-20"></div>
									</div>
									<div class="col-md-8">
										<p>주방장과 셰프는 다른 존재다. 먹방과 쉐방이 다른 존재이듯. 주방과 키친이 다른 존재이듯. 미셰린과 미슐랭이 다른 존재이듯.그러한 현 정세를 적극 반영하여 'Burnt'라는 원제를 '더 셰프'라는 제목으로 번안하여 각종 쉐방 팬들의 이목을 끈 것은 매우 적절한 조치였다 사료되는 가운...</p>
									</div>
								</div>
							</div>
						</li>
					</ul>
				</div>
				<!-- End Content -->
			</div>
		</div><!--/container-->
		<!--=== End Content Part ===-->
	
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
<script src="/js/member/myPage.js"></script>

<!--[if lt IE 9]>
	<script src="plugins/respond.js"></script>
	<script src="plugins/html5shiv.js"></script>
	<script src="plugins/placeholder-IE-fixes.js"></script>
<![endif]-->
</html>