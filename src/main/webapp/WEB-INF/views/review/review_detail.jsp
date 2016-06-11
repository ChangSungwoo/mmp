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
			<div class="container">
				<h1 class="pull-left">${movie.movieKorTitle} (${movie.movieEngTitle})</h1>
				<ul class="pull-right breadcrumb">
					<li>개봉일 : ${movie.releaseDt}</li>
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
							<!-- span class="dropcap">압</span>도적인 집요함과 유구한 끈질김으로 해볼 건 웬만하면 다 해본 듯하여 이제는 더 이상 나올 게 없어보였던 나치만행 고발무비에서, 보란 듯 등장한 혁신과 진일보를 앞에 두고 그만 무어라 드릴 말씀을 잊는 와중에도 계속해서 떠오르는 것은, 이만하면 됐으니 이제 과거는 웬만하면 다 털고 가자는 목소리들.
							나치를 잊지 말자는 그 목소리 만큼이나 집요하고 끈질긴 그 목소리들. -->
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
	<script type="text/javascript" src="/js/review/review_detail.js"></script>
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