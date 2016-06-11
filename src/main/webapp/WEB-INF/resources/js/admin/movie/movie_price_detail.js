/**
 * Admin 적정관람료 상세화면 JavaScript File
 */

$(document).ready(function() {
	App.init();
	setEvent();
	
	//getOneMoviePriceList(movieID , 'P');
	
	Validation.initValidation();
});


function setEvent(){
	
	$("#btnPriceSave").click(function(){
		if($("#priceForm").valid()) {
			console.log("valid Form");
			addMoviePrice();
			return false;
		} else {
			console.log("unvalid Form");
			//return false;
		}
	});
	
	$("#btnReviewSave").click(function(){
		console.log("리뷰 저장");
		addMovieReview();
	});
	
}


function addMoviePrice() {
	
	var movieID = getUrlParameter("movieId");
	var reviewSeq = getUrlParameter("reviewSeq");
	
	$.ajax({
		url : "/admin/movie/moviePriceSave",
		type : 'POST',
		data : $("#priceForm").serialize(true),
		dataType : "json",
		success : function(data){
			if(data.error != undefined){
				alert("에러코드 : " + data.additionalInfo.errCode + "\n" + data.message);
				return false;
			} else {
				alert("정상 저장 되었습니다.");
				location.href="/admin/movie/moviePriceDetail?movieId="+movieID+"&reviewSeq="+reviewSeq;				
			}
		},
		error : function(e){
			if(e.status==200){
				alert("error code 정상 저장 되었습니다.");
				location.href="/admin/movie/moviePriceList";
			}else{
				console.log(e);
				alert("오류가 발생했습니다. 다시 시도해 주시기 바랍니다.");
			}
		}
	});
}

function addMovieReview() {
	
	var movieID = getUrlParameter("movieId");
	var reviewSeq = getUrlParameter("reviewSeq");
	
	console.log("Review movieID : "+movieID);
	
	$.ajax({
		url : "/admin/movie/movieReviewSave",
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
				alert("정상 저장 되었습니다.");
				location.href="/admin/movie/moviePriceDetail?movieId="+movieID+"&reviewSeq="+reviewSeq;
			}
		},
		error : function(e){
			if(e.status==200){
				alert("error code 정상 저장 되었습니다.");
				location.href="/admin/movie/moviePriceList";
			}else{
				console.log(e);
				alert("오류가 발생했습니다. 다시 시도해 주시기 바랍니다.");
			}
		}
	});
}

function getOneMoviePriceList(id , div) {
	
	$.ajax({
		url : "/admin/movie/oneMoviePriceList?movieId="+id+"&priceDiv="+div,
		type : 'GET',
		dataType : "json",
		success : function(data){
			console.log("error : "+data.error);
			if(data.error != undefined){
				alert("에러코드 : " + data.additionalInfo.errCode + "\n" + data.message);
				return false;
			} else {
				//alert("정상 저장 되었습니다.");
				//location.href="/admin/movie/moviePriceList";
				alert(data.length);
			}
		},
		error : function(e){
			if(e.status==200){
				alert("error code 정상 저장 되었습니다.");
				//location.href="/admin/movie/moviePriceList";
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

