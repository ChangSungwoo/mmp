<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	<link rel="stylesheet" href="/plugins/cubeportfolio/css/cubeportfolio.min.css">
	<link rel="stylesheet" href="/plugins/cubeportfolio/custom/custom-cubeportfolio.css">
	<link rel="stylesheet" href="/plugins/sky-forms-pro/skyforms/css/sky-forms.css">
	<link rel="stylesheet" href="/plugins/sky-forms-pro/skyforms/custom/custom-sky-forms.css">	

	<!-- CSS Theme -->
	<link rel="stylesheet" href="/css/theme-colors/default.css" id="style_color">
</head>

<body>
	<div class="wrapper">
		<jsp:include page="/WEB-INF/views/admin/include/includeTop.jsp" flush="false">
			<jsp:param name="dummy" value=""/>
		</jsp:include>
		<jsp:include page="/WEB-INF/views/admin/include/includeNavi.jsp" flush="true">
			<jsp:param name="thisName" value='<%=java.net.URLEncoder.encode("영화별 이미지")%>'/>
			<jsp:param name="parentName" value='<%=java.net.URLEncoder.encode("영화 관리")%>'/>
		</jsp:include>
		<!--=== Content ===-->
		<!--=== Search Start===-->
		<div class="container content">
			<form id="movieSearchForm" name="movieSearchForm" class="sky-form">
				<div class="col-md-12">
						<fieldset>
					<div class="row">
						<section class="col col-6">
							<label class="input">
								영화제목 : <input type="text" name="movieTitle" id="movieTitle">
							</label>
						</section>
						<section class="col col-6">
							<label class="input">
								상태 : <input type="text" name="movieTitle" id="movieTitle">
							</label>						
						</section>
					</div>
					</fieldset>
				</div>
				<footer style="text-align:right;padding-right:10px;">
					<button type="submit" id="btnSearch" name="btnSearch" class="btn-u">검색</button>
				</footer>
			</form>
		</div>
		<!--=== Search End ===-->
		<!--=== Cube-Portfdlio ===-->
		<div class="cube-portfolio container margin-bottom-60">
			<div id="grid-container" class="cbp-l-grid-agency">
			<c:choose>
				<c:when test="${fn:length(list) > 0}">
					<c:forEach items="${list}" var="row">
						<div class="cbp-item graphic">
							<div class="cbp-caption margin-bottom-20">
								<div class="cbp-caption-defaultWrap">
									<a href="/admin/movie/manageMovieImage?movieId=${row.movieId}">
										<c:choose>
											<c:when test="${row.fileNm eq null}">
												<img src="/img/common/no_image.jpeg" alt="">
											</c:when>
											<c:otherwise>
												<img src="${row.filePath}/${row.fileNm}" alt="">
											</c:otherwise>
										</c:choose>
									</a>
								</div>
							</div>
							<div class="cbp-title-dark">
								<div class="cbp-l-grid-agency-title"><a href="/admin/movie/manageMovieImage?movieId=${row.movieId}">${row.movieKorTitle}</a></div>
								<div class="cbp-l-grid-agency-desc">등록 이미지수 : ${row.imageCnt}<br/></div>
							</div>
						</div>
						</c:forEach>
					</c:when>
				</c:choose>
			</div><!--/end Grid Container-->
		</div>
		<!--=== End Cube-Portfdlio ===-->
		<!--=== End Content ===-->
		<jsp:include page="/WEB-INF/views/admin/include/includeBottom.jsp" flush="false">
			<jsp:param name="dummy" value=""/>
		</jsp:include>
	</div>

	<!-- JS Global Compulsory -->
	<script type="text/javascript" src="/plugins/jquery/jquery.min.js"></script>
	<script type="text/javascript" src="/plugins/jquery/jquery-migrate.min.js"></script>
	<script type="text/javascript" src="/plugins/bootstrap/js/bootstrap.min.js"></script>
	<!-- JS Implementing Plugins -->
	<script type="text/javascript" src="/plugins/back-to-top.js"></script>
	<script type="text/javascript" src="/plugins/smoothScroll.js"></script>
	<script type="text/javascript" src="/plugins/cubeportfolio/js/jquery.cubeportfolio.min.js"></script>
	<script type="text/javascript" src="/plugins/sky-forms-pro/skyforms/js/jquery.maskedinput.min.js"></script>
	<script type="text/javascript" src="/plugins/sky-forms-pro/skyforms/js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="/plugins/sky-forms-pro/skyforms/js/jquery.validate.min.js"></script>
	<!-- JS Customization -->
	<script type="text/javascript" src="/js/admin/movie/movie_image_list.js"></script>
	<!-- JS Page Level -->
	<script type="text/javascript" src="/js/app.js"></script>
	<script type="text/javascript" src="/plugins/cubeportfolio/js/cube-portfolio-4.js"></script>
<!--[if lt IE 9]>
	<script src="assets/plugins/respond.js"></script>
	<script src="assets/plugins/html5shiv.js"></script>
	<script src="assets/plugins/placeholder-IE-fixes.js"></script>
	<![endif]-->
	
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