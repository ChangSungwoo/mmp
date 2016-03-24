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
	<link rel="stylesheet" href="/css/movie/movie_detail.css">
	
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
		<!--=== Breadcrumbs ===-->
		<div class="breadcrumbs breadcrumbs-light">
			<div class="container">
				<h1 class="pull-left">사울의 아들 (Saul fia, Son of Saul)</h1>
				<ul class="pull-right breadcrumb">
					<li>개봉일 : 2016-02-25</li>
				</ul>
			</div>
		</div><!--/breadcrumbs-->
		<!--=== End Breadcrumbs ===-->		
		<!--=== Container Part ===-->
		<div class="container">
			<div class="content">
				<!-- Magazine Slider -->
				<div class="carousel slide carousel-v2 margin-bottom-10" id="portfolio-carousel">
					<ol class="carousel-indicators">
						<li class="active rounded-x" data-target="#portfolio-carousel" data-slide-to="0"></li>
						<li class="rounded-x" data-target="#portfolio-carousel" data-slide-to="1"></li>
						<li class="rounded-x" data-target="#portfolio-carousel" data-slide-to="2"></li>
					</ol>

					<div class="carousel-inner">
						<div class="item active">
							<img class="full-width img-responsive" src="/img/movie/movie002.jpg" alt="">
						</div>
						<div class="item">
							<img class="full-width img-responsive" src="/img/movie/movie002_002.jpg" alt="">
						</div>
						<div class="item">
							<img class="full-width img-responsive" src="/img/movie/movie002_003.jpg" alt="">
						</div>
					</div>

					<a class="left carousel-control rounded-x" href="#portfolio-carousel" role="button" data-slide="prev">
						<i class="fa fa-angle-left arrow-prev"></i>
					</a>
					<a class="right carousel-control rounded-x" href="#portfolio-carousel" role="button" data-slide="next">
						<i class="fa fa-angle-right arrow-next"></i>
					</a>
				</div>
				<!-- End Magazine Slider -->

				<div class="row margin-bottom-60">
					<div class="col-sm-8">
						<div class="headline"><h2>영화 감상평</h2></div>
						<p>
							<span class="dropcap">압</span>도적인 집요함과 유구한 끈질김으로 해볼 건 웬만하면 다 해본 듯하여 이제는 더 이상 나올 게 없어보였던 나치만행 고발무비에서, 보란 듯 등장한 혁신과 진일보를 앞에 두고 그만 무어라 드릴 말씀을 잊는 와중에도 계속해서 떠오르는 것은, 이만하면 됐으니 이제 과거는 웬만하면 다 털고 가자는 목소리들.
							나치를 잊지 말자는 그 목소리 만큼이나 집요하고 끈질긴 그 목소리들.
						</p>
					</div>
					<div class="col-sm-4">
						<div class="headline"><h2>영화 개요</h2></div>
						<ul class="list-unstyled project-details">
							<li><strong>감독 :</strong>라즐로 네메스</li>
							<li><strong>개봉일 :</strong> 2016-02-25</li>
							<li><strong>출연 :</strong> 게자 뢰리히 외...</li>
						</ul>
					</div>
				</div>
				<div class="row margin-bottom-20">
					<div class="col-sm-12">
						<div class="headline"><h2>적정 관람료</h2></div>
					</div>
					<div class="col-sm-6">
						<!--Basic Table Option (Spacing)-->
						<div class="panel panel-red margin-bottom-30">
							<div class="panel-heading">
								<h3 class="panel-title"><i class="fa fa-arrow-circle-up"></i> 인상</h3>
							</div>
							<div class="panel-body">
								<table class="table">
									<tbody>
										<tr>
											<td colspan="3">나치 수용소 1인칭 체험효과를 극대화시키기 위한 설정들, 즉 </td>
										</tr>
										<tr>
											<td>1</td>
											<td>4:3 화면비의 채택</td>
											<td width="80" align="right" class="price-red">+150원</td>
										</tr>
										<tr>
											<td>2</td>
											<td>철저한 주인공 밀착 근접촬영</td>
											<td align="right" class="price-red">+200원</td>
										</tr>
										<tr>
											<td>3</td>
											<td>그로 인해 더욱 좁아지는 시야</td>
											<td align="right" class="price-red">+150원</td>
										</tr>
										<tr>
											<td>4</td>
											<td>얕은 심도의 촬영으로 인해 마치 고도근시처럼, 주인공에서 조금만 떨어져도 모두 흐릿해져버리는 전경</td>
											<td align="right" class="price-red">+250원</td>
										</tr>
										<tr>
											<td>5</td>
											<td>이와 정반대로, 가스실과 소각로 등 현장의 모든 소리를 가장 생생한 느낌으로 담아낸 현미경적 음향</td>
											<td align="right" class="price-red">+250원</td>
										</tr>
										<tr>
											<td>6</td>
											<td> ③+④+⑤로 인한 시청각적 상상력의 극대화</td>
											<td align="right" class="price-red">+300원</td>
										</tr>
										<tr>
											<td>7</td>
											<td>①+②+⑥로 인한 폐쇄공포</td>
											<td align="right" class="price-red">+300원</td>
										</tr>
										<tr>
											<td>8</td>
											<td>컷을 최대한 배제한 롱테이크 중심의 구성</td>
											<td align="right" class="price-red">+150원</td>
										</tr>
										<tr>
											<td>9</td>
											<td>음악 사용 배제</td>
											<td align="right" class="price-red">+150원</td>
										</tr>
										<tr>
											<td>10</td>
											<td>이 모두를 결정하고 실행해 낸 과감함</td>
											<td align="right" class="price-red">+300원</td>
										</tr>
										<tr>
											<td>11</td>
											<td>그것을 현실로 만들어낸 주연배우(게자 뢰리히)의 연기</td>
											<td align="right" class="price-red">+150원</td>
										</tr>
										<tr>
											<td>12</td>
											<td>그리고 엑스트라까지 포함하는 모든 배우들의 연기</td>
											<td align="right" class="price-red">+150원</td>
										</tr>
										<tr>
											<td>13</td>
											<td>더하여, 섬뜩하도록 리얼한 세트</td>
											<td align="right" class="price-red">+100원</td>
										</tr>
										<tr>
											<td>14</td>
											<td>수용소 내 시신처리 전담반 ‘존더코만도’라는 소재의 극적 긴장감 및 양면성</td>
											<td align="right" class="price-red">+150원</td>
										</tr>
										<tr>
											<td>15</td>
											<td>매우 제한된 공간과 자유도에도 불구하고, 계속해서 이어지는 새로운 전개</td>
											<td align="right" class="price-red">+200원</td>
										</tr>
										<tr>
											<td>16</td>
											<td>한마디로, 이제껏 총격액션에서나 쓰여 왔던 1인칭 RPG 기법을, 예술의 경지로 단숨에 격상시킨 놀라운 시도</td>
											<td align="right" class="price-red">+250원</td>
										</tr>
										<tr>
											<th colspan="3" class="price-red" style="text-align:right;">Total : + 3,100원</th>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<!--End Basic Table-->
					</div>
					<div class="col-sm-6">
						<!--Basic Table Option (Spacing)-->
						<div class="panel panel-green margin-bottom-30">
							<div class="panel-heading">
								<h3 class="panel-title"><i class="fa fa-arrow-circle-down"></i> 인하</h3>
							</div>
							<div class="panel-body">
								<table class="table">
									<tbody>
										<tr>
											<td colspan="3">[아래 네 항목들은 이 영화의 의도이자 목표임을 감안하고]</td>
										</tr>
										<tr>
											<td>1</td>
											<td>극도의 폐쇄공포 및 숨막힘</td>
											<td width="80" align="right" class="price-blue">-1,500원</td>
										</tr>
										<tr>
											<td>2</td>
											<td>암울함 및 처참함</td>
											<td align="right" class="price-blue">-1,500원</td>
										</tr>
										<tr>
											<td>3</td>
											<td>그리고 거의 아무런 희망도 허용하지 않는 냉정함</td>
											<td align="right" class="price-blue">-1,000원</td>
										</tr>
										<tr>
											<td>4</td>
											<td>요컨대, 궁극의 나치 수용소 체험에 대한 마음의 준비가 되어 있지 않은 관객에게는 일종의 정서적 고문일 수도 있음</td>
											<td align="right" class="price-blue">-500원</td>
										</tr>
										<tr>
											<td>5</td>
											<td>이 영화의 또 하나의 핵심이자, 평가가 갈릴 가장 큰 분수령일 ‘아들의 장례식’이라는 설정은, 그 의도와 의미에 십분 공감한다 하더라도, 상당히 무리하고 인위적으로 느껴짐</td>
											<td align="right" class="price-blue">-300원</td>
										</tr>
										<tr>
											<td>6</td>
											<td>더구나 그 설정에 더해진 모호성을 감안한다면 더욱</td>
											<td align="right" class="price-blue">-150원</td>
										</tr>
										<tr>
											<th colspan="3" class="price-blue" style="text-align:right;">Total : -450원 또는 -4,950원</th>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<!--End Basic Table-->
					</div>
					<div class="col-sm-12">
						<!--Basic Table Option (Spacing)-->
						<div class="panel panel-grey margin-bottom-10">
							<div class="panel-heading">
								<h3 class="price-total"><i class="fa fa-krw"></i>총 적정관람료 : 9,000원 + 3,100원 - 450원 (또는 4,950원) = 11,650원 (또는 7,150원)</h3>
							</div>
						</div>
						<!--End Basic Table-->
					</div>
				</div>

				<div class="cube-portfolio height-300">
					<div class="col-sm-12">
						<div class="headline"><h2>최근 등록글</h2></div>
					</div>
					<div id="grid-container" class="cbp-l-grid-agency">
						<div class="cbp-item">
							<div class="cbp-caption margin-bottom-5">
								<div class="cbp-caption-defaultWrap">
									<img src="/img/movie/movie003.jpg" alt="">
								</div>
								<div class="cbp-caption-activeWrap">
									<div class="cbp-l-caption-alignCenter">
										<div class="cbp-l-caption-body">
											<ul class="link-captions no-bottom-space">
												<li><a href="portfolio_single_item.html"><i class="rounded-x fa fa-link"></i></a></li>
												<li><a href="/img/movie/movie003.jpg" class="cbp-lightbox" data-title="Design Object"><i class="rounded-x fa fa-search"></i></a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
							<div class="cbp-title-dark">
								<div class="cbp-l-grid-agency-title">주토피아</div>
								<div class="cbp-l-grid-agency-desc">Zootopia</div>
							</div>
						</div>
						<div class="cbp-item">
							<div class="cbp-caption margin-bottom-5">
								<div class="cbp-caption-defaultWrap">
									<img src="/img/movie/movie004.jpg" alt="">
								</div>
								<div class="cbp-caption-activeWrap">
									<div class="cbp-l-caption-alignCenter">
										<div class="cbp-l-caption-body">
											<ul class="link-captions no-bottom-space">
												<li><a href="portfolio_single_item.html"><i class="rounded-x fa fa-link"></i></a></li>
												<li><a href="/img/movie/movie004.jpg" class="cbp-lightbox" data-title="Design Object"><i class="rounded-x fa fa-search"></i></a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
							<div class="cbp-title-dark">
								<div class="cbp-l-grid-agency-title">스포트 라이트</div>
								<div class="cbp-l-grid-agency-desc">Spotlight</div>
							</div>
						</div>
						<div class="cbp-item">
							<div class="cbp-caption margin-bottom-5">
								<div class="cbp-caption-defaultWrap">
									<img src="/img/movie/movie005.jpg" alt="">
								</div>
								<div class="cbp-caption-activeWrap">
									<div class="cbp-l-caption-alignCenter">
										<div class="cbp-l-caption-body">
											<ul class="link-captions no-bottom-space">
												<li><a href="portfolio_single_item.html"><i class="rounded-x fa fa-link"></i></a></li>
												<li><a href="/img/movie/movie005.jpg" class="cbp-lightbox" data-title="Design Object"><i class="rounded-x fa fa-search"></i></a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
							<div class="cbp-title-dark">
								<div class="cbp-l-grid-agency-title">남과 여</div>
								<div class="cbp-l-grid-agency-desc">&nbsp;</div>
							</div>
						</div>
						<div class="cbp-item">
							<div class="cbp-caption margin-bottom-5">
								<div class="cbp-caption-defaultWrap">
									<img src="/img/movie/movie006.jpg" alt="">
								</div>
								<div class="cbp-caption-activeWrap">
									<div class="cbp-l-caption-alignCenter">
										<div class="cbp-l-caption-body">
											<ul class="link-captions no-bottom-space">
												<li><a href="portfolio_single_item.html"><i class="rounded-x fa fa-link"></i></a></li>
												<li><a href="/img/movie/movie006.jpg" class="cbp-lightbox" data-title="Design Object"><i class="rounded-x fa fa-search"></i></a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
							<div class="cbp-title-dark">
								<div class="cbp-l-grid-agency-title">동주</div>
								<div class="cbp-l-grid-agency-desc">&nbsp;</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--=== End Container Part ===-->

	<!--=== Footer v8 ===-->
	<div class="footer-v8">
		<jsp:include page="/WEB-INF/views/include/footer.jsp" flush="false">
			<jsp:param name="dummy" value=""/>
		</jsp:include>
	</div>
	<!--=== End Footer v8 ===-->

	<!-- JS Global Compulsory -->
	<script type="text/javascript" src="/plugins/jquery/jquery.min.js"></script>
	<script type="text/javascript" src="/plugins/jquery/jquery-migrate.min.js"></script>
	<script type="text/javascript" src="/plugins/bootstrap/js/bootstrap.min.js"></script>
	<!-- JS Implementing Plugins -->
	<script type="text/javascript" src="/plugins/back-to-top.js"></script>
	<script type="text/javascript" src="/plugins/smoothScroll.js"></script>
	<script type="text/javascript" src="/plugins/cubeportfolio/js/jquery.cubeportfolio.min.js"></script>
	<!-- JS Customization -->
	<script type="text/javascript" src="/js/movie/movie_detail.js"></script>
	<!-- JS Page Level -->
	<script type="text/javascript" src="/js/app.js"></script>
	<script type="text/javascript" src="/plugins/cubeportfolio/js/cube-portfolio-4.js"></script>


<!--[if lt IE 9]>
	<script src="plugins/respond.js"></script>
	<script src="plugins/html5shiv.js"></script>
	<script src="plugins/placeholder-IE-fixes.js"></script>
<![endif]-->
</body>
</html>