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
				<li><%=session.getAttribute("member.userNick")%></li>
			</ul>
		</div>
	</div>
	<!--/breadcrumbs-->

		<!--=== Content Part ===-->
		<div class="container content profile">
			<div class="row">
				<div class="col-md-12">
					<div class="profile-body">
						<!--Service Block v3-->
						<div class="row margin-bottom-10">
							<div class="col-sm-6 sm-margin-bottom-20">
								<div class="service-block-v3 service-block-u">
									<i class="icon-users"></i>
									<span class="service-heading">&nbsp;</span>
									<span class="counter">나의 취향 친구들</span>

									<div class="clearfix margin-bottom-10"></div>

									<div class="row margin-bottom-20">
										<div class="col-xs-6 service-in">
											<small>내가 공감한 User</small>
											<c:choose>
												<c:when test="${fn:length(mfList) > 0}">
													<c:forEach items="${mfList}" var="mfRow">
														<h4 class="counter">${mfRow.userNickName}</h4>
													</c:forEach>
												</c:when>
											</c:choose>
										</div>
										<div class="col-xs-6 text-right service-in">
											<small>내게 공감한 User</small>
											<c:choose>
												<c:when test="${fn:length(fmList) > 0}">
													<c:forEach items="${fmList}" var="fmRow">
														<h4 class="counter">${fmRow.userNickName}</h4>
													</c:forEach>
												</c:when>
											</c:choose>
										</div>
									</div>
								</div>
							</div>

							<div class="col-sm-6">
								<div class="service-block-v3 service-block-blue">
									<i class="icon-screen-desktop"></i>
									<span class="service-heading">&nbsp;</span>
									<span class="counter">나의 적정관람료</span>

									<div class="clearfix margin-bottom-30"></div>

									<div class="row margin-bottom-20">
										<div class="col-xs-6 service-in">
											&nbsp;
										</div>
										<div class="col-xs-6 text-right service-in">
											<span class="counter">${reviewCount}편 작성</span>
										</div>
									</div>
								</div>
							</div>
						</div><!--/end row-->
						<!--End Service Block v3-->
						</div>
					</div>
			</div>
			<div class="profile-body margin-bottom-20">
						<div class="tab-v1">
							<ul class="nav nav-justified nav-tabs">
								<li class="active"><a data-toggle="tab" href="#myArticle">내가 남긴 글들</a></li>
								<li><a data-toggle="tab" href="#myFavorite">내가 공감한 유저</a></li>
								<li><a data-toggle="tab" href="#favoriteMe">내게 공감한 유저</a></li>
							</ul>
							<div class="tab-content">
								<div id="myArticle" class="profile-edit tab-pane fade in active">
									<ul class="timeline-v2">
										<c:choose>
											<c:when test="${fn:length(list) > 0}">
												<c:forEach items="${list}" var="row" varStatus = "status">
													<li class="equal-height-columns">
														<div class="cbp_tmtime equal-height-column"><span>${fn:substring(row.creDt,0,10) }</span> <span class="font-red">${row.totalPrice}원</span></div>
														<i class="cbp_tmicon rounded-x hidden-xs"></i>
														<div class="cbp_tmlabel equal-height-column">
															<span class="label label-danger">적정관람료</span>&nbsp;<h2>${row.movieKorTitle}</h2>
															<div class="row">
																<div class="col-md-4">
																	<img class="img-responsive" src="${row.filePath}/${row.fileNm}" alt="">
																	<div class="md-margin-bottom-20"></div>
																</div>
																<div class="col-md-8">
																	<p>${row.reviewText}</p>
																</div>
															</div>
															<div class="row">
																<div class="col-md-10">&nbsp;</div>
																<div class="col-md-2">
																	<button id="btnDelete" name="btnDelete" class="btn-u btn-u-xs btn-u-default" type="button">삭제</button>
																	<button id="btnModify" name="btnModify" class="btn-u btn-u-xs btn-u-green btnUpdate" type="button">수정</button>
																</div>
															</div>
														</div>
													</li>
												</c:forEach>
											</c:when>
										</c:choose>
									</ul>
								</div>

								<div id="myFavorite" class="profile-edit tab-pane fade">
									<h2 class="heading-md">준비중입니다.</h2>
									<!--h2 class="heading-md">Manage your Security Settings</h2>
									<p>Change your password.</p>
									<br>
									<form class="sky-form" id="sky-form4" action="#">
										<dl class="dl-horizontal">
											<dt>Username</dt>
											<dd>
												<section>
													<label class="input">
														<i class="icon-append fa fa-user"></i>
														<input type="text" placeholder="Username" name="username">
														<b class="tooltip tooltip-bottom-right">Needed to enter the website</b>
													</label>
												</section>
											</dd>
											<dt>Email address</dt>
											<dd>
												<section>
													<label class="input">
														<i class="icon-append fa fa-envelope"></i>
														<input type="email" placeholder="Email address" name="email">
														<b class="tooltip tooltip-bottom-right">Needed to verify your account</b>
													</label>
												</section>
											</dd>
											<dt>Enter your password</dt>
											<dd>
												<section>
													<label class="input">
														<i class="icon-append fa fa-lock"></i>
														<input type="password" id="password" name="password" placeholder="Password">
														<b class="tooltip tooltip-bottom-right">Don't forget your password</b>
													</label>
												</section>
											</dd>
											<dt>Confirm Password</dt>
											<dd>
												<section>
													<label class="input">
														<i class="icon-append fa fa-lock"></i>
														<input type="password" name="passwordConfirm" placeholder="Confirm password">
														<b class="tooltip tooltip-bottom-right">Don't forget your password</b>
													</label>
												</section>
											</dd>
										</dl>
										<label class="toggle toggle-change"><input type="checkbox" checked="" name="checkbox-toggle-1"><i class="no-rounded"></i>Remember password</label>
										<br>
										<section>
											<label class="checkbox"><input type="checkbox" id="terms" name="terms"><i></i><a href="#">I agree with the Terms and Conditions</a></label>
										</section>
										<button type="button" class="btn-u btn-u-default">Cancel</button>
										<button class="btn-u" type="submit">Save Changes</button>
									</form -->
								</div>

								<div id="favoriteMe" class="profile-edit tab-pane fade">
									<h2 class="heading-md">준비중입니다.</h2>
									<!-- h2 class="heading-md">Manage your Payment Settings</h2>
									<p>Below are the payment options for your account.</p>
									<br>
									<form class="sky-form" id="sky-form" action="#">
										<section>
											<div class="inline-group">
												<label class="radio"><input type="radio" checked="" name="radio-inline"><i class="rounded-x"></i>Visa</label>
												<label class="radio"><input type="radio" name="radio-inline"><i class="rounded-x"></i>MasterCard</label>
												<label class="radio"><input type="radio" name="radio-inline"><i class="rounded-x"></i>PayPal</label>
											</div>
										</section>

										<section>
											<label class="input">
												<input type="text" name="name" placeholder="Name on card">
											</label>
										</section>

										<div class="row">
											<section class="col col-10">
												<label class="input">
													<input type="text" name="card" id="card" placeholder="Card number">
												</label>
											</section>
											<section class="col col-2">
												<label class="input">
													<input type="text" name="cvv" id="cvv" placeholder="CVV2">
												</label>
											</section>
										</div>

										<div class="row">
											<label class="label col col-4">Expiration date</label>
											<section class="col col-5">
												<label class="select">
													<select name="month">
														<option disabled="" selected="" value="0">Month</option>
														<option value="1">January</option>
														<option value="1">February</option>
														<option value="3">March</option>
														<option value="4">April</option>
														<option value="5">May</option>
														<option value="6">June</option>
														<option value="7">July</option>
														<option value="8">August</option>
														<option value="9">September</option>
														<option value="10">October</option>
														<option value="11">November</option>
														<option value="12">December</option>
													</select>
													<i></i>
												</label>
											</section>
											<section class="col col-3">
												<label class="input">
													<input type="text" placeholder="Year" id="year" name="year">
												</label>
											</section>
										</div>
										<button type="button" class="btn-u btn-u-default">Cancel</button>
										<button class="btn-u" type="submit">Save Changes</button>
									</form-->
								</div>
							</div>
						</div>
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
	<script src="plugins/respond.js"></script>
	<script src="plugins/html5shiv.js"></script>
	<script src="plugins/placeholder-IE-fixes.js"></script>
<![endif]-->
</html>