/**
 * Front 영화 상세보기 화면용 JavaScript File
 */

$(document).ready(function() {
	App.init();
	setEvent();
	
	var inputMode = getUrlParameter("inputMode");
	var movieId = getUrlParameter("movieId");
	var reviewSeq = getUrlParameter("reviewSeq");
	
	console.log("movieId : "+movieId);
	console.log("inputMode : "+inputMode);
	
	if(reviewSeq == null) {
		$("#priceInput").hide();
		$("#reviewPPrice").hide();
		$("#reviewNPrice").hide();
	}
	
	Validation.initValidation();
	
	$("#reviewForm").find("#movieId").val(movieId);
	$("#priceForm").find("#movieId").val(movieId);
	
	
	$("#btnPriceModify").hide();
	$("#btnChange").hide();
	
	$("[id=pCommentYn]").hide();
	$("[id=nCommentYn]").hide();
	
	$("#mode").val("I");
	
	
	
	if(inputMode != undefined) {
		
		$('input:radio[name="priceDiv"]').each(function(){
		     if(this.value == inputMode){
		        this.checked = true;
		     }
		});
		
		
		$("#priceComment").focus();
	}
	
});

function setEvent(){

	/*
	$(document).on("click", "[id=btnSearchMovie]", function(){
		$("#responsive").modal();
	});
	*/
	
	$("#btnReviewSave").click(function(){
		addMovieReview();
	});
	
	$("#btnPriceSave").click(function(){
		if($("#priceForm").valid()) {
			addMoviePrice();
			return false;
		} else {
			console.log("unvalid Form");
			//return false;
		}
	});
	
}

function addMovieReview() {
	
	var movieID = getUrlParameter("movieId");
	
	console.log("Review movieID : "+movieID);
	
	$.ajax({
		url : "/review/movieReviewSave",
		type : 'POST',
		data : $("#reviewForm").serialize(true),
		dataType : "json",
		success : function(data){
			console.log("errNo : "+data.error);
			if(data.error != undefined){
				console.log("Error?");
				alert("에러코드 : " + data.additionalInfo.errCode + "\n" + data.message);
				return false;
			} else {
				alert("영화 감상평이 정상적으로 등록되었습니다. 적정관람료를 등록해주세요.");
				location.href="/review/reviewWrite?movieId="+movieID+"&reviewSeq="+data.reviewSeq;
			}
		},
		error : function(e){
			if(e.status==200){
				alert("error code 정상 저장 되었습니다.");
				location.href="/";
			}else{
				console.log(e);
				alert("오류가 발생했습니다. 다시 시도해 주시기 바랍니다.");
			}
		}
	});
}

function addMoviePrice() {
	
	var movieID = getUrlParameter("movieId");
	var reviewSeq = getUrlParameter("reviewSeq");
	
	$.ajax({
		url : "/review/moviePriceSave",
		type : 'POST',
		data : $("#priceForm").serialize(true),
		dataType : "json",
		success : function(data){
			if(data.error != undefined){
				alert("에러코드 : " + data.additionalInfo.errCode + "\n" + data.message);
				return false;
			} else {
				//alert("정상 저장 되었습니다.");
				location.href="/review/reviewWrite?movieId="+movieID+"&reviewSeq="+reviewSeq+"&inputMode="+data.inputMode;				
			}
		},
		error : function(e){
			if(e.status==200){
				alert("error code 정상 저장 되었습니다.");
				location.href="/admin/review/moviePriceList";
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
	        $("#priceForm").validate({                   
	            // Rules for form validation
	            rules:
	            {
	            	priceComment:
	                {
	                    required: true
	                }
	            },
	                                
	            // Messages for form validation
	            messages:
	            {
	            	priceComment:
	                {
	                    required: '적정관람료 코멘트를 입력해 주세요.'
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

function getUrlParameter(sParam)
{
    var sPageURL = window.location.search.substring(1);
    var sURLVariables = sPageURL.split('&');
    for (var i = 0; i < sURLVariables.length; i++) 
    {
        var sParameterName = sURLVariables[i].split('=');
        if (sParameterName[0] == sParam) 
        {
            return sParameterName[1];
        }
    }
}