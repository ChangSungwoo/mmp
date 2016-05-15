/**
 * Admin 영화 목록조회화면 JavaScript File
 */

$(document).ready(function() {
	App.init();
	setEvent()
});

function setEvent(){
	
	// 영화 신규 등록
	$("button[id=btnRegist]").click(function(){
		location.href="/admin/movie/createMovie";
		
	});
	
}

function movieDetail(mid) {
	location.href="/admin/movie/movieDetail";
}


