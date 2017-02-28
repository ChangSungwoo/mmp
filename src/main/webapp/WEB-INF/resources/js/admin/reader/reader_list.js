/**
 * 읽을거리 목록용 JavaScript File
 */

$(document).ready(function() {
	App.init();
	setEvent()
});

function setEvent(){
	
	$("#btnRegist").click(function(){
		location.href="/admin/reader/readerCreate";
	});
	
}

function readerDetail(rid) {
	console.log("aaa");
	location.href="/admin/reader/readerDetail?readerSeq="+rid;
}