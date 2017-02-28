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
			<jsp:param name="thisName" value='<%=java.net.URLEncoder.encode("공통코드 관리")%>'/>
			<jsp:param name="parentName" value='<%=java.net.URLEncoder.encode("시스템 관리")%>'/>
		</jsp:include>
		<!--=== Content ===-->
		<div class="container content height-500">
			<!--Striped and Hover Rows-->
			<div class="row">
				<div class="col-md-11">
					<form name="frmAddCommonDetail" id="frmAddCommonDetail" method="POST">
						<input type="hidden" name="masterCode" id="masterCode" value="${codeM.codeMSeq}">
						<input type="text" name="detailCodeNm" id="detailCodeNm">
						<button id="btnDetailCodeSave" name="btnDetailCodeSave" class="btn btn-success btn-xs"><i class="fa fa-check"></i> 저장</button>
					</form>
				</div>
				<div class="col-md-1">
					<button id="btnGoList" name="btnGoList" class="btn-u" type="button"><i class="fa fa-magic">목록으로</i></button>
				</div>
			</div>
			<div class="row">
				<!--Hover Rows-->
				<div class="col-md-12">
					<div class="panel panel-grey margin-bottom-40">
						<div class="panel-heading">
							<h3 class="panel-title"><i class="fa fa-gear"></i>${codeM.codeMNm}</h3>
						</div>
						<table class="table table-hover">
							<thead>
								<tr>
									<th>No.</th>
									<th width="150">상세코드</th>
									<th width="200">상세코드명</th>
									<th width="80">기본값</th>
									<th  width="80">사용</th>
									<th>등록자</th>
									<th>등록일</th>
									<th>수정자</th>
									<th>수정일</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${fn:length(list) > 0}">
										<c:forEach items="${list}" var="row" varStatus = "status">
											<tr>
												<td>${status.count+((pageNo-1)*10)}</td>
												<td>${row.codeDSeq}</td>
												<td>${row.codeDNm}</td>
												<td>${row.defaultYn}</td>
												<td>${row.useYn}</td>
												<td>${row.creNm}</td>
												<td>${fn:substring(row.creDt, 0,10)}</td>
												<td>${row.updNm}</td>
												<td>${fn:substring(row.updDt, 0,10)}</td>
												<td>
													<button class="btn-u btn-u-sm btn-u-red" type="button" id="btnDelete" name="btnDelete">삭제</button>
													<button class="btn-u btn-u-sm btn-u-green" type="button" id="btnSave" name="btnSave" >수정</button>
												</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="11" align="center" height="200">등록된 데이터가 존재하지 않습니다.</td>
										</tr>										
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
					<jsp:include page="/WEB-INF/views/admin/include/includePaging.jsp" flush="false">
						<jsp:param name="formId" value="frm"/>
					</jsp:include>
				</div>
				<!--End Hover Rows-->
				<form id="pagingFrm" name="pagingFrm" action="/admin/common/commonCodeList">
					<input type="hidden" name="pageNo" id="pageNo"/>
				</form>
			</div>
			<!--End Striped and Hover Rows-->
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
	<script type="text/javascript" src="/plugins/sky-forms-pro/skyforms/js/jquery.validate.min.js"></script>
	<!-- JS Customization -->
	<script type="text/javascript" src="/js/admin/common/common_code_detail.js"></script>
	<!-- JS Page Level -->
	<script type="text/javascript" src="/js/app.js"></script>
<!--[if lt IE 9]>
	<script src="assets/plugins/respond.js"></script>
	<script src="assets/plugins/html5shiv.js"></script>
	<script src="assets/plugins/placeholder-IE-fixes.js"></script>
	<![endif]-->
</body>
</html>