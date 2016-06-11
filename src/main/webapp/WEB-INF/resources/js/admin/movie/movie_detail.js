/**
 * 
 */
$(document).ready(function() {
	App.init();
	Datepicker.initDatepicker();
	Validation.initValidation();
	
	setEvent();
});

function setEvent(){
	
	$("#btnModify").click(function(){
		
		if($("#movieEditForm").valid()) {
			console.log("valid Form");
			modifyMovie();
			//return false;
		} else {
			console.log("unvalid Form");
			//return false;
		}

	});
}

function modifyMovie() {
	
	$.ajax({
		url : "/admin/movie/movieModifySave",
		type : 'POST',
		data : $("#movieEditForm").serialize(true),
		dataType : "json",
		success : function(data){
			if(data.error != undefined){
				alert("에러코드 : " + data.additionalInfo.errCode + "\n" + data.message);
				return false;
			} else {
				alert("영화 정보가 정상적으로 수정되었습니다.");
				location.href="/admin/movie/movieList";				
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
	        $("#movieEditForm").validate({                   
	            // Rules for form validation
	            rules:
	            {
	                movieTitle:
	                {
	                    required: true
	                },
	                releaseDt:
	                {
	                    required: true,
	                    date: true
	                },
	                creDt:
	                {
	                    required: true,
	                    date: true
	                }
	            },
	                                
	            // Messages for form validation
	            messages:
	            {
	                movieTitle:
	                {
	                    required: '영화 제목을 입력해주세요.'
	                },
	               releaseDt:
	                {
	                    required: '개봉일을 입력해주세요.'
	                },
	               creDt:
	                {
	                    required: '실제 데이터 등록일자는 빈값을 입력할 수 없습니다.'
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

var Datepicker = function () {

    return {
        
        //Datepickers
        initDatepicker: function () {
	        // Regular datepicker
	        $('#releaseDt').datepicker({
	            dateFormat: 'yy-mm-dd',
	            prevText: '<i class="fa fa-angle-left"></i>',
	            nextText: '<i class="fa fa-angle-right"></i>'
	        });
	        
	        // Regular datepicker
	        $('#creDt').datepicker({
	            dateFormat: 'yy-mm-dd',
	            prevText: '<i class="fa fa-angle-left"></i>',
	            nextText: '<i class="fa fa-angle-right"></i>'
	        });
	        
        }

    };
}();