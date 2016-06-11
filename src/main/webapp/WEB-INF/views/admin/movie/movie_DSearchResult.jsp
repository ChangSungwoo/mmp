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
			<jsp:param name="thisName" value='<%=java.net.URLEncoder.encode("Daum영화정보 검색")%>'/>
			<jsp:param name="parentName" value='<%=java.net.URLEncoder.encode("영화 관리")%>'/>
		</jsp:include>
		<!--=== Content ===-->
		<div class="container content height-500">
			<!--상단 버튼 영역 Start-->
			<div class="search-block-v2">
				<div class="container">
					<div class="col-md-9 col-md-offset-3">
					<form id="movieAddForm" name="movieAddForm" action="/admin/movie/movieDSearchProc" method="POST" class="sky-form">
						<div class="input-group">
							<input type="text" class="form-control" placeholder="영화명을 띄어쓰기 없이 입력해주세요." name="query" id="query">
							<span class="input-group-btn">
								<button class="btn-u" type="submit"><i class="fa fa-search"></i></button>
							</span>
						</div>
					</form>
					</div>
				</div>
			</div>
			<!--상단 버튼 영역 End-->
			<!--Striped and Hover Rows-->
			<div class="row">
				<!--Hover Rows-->
				<div class="col-md-12">
					<div class="panel panel-grey margin-bottom-40">
						<div class="panel-heading">
							<h3 class="panel-title"><i class="fa fa-gear"></i>검색결과조회</h3>
						</div>
						<table class="table table-hover">
							<thead>
								<tr>
									<th>영화ID</th>
									<th>영화명(영문명)</th>
									<th>원제</th>
									<th>개봉일</th>
									<th>감독</th>
									<th width="300">배우</th>
									<th width="120">작업</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${fn:length(list) > 0}">
										<c:forEach items="${list}" var="row" varStatus="status">
											<tr>
												<td>${status.count}</td>
												<td>
													${row.title}(${row.engTitle})
													<input type="hidden" id="tmpTitle" name="tmpTitle" value="${row.title}">
													<input type="hidden" id="tmpEngTitle" name="tmpEngTitle" value="${row.engTitle}">
												</td>
												<td>${row.ogrTitle}</td>
												<td>
													${row.openInfo}
													<input type="hidden" id="tmpDate" name="tmpDate" value="${row.openInfo}">
												</td>
												<td>
													${row.director}
													<input type="hidden" id="tmpDirector" name="tmpDirector" value="${row.director}">
												</td>
												<td>
													${row.actor}
													<input type="hidden" id="tmpActor" name="tmpActor" value="${row.actor}">
												</td>
												<td>
													<input type="hidden" id="tmpLink" name="tmpLink" value="${row.link}">
													<button class="btn-u btn-u-xs btn-u-blue" type="button" id="btnMove" name="btnMove">이동</button>
													<button class="btn-u btn-u-xs btn-u-red" type="button" id="btnSave" name="btnSave">등록</button>
												</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="6" align="center" height="200">등록된 데이터가 존재하지 않습니다.</td>
										</tr>										
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
				</div>
				<!--End Hover Rows-->
			</div>
			<!--End Striped and Hover Rows-->
		</div>
		<!--=== End Content ===-->
	<jsp:include page="/WEB-INF/views/admin/include/includeBottom.jsp" flush="false">
		<jsp:param name="dummy" value=""/>
	</jsp:include>
	<form name="hForm" id="hForm">
		<input type="hidden" name="movieTitle" id="movieTitle">
		<input type="hidden" name="movieEngTitle" id="movieEngTitle">
		<input type="hidden" name="releaseDt" id="releaseDt">
		<input type="text" name="directorText" id="directorText">
		<input type="text" name="actorText" id="actorText">
	</form>

	<!-- JS Global Compulsory -->
	<script type="text/javascript" src="/plugins/jquery/jquery.min.js"></script>
	<script type="text/javascript" src="/plugins/jquery/jquery-migrate.min.js"></script>
	<script type="text/javascript" src="/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/plugins/sky-forms-pro/skyforms/js/jquery.maskedinput.min.js"></script>
	<script type="text/javascript" src="/plugins/sky-forms-pro/skyforms/js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="/plugins/sky-forms-pro/skyforms/js/jquery.validate.min.js"></script>
	
	<!-- JS Implementing Plugins -->
	<script type="text/javascript" src="/plugins/back-to-top.js"></script>
	<script type="text/javascript" src="/plugins/smoothScroll.js"></script>
	<!-- JS Customization -->
	<script type="text/javascript" src="/js/admin/movie/movie_DSearchResult.js"></script>
	<!-- JS Page Level -->
	<script type="text/javascript" src="/js/app.js"></script>

</body>
</html>