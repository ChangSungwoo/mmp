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

	<!-- CSS Implementing Plugins -->
	<link rel="stylesheet" href="/plugins/animate.css">
	<link rel="stylesheet" href="/plugins/line-icons/line-icons.css">
	<link rel="stylesheet" href="/plugins/font-awesome/css/font-awesome.min.css">

	<!-- CSS Theme -->
	<link rel="stylesheet" href="/css/theme-colors/default.css" id="style_color">
	<link rel="stylesheet" href="/css/theme-skins/dark.css">
	<link rel="stylesheet" href="/css/pages/blog_masonry_3col.css">

	<!-- CSS Customization -->
	<link rel="stylesheet" href="/css/review/review_list.css">
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
					<li><a href="#profile-1" data-toggle="tab">전체 유저</a></li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane fade in active" id="home-1">
						<p>
						<c:choose>
							<c:when test="${fn:length(list) > 0}">
								<c:forEach items="${list}" var="row">						
									<!-- News v3 -->
									
									<div class="row margin-bottom-5">
										<div class="col-sm-5 sm-margin-bottom-5">
											<img class="img-responsive" src="${row.imgFilePath}/${row.imgFileNm}"  alt="">
										</div>
										<div class="col-sm-7">
											<div class="news-v3">
												<ul class="list-inline posted-info">
													<li>감독 : ${row.directorText}</li>
													<li>배우 : ${fn:substring(row.actorText, 0,22)}...</li>
													<li>개봉일 : <fmt:formatDate value="${row.releaseDt}" pattern="yyyy년 MM월 dd일"/></li>
												</ul>
												<h2><a href="/review/reviewDetail?movieId=${row.movieID}&reviewSeq=${row.reviewSeq}">${row.movieKorTitle} (${row.movieEngTitle})</a></h2>
												<p>${fn:substring(row.reviewText, 0,200)}...</p>
												<ul class="post-shares">
													<li class="movie-prices text-highlights text-highlights-purple rounded tooltips"><fmt:formatNumber value="${row.stdPrice+row.positivePrice-row.negativePrice}" pattern="#,###"/>원</li>
													<span aria-hidden="true" class="icon-arrow-up"></span>&nbsp;<li class="movie-small-prices price-red">+<fmt:formatNumber value="${row.positivePrice}" pattern="#,###"/>원</li>
													<span aria-hidden="true" class="icon-arrow-down"></span>&nbsp;<li class="movie-small-prices price-blue">-<fmt:formatNumber value="${row.negativePrice}" pattern="#,###"/>원</li>
												</ul>
											</div>
										</div>
									</div><!--/end row-->
									<!-- End News v3 -->
									<div class="clearfix margin-bottom-5"><hr></div>
									
								</c:forEach>
							</c:when>
						</c:choose>
						</p>					
					</div>
					
					<div class="tab-pane fade in" id="profile-1">
						<div class="row margin-bottom-50">
							<p>
								<c:choose>
									<c:when test="${fn:length(uList) > 0}">
										<c:forEach items="${uList}" var="uRow" varStatus = "uStatus">
											<div class="col-sm-3 sm-margin-bottom-50">
												<img class="img-responsive" src="${uRow.filePath}/${uRow.fileNm}" alt="">
											</div>
											<div class="col-sm-3">
												<div class="news-v3">
													<ul class="list-inline posted-info">
														<li>개봉일 : <fmt:formatDate value="${uRow.releaseDt}" pattern="yyyy년 MM월 dd일"/></li>
													</ul>
													<h3><a href="/review/reviewListByUser?movieId=${uRow.movieId}">${uRow.movieKorTitle}</a></h3>
													유저평 : 총 <span style="font-size:22px;">${uRow.reviewCount}</span>명의 유저
													<ul class="post-shares">
														<li class="movie-prices text-highlights text-highlights-purple rounded tooltips">${uRow.reviewAvgPrice}원</li>
													</ul>
												</div>
											</div>
											<c:if test="${(uStatus.index mod 2) eq 1}">
												<div class="clearfix margin-bottom-50"><hr></div>
											</c:if>
										</c:forEach>
									</c:when>
								</c:choose>
							</p>
						</div>
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
<script type="text/javascript" src="/plugins/masonry/jquery.masonry.min.js"></script>

<!-- JS Page Level -->
<script src="/js/app.js"></script>

<!-- JS Customization -->
<script src="/js/review/review_list_editor.js"></script>

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