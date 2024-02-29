<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문게시판</title>
</head>
<body>
<form action="/question/qsregistr" method="post">
	<div class="input_wrap">
		<label>제목</label>
		<input name="QS_TITLE">
	</div>
	<div class="input_wrap">
		<label>내용</label>
		<textarea rows="3" name="QS_CONTENT"></textarea>
	</div>
	<div class="input_wrap">
		<label>작성자</label>
		<input name="QS_WRITER">
	</div>
	<button class="qsbtn">등록</button>
</form>
</body>
</html>