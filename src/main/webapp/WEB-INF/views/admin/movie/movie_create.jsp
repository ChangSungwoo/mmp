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
			<jsp:param name="thisName" value='<%=java.net.URLEncoder.encode("영화 신규 등록")%>'/>
			<jsp:param name="parentName" value='<%=java.net.URLEncoder.encode("영화 관리")%>'/>
		</jsp:include>
		<!--=== Content ===-->
		<div class="container content height-500">
				<div class="col-md-12">
					<!-- General Unify Forms -->
					<form id="movieAddForm" name="movieAddForm" class="sky-form">
						<fieldset>
							<div class="row">
								<section class="col col-6">
									<label class="label">영화 제목(한글)</label>
									<label class="input state-success">
										<input type="text" name="movieTitle" id="movieTitle">
									</label>
								</section>
								<section class="col col-6">
									<label class="label">영화 제목(영문)</label>
									<label class="input">
										<input type="text" name="movieEngTitle" id="movieEngTitle">
									</label>
								</section>
							</div>
							<div class="row">
								<section class="col col-6">
									<label class="label">감독 정보</label>
									<label class="input state-success">
										<input type="text" name="directorText" id="directorText">
									</label>
								</section>
								<section class="col col-6">
									<label class="label">배우 정보</label>
									<label class="input">
										<input type="text" name="actorText" id="actorText">
									</label>
								</section>
							</div>
							<div class="row">
								<section class="col col-4">
									<label class="label">개봉일</label>
									<label class="input state-success"">
										<i class="icon-append fa fa-calendar"></i>
										<input type="text" name="releaseDt" id="releaseDt">
									</label>
								</section>
								<section class="col col-4">
									<label class="label">노출여부</label>
									<div class="inline-group">
										<label class="radio"><input type="radio" name="displayYn" id="displayYn" value="Y"><i class="rounded-x"></i>노출</label>
										<label class="radio"><input type="radio" name="displayYn" id="displayYn" value="N" checked><i class="rounded-x"></i>대기</label>
									</div>
								</section>
								<section class="col col-4">
									<label class="label">기준관람료</label>
									<div class="inline-group">
									<c:choose>
										<c:when test="${fn:length(list) > 0}">
											<c:forEach items="${list}" var="row">
												<label class="radio"><input type="radio" name="stdPriceDiv" id="stdPriceDiv" value="${row.dSeq}" <c:if test="${'Y' eq row.defaultYn }"> checked </c:if>><i class="rounded-x"></i>${row.DName}원</label>
											</c:forEach>
										</c:when>
									</c:choose>
									</div>
								</section>
						
							</div>
						</fieldset>
						<footer>
							<button type="button" id="btnSave" name="btnSave" class="btn-u">저장</button>
							<button type="button" class="btn-u btn-u-default" onclick="window.history.back();">리스트</button>
						</footer>
					</form>
					<!-- General Unify Forms -->
				</div>
				<!-- End Content -->
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
	<script type="text/javascript" src="/plugins/sky-forms-pro/skyforms/js/jquery.maskedinput.min.js"></script>
	<script type="text/javascript" src="/plugins/sky-forms-pro/skyforms/js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="/plugins/sky-forms-pro/skyforms/js/jquery.validate.min.js"></script>
	
	<!-- JS Implementing Plugins -->
	<script type="text/javascript" src="/plugins/back-to-top.js"></script>
	<script type="text/javascript" src="/plugins/smoothScroll.js"></script>
	<!-- JS Customization -->
	<script type="text/javascript" src="/js/admin/movie/movie_create.js"></script>
	<!-- JS Page Level -->
	<script type="text/javascript" src="/js/app.js"></script>

</body>
</html>