<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 등록</title>
<link rel="stylesheet" href="/resources/css/notice/notregistr.css">
</head>
<body>
<h1>공지사항 작성페이지</h1>

<form id="noticeForm" action="/notice/notregistr" method="post" enctype="multipart/form-data">
    <div class="input_wrap">
        <label>Title</label>
        <input name="NOTICE_TITLE">
    </div>
    <div class="input_wrap">
        <label>Content</label>
        <textarea rows="3" name="NOTICE_CONTENT"></textarea>
    </div>
    <div class="input_wrap">
        <label>Writer</label>
        <input name="NOTICE_WRITER">
    </div>
    <div id="fileIndex">
        <input type="file" name="file_1">
        <button class="fileAdd_btn" type="button">파일추가</button>	
    </div>
    <button type="submit" class="notbtn">등록</button>
</form>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
function fn_addFile(){
	var fileIndex = 1;
	//$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"<button type='button' style='float:right;' id='fileAddBtn'>"+"추가"+"</button></div>");
	$(".fileAdd_btn").on("click", function(){
		$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"</button>"+"<button type='button' style='float:right;' id='fileDelBtn'>"+"삭제"+"</button></div>");
	});
	$(document).on("click","#fileDelBtn", function(){
		$(this).parent().remove();
		
	});
}
</script>
</body>
</html>