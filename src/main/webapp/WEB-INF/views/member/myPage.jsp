<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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

	<!-- CSS Customization -->
	<link rel="stylesheet" href="/css/member/myPage.css">
</head>
<body class="header-fixed header-fixed-space-v2">
	<!--=== Start Header v8 ===-->
	<div class="wrapper">
		<jsp:include page="/WEB-INF/views/include/header.jsp" flush="false">
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
			<h1 class="pull-left">마이 페이지</h1>
			<ul class="pull-right breadcrumb">
				<li>JESSI</li>
			</ul>
		</div>
	</div>
	<!--/breadcrumbs-->

	<!--=== Content Part ===-->
	<div class="container content">
		<div class="row">
			<!-- Begin Content -->
			<div class="col-md-12">
				<!--Basic Table-->
				<div class="panel panel-sea margin-bottom-40">
					<div class="panel-heading">
						<h3 class="panel-title"><i class="fa fa-edit"></i> 나의 적정관람료</h3>
					</div>
					<table class="table table-striped">
								<thead>
									<tr>
										<th>#</th>
										<th>영화명</th>
										<th>나의 적정관람료</th>
										<th>공감횟수</th>
										<th>게시일</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td><span class="label label-danger">NEW</span> 주토피아</td>
										<td>9,300원 <span class="font-red">(+ 300원)</span></td>
										<td>3회</td>
										<td>오늘</td>
									</tr>
									<tr>
										<td>2</td>
										<td>내부자들</td>
										<td>9,450원 <span class="font-red">(+ 450원)</span></td>
										<td>7회</td>
										<td>2일전</td>
									</tr>
									<tr>
										<td>3</td>
										<td>간신</td>
										<td>8,450원 <span class="font-blue">(- 550원)</span></td>
										<td>2회</td>
										<td>4일전</td>
									</tr>
									<tr>
										<td>4</td>
										<td>범죄와의 전쟁</td>
										<td>8,000원 <span class="font-black">(0원)</span></td>
										<td>3회</td>
										<td>7일전</td>
									</tr>
									<tr>
										<td>5</td>
										<td>도둑들</td>
										<td>8,700원 <span class="font-red">(+ 700원)</span></td>
										<td>3회</td>
										<td>9일전</td>
									</tr>
									<tr>
										<td>6</td>
										<td>테이큰2</td>
										<td>7,390원 <span class="font-blue">(- 610원)</span></td>
										<td>3회</td>
										<td>7일전</td>
									</tr>
									<tr>
										<td>7</td>
										<td>더 임파서블</td>
										<td>8,800원 <span class="font-red">(+ 800원)</span></td>
										<td>3회</td>
										<td>7일전</td>
									</tr>
									<tr>
										<td>8</td>
										<td>나우 유 씨미 : 마술사기단 </td>
										<td>8,300원 <span class="font-red">(+ 300원)</span></td>
										<td>3회</td>
										<td>7일전</td>
									</tr>
								</tbody>
							</table>
							<!--End Table Striped-->
				</div>
				<!--End Basic Table-->

				<!--Striped and Hover Rows-->
				<div class="row">
					<!--Striped Rows-->
					<div class="col-md-6">
						<div class="panel panel-green margin-bottom-40">
							<div class="panel-heading">
								<h3 class="panel-title"><i class="fa fa-user"></i> 내가 공감하는 User</h3>
							</div>
							<table class="table table-striped">
								<thead>
									<tr>
										<th>#</th>
										<th>사용자명</th>
										<th>공감횟수</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td>포포야</td>
										<td>21회</td>
									</tr>
									<tr>
										<td>2</td>
										<td>오징어외계인</td>
										<td>17회</td>
									</tr>
									<tr>
										<td>3</td>
										<td>Hichi콕</td>
										<td>13회</td>
									</tr>
									<tr>
										<td>4</td>
										<td>레오친구네오</td>
										<td>9회</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<!--End Striped Rows-->

					<!--Hover Rows-->
					<div class="col-md-6">
						<div class="panel panel-green margin-bottom-40">
							<div class="panel-heading">
								<h3 class="panel-title"><i class="fa fa-user"></i> 나를 공감하는 User</h3>
							</div>
							<table class="table table-striped">
								<thead>
									<tr>
										<th>#</th>
										<th>사용자명</th>
										<th>횟수</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td>말괄량이 캔디</td>
										<td>24회</td>
									</tr>
									<tr>
										<td>2</td>
										<td>포포야</td>
										<td>12회</td>
									</tr>
									<tr>
										<td>3</td>
										<td>이리새</td>
										<td>12회</td>
									</tr>
									<tr>
										<td>4</td>
										<td>CineBoy</td>
										<td>10회</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<!--End Hover Rows-->
				</div>
				<!--End Striped and Hover Rows-->
			</div>
			<!-- End Content -->
		</div>
	</div><!--/container-->
	<!--=== Content Part ===-->
		
	
	
	
	
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

<!-- JS Page Level -->
<script src="/js/app.js"></script>

<!-- JS Customization -->
<script src="/js/member/myPage.js"></script>

<!--[if lt IE 9]>
	<script src="plugins/respond.js"></script>
	<script src="plugins/html5shiv.js"></script>
	<script src="plugins/placeholder-IE-fixes.js"></script>
<![endif]-->
</html>