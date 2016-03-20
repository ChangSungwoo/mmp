<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
									<label class="label">개봉일</label>
									<label class="input state-success"">
										<i class="icon-append fa fa-calendar"></i>
										<input type="text" name="releaseDate" id="releaseDate">
									</label>
								</section>
								<section class="col col-3">
									<label class="label">종영 여부</label>
									<label class="toggle"><input type="checkbox" name="endYn" value="Y" checked><i></i>종영</label>
								</section>
								<section class="col col-3">
									<label class="label">프런트 노출여부</label>
									<label class="toggle"><input type="checkbox" name="displayYn" value="Y" checked><i></i>노출</label>
								</section>								
							</div>
							<div class="row">
							</div>
							<section>
								<label class="label">영화 포스터</label>
								<label for="file" class="input input-file">
									<div class="button"><input type="file" id="file" onchange="this.parentNode.nextSibling.value = this.value">Browse</div><input type="text" readonly>
								</label>
							</section>
						</fieldset>
						<footer>
							<button type="button" id="btnSave" name="btnSave" class="btn-u">저장</button>
							<button type="button" class="btn-u btn-u-default" onclick="window.history.back();">취소</button>
						</footer>
					</form>
					<!-- General Unify Forms -->
				</div>
				<!-- End Content -->
			</div>
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