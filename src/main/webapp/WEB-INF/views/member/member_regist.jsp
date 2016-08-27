<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->
<head>
	<title>Login 2 | Unify - Responsive Website Template</title>

	<!-- Meta -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">


	<!-- Web Fonts -->
	<link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Open+Sans:400,300,700&amp;subset=cyrillic,latin">

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
	<link rel="stylesheet" href="/plugins/brand-buttons/brand-buttons.css">
	<link rel="stylesheet" href="/plugins/sky-forms-pro/skyforms/custom/custom-sky-forms.css">	

	<!-- CSS Page Style -->
	<link rel="stylesheet" href="/css/pages/page_log_reg_v4.css">

	<!-- CSS Theme -->
	<link rel="stylesheet" href="/css/theme-colors/default.css">

	<!-- CSS Customization -->
	<link rel="stylesheet" href="/css/member/member_login.css">
	
</head>
<body>
	<!--=== Start Header v8 ===-->
	<div class="wrapper">
		<jsp:include page="/WEB-INF/views/include/header.jsp" flush="false">
			<jsp:param name="dummy" value=""/>
		</jsp:include>
	</div>
	<!--=== End Header v8 ===-->
	<!--=== Content Part ===-->
	<div class="container-fluid">
	<form id="userRegistForm" name="userRegistForm" class="sky-form2">
		<div class="row equal-height-columns">
			<div class="col-md-12 col-sm-12 form-block equal-height-column">
				<div class="reg-block">
					<h2 class="margin-bottom-30">신규 회원 가입</h2>
					
					<div class="input-group margin-bottom-20">
						<span class="input-group-addon rounded-left"><i class="icon-envelope color-green"></i></span>
						<input type="email" id="loginId" name="loginId" class="form-control rounded-right" placeholder="로그인 아이디(이메일 주소)">
					</div>
					
					<div class="input-group margin-bottom-20">
						<span class="input-group-addon rounded-left"><i class="icon-lock color-green"></i></span>
						<input type="password" id="loginPwd" name="loginPwd" class="form-control rounded-right" placeholder="비밀번호" maxlength="20">
					</div>
					
					<div class="input-group margin-bottom-20">
						<span class="input-group-addon rounded-left"><i class="icon-lock color-green"></i></span>
						<input type="password" id="pwdConfirm" name="pwdConfirm" class="form-control rounded-right" placeholder="비밀번호 확인" maxlength="20">
					</div>
					
					<div class="input-group margin-bottom-20">
						<span class="input-group-addon rounded-left"><i class="icon-pencil color-green"></i></span>
						<input type="text" id="userNickNm" name="userNickNm" class="form-control rounded-right" placeholder="닉네임" maxlength="10">
					</div>

					<div class="checkbox margin-bottom-40">
						<label style="margin-bottom:15px;">
							<input type="checkbox" id="agreeRule" name="agreeRule" ><a href="">이용약관 및 개인정보 취급 방침</a>에 동의합니다.</a>
						</label>
					</div>
					<button type="button" id="btnRegist" name="btnRegist" class="btn-u btn-block rounded">회원 가입</button>
				</div>
			</div>
		</div>
		</form>
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
	<script type="text/javascript" src="/plugins/sky-forms-pro/skyforms/js/jquery.maskedinput.min.js"></script>
	<script type="text/javascript" src="/plugins/sky-forms-pro/skyforms/js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="/plugins/sky-forms-pro/skyforms/js/jquery.validate.min.js"></script>

	<!-- JS Implementing Plugins -->
	<script src="/plugins/back-to-top.js"></script>
	<script src="/plugins/backstretch/jquery.backstretch.min.js"></script>

	<!-- JS Customization -->
	<script src="/js/member/member_regist.js"></script>

	<!-- JS Page Level -->
	<script src="/js/app.js"></script>
	
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
	<script src="assets/plugins/respond.js"></script>
	<script src="assets/plugins/html5shiv.js"></script>
	<script src="assets/plugins/placeholder-IE-fixes.js"></script>
	<![endif]-->
</body>
</html>
