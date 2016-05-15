<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>영화ID</th>
							<th>영화명</th>
							<th>적정관람료</th>
							<th>개봉일</th>
							<th>게시일</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>${movie.movieId}</td>
							<td>${movie.movieKorTitle}</td>
							<td>9,300원 <span class="font-red">(+ 300원)</span></td>
							<td>${movie.releaseDt}</td>
							<td>${movie.creDt}</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="col-md-12">
				<!-- General Unify Forms -->
				<form:form action="/admin/movie/movieImageUpload" method="POST" id="movieImgAddForm" name="movieImgAddForm" class="sky-form" modelAttribute="uploadForm" enctype="multipart/form-data">
				<input type="hidden" id="movieId" name="movieId" value="${movie.movieId}">
				<input type="hidden" id="imageCnt" name="imageCnt" value="${fn:length(list)}">
				<input type="hidden" id="useYn" name="useYn">
				<input type="hidden" id="delegateYn" name="delegateYn">
					<fieldset>
						<div class="row">
							<label class="label">이미지 구분</label>
							<div class="inline-group">
								<label class="radio"><input type="radio" id="imageDiv" name="imageDiv" value="0"><i class="rounded-x"></i>포스터</label>
								<label class="radio"><input type="radio" id="imageDiv" name="imageDiv" value="1"><i class="rounded-x"></i>스크린샷</label>
								<label class="radio"><input type="radio" id="imageDiv" name="imageDiv" value="2"><i class="rounded-x"></i>기타 영화이미지</label>
							</div>					
						</div>
						<div class="row">
							<section>
								<label class="label">이미지</label>
								<label for="file" class="input input-file">
									<div class="button"><input type="file" id="file" name="file" onchange="this.parentNode.nextSibling.value = this.value"> Browse</div><input type="text" readonly>
								</label>
							</section>							
						</div>
						<div class="row">
								<label class="label">이미지 설명</label>
								<label class="input">
									<input type="text" name="imageDesc" id="imageDesc">
								</label>					
						</div>
					</fieldset>
					<footer>
						<button type="button" id="btnSave" name="btnSave" class="btn-u">Upload</button>
						<button type="button" class="btn-u btn-u-default" onclick="window.history.back();">취소</button>
					</footer>
				</form:form>
				<!-- General Unify Forms -->
			</div>
			<div class="col-md-12">
			<form id="movieImgModifyForm" name="movieImgModifyForm" class="sky-form">
				<!-- General Unify Forms -->
					<table class="table table-bordered">
						<thead>
							<tr>
								<th width="200">영화 이미지</th>
								<th>대표이미지</th>
								<th>삭제</th>
								<th>업로드일</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${fn:length(list) > 0}">
									<c:forEach items="${list}" var="row">
										<tr>
											<td rowspan="2">
												<img src="${row.filePath}/${row.fileNm}" width="200">
												<input type="hidden" id="imgSeq" name="imgSeq" value="${row.imageSeq}">
											</td>
											<td>
												<label class="checkbox">
													<input type="checkbox" id="delegateYnChk" name="delegateYnChk" value="Y" <c:if test="${row.delegateYn eq 'Y' }"> checked </c:if>><i></i>대표이미지
												</label>
											</td>
											<td>
												<label class="checkbox">
													<input type="checkbox" id="useYnChk" name="useYnChk" value="Y" <c:if test="${row.useYn eq 'Y' }"> checked </c:if>><i></i>사용중
												</label>
											</td>
											<td>
												${fn:substring(row.creDt,0,10) }
											</td>
											<td rowspan="2">
												<button class="btn-u btn-u-xs btn-u-default" type="button">이동</button>
												<button id="btnUpdate" name="btnUpdate" class="btn-u btn-u-xs btn-u-green btnUpdate" type="button">저장</button>
											</td>
										</tr>
										<tr>
											<td colspan="3">
												<label class="input">
													이미지 설명<input type="text" name="imageDescription" id="imageDescription" value="${row.imageDesc}">
												</label>
											</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<th colspan="5">등록된 이미지가 없습니다.</th>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				<!-- General Unify Forms -->
			</form>	
			</div>			
			<form name="hiddenFrm" id="hiddenFrm">
				<input type="hidden" id="movieId" name="movieId" value="${movie.movieId}">
				<input type="hidden" id="imageSeq" name="imageSeq">
				<input type="hidden" id="editUseYn" name="editUseYn">
				<input type="hidden" id="editDelegateYn" name="editDelegateYn">
				<input type="hidden" id="editImageDesc" name="editImageDesc">
			</form>
			
			
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
	<script type="text/javascript" src="/js/admin/movie/manage_movie_image.js"></script>
	<!-- JS Page Level -->
	<script type="text/javascript" src="/js/app.js"></script>
</body>
</html>