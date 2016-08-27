<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
		<jsp:include page="/common/header" flush="false">
			<jsp:param name="dummy" value=""/>
		</jsp:include>
		<jsp:include page="/WEB-INF/views/include/menu.jsp" flush="false">
			<jsp:param name="dummy" value=""/>
		</jsp:include>
	</div>
	<!--=== End Header v8 ===-->

	<!--=== Start Contents ===-->
	<div class="cube-portfolio">
		<!-- div class="content-xs">
			<div id="filters-container" class="cbp-l-filters-text content-xs">
				<div data-filter="*" class="cbp-filter-item-active cbp-filter-item"> All </div> |
				<div data-filter=".identity" class="cbp-filter-item"> 개봉일순 </div> |
				<div data-filter=".web-design" class="cbp-filter-item"> 최고가 </div> |
				<div data-filter=".graphic" class="cbp-filter-item"> 댓글순 </div> |
				<div data-filter=".logos" class="cbp-filter-item"> 좋아요! </div>
			</div>
		</div-->
		<!--/end Filters Container-->
		<div id="grid-container" class="cbp-l-grid-agency">
			<c:choose>
				<c:when test="${fn:length(list) > 0}">
					<c:forEach items="${list}" var="row">
						<div class="cbp-item graphic">
							<div class="cbp-caption" >
								<div class="cbp-caption-defaultWrap">
									<a href="/review/reviewDetail?reviewSeq=${row.reviewSeq}"><img src="${row.imgFilePath}/${row.imgFileNm}" alt=""></a>
								</div>
								<div class="cbp-caption-activeWrap">
									<div class="cbp-l-caption-alignCenter">
										<div class="cbp-l-caption-body">
											<ul class="link-captions">
												<c:choose>
													<c:when test="${row.uploadDay < 8}">
														<li><img src="/img/p01_new_yellow_trans.gif"></li>
													</c:when>
												</c:choose>
											</ul>											
											<div class="cbp-l-grid-agency-title">
												<a href="/review/reviewDetail?reviewSeq=${row.reviewSeq}">${row.mainSubject}</a>
											</div>
											<div class="cbp-l-grid-agency-desc">by 한동원</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:when>
			</c:choose>
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

<script>
window.ga=window.ga||function(){(ga.q=ga.q||[]).push(arguments)};ga.l=+new Date;
ga('create', 'UA-XXXXX-Y', 'auto');
ga('send', 'pageview');
</script>
<script async src='https://www.google-analytics.com/analytics.js'></script>

<!--[if lt IE 9]>
	<script src="plugins/respond.js"></script>
	<script src="plugins/html5shiv.js"></script>
	<script src="plugins/placeholder-IE-fixes.js"></script>
<![endif]-->
</body>
</html>