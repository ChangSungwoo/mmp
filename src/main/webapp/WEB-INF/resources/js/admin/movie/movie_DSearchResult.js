/**
 * 
 */
$(document).ready(function() {
	App.init();	
	setEvent();
});

function setEvent(){
	
	//이동 버튼 선택시
	$("[id=btnMove]").click(function(){
		var idx = $("[id=btnMove]").index(this);
		
		//$(location).attr("href",$("[id=tmpLink]").eq(idx).val()).attr("target","_blank");
		window.open($("[id=tmpLink]").eq(idx).val(),"","");
	});
	
	
	//등록 버튼 선택시
	$("[id=btnSave]").click(function(){
		var i = $("[id=btnSave]").index(this);
		
		$("#movieTitle").val($("[id=tmpTitle]").eq(i).val());
		$("#movieEngTitle").val($("[id=tmpEngTitle]").eq(i).val().trim());
		$("#releaseDt").val($("[id=tmpDate]").eq(i).val());
		$("#directorText").val($("[id=tmpDirector]").eq(i).val());
		$("#actorText").val($("[id=tmpActor]").eq(i).val());
		
		if($("#releaseDt").val()=="") {
			alert("개봉일이 등록되지 않은 영화라 영화 정보 등록이 불가능합니다.");
		} else if($("#releaseDt").val()=="") {
			alert("개봉일이 등록되지 않은 영화라 영화 정보 등록이 불가능합니다.");
		} else {
			addMovie();
		}
	});
	
}

function addMovie() {
	$.ajax({
		url : "/admin/movie/movieSave",
		type : 'POST',
		data : $("#hForm").serialize(true),
		dataType : "json",
		success : function(data){
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

if ( ! String.prototype.trim ){ 
    String.prototype.trim = function(){
        return this.replace( /^[\s\uFEFF\u00A0]+|[\s\uFEFF\u00A0]+$/g , "" ); 
    }; 
} 