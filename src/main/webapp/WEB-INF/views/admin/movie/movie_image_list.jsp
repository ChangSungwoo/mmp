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

	<!-- CSS Theme -->
	<link rel="stylesheet" href="/css/theme-colors/default.css" id="style_color">
</head>

<body>

	<div class="wrapper">
		<jsp:include page="/WEB-INF/views/admin/include/includeTop.jsp" flush="false">
			<jsp:param name="dummy" value=""/>
		</jsp:include>
		<jsp:include page="/WEB-INF/views/admin/include/includeNavi.jsp" flush="true">
			<jsp:param name="thisName" value='<%=java.net.URLEncoder.encode("영화 이미지 목록조회")%>'/>
			<jsp:param name="parentName" value='<%=java.net.URLEncoder.encode("영화 관리")%>'/>
		</jsp:include>
		<!--=== Content ===-->
		<!--=== Cube-Portfdlio ===-->
		<div class="cube-portfolio container margin-bottom-60">
			<div class="content-xs">
				<div id="filters-container" class="cbp-l-filters-text content-xs">
					<div data-filter="*" class="cbp-filter-item-active cbp-filter-item"> All </div> |
					<div data-filter=".identity" class="cbp-filter-item"> Identity </div> |
					<div data-filter=".web-design" class="cbp-filter-item"> Web Design </div> |
					<div data-filter=".graphic" class="cbp-filter-item"> Graphic </div> |
					<div data-filter=".logos" class="cbp-filter-item"> Logo </div>
				</div><!--/end Filters Container-->
			</div>
			<div id="grid-container" class="cbp-l-grid-agency">
			<c:choose>
				<c:when test="${fn:length(list) > 0}">
					<c:forEach items="${list}" var="row">
						<div class="cbp-item graphic">
							<div class="cbp-caption margin-bottom-20">
								<div class="cbp-caption-defaultWrap">
									<c:choose>
										<c:when test="${row.FileNm eq null}">
											<img src="/img/common/no_image.jpeg" alt="">
										</c:when>
										<c:otherwise>
											<img src="/uploadImg/100/${row.FileNm}" alt="">
										</c:otherwise>
									</c:choose>
								</div>
								<div class="cbp-caption-activeWrap">
									<div class="cbp-l-caption-alignCenter">
										<div class="cbp-l-caption-body">
											<ul class="link-captions no-bottom-space">
												<li><a href="portfolio_single_item.html"><i class="rounded-x fa fa-link"></i></a></li>
												<li>
													<a href="/uploadImg/100/${row.FileNm}" class="cbp-lightbox" data-title="Design Object">
													<i class="rounded-x fa fa-search"></i></a>
												</li>
											</ul>
										</div>
									</div>
								</div>
							</div>
							<div class="cbp-title-dark">
								<div class="cbp-l-grid-agency-title">${row.movieKorTitle}[1]</div>
								<div class="cbp-l-grid-agency-desc">이미지 추가/수정<br/></div>
							</div>
						</div>
						</c:forEach>
					</c:when>
				</c:choose>
				<!-- div class="cbp-item web-design logos">
					<div class="cbp-caption margin-bottom-20">
						<div class="cbp-caption-defaultWrap">
							<img src="/img/movie/movie002.jpg" alt="">
						</div>
						<div class="cbp-caption-activeWrap">
							<div class="cbp-l-caption-alignCenter">
								<div class="cbp-l-caption-body">
									<ul class="link-captions no-bottom-space">
										<li><a href="portfolio_single_item.html"><i class="rounded-x fa fa-link"></i></a></li>
										<li><a href="/img/movie/movie002.jpg" class="cbp-lightbox" data-title="Design Object"><i class="rounded-x fa fa-search"></i></a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="cbp-title-dark">
						<div class="cbp-l-grid-agency-title">사울의 아들[3]</div>
						<div class="cbp-l-grid-agency-desc">이미지 추가/수정</div>
					</div>
				</div>
				<div class="cbp-item graphic logos">
					<div class="cbp-caption margin-bottom-20">
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
						<div class="cbp-l-grid-agency-title">주토피아[1]</div>
						<div class="cbp-l-grid-agency-desc">이미지 추가/수정</div>
					</div>
				</div>
				<div class="cbp-item web-design graphic">
					<div class="cbp-caption margin-bottom-20">
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
						<div class="cbp-l-grid-agency-title">스포트라이트[1]</div>
						<div class="cbp-l-grid-agency-desc">이미지 추가/수정</div>
					</div>
				</div>
				<div class="cbp-item identity web-design">
					<div class="cbp-caption margin-bottom-20">
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
						<div class="cbp-l-grid-agency-desc">이미지 추가/수정</div>
					</div>
				</div>
				<div class="cbp-item identity web-design">
					<div class="cbp-caption margin-bottom-20">
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
						<div class="cbp-l-grid-agency-title">동주[1]</div>
						<div class="cbp-l-grid-agency-desc">이미지 추가/수정</div>
					</div>
				</div>
				<div class="cbp-item web-design identity">
					<div class="cbp-caption margin-bottom-20">
						<div class="cbp-caption-defaultWrap">
							<img src="/img/movie/movie_007.jpg" alt="">
						</div>
						<div class="cbp-caption-activeWrap">
							<div class="cbp-l-caption-alignCenter">
								<div class="cbp-l-caption-body">
									<ul class="link-captions no-bottom-space">
										<li><a href="portfolio_single_item.html"><i class="rounded-x fa fa-link"></i></a></li>
										<li><a href="/img/movie/movie_007.jpg" class="cbp-lightbox" data-title="Design Object"><i class="rounded-x fa fa-search"></i></a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="cbp-title-dark">
						<div class="cbp-l-grid-agency-title">미스 컨덕트[1]</div>
						<div class="cbp-l-grid-agency-desc">이미지 추가/수정</div>
					</div>
				</div>
				<div class="cbp-item identity logo">
					<div class="cbp-caption margin-bottom-20">
						<div class="cbp-caption-defaultWrap">
							<img src="/img/movie/no_image.jpeg" alt="">
						</div>
						<div class="cbp-caption-activeWrap">
							<div class="cbp-l-caption-alignCenter">
								<div class="cbp-l-caption-body">
									<ul class="link-captions no-bottom-space">
										<li><a href="portfolio_single_item.html"><i class="rounded-x fa fa-link"></i></a></li>
										<li><a href="/img/movie/no_image.jpeg" class="cbp-lightbox" data-title="Design Object"><i class="rounded-x fa fa-search"></i></a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="cbp-title-dark">
						<div class="cbp-l-grid-agency-title">조제, 호랑이 그리고 물고기들[0]</div>
						<div class="cbp-l-grid-agency-desc">이미지 추가/수정</div>
					</div>
				</div>
				<div class="cbp-item graphic">
					<div class="cbp-caption margin-bottom-20">
						<div class="cbp-caption-defaultWrap">
							<img src="/img/movie/movie_008.jpg" alt="">
						</div>
						<div class="cbp-caption-activeWrap">
							<div class="cbp-l-caption-alignCenter">
								<div class="cbp-l-caption-body">
									<ul class="link-captions no-bottom-space">
										<li><a href="portfolio_single_item.html"><i class="rounded-x fa fa-link"></i></a></li>
										<li><a href="/img/movie/movie_008.jpg" class="cbp-lightbox" data-title="Design Object"><i class="rounded-x fa fa-search"></i></a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="cbp-title-dark">
						<div class="cbp-l-grid-agency-title">그레이의 50가지 그림자</div>
						<div class="cbp-l-grid-agency-desc">이미지 추가/수정</div>
					</div>
				</div>
				<div class="cbp-item web-design logos">
					<div class="cbp-caption margin-bottom-20">
						<div class="cbp-caption-defaultWrap">
							<img src="/img/movie/movie_009.jpg" alt="">
						</div>
						<div class="cbp-caption-activeWrap">
							<div class="cbp-l-caption-alignCenter">
								<div class="cbp-l-caption-body">
									<ul class="link-captions no-bottom-space">
										<li><a href="portfolio_single_item.html"><i class="rounded-x fa fa-link"></i></a></li>
										<li><a href="/img/movie/movie_009.jpg" class="cbp-lightbox" data-title="Design Object"><i class="rounded-x fa fa-search"></i></a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="cbp-title-dark">
						<div class="cbp-l-grid-agency-title">007 스펙터</div>
						<div class="cbp-l-grid-agency-desc">이미지 추가/수정</div>
					</div>
				</div>
				<div class="cbp-item graphic logos">
					<div class="cbp-caption margin-bottom-20">
						<div class="cbp-caption-defaultWrap">
							<img src="/img/movie/no_image.jpeg" alt="">
						</div>
						<div class="cbp-caption-activeWrap">
							<div class="cbp-l-caption-alignCenter">
								<div class="cbp-l-caption-body">
									<ul class="link-captions no-bottom-space">
										<li><a href="portfolio_single_item.html"><i class="rounded-x fa fa-link"></i></a></li>
										<li><a href="/img/movie/no_image.jpeg" class="cbp-lightbox" data-title="Design Object"><i class="rounded-x fa fa-search"></i></a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="cbp-title-dark">
						<div class="cbp-l-grid-agency-title">Design Object 11</div>
						<div class="cbp-l-grid-agency-desc">Web Design</div>
					</div>
				</div>
				<div class="cbp-item web-design graphic">
					<div class="cbp-caption margin-bottom-20">
						<div class="cbp-caption-defaultWrap">
							<img src="/img/movie/no_image.jpeg" alt="">
						</div>
						<div class="cbp-caption-activeWrap">
							<div class="cbp-l-caption-alignCenter">
								<div class="cbp-l-caption-body">
									<ul class="link-captions no-bottom-space">
										<li><a href="portfolio_single_item.html"><i class="rounded-x fa fa-link"></i></a></li>
										<li><a href="/img/movie/no_image.jpeg" class="cbp-lightbox" data-title="Design Object"><i class="rounded-x fa fa-search"></i></a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="cbp-title-dark">
						<div class="cbp-l-grid-agency-title">Design Object 12</div>
						<div class="cbp-l-grid-agency-desc">Web Design</div>
					</div>
				</div-->
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

</body>
</html>