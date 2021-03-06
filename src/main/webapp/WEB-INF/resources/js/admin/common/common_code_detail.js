/**
 * 공통코드 상세화면용 javascript Source file
 */

$(document).ready(function() {
	App.init();
	setEvent();
	
	Validation.initValidation();
});

function setEvent(){
	
	$("#btnGoList").click(function(){
		location.href="/admin/common/commonCodeList";
	});
	
	$("#btnDetailCodeSave").click(function(){
		
		if($("#btnDetailCodeSave").valid()) {
			console.log("valid Form");
			addDetailCode();
			//return false;
		} else {
			console.log("unvalid Form");
			//return false;
		}
	});
	
}

function addDetailCode() {
	$.ajax({
		url : "/admin/common/commonCodeDetailSave",
		type : 'POST',
		data : $("#frmAddCommonDetail").serialize(true),
		dataType : "json",
		success : function(data){
			if(data.error != undefined){
				alert("에러코드 : " + data.additionalInfo.errCode + "\n" + data.message);
				return false;
			} else {
				alert("정상 저장 되었습니다.");
				//location.href="/admin/common/commonCodeList";	
				location.reload(true);
			}
		},
		error : function(e){
			if(e.status==200){
				alert("error code 정상 저장 되었습니다.");
				//location.href="/admin/common/commonCodeList";
				location.reload(true);
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
	        $("#frmAddCommonDetail").validate({                   
	            // Rules for form validation
	            rules:
	            {
	            	detailCodeNm:
	                {
	                    required: true
	                }
	            },
	                                
	            // Messages for form validation
	            messages:
	            {
	            	detailCodeNm:
	                {
	                    required: '상세 공통코드명을 입력해주세요.'
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
