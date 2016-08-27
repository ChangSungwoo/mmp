/**
 * Admin 적정관람료 상세화면 JavaScript File
 */

$(document).ready(function() {
	App.init();
	setEvent();
	
	Validation.initValidation();
	
	
	$("#btnPriceModify").hide();
	$("#btnChange").hide();
	
	$("[id=pCommentYn]").hide();
	$("[id=nCommentYn]").hide();
	
	$("#mode").val("I");
	
	var inputMode = getUrlParameter("inputMode");
	
	console.log("inputMode : "+inputMode);
	
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
	
	$("#btnPriceSave").click(function(){
		if($("#priceForm").valid()) {
			addMoviePrice();
			return false;
		} else {
			console.log("unvalid Form");
			//return false;
		}
	});
	
	$("#btnPriceModify").click(function(){
		console.log("적정관람료 수정");
		updateMoviePrice();
		//alert("준비중입니다.");
	});
	
	
	$("#btnReviewSave").click(function(){
		console.log("리뷰 저장"+oEditors.getById["ir1"].getIR());
		$("#ir1").val(oEditors.getById["ir1"].getIR());
		addMovieReview();
	});
	
	$("#btnReviewEdit").click(function(){
		console.log("리뷰 수정"+oEditors.getById["ir1"].getIR());
		$("#ir1").val(oEditors.getById["ir1"].getIR());
		updateMovieReview();
	});
	
	$("#btnChange").click(function(){
		var movieID = getUrlParameter("movieId");
		var reviewSeq = getUrlParameter("reviewSeq");
		
		location.href="/admin/review/moviePriceDetail?movieId="+movieID+"&reviewSeq="+reviewSeq;
		
	});
	
}


function addMoviePrice() {
	
	var movieID = getUrlParameter("movieId");
	var reviewSeq = getUrlParameter("reviewSeq");
	
	$.ajax({
		url : "/admin/review/moviePriceSave",
		type : 'POST',
		data : $("#priceForm").serialize(true),
		dataType : "json",
		success : function(data){
			if(data.error != undefined){
				alert("에러코드 : " + data.additionalInfo.errCode + "\n" + data.message);
				return false;
			} else {
				//alert("정상 저장 되었습니다.");
				location.href="/admin/review/moviePriceDetail?movieId="+movieID+"&reviewSeq="+reviewSeq+"&inputMode="+data.inputMode;				
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

function updateMoviePrice() {
	
	var movieID = getUrlParameter("movieId");
	var reviewSeq = getUrlParameter("reviewSeq");
	
	$.ajax({
		url : "/admin/review/moviePriceModify",
		type : 'POST',
		data : $("#priceForm").serialize(true),
		dataType : "json",
		success : function(data){
			if(data.error != undefined){
				alert("에러코드 : " + data.additionalInfo.errCode + "\n" + data.message);
				return false;
			} else {
				alert("정상 저장 되었습니다.");
				location.href="/admin/review/moviePriceDetail?movieId="+movieID+"&reviewSeq="+reviewSeq;				
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

function addMovieReview() {
	
	var movieID = getUrlParameter("movieId");
	//var reviewSeq = getUrlParameter("reviewSeq");
	
	console.log("Review movieID : "+movieID);
	
	$.ajax({
		url : "/admin/review/movieReviewSave",
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
				alert("영화 감상평이 정상적으로 등록되었습니다.");
				alert(data.reviewSeq);
				location.href="/admin/review/moviePriceDetail?movieId="+movieID+"&reviewSeq="+data.reviewSeq;
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

function moveComment(location, seq) {
	var msg = "";
	
	if(location == 'P') {
		msg="인상가격";
	} else {
		msg="인하가격";
	}
	
	var cfm = confirm("해당 적정관람료를 "+msg+" 방향으로 옮기시겠습니까?");
	var frm = $("form#frmMovePriceCmt");
	
	if(cfm) {
		$("#tmpPriceDiv").val(location);
		$("#tmpMoviePriceSeq").val(seq);
		updatePriceDiv();
		
	} else {
		console.log("이동하지 말자...");
		return false;
	}
}

function removeComment(seq) {
	
	var cfm = confirm("해당 적정관람료를 삭제하시겠습니까?");
	var frm = $("form#frmMovePriceCmt");
	
	if(cfm) {
		$("#tmpMoviePriceSeq").val(seq);
		updateUseYn();
		
	} else {
		console.log("삭제하지 말자...");
		return false;
	}
}

function modifyComment(seq , priceDiv, idx) {
	
	/*Button Control*/
	$("#btnPriceModify").show();
	$("#btnChange").show();
	$("#btnPriceSave").hide();
	
	/* Filed Control*/
	$("#mode").val("E");
	$("#moviePriceSeq").val(seq);
	
	$('input:radio[name="priceDiv"]').each(function(){
	     if(this.value == priceDiv){
	        this.checked = true;
	     }
	});
	
	if(priceDiv == 'P') {
		
		$("#priceComment").val($("[id=pComment]").eq(idx).text());
		
		if($("[id=pCommentYn]").eq(idx).text() == 'Y') {
			$("#price").val(0);
			$("#commentYn").attr("checked", true);
		} else {
			$("#price").val($("[id=pPrice]").eq(idx).text().trim().substring(1,$("[id=pPrice]").eq(idx).text().trim().length-1));
			$("#commentYn").attr("checked", false);
		}
		
	} else {
		
		$("#priceComment").val($("[id=nComment]").eq(idx).text());
		
		if($("[id=nCommentYn]").eq(idx).text() == 'Y') {
			$("#price").val(0);
			$("#commentYn").attr("checked", true);
		} else {
			$("#price").val($("[id=nPrice]").eq(idx).text().trim().substring(1,$("[id=nPrice]").eq(idx).text().trim().length-1));
			$("#commentYn").attr("checked", false);
		}
	}
	
}


function updatePriceDiv() {
	
	var movieID = getUrlParameter("movieId");
	var reviewSeq = getUrlParameter("reviewSeq");

	
	$.ajax({
		url : "/admin/review/commentMove",
		type : 'POST',
		data : $("#frmMovePriceCmt").serialize(true),
		dataType : "json",
		success : function(data){
			if(data.error != undefined){
				console.log("Error?");
				alert("에러코드 : " + data.additionalInfo.errCode + "\n" + data.message);
				return false;
			} else {
				alert("적정관람료가 정상적으로 이동되었습니다.");
				location.href="/admin/review/moviePriceDetail?movieId="+movieID+"&reviewSeq="+reviewSeq;
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

function updateUseYn() {
	
	var movieID = getUrlParameter("movieId");
	var reviewSeq = getUrlParameter("reviewSeq");

	
	$.ajax({
		url : "/admin/review/commentRemove",
		type : 'POST',
		data : $("#frmMovePriceCmt").serialize(true),
		dataType : "json",
		success : function(data){
			if(data.error != undefined){
				console.log("Error?");
				alert("에러코드 : " + data.additionalInfo.errCode + "\n" + data.message);
				return false;
			} else {
				alert("적정관람료가 정상적으로 삭제되었습니다.");
				location.href="/admin/review/moviePriceDetail?movieId="+movieID+"&reviewSeq="+reviewSeq;
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

function updateMovieReview() {
	
	var movieID = getUrlParameter("movieId");
	var reviewSeq = getUrlParameter("reviewSeq");

	
	$.ajax({
		url : "/admin/review/modifyReview",
		type : 'POST',
		data : $("#reviewForm").serialize(true),
		dataType : "json",
		success : function(data){
			
			console.log("aaaa"+data.error);
			
			if(data.error != undefined){
				console.log("Error?");
				alert("에러코드 : " + data.additionalInfo.errCode + "\n" + data.message);
				return false;
			} else {
				alert("영화 감상평이 정상적으로 수정되었습니다.");
				location.href="/admin/review/moviePriceDetail?movieId="+movieID+"&reviewSeq="+reviewSeq;
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

function getOneMoviePriceList(id , div) {
	
	$.ajax({
		url : "/admin/review/oneMoviePriceList?movieId="+id+"&priceDiv="+div,
		type : 'GET',
		dataType : "json",
		success : function(data){
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

