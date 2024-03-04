<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>조회 페이지</title>
<link rel="stylesheet" href="/resources/css/question/qsget.css">
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
</head>
<body>
<h1>조회 페이지</h1>
	<div class="input_wrap">
		<label>공지사항 번호</label>
		<input name="bno" readonly="readonly" value='<c:out value="${pageInfo.QS_BNO}"/>' >
	</div>
	<div class="input_wrap">
		<label>공지사항 제목</label>
		<input name="title" readonly="readonly" value='<c:out value="${pageInfo.QS_TITLE}"/>' >
	</div>
	<div class="input_wrap">
		<label>공지사항 내용</label>
		<textarea rows="3" name="content" readonly="readonly"><c:out value="${pageInfo.QS_CONTENT}"/></textarea>
	</div>
	<div class="input_wrap">
		<label>공지사항 작성자</label>
		<input name="writer" readonly="readonly" value='<c:out value="${pageInfo.QS_WRITER}"/>' >
	</div>
	<div class="input_wrap">
		<label>공지사항 등록일</label>
		<input name="regdate" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.QS_REGDATE}"/>' >
	</div>
	<hr>
	<span>파일 목록</span>
	<div class="form-group" style="border: 1px solid #dbdbdb;">
    	<c:forEach var="file" items="${fileList}">
        	<a href="#" onclick="fn_fileDown('${file.FILE_ID}'); return false;">
        	${file.FILE_NAME}</a>(${file.FILE_SIZE} KB)<br>
    	</c:forEach>
	</div>
	<hr>

	<div class="btn_wrap">
		<a class="btn" id="qslist_btn">목록 페이지</a> 
		<a class="btn" id="qsupdate_btn">수정 하기</a>
	</div>
	<form id="qsinfoForm" action="/question/qsupdate" method="get">
		<input type="hidden" id="QS_BNO" name="QS_BNO" value='<c:out value="${pageInfo.QS_BNO}"/>'>
		<input type="hidden" name="pageNum" value='<c:out value="${qcri.pageNum}"/>'>
        <input type="hidden" name="amount" value='<c:out value="${qcri.amount}"/>'>
        <input type="hidden" name="keyword" value="${qcri.keyword }">
        <input type="hidden" name="type" value="${qcri.type }">
	</form>
<script>
	let form = $("#qsinfoForm");
	
	// 공지사항 목록화면 이동 js 코드
	$("#qslist_btn").on("click", function(e){
		form.find("#QS_BNO").remove();
		form.attr("action", "/question/qslist");
		form.submit();
	});
	
	// 공지사항 수정화면 이동 js 코드
	$("#qsupdate_btn").on("click", function(e){
		form.attr("action", "/question/qsupdate");
		form.submit();
	});	
	
	// 공지사항 첨부파일 다운로드 js 코드
	function fn_fileDown(fileId) {
        var url = "/notice/fileDown?FILE_ID=" + fileId;
        window.location.href = url;
    }
</script>	
</body>
</html>