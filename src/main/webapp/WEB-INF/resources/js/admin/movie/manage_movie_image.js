/**
 * 
 */
$(document).ready(function() {
	App.init();
	Validation.initValidation();
	
	setEvent();
	
	//이미지 구분은 기본적으로 스크린샷 이미지를 기본으로 한다.
	$("input:radio[name='imageDiv']:radio[value='1']").attr('checked',true);
});


function setEvent(){
	
	$("#btnSave").click(function(){
		if($("#movieImgAddForm").valid()) {
			console.log("valid Form");
			uploadImageSubmit();
			//return false;
		} else {
			console.log("unvalid Form");
			//return false;
		}
	});
	
	$(document).on("click", "[id=btnUpdate]", function(){
		var idx = $("[id=btnUpdate]").index(this);
		//TODO 수정작업
		
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
	});
	
}

function uploadImageSubmit() {
	var frm = $("form#movieImgAddForm");
	
	
	if($("#imageCnt").val()=="0") {
		// 등록된 이미지가 하나도 없는 영화면 대표이미지 여부는 Y로... 
		$("#delegateYn").val("Y");
		$("#useYn").val("Y");
	} else {
		$("#delegateYn").val("N");
		$("#useYn").val("Y");
	}
	
	frm.submit();
}

/*
function uploadImage() {
	
	$.ajax({
		url : "/admin/movie/movieImageUpload",
		type : 'POST',
		data : $("#movieImgAddForm").serialize(true),
		dataType : "json",
		success : function(data){
			alert(data.error);
			if(data.error != undefined){
				alert("에러코드 : " + data.additionalInfo.errCode + "\n" + data.message);
				return false;
			} else {
				alert("이미지가 정상적으로 업로드 되었습니다.");
				location.href="/admin/movie/movieList";				
			}
		},
		error : function(e){
			if(e.status==200){
				alert("error code 이미지가 정상적으로 업로드 되었습니다.");
				location.href="/admin/movie/movieList";
			}else{
				console.log(e);
				alert("오류가 발생했습니다. 다시 시도해 주시기 바랍니다.");
			}
		}
	});
}
*/

function modifyMovieImageInfo() {
	console.log("Start Modify");
	
	$.ajax({
		url : "/admin/movie/movieImageModify",
		type : 'POST',
		data : $("#hiddenFrm").serialize(true),
		dataType : "json",
		success : function(data){
			console.log(data.error);
			if(data.error != undefined){
				alert("에러코드 : " + data.additionalInfo.errCode + "\n" + data.message);
				return false;
			} else {
				alert("이미지 정보가 정상적으로 수정되었습니다.");
				location.href="/admin/movie/movieImageList";				
			}
		},
		error : function(e){
			if(e.status==200){
				alert("error code 정상 저장 되었습니다.");
				location.href="/admin/movie/movieList";
			}else{
				console.log(e);
				alert("오류가 발생했습니다. 다시 시도해 주시기 바랍니다.");
			}
		}
	});
}

var Validation = function () {

    return {
        //Validation
        initValidation: function () {
	        $("#movieImgAddForm").validate({                   
	            // Rules for form validation
	            rules:
	            {
	            	file:
	                {
	                    required: true
	                }
	            },
	                                
	            // Messages for form validation
	            messages:
	            {
	            	file:
	                {
	                    required: '업로드하실 영화 이미지 파일을 선택해주세요.'
	                }
	            },                  
	            onsubmit:false,
	            // Do not change code below
	            errorPlacement: function(error, element)
	            {
	                error.insertAfter(element.parent());
	            }
	        });
        }

    };
}();