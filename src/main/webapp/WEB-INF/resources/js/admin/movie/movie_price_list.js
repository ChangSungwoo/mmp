/**
 * Admin 적정관람료 목록조회화면 JavaScript File
 */

$(document).ready(function() {
	App.init();
	setEvent()
});

function setEvent(){

}

function moviePriceDetail(mid , rid) {
	location.href="/admin/movie/moviePriceDetail?movieId="+mid+"&reviewSeq="+rid;
}