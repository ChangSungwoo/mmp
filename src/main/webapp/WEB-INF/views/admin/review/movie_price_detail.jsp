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
					<input type="hidden" id="reviewSeq" name="reviewSeq" value="${review.reviewSeq}">
					<input type="hidden" id="writerDiv" name="writerDiv" value="E">
					<h4>영화 감상평</h4>
					<!-- textarea class="form-control" id="review" name="review" rows="7">${review.reviewText}</textarea-->
					<textarea name="ir1" id="ir1" rows="10" style="width:100%; height:412px; ">${review.reviewText}</textarea>
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
				</form>
			</div>
			<div class="col-sm-12">
				<h4>적정 관람료</h4>
				<form name="priceForm" id="priceForm" class="sky-form">
					<input type="hidden" id="movieId" name="movieId" value="${movie.movieId}">
					<input type="hidden" id="reviewSeq" name="reviewSeq" value="${review.reviewSeq}">
					<input type="hidden" id="moviePriceSeq" name="moviePriceSeq">
					<input type="hidden" id="writerDiv" name="writerDiv" value="E">
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
			<!-- End Content -->
			<form name="frmMovePriceCmt" id="frmMovePriceCmt">
				<input type="hidden" id="tmpPriceDiv" name="tmpPriceDiv" />
				<input type="hidden" id="tmpMoviePriceSeq" name="tmpMoviePriceSeq" />
			</form>
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
	<script type="text/javascript" src="/js/admin/review/movie_price_detail.js"></script>
	<script type="text/javascript" src="/js/editor/HuskyEZCreator.js" charset="utf-8"></script>
	<!-- JS Page Level -->
	<script type="text/javascript" src="/js/app.js"></script>
	
		<script type="text/javascript">
		var oEditors = [];
		
		// 추가 글꼴 목록
		//var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];
		
		nhn.husky.EZCreator.createInIFrame({
			oAppRef: oEditors,
			elPlaceHolder: "ir1",
			sSkinURI: "/js/editor/SmartEditor2Skin.html",	
			htParams : {
				bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
				//aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
				fOnBeforeUnload : function(){
					//alert("완료!");
				}
			}, //boolean
			fOnAppLoad : function(){
				//예제 코드
				//oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
			},
			fCreator: "createSEditor2"
		});
		
		function pasteHTML() {
			var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
			oEditors.getById["ir1"].exec("PASTE_HTML", [sHTML]);
		}
		
		function showHTML() {
			var sHTML = oEditors.getById["ir1"].getIR();
			alert(sHTML);
		}
			
		function submitContents(elClickedObj) {
			oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
			
			// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.
			
			try {
				elClickedObj.form.submit();
			} catch(e) {}
		}
		
		function setDefaultFont() {
			var sDefaultFont = '궁서';
			var nFontSize = 24;
			oEditors.getById["ir1"].setDefaultFont(sDefaultFont, nFontSize);
		}
	</script>
</body>
</html>