<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.5&appId=260835094253344";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
	<!--=== Start Header v8 ===-->
	<div class="wrapper">
		<jsp:include page="/WEB-INF/views/include/header.jsp" flush="false">
			<jsp:param name="dummy" value=""/>
		</jsp:include>
	</div>
	<!--=== End Header v8 ===-->
	<!--=== Content Part ===-->
	<div class="container-fluid">
		<div class="row equal-height-columns">
			<div class="col-md-12 col-sm-6 form-block equal-height-column">
				<h2 class="margin-bottom-30">Login To Your Account</h2>
				<form id="loginForm" name="loginForm" class="sky-form2">
				<input type="hidden" id="returnUrl" name="returnUrl" value="${rtnUrl}">
					<div class="login-block">
						<div class="input-group margin-bottom-20">
							<span class="input-group-addon rounded-left"><i class="icon-user color-blue"></i></span>
							<input type="email" id="loginId" name="loginId" class="form-control rounded-right" placeholder="로그인 아이디">
						</div>

						<div class="input-group margin-bottom-20">
							<span class="input-group-addon rounded-left"><i class="icon-lock color-blue"></i></span>
							<input type="password" id="loginPwd" name="loginPwd" class="form-control rounded-right" placeholder="비밀번호">
						</div>

						<div class="checkbox">
							<ul class="list-inline">
								<li>
									<label>
										<input type="checkbox" id="idMemory" name="idMemory"> 아이디 기억하기
									</label>
								</li>

								<li class="pull-right">
									<a href="#">비밀번호를 잊으셨나요?</a>
								</li>
							</ul>
						</div>

						<div class="row margin-bottom-70">
							<div class="col-md-12">
								<button type="button" id="btnLogin" name="btnLogin" class="btn-u btn-u-green btn-block rounded">로그인</button>
							</div>
						</div>

						<div class="social-login text-center">
							<div class="or rounded-x">Or</div>
							<ul class="list-inline margin-bottom-20">
								<li>
									<!-- button class="btn rounded btn-lg btn-facebook">
										<i class="fa fa-facebook"></i> Facebook Sign in
									</button>
									<fb:login-button scope="public_profile,email" onlogin="checkLoginState();">
									</fb:login-button-->
									<div class="fb-login-button" data-max-rows="1" data-size="xlarge" data-show-faces="false" data-auto-logout-link="true"></div>
									<div id="status">
									</div>
								</li>
							</ul>
							<p>아직 아이디가 없으신가요? <a href="/member/regist">회원가입</a></p>
						</div>
					</div>
				</form>
			</div>
		</div>
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
	<script src="/js/member/member_login.js"></script>

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
