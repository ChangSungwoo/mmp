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

	<!-- CSS Theme -->
	<link rel="stylesheet" href="/css/theme-colors/default.css" id="style_color">
</head>

<body>

	<div class="wrapper">
		<jsp:include page="/WEB-INF/views/admin/include/includeTop.jsp" flush="false">
			<jsp:param name="dummy" value=""/>
		</jsp:include>
		<jsp:include page="/WEB-INF/views/admin/include/includeNavi.jsp" flush="true">
			<jsp:param name="thisName" value='<%=java.net.URLEncoder.encode("메인화 컨텐츠 목록조회")%>'/>
			<jsp:param name="parentName" value='<%=java.net.URLEncoder.encode("서비스 관리")%>'/>
		</jsp:include>
		<!--=== Content ===-->
		<div class="container content height-500">
			<!--Striped and Hover Rows-->
			<div class="row">
				<!--Hover Rows-->
				<div class="col-md-12">
					<!--상단 버튼 영역 Start-->
					<p align="right">
						<button id="btnRegist" name="btnRegist" class="btn-u" type="button" data-toggle="modal" data-target="#responsive">
						<i class="fa fa-magic">신규등록</i></button>
					</p>
					<!--상단 버튼 영역 End-->
					<div class="panel panel-grey margin-bottom-40">
						<div class="panel-heading">
							<h3 class="panel-title"><i class="fa fa-gear"></i>메인화면 컨텐츠 조회</h3>
						</div>
						<table class="table table-hover">
							<thead>
								<tr>
									<th>컨텐츠 구분</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
									<th>정렬 순서</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${fn:length(list) > 0}">
										<c:forEach items="${list}" var="row">
											<tr>
												<td>${row.movieId}</td>
												<td><a href="javascript:movieDetail('${row.movieId}');">${row.movieKorTitle}(${row.movieEngTitle})</a></td>
												<td>${row.releaseDt}</td>
												<td>0원</td>
												<td>${row.creDt}</td>
												<td>
													<c:choose>
														<c:when test="${row.endYn == 'Y'}">
															<a class="btn btn-danger btn-xs">종영</a>
														</c:when>
														<c:otherwise>
															<a class="btn btn-danger btn-xs">상영중</a>
														</c:otherwise>
													</c:choose>
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
			<!-- Bootstrap Modals With Forms -->
			<div class="margin-bottom-40">
				<div class="modal fade" id="responsive" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
								<h4 class="modal-title" id="myModalLabel4">Contents 검색</h4>
							</div>
							<div class="modal-body">
								<div class="row">
								<ul class="nav nav-tabs">
									<li class="active"><a href="#price_admin" data-toggle="tab">적정관람료(에디터)</a></li>
									<li><a href="#price_member" data-toggle="tab">적정관람료(회원)</a></li>
									<li><a href="#read_content" data-toggle="tab">읽을거리</a></li>
									<li><a href="#adver_content" data-toggle="tab">광고</a></li>
								</ul>
								<p />
									<div class="tab-content">
										<div class="tab-pane fade in active" id="price_admin">
											<div class="col-md-10">
												<div class="panel panel-sea margin-bottom-40">
													<div class="panel-heading">
														<h3 class="panel-title"><i class="fa fa-edit"></i> Striped Rows</h3>
													</div>
													<table class="table table-striped">
														<thead>
															<tr>
																<th>ID</th>
																<th>영화명</th>
																<th>작성일</th>
																<th>선택</th>
															</tr>
														</thead>
														<form name="frmAddEditorReview" id="frmAddEditorReview" method="POST">
															<tbody>
																<c:choose>
																	<c:when test="${fn:length(mList1) > 0}">
																		<c:forEach items="${mList1}" var="row1">
																			<tr>
																				<td>
																					<input type="hidden" name="reviewSeq" id="reviewSeq" value="${row1.reviewSeq}">
																					${row1.reviewSeq}
																				</td>
																				<td>
																					<input type="hidden" name="movieTitle" id="movieTitle" value="${row1.movieKorTitle}">
																					${row1.movieKorTitle}
																				</td>
																				<td>${row1.creDt}</td>
																				<td>
																					<input type="hidden" name="pageId" id="pageId" value="1">
																					<input type="hidden" name="contentDiv" id="contentDiv" value="M">
																					<button id="btnEditorReviewAdd" name="btnEditorReviewAdd" class="btn btn-success btn-xs"><i class="fa fa-check"></i> 선택</button>
																				</td>
																			</tr>
																		</c:forEach>
																	</c:when>
																</c:choose>
															</tbody>
														</form>
													</table>
												</div>
											</div>
										</div>
										<div class="tab-pane fade in active" id="price_member">
										</div>
										<div class="tab-pane fade in active" id="read_content">
										</div>
										<div class="tab-pane fade in active" id="adver_content">
										</div>
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn-u btn-u-default" data-dismiss="modal">Close</button>
								<button type="button" class="btn-u btn-u-primary">Save changes</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- End Bootstrap Modals With Forms -->
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
	<!-- JS Implementing Plugins -->
	<script type="text/javascript" src="/plugins/back-to-top.js"></script>
	<script type="text/javascript" src="/plugins/smoothScroll.js"></script>
	<!-- JS Customization -->
	<script type="text/javascript" src="/js/admin/contents/main_content_list.js"></script>
	<!-- JS Page Level -->
	<script type="text/javascript" src="/js/app.js"></script>
<!--[if lt IE 9]>
	<script src="assets/plugins/respond.js"></script>
	<script src="assets/plugins/html5shiv.js"></script>
	<script src="assets/plugins/placeholder-IE-fixes.js"></script>
	<![endif]-->

</body>
</html>