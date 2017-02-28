<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
	<link rel='stylesheet' type='text/css' href='//fonts.googleapis.com/css?family=Open+Sans:400,300,600&amp;subset=cyrillic,latin'>

	<!-- CSS Global Compulsory -->
	<link rel="stylesheet" href="/plugins/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/style.css">
	<link rel="stylesheet" href="/css/blog.style.css">

	<!-- CSS Header and Footer -->
	<link rel="stylesheet" href="/css/headers/header-v8.css">
	<link rel="stylesheet" href="/css/footers/footer-v8.css">

	<!-- CSS Implementing Plugins -->
	<link rel="stylesheet" href="/plugins/animate.css">
	<link rel="stylesheet" href="/plugins/line-icons/line-icons.css">
	<link rel="stylesheet" href="/plugins/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="/plugins/owl-carousel/owl-carousel/owl.carousel.css">
	<link rel="stylesheet" href="/plugins/sky-forms-pro/skyforms/css/sky-forms.css">
	<link rel="stylesheet" href="/plugins/sky-forms-pro/skyforms/custom/custom-sky-forms.css">

	<!-- CSS Page Style -->
	<link rel="stylesheet" href="/css/pages/blog_masonry_3col.css">

	<!-- CSS Theme -->
	<link rel="stylesheet" href="/css/theme-colors/default.css" id="style_color">
	<link rel="stylesheet" href="/css/theme-skins/dark.css">

	<!-- CSS Customization -->

</head>
<body>
	<div class="wrapper">
	<!--=== Start Header v8 ===-->
		<jsp:include page="/common/header" flush="false">
			<jsp:param name="dummy" value=""/>
		</jsp:include>
		<jsp:include page="/WEB-INF/views/include/menu.jsp" flush="false">
			<jsp:param name="dummy" value=""/>
		</jsp:include>
	<!--=== End Header v8 ===-->

		<!--=== Content Part ===-->
		<div class="container content">
			<div class="row portfolio-item margin-bottom-50">
				<!-- Carousel -->
				<div class="col-md-7">
					<div class="carousel slide carousel-v1" id="myCarousel">
						<div class="carousel-inner">
							<div class="item active">
								<img alt="" src="${reader.filePath}/${reader.fileNm}">
								<div class="carousel-caption">
									<p>&nbsp;</p>
								</div>
							</div>
						</div>

						<div class="carousel-arrow">
							<a data-slide="prev" href="#myCarousel" class="left carousel-control">
								<i class="fa fa-angle-left"></i>
							</a>
							<a data-slide="next" href="#myCarousel" class="right carousel-control">
								<i class="fa fa-angle-right"></i>
							</a>
						</div>
					</div>
				</div>
				<!-- End Carousel -->

				<!-- Content Info -->
				<div class="col-md-5">
					<h2>${reader.readerTitle}</h2>
					
					<ul class="list-unstyled">
						<li><i class="fa fa-user color-green"></i> ${reader.userNickNm}</li>
						<li><i class="fa fa-calendar color-green"></i> ${fn:substring(reader.creDt, 0,10)}</li>
					</ul>
					<a href="#" class="btn-u btn-u-large">적정관람료는?</a>
				</div>
				<!-- End Content Info -->
			</div><!--/row-->

			<div class="tag-box tag-box-v2">
				<p>
					${reader.readerContent}
				</p>
			</div>

			<div class="margin-bottom-5 clearfix"></div>

		<!--=== Blog Posts ===-->
		<div class="bg-color-light">
			<div class="container content-sm">
				<h2 class="margin-bottom-20">Comments</h2>
				<!-- Blog Comments -->
				<div class="row blog-comments margin-bottom-30">
					<div class="col-sm-2 sm-margin-bottom-40">
						<img src="/img/team/sample_cha.jpg" alt="">
					</div>
					<div class="col-sm-9">
						<div class="comments-itself">
							<h4>
								Ja Gimson
								<span>5 hours ago / <a href="#">Reply</a></span>
							</h4>
							<p>24편 섭렵
								첫편 피카디리 극장에서
								홍보 없이 간 영화에 매료
								24편 전부를 영화관에서
								나성 오전9시반 화요일 가장 적은 관객날에
								그렇게 많은 한인들 관객에 놀랐고
								암살 까지 공전의 힛트를 했지만
								그시간대 까지 본 국제 시장 관상 그레비티 등등
								옥의 티 상영시간 길어 화장실이 급했던...
								부담없이 볼수 있는 스케일 큰 화면 압권
								오락물 중의 오락물.어지러운 스토리 어벤져스 도
								그런 많은 관객 볼수 없었는데...
								영원한 대박 영화 007</p>
						</div>
					</div>
				</div>
				<!-- End Blog Comments -->

				<!-- Blog Comments -->
				<div class="row blog-comments blog-comments-reply margin-bottom-30">
					<div class="col-sm-2 sm-margin-bottom-40">
						<img src="/img/team/hdw_sm.JPG" alt="">
					</div>
					<div class="col-sm-9">
						<div class="comments-itself">
							<h4>
								한동원
								<span>6 hours ago / <a href="#">Reply</a></span>
							</h4>
							<p>답글이 보여지는 영역입니다.</p>
						</div>
					</div>
				</div>
				<!-- End Blog Comments -->

				<!-- Blog Comments -->
				<div class="row blog-comments margin-bottom-50">
					<div class="col-sm-2 sm-margin-bottom-40">
						<img src="/img/team/img5-sm.jpg" alt="">
					</div>
					<div class="col-sm-9">
						<div class="comments-itself">
							<h4>
								Marcus Farrell
								<span>7 hours ago / <a href="#">Reply</a></span>
							</h4>
							<p>Nam viverra euismod odio, gravida pellentesque urna varius vitae, gravida pellentesque urna varius vitae. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod..</p>
						</div>
					</div>
				</div>
				<!-- End Blog Comments -->

				<hr>

				<h2 class="margin-bottom-20">Post a Comment</h2>
				<!-- Form -->
				<form action="assets/php/sky-forms-pro/demo-comment-process.php" method="post" id="sky-form3" class="sky-form comment-style">
					<fieldset>
						<div class="row sky-space-30">
							<div class="col-md-5">
								<div>
									<input type="text" name="name" id="name" placeholder="Name" class="form-control">
								</div>
							</div>
							<div class="col-md-6">
								<div>
									<input type="text" name="email" id="email" placeholder="Email" class="form-control">
								</div>
							</div>
						</div>

						<div class="sky-space-30">
							<div style="margin-right:100px">
								<textarea rows="8" name="message" id="message" placeholder="Write comment here ..." class="form-control"></textarea>
							</div>
						</div>

						<p><button type="submit" class="btn-u">Submit</button></p>
					</fieldset>

					<div class="message">
						<i class="rounded-x fa fa-check"></i>
						<p>Your comment was successfully posted!</p>
					</div>
				</form>
				<!-- End Form -->
			</div><!--/end container-->
		</div>
		<!--=== End Blog Posts ===-->

		</div><!--/container-->
		<!--=== End Content Part ===-->

		<!--=== Footer v8 ===-->
		<div class="footer-v8">
			<jsp:include page="/WEB-INF/views/include/footer.jsp" flush="false">
				<jsp:param name="dummy" value=""/>
			</jsp:include>
		</div>
		<!--=== End Footer v8 ===-->
	</div><!--/wrapper-->
	
	<!-- JS Global Compulsory -->
	<script type="text/javascript" src="/plugins/jquery/jquery.min.js"></script>
	<script type="text/javascript" src="/plugins/jquery/jquery-migrate.min.js"></script>
	<script type="text/javascript" src="/plugins/bootstrap/js/bootstrap.min.js"></script>
	<!-- JS Implementing Plugins -->
	<script type="text/javascript" src="/plugins/back-to-top.js"></script>
	<script type="text/javascript" src="/plugins/smoothScroll.js"></script>
	<script type="text/javascript" src="/plugins/masonry/jquery.masonry.min.js"></script>
	<script type="text/javascript" src="/plugins/owl-carousel/owl-carousel/owl.carousel.js"></script>
	<!-- JS Customization -->
	<!-- JS Page Level -->
	<script type="text/javascript" src="/js/app.js"></script>
	<script type="text/javascript" src="/js/blog-masonry.js"></script>
	<script type="text/javascript">
		jQuery(document).ready(function() {
			App.init();
		});
	</script>
	
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
</body>
</html>