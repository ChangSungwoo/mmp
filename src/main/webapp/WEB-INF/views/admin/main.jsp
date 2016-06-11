<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->
<head>
	<title>My Movie Price Administrator</title>

	<!-- Meta -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">

	<!-- Web Fonts -->
	<link rel='stylesheet' type='text/css' href='//fonts.googleapis.com/css?family=Open+Sans:400,300,600&amp;subset=cyrillic,latin'>

	<!-- CSS Global Compulsory -->
	<link rel="stylesheet" href="/plugins/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/style.css">

	<!-- CSS Header and Footer -->
	<link rel="stylesheet" href="/css/headers/header-default.css">
	<link rel="stylesheet" href="/css/footers/footer-v1.css">

	<!-- CSS Implementing Plugins -->
	<link rel="stylesheet" href="/plugins/animate.css">
	<link rel="stylesheet" href="/plugins/line-icons/line-icons.css">
	<link rel="stylesheet" href="/plugins/font-awesome/css/font-awesome.min.css">

	<!-- CSS Theme -->
	<link rel="stylesheet" href="/css/theme-colors/default.css" id="style_color">
</head>

<body>

	<div class="wrapper">
		<jsp:include page="/WEB-INF/views/admin/include/includeTop.jsp" flush="false">
			<jsp:param name="dummy" value=""/>
		</jsp:include>
		<jsp:include page="/WEB-INF/views/admin/include/includeNavi.jsp" flush="false">
			<jsp:param name="thisName" value='<%=java.net.URLEncoder.encode("main")%>'/>
			<jsp:param name="parentName" value='<%=java.net.URLEncoder.encode("main")%>'/>
		</jsp:include>
		<!--=== Content ===-->
		<div class="container content height-500">

				<!-- Begin Content -->
				<div class="col-md-9">
					<div class="tag-box tag-box-v3">
						<div class="headline"><h2>DashBoard</h2></div>
						<p>언젠가는 이화면에 적정관람료 <code>대시보드</code>가 만들어질 예정입니다.</p><br><br>

						<!-- Pie Charts v1 -->
						<div class="row pie-progress-charts margin-bottom-60">
							<div class="inner-pchart col-md-4">
								<div class="circle" id="circle-1"></div>
								<h3 class="circle-title">UI Design</h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
							</div>
							<div class="inner-pchart col-md-4">
								<div class="circle" id="circle-2"></div>
								<h3 class="circle-title">Web Development</h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
							</div>
							<div class="inner-pchart col-md-4">
								<div class="circle" id="circle-3"></div>
								<h3 class="circle-title">JavaScript</h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
							</div>
						</div>
						<!-- End Pie Charts v1 -->

						<div class="margin-bottom-60"><hr></div>

						<!-- Pie Charts v2 -->
						<div class="row pie-progress-charts margin-bottom-60">
							<div class="inner-pchart col-md-3">
								<div class="circle" id="circles-1"></div>
								<h3 class="circle-title">Consulting</h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing</p>
							</div>
							<div class="inner-pchart col-md-3">
								<div class="circle" id="circles-2"></div>
								<h3 class="circle-title">Marketing</h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing</p>
							</div>
							<div class="inner-pchart col-md-3">
								<div class="circle" id="circles-3"></div>
								<h3 class="circle-title">Branding</h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing</p>
							</div>
							<div class="inner-pchart col-md-3">
								<div class="circle" id="circles-4"></div>
								<h3 class="circle-title">Copywriting</h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing</p>
							</div>
						</div>
						<!-- End Pie Charts v2 -->

						<!-- Counters -->
						<div class="main-counters margin-bottom-40">
							<div class="headline"><h2>Counters</h2></div>

							<div class="row margin-bottom-40">
								<div class="counters col-md-3 col-sm-3">
									<span class="counter">52147</span>
									<h4>Code Lines</h4>
								</div>
								<div class="counters col-md-3 col-sm-3">
									<span class="counter">24583</span>
									<h4>Projects</h4>
								</div>
								<div class="counters col-md-3 col-sm-3">
									<span class="counter">7349</span>
									<h4>Working Hours</h4>
								</div>
								<div class="counters col-md-3 col-sm-3">
									<span class="counter">87904</span>
									<h4>Job Offers</h4>
								</div>
							</div>

							<div class="margin-bottom-50"><hr></div>

							<div class="row">
								<div class="counters col-md-3 col-sm-3">
									<span class="counter-icon"><i class="fa fa-gift rounded"></i></span>
									<span class="counter">3254</span>
								</div>
								<div class="counters col-md-3 col-sm-3">
									<span class="counter-icon"><i class="fa fa-coffee rounded"></i></span>
									<span class="counter">7068</span>
								</div>
								<div class="counters col-md-3 col-sm-3">
									<span class="counter-icon"><i class="fa fa-thumbs-up rounded"></i></span>
									<span class="counter">5389</span>
								</div>
								<div class="counters col-md-3 col-sm-3">
									<span class="counter-icon"><i class="fa fa-comments rounded"></i></span>
									<span class="counter">9172</span>
								</div>
							</div>
						</div>
						<!-- End Counters -->
					</div>
				</div>
				<!-- End Content -->
			</div>
		</div><!--/container-->
		<!--=== End Content Part ===-->


		</div>
		<!--=== End Content ===-->
		<jsp:include page="/WEB-INF/views/admin/include/includeBottom.jsp" flush="false">
			<jsp:param name="dummy" value=""/>
		</jsp:include>
	</div>

	<!-- JS Global Compulsory -->
	<script type="text/javascript" src="/plugins/jquery/jquery.min.js"></script>
	<script type="text/javascript" src="/plugins/jquery/jquery-migrate.min.js"></script>
	<script type="text/javascript" src="/plugins/bootstrap/js/bootstrap.min.js"></script>
	
	
	<script type="text/javascript" src="/plugins/counter/waypoints.min.js"></script>
	<script type="text/javascript" src="/plugins/counter/jquery.counterup.min.js"></script>
	<script type="text/javascript" src="/plugins/circles-master/circles.js"></script>
	
	
	<!-- JS Implementing Plugins -->
	<script type="text/javascript" src="/plugins/back-to-top.js"></script>
	<script type="text/javascript" src="/plugins/smoothScroll.js"></script>
	<script type="text/javascript" src="/plugins/circles-master.js"></script>
	<!-- JS Customization -->
	<script type="text/javascript" src="/js/admin/main.js"></script>
	<!-- JS Page Level -->
	<script type="text/javascript" src="/js/app.js"></script>
	
	
	<script>
	window.ga=window.ga||function(){(ga.q=ga.q||[]).push(arguments)};ga.l=+new Date;
	ga('create', 'UA-77964332-1', 'auto');
	ga('send', 'pageview');
	
	ga('create', {
	  trackingId: 'UA-77964332-1',
	  cookieDomain: 'auto',
	  name: 'myTracker',
	  userId: 'poppoya'
	});
	
	</script>
	<script async src='https://www.google-analytics.com/analytics.js'></script>


<!--[if lt IE 9]>
	<script src="assets/plugins/respond.js"></script>
	<script src="assets/plugins/html5shiv.js"></script>
	<script src="assets/plugins/placeholder-IE-fixes.js"></script>
	<![endif]-->


</body>
</html>