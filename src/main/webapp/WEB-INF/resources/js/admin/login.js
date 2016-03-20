/**
 * Admin Login 화면용 JavaScript File
 */

$(document).ready(function() {
	App.init();
	setEvent();
});

function setEvent(){
	// 로그인 버튼 클릭
	$("#btnLogin").click(function(){
		location.href="/admin/movie/movieList";
	});
}
