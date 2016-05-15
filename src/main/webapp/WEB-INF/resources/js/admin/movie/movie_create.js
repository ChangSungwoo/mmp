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
	
	$("#btnSave").click(function(){
		if($("#movieAddForm").valid()) {
			console.log("valid Form");
			addMovie();
			//return false;
		} else {
			console.log("unvalid Form");
			//return false;
		}
	});
}

function addMovie() {
	
	$.ajax({
		url : "/admin/movie/movieSave",
		type : 'POST',
		data : $("#movieAddForm").serialize(true),
		dataType : "json",
		success : function(data){
			alert(data.error);
			if(data.error != undefined){
				alert("에러코드 : " + data.additionalInfo.errCode + "\n" + data.message);
				return false;
			} else {
				alert("정상 저장 되었습니다.");
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
	        $("#movieAddForm").validate({                   
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
	        
        }

    };
}();