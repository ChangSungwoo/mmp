<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		<link rel="stylesheet" href="/plugins/sky-forms-pro/skyforms/css/sky-forms.css">
	<link rel="stylesheet" href="/plugins/sky-forms-pro/skyforms/custom/custom-sky-forms.css">	

	<!-- CSS Theme -->
	<link rel="stylesheet" href="/css/theme-colors/default.css" id="style_color">
	<link rel="stylesheet" href="/css/theme-skins/dark.css">

	<!-- CSS Customization -->
	<link rel="stylesheet" href="/css/review/review_detail.css">
	
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
		<!--=== Breadcrumbs ===-->
		<div class="breadcrumbs breadcrumbs-light">
			<div class="container">
				<h1 class="pull-left">적정관람료 등록</h1>
			</div>
		</div><!--/breadcrumbs-->
		<!--=== End Breadcrumbs ===-->		
		<!--=== Container Part ===-->
		<div class="container">
			<div class="content">
				<div class="row margin-bottom-30" id="reviewInput">
					<form name="reviewForm" id="reviewForm" class="sky-form">
						<input type="hidden" id="movieId" name="movieId">
						<input type="hidden" id="writerDiv" name="writerDiv" value="U">
						<div class="col-md-12">					
							<h4>대표 이미지</h4>
							<div class="col-md-12">
								<c:choose>
									<c:when test="${fn:length(list) > 0}">
										<c:forEach items="${list}" var="row">
											<input type="radio" name="delegateImg" id="delegateImg" value="${row.imageSeq}">
											<img src="${row.filePath}/${row.fileNm}" height="100">
										</c:forEach>
									</c:when>
								</c:choose>
							</div>
						</div>
						<div class="col-md-12">					
							<h4>영화 감상평</h4>
							<textarea class="form-control" id="reviewText" name="reviewText" rows="7">${review.reviewText}</textarea>
							<div class="col-md-12" align="right">
								<c:choose>
									<c:when test="${review.reviewText eq null}">
										<button class="btn-u btn-u-sm btn-u-green" type="button" id="btnReviewSave" name="btnReviewSave" >리뷰등록</button>
									</c:when>
									<c:otherwise>
										<button class="btn-u btn-u-sm btn-u-green" type="button" id="btnReviewEdit" name="btnReviewEdit" >리뷰수정</button>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</form>
				</div>
				<!-- 적정관람료 영역 -->
				<div class="col-sm-12" id="priceInput">
					<h4>적정 관람료</h4>
					<form name="priceForm" id="priceForm" class="sky-form">
						<input type="hidden" id="movieId" name="movieId">
						<input type="hidden" id="reviewSeq" name="reviewSeq" value="${review.reviewSeq}">
						<input type="hidden" id="moviePriceSeq" name="moviePriceSeq">
						<input type="hidden" id="writerDiv" name="writerDiv" value="U">
						<input type="hidden" id="mode" name="mode">
						<table class="table">
							<thead>
								<tr>
									<td width="20%">구분</td>
									<td width="*">Comment</td>
									<td width="10%" nowrap>관람료(원)</td>
									<td width="13%">&nbsp;</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
										<div class="inline-group">
											<label class="radio"><input type="radio" name="priceDiv" id="priceDiv" value="P" checked><i class="rounded-x"></i>인상</label>
											<label class="radio"><input type="radio" name="priceDiv" id="priceDiv" value="N"><i class="rounded-x"></i>인하</label>
											<label class="checkbox"><input type="checkbox" name="commentYn" id="commentYn" value="Y"><i></i>Comment</label>
										</div>
									</td>
									<td>
										<input type="text" class="form-control input-sm" name="priceComment" id="priceComment">
									</td>
									<td>
										<input type="text" class="form-control input-sm" name="price" id="price">
									</td>
									<td>
										<button class="btn-u btn-u-sm btn-u-red" type="button" id="btnPriceSave" name="btnPriceSave" >등록</button>
										<button class="btn-u btn-u-sm btn-u-green" type="button" id="btnPriceModify" name="btnPriceModify" >수정</button>
										<button class="btn-u btn-u-sm btn-u-green" type="button" id="btnChange" name="btnChange" >전환</button>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
				<div class="col-sm-6" id="reviewPPrice">
					<!--Basic Table Option (Spacing)-->
					<div class="panel panel-red margin-bottom-30">
						<div class="panel-heading">
							<h3 class="panel-title"><i class="fa fa-arrow-circle-up"></i> 인상</h3>
						</div>
						<div class="panel-body">
							<table class="table">
								<tbody>
									<c:choose>
										<c:when test="${fn:length(pList) > 0}">
											<c:forEach items="${pList}" var="row" varStatus="status">
												<span id="pCommentYn">${row.commentYn}</span>
													<tr>
														<td>
															<a href="javascript:removeComment('${row.moviePriceSeq}');">
																<span class="item" style="cursor:hand;">
																	<i class="fa fa-times-circle-o"></i>
																</span>
															</a>
															&nbsp;<a href="javascript:modifyComment('${row.moviePriceSeq}', 'P', '${status.index}');"><span id="pComment">${row.priceComment}</span></a>&nbsp;&nbsp;
															<a href="javascript:moveComment('N', '${row.moviePriceSeq}');"><span class="glyphicon glyphicon-hand-right"></span></a>
														</td>
														<td width="80" align="right" class="price-red">
															<span id="pPrice">
																<c:choose>
																	<c:when test="${row.commentYn == 'Y'}">
																		&nbsp;
																	</c:when>
																	<c:otherwise>
																		<c:choose>
																			<c:when test="${row.price == 0}">
																				0원
																			</c:when>
																			<c:otherwise>
																				+${row.price}원
																			</c:otherwise>
																		</c:choose>
																	</c:otherwise>
																</c:choose>
															</span>
														</td>
														<fmt:formatNumber var="totalPrice" value="${totalPrice+row.price}" pattern="###0"/>
													</tr>
											</c:forEach>
										</c:when>
									</c:choose>
									<tr>
										<th colspan="3" class="price-red" style="text-align:right;">Total : + <fmt:formatNumber value="${totalPrice+row.price}"/>원</th>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<!--End Basic Table-->
				</div>
				<div class="col-sm-6" id="reviewNPrice">
					<!--Basic Table Option (Spacing)-->
					<div class="panel panel-green margin-bottom-30">
						<div class="panel-heading">
							<h3 class="panel-title"><i class="fa fa-arrow-circle-down"></i> 인하</h3>
						</div>
						<div class="panel-body">
							<table class="table">
								<tbody>
									<c:choose>
										<c:when test="${fn:length(nList) > 0}">
											<c:forEach items="${nList}" var="row1"  varStatus="status1">
											<span id="nCommentYn">${row1.commentYn}</span>
												<tr>
													<td>
														<a href="javascript:removeComment('${row1.moviePriceSeq}');">
															<span class="item" style="cursor:hand;">
																<i class="fa fa-times-circle-o"></i>
															</span>
														</a>
														&nbsp;<a href="javascript:modifyComment('${row1.moviePriceSeq}', 'N', '${status1.index}');"><span id="nComment">${row1.priceComment}</span></a>&nbsp;
														<a href="javascript:moveComment('P' , '${row1.moviePriceSeq}');"><span class="glyphicon glyphicon-hand-left"></span></a>
													</td>
													<td width="80" align="right" class="price-blue">
														<span id="nPrice">
															<c:choose>
																<c:when test="${row1.commentYn == 'Y'}">
																	&nbsp;
																</c:when>
																<c:otherwise>
																	<c:choose>
																		<c:when test="${row1.price == 0}">
																			0원
																		</c:when>
																		<c:otherwise>
																			-${row1.price}원
																		</c:otherwise>
																	</c:choose>
																</c:otherwise>
															</c:choose>
														</span>
													</td>
													<fmt:formatNumber var="totalPriceMinus" value="${totalPriceMinus+row1.price}" pattern="###0"/>
												</tr>
											</c:forEach>
										</c:when>
									</c:choose>
									<tr>
										<th colspan="3" class="price-blue" style="text-align:right;">Total : - ${totalPriceMinus}원</th>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<!--End Basic Table-->
				</div>
				<!-- 적관 끝  -->
				
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
				<form name="frmMovePriceCmt" id="frmMovePriceCmt">
				<input type="hidden" id="tmpPriceDiv" name="tmpPriceDiv" />
				<input type="hidden" id="tmpMoviePriceSeq" name="tmpMoviePriceSeq" />
			</form>
			</div>
		</div>
		<!--=== End Container Part ===-->

	<!--=== Footer v8 ===-->
	<div class="footer-v8">
		<jsp:include page="/WEB-INF/views/include/footer.jsp" flush="false">
			<jsp:param name="dummy" value=""/>
		</jsp:include>
	</div>
	<!--=== End Footer v8 ===-->

	<!-- JS Global Compulsory -->
	<script type="text/javascript" src="/plugins/jquery/jquery.min.js"></script>
	<script type="text/javascript" src="/plugins/jquery/jquery-migrate.min.js"></script>
	<script type="text/javascript" src="/plugins/bootstrap/js/bootstrap.min.js"></script>
	<!-- JS Implementing Plugins -->
	<script type="text/javascript" src="/plugins/back-to-top.js"></script>
	<script type="text/javascript" src="/plugins/smoothScroll.js"></script>
	<script type="text/javascript" src="/plugins/sky-forms-pro/skyforms/js/jquery.validate.min.js"></script>
	<!-- JS Customization -->
	<script type="text/javascript" src="/js/review/review_write.js"></script>
	<!-- JS Page Level -->
	<script type="text/javascript" src="/js/app.js"></script>

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
	<script src="plugins/respond.js"></script>
	<script src="plugins/html5shiv.js"></script>
	<script src="plugins/placeholder-IE-fixes.js"></script>
<![endif]-->
</body>
</html>