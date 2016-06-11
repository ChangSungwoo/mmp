<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
			<jsp:param name="thisName" value='<%=java.net.URLEncoder.encode("적정 관람료 등록")%>'/>
			<jsp:param name="parentName" value='<%=java.net.URLEncoder.encode("영화 관리")%>'/>
		</jsp:include>
		<!--=== Content ===-->
		<div class="container content height-500">
			<div class="col-md-12">
			<h4>영화 기본정보</h4>
				<table class="table table-bordered">
					<tr>
						<th width="260" rowspan="4"><img src="${review.filePath}/${review.fileNm}" width="250" alt=""></th>
						<th>영화명</th>
						<th>개봉일</th>
						<th>게시일</th>
					</tr>
					<tr>
						<td>${movie.movieKorTitle}</td>
						<td>${movie.releaseDt}</td>
						<td>${movie.creDt}</td>
					</tr>
					<tr>
						<th>감독</th>
						<th colspan="2">배우</th>
					</tr>
					<tr>
						<td>${movie.directorText}</td>
						<td colspan="2">${movie.actorText}</td>
					</tr>
				</table>
			</div>
			<div class="col-md-12">
				<form name="reviewForm" id="reviewForm" class="sky-form">
					<input type="hidden" id="movieId" name="movieId" value="${movie.movieId}">
					<input type="hidden" id="writerDiv" name="writerDiv" value="E">
					<h4>영화 감상평</h4>
					<p>추후 <code>네이버 스마트 에디터</code> 적용 예정.</p>
					<textarea class="form-control" id="review" name="review" rows="7">${review.reviewText}</textarea>
					<c:choose>
						<c:when test="${review.reviewText eq null}">
							<button class="btn-u btn-u-sm btn-u-green" type="button" id="btnReviewSave" name="btnReviewSave" >리뷰등록</button>
						</c:when>
						<c:otherwise>
							<button class="btn-u btn-u-sm btn-u-green" type="button" id="btnReviewEdit" name="btnReviewEdit" >리뷰수정</button>
						</c:otherwise>
					</c:choose>
					
				</form>
			</div>
			<div class="col-sm-12">
				<h4>적정 관람료</h4>
				<form name="priceForm" id="priceForm" class="sky-form">
					<input type="hidden" id="movieId" name="movieId" value="${movie.movieId}">
					<input type="hidden" id="reviewSeq" name="reviewSeq" value="${review.reviewSeq}">
					<input type="hidden" id="writerDiv" name="writerDiv" value="E">
					<table class="table">
						<thead>
							<tr>
								<td width="10%">구분</td>
								<td width="*">Comment</td>
								<td width="10%" nowrap>관람료(원)</td>
								<td width="5%">&nbsp;</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
									<div class="inline-group">
										<label class="radio"><input type="radio" name="priceDiv" id="priceDiv" value="P" checked><i class="rounded-x"></i>인상</label>
										<label class="radio"><input type="radio" name="priceDiv" id="priceDiv" value="N"><i class="rounded-x"></i>인하</label>
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
								</td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
			<div class="col-sm-6">
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
										<c:forEach items="${pList}" var="row">
								<tr>
									<td>${row.priceComment}</td>
									<td width="80" align="right" class="price-red">+${row.price}원</td>
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
			<div class="col-sm-6">
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
										<c:forEach items="${nList}" var="row1">
											<tr>
												<td>${row1.priceComment}</td>
												<td width="80" align="right" class="price-blue">
													<c:choose>
													<c:when test="${row1.price == 0}">
														&nbsp;
													</c:when>
													<c:otherwise>
														-${row1.price}원
													</c:otherwise>
													</c:choose>
												
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
	<script type="text/javascript" src="/js/admin/movie/movie_price_detail.js"></script>
	<!-- JS Page Level -->
	<script type="text/javascript" src="/js/app.js"></script>
</body>
</html>