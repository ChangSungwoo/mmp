/**
 * Front 영화 상세보기 화면용 JavaScript File
 */

$(document).ready(function() {
	App.init();
	setEvent();
});

function setEvent(){
	
	var inputMode = getUrlParameter("inputMode");
	var movieId = getUrlParameter("movieId");
	var reviewSeq = getUrlParameter("reviewSeq");
	
	
	$("#btnModify").click(function(){
		console.log("movieId : "+movieId);
		console.log("reviewSeq : "+reviewSeq);
		location.href="/review/reviewWrite?movieId="+movieId+"&reviewSeq="+reviewSeq;
	});
	
}

function goLoginPage() {
	
	alert("공감이나 다른의견을 쓰시려면 로그인이 필요합니다.");
	var currentUrl = jQuery(location).attr('pathname')+jQuery(location).attr('search');
	
	console.log("currentUrl : "+currentUrl);
	
	location.href="/member/login?returnUrl="+currentUrl;
}

function reviewRecommend(recommDiv) {
	$("#recommFrm").find("#recommDiv").val(recommDiv);
	
	console.log("recommDiv : "+recommDiv);
	
	if(recommDiv == '1') {
		addRecomm();
	} else if(recommDiv == '2') {
		location.href="/review/checkUserReviewStatus?movieId="+$("#recommFrm").find("#movieId").val();
		
	} else {
		alert("오류 발생");
	}
	
	
}

function addRecomm() {
	
	$.ajax({
		url : "/review/reviewRecomm",
		type : 'POST',
		data : $("#recommFrm").serialize(true),
		dataType : "json",
		success : function(data){
			console.log("errNo : "+data.error);
			
			//console.log("errcode : "+data.error.indexOf("IDX_MOVIE_RECOMM_01"));
			
			if(data.error != undefined){
				if(data.error.indexOf("IDX_MOVIE_RECOMM_01") > 0) {
					alert("이미 추천하셨습니다.");
				}
				console.log("Error?");
				alert("에러코드 : " + data.additionalInfo.errCode + "\n" + data.message);
				return false;
			} else {
				alert("해당 감상평 및 적정관람료에 공감하셨습니다.");
			}
		},
		error : function(e){
			if(e.status==200){
				alert("error code 정상 저장 되었습니다.");
			}else{
				console.log(e);
				alert("오류가 발생했습니다. 다시 시도해 주시기 바랍니다.");
			}
		}
	});
}

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
