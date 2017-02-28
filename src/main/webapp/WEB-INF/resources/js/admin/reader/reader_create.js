/**
 * 읽을거리 신규 작성용 JavaScript File
 */

$(document).ready(function() {
	App.init();
	setEvent()
	
	Validation.initValidation();
	$("#row_movie").hide();
});

function setEvent(){

	$("#btnReaderSave").click(function(){
		if($("#readerAddForm").valid()) {
			console.log("valid Form");
			//console.log("ir1 : "+oEditors.getById["ir1"].getIR());
			$("#ir1").val(oEditors.getById["ir1"].getIR());
			//console.log("ir1 : "+$("#ir1").val());
			addReader();
			//return false;
		} else {
			console.log("unvalid Form");
			//return false;
		}
	});
	
	
	$("input[name='readerDiv']").change(function() {
		
		var selVal = $(this).val();
		
		switch(selVal) {
			case "1" : $("#row_image").show(); $("#row_movie").hide(); break;
			case "2" : $("#row_movie").show(); $("#row_image").hide(); break;
			//case "3" : $("#row_movie").hide(); $("#row_image").hide(); break;
			default: alert("오류"); break;
		}
		
	});
	
}

function addReader() {
	
	$.ajax({
		url : "/admin/reader/readerSave",
		type : 'POST',
		data : $("#readerAddForm").serialize(true),
		dataType : "json",
		success : function(data){
			if(data.error != undefined){
				alert("에러코드 : " + data.additionalInfo.errCode + "\n" + data.message);
				return false;
			} else {
				alert("정상 저장 되었습니다.");
				location.href="/admin/reader/readerList";				
			}
		},
		error : function(e){
			if(e.status==200){
				alert("error code 정상 저장 되었습니다.");
				location.href="/admin/reader/readerList";
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
	        $("#readerAddForm").validate({                   
	            // Rules for form validation
	            rules:
	            {
	            	readerTitle:
	                {
	                    required: true
	                },
	                ir1:
	                {
	                    required: true
	                }
	            },
	                                
	            // Messages for form validation
	            messages:
	            {
	            	readerTitle:
	                {
	                    required: '읽을거리 제목을 입력해주세요.'
	                },
	                ir1:
	                {
	                    required: '내용을 입력해주세요.'
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