/**
 * 메인화면 노출 컨텐츠 관리용 JavaScript File
 */

$(document).ready(function() {
	App.init();
	setEvent()
});

function setEvent(){
	
	$(document).on("click", "[id=btnEditorReviewAdd]", function(){
		var idx = $("[id=btnEditorReviewAdd]").index(this);
		//TODO 수정작업
		
		var mTitle = $("[id=movieTitle]").eq(idx).val();
		var mSeq = $("[id=reviewSeq]").eq(idx).val();
		
		var cfmWin = confirm("영화 "+mTitle+"을(를) 메인화면에 노출하시겠습니까?");
		if(cfmWin) {
			addContent(mSeq);
		} else {
			return false;
		}
		
		/*
		var useImgChk = "N";
		var delegateImgChk = "N";
		var delegateCnt = 0;
		
		if($("[id=useYnChk]").eq(idx).prop("checked"))	
			useImgChk = "Y";
		
		if($("[id=delegateYnChk]").eq(idx).prop("checked"))	
			delegateImgChk = "Y";
		
		delegateCnt = $("input[name=delegateYnChk]:checkbox:checked").length;
		
		if(delegateCnt > 1) {
			alert("영화의 대표이미지는 하나만 설정 가능합니다\n대표이미지는 목록 표시에 사용되는 이미지 입니다.");
		} else {
			$("#imageSeq").val($("[id=imgSeq]").eq(idx).val());
			$("#editUseYn").val(useImgChk);
			$("#editDelegateYn").val(delegateImgChk);
			$("#editImageDesc").val($("[id=imageDescription]").eq(idx).val());
			
			//var hiddenFrm = $("form#hiddenFrm");
			//hiddenFrm.submit();
			modifyMovieImageInfo();
		}
		
		*/
		
		return false;
	});
}

function addContent(seq) {
	
	$.ajax({
		url : "/admin/service/addMainContentEditorReview",
		type : 'POST',
		data : $("#frmAddEditorReview").serialize(true),
		dataType : "json",
		success : function(data){
			console.log(data.error);
			if(data.error != undefined){
				alert("에러코드 : " + data.additionalInfo.errCode + "\n" + data.message);
				return false;
			} else {
				alert("메인 화면에 컨텐츠가 정상적으로 등록되었습니다.");
				location.href="/admin/service/mainContentList";				
			}
		},
		error : function(e){
			if(e.status==200){
				alert("error code 정상 저장 되었습니다.");
				location.href="/admin/service/mainContentList";
			}else{
				console.log(e);
				alert("오류가 발생했습니다. 다시 시도해 주시기 바랍니다.");
			}
		}
	});
	
}