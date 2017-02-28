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
			<jsp:param name="thisName" value='<%=java.net.URLEncoder.encode("읽을거리 신규 등록")%>'/>
			<jsp:param name="parentName" value='<%=java.net.URLEncoder.encode("서비스 관리")%>'/>
		</jsp:include>
		<!--=== Content ===-->
		<div class="container content height-500">
				<div class="col-md-12">
					<!-- General Unify Forms -->
					<form id="readerAddForm" name="readerAddForm" class="sky-form">
						<fieldset>
							<div class="row">
								<section>
									<label class="label">읽을거리 제목</label>
									<label class="input state-success">
										<input type="text" name="readerTitle" id="readerTitle">
									</label>
								</section>
							</div>
							<div class="row">
								<section class="col col-6">
									<label class="label">형식</label>
									<div class="inline-group">
										<label class="radio"><input type="radio" name="readerDiv" id="readerDiv" value="1" checked><i class="rounded-x"></i>일반</label>
										<label class="radio"><input type="radio" name="readerDiv" id="readerDiv" value="2"><i class="rounded-x"></i>동영상</label>
										<!-- label class="radio"><input type="radio" name="readerDiv" id="readerDiv" value="3"><i class="rounded-x"></i>명대사</label-->
									</div>
								</section>
								<section class="col col-6">
									<label class="label">노출 여부</label>
									<div class="inline-group">
										<label class="radio"><input type="radio" name="useYn" id="useYn" value="Y"><i class="rounded-x"></i>노출</label>
										<label class="radio"><input type="radio" name="useYn" id="useYn" value="N" checked><i class="rounded-x"></i>대기</label>
									</div>
								</section>
							</div>
							<div class="row" id="row_image" name="row_image">
								<section>
									<label class="label">이미지</label>
									<label for="file" class="input input-file">
										<div class="button"><input type="file" id="file" name="file" onchange="this.parentNode.nextSibling.value = this.value"> Browse</div><input type="text" readonly>
									</label>
								</section>	
							</div>
							<div class="row" id="row_movie" name="row_movie">
								<section>
									<label class="label">동영상 URL</label>
									<label class="input">
										<input type="text" name="movieUrl" id="movieUrl">
									</label>
								</section>
							</div>
							<div class="row" id="row_content" name="row_content">
								<section>
									<label class="label">읽을거리 내용</label>
									<textarea name="ir1" id="ir1" rows="10" style="width:100%; height:412px; "></textarea>
								</section>
							</div>
						</fieldset>
						<footer>
							<button type="button" id="btnReaderSave" name="btnReaderSave" class="btn-u">저장</button>
							<button type="button" class="btn-u btn-u-default" onclick="window.history.back();">취소</button>
						</footer>
					</form>
					<!-- General Unify Forms -->
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
	<script type="text/javascript" src="/js/admin/reader/reader_create.js"></script>
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

