<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/notice/notregistr.css">
</head>
<body>
<h1>공지사항 작성페이지</h1>

<form action="/notice/notregistr" method="post">
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
    <button class="notbtn">등록</button>
</form>
</body>
</html>