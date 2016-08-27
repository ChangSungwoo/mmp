<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->
<head>
	<title>적정관람료-${movie.movieKorTitle}</title>
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
	<link rel="stylesheet" href="/css/review/review_detail.css">
	
</head>
<body class="header-fixed header-fixed-space-v2">
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
			<div class="container" height="100">
				<h1 class="pull-right">${movie.movieKorTitle}<br />${movie.movieEngTitle}</h1><br /><p /><br /><p /><br /><br />
				<h6 class="pull-right">개봉일 : ${movie.releaseDt}</h6>
			</div>
		</div>
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
						<c:choose>
							<c:when test="${fn:length(list) > 0}">
								<c:forEach items="${list}" var="row" varStatus="status">
									<div class="item <c:if test="${status.count eq 1 }">active</c:if> ">
										<img class="full-width img-responsive" src="${row.filePath}/${row.fileNm}" alt="">
									</div>
								</c:forEach>
							</c:when>
						</c:choose>
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
							${review.reviewText}
						</p>
					</div>
					<div class="col-sm-4">
						<div class="headline"><h2>영화 개요</h2></div>
						<ul class="list-unstyled project-details">
							<li><strong>감독 :</strong>${movie.directorText}</li>
							<li><strong>출연 :</strong>${fn:substring(movie.actorText, 0,12)}... </li>
							<li><strong>개봉 :</strong>${movie.releaseDt}</li>
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
										<c:choose>
											<c:when test="${fn:length(pList) > 0}">
												<c:forEach items="${pList}" var="rowP">
										<tr>
											<td>${rowP.priceComment}</td>
											<td width="80" align="right" class="price-red">
												<c:choose>
													<c:when test="${rowP.price == 0}">
														&nbsp;
													</c:when>
													<c:otherwise>
														+${rowP.price}원
													</c:otherwise>
												</c:choose>
												
											</td>
											<fmt:formatNumber var="totalPrice" value="${totalPrice+rowP.price}" pattern="####"/>
										</tr>
												</c:forEach>
											</c:when>
										</c:choose>
										<tr>
											<th colspan="3" class="price-red" style="text-align:right;">Total : + <fmt:formatNumber value="${totalPrice+rowP.price}"/>원</th>
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
										<c:choose>
											<c:when test="${fn:length(nList) > 0}">
												<c:forEach items="${nList}" var="rowN">
										<tr>
											<td>${rowN.priceComment}</td>
											<td width="80" align="right" class="price-blue">
								                <c:choose>
												<c:when test="${rowN.price == 0}">
													&nbsp;
												</c:when>
												<c:otherwise>
													-${rowN.price}원
												</c:otherwise>
												</c:choose>
											</td>
											<fmt:formatNumber var="totalPriceMinus" value="${totalPriceMinus+rowN.price}" pattern="####"/>
										</tr>
												</c:forEach>
											</c:when>
										</c:choose>
										<tr>
											<th colspan="3" class="price-blue" style="text-align:right;">Total : - <fmt:formatNumber value="${totalPriceMinus+rowN.price}"/>원</th>
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
								<h3 class="price-total"><i class="fa fa-krw"></i>총 적정관람료 : <fmt:formatNumber value="${movie.stdPrice}" pattern="#,###" />원 + <fmt:formatNumber value="${totalPrice}" pattern="#,###" />원 - <fmt:formatNumber value="${totalPriceMinus}" pattern="#,###" />원 = <fmt:formatNumber value="${movie.stdPrice+totalPrice-totalPriceMinus}" pattern="#,###" />원 </h3>
							</div>
						</div>
						<!--End Basic Table-->
					</div>
					<div class="col-sm-12" align="center">
						<c:set var="userid" value="${sessionScope.member.userNo}" />
						<c:choose>
							<c:when test="${userid eq null}">
								<a href="javascript:goLoginPage();"><img src="/img/p07_agree.jpg"></a>&nbsp;&nbsp;&nbsp;
								<a href="javascript:goLoginPage();"><img src="/img/p07_disagree.jpg"></a>
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${sessionScope.member.userNo eq review.creId}">
										<button id="btnModify" name="btnModify" class="btn-u btn-u-blue" type="button"><i class="fa fa-pencil-square-o"></i> 수 정</button>
									</c:when>
									<c:otherwise>
										<a href="javascript:reviewRecommend('1');"><img src="/img/p07_agree.jpg"></a>&nbsp;&nbsp;&nbsp;
										<a href="javascript:reviewRecommend('2');"><img src="/img/p07_disagree.jpg"></a>										
									</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>

						
					</div>
					<form name="recommFrm" id ="recommFrm">
						<input type="hidden" id="reviewSeq" name="reviewSeq" value="${review.reviewSeq}">
						<input type="hidden" id="movieId" name="movieId" value="${movie.movieId}">
						<input type="hidden" id="userNo" name="userNo" value="${review.creId}">
						<input type="hidden" id=recommDiv name="recommDiv">
					</form>
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
	<script type="text/javascript" src="/js/review/review_detail.js"></script>
	<!-- JS Page Level -->
	<script type="text/javascript" src="/js/app.js"></script>
	<script type="text/javascript" src="/plugins/cubeportfolio/js/cube-portfolio-4.js"></script>
	
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
</body>
</html>