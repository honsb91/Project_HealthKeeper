<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/notice/notget.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>
<h1>조회 페이지</h1>
<form id="notmodifyForm" action="/notice/notmodify" method="post">
	<div class="input_wrap">
		<label>게시판 번호</label>
		<input name="NOTICE_BNO" readonly="readonly" value='<c:out value="${pageInfo.NOTICE_BNO}"/>' >
	</div>
	<div class="input_wrap">
		<label>게시판 제목</label>
		<input name="NOTICE_TITLE" value='<c:out value="${pageInfo.NOTICE_TITLE}"/>' >
	</div>
	<div class="input_wrap">
		<label>게시판 내용</label>
		<textarea rows="3" name="NOTICE_CONTENT" ><c:out value="${pageInfo.NOTICE_CONTENT}"/></textarea>
	</div>
	<div class="input_wrap">
		<label>게시판 작성자</label>
		<input name="NOTICE_WRITER" readonly="readonly" value='<c:out value="${pageInfo.NOTICE_WRITER}"/>' >
	</div>
	<div class="input_wrap">
		<label>게시판 등록일</label>
		<input name="NOTICE_REGDATE" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.NOTICE_REGDATE}"/>' >
	</div>	
	<div class="btn_wrap">
		<a class="btn" id="notlist_btn">목록 페이지</a> 
		<a class="btn" id="notmodify_btn">수정완료</a>
		<a class="btn" id="cancel_btn">수정취소</a>
	</div>
	</form>
	<form id="infoForm" action="/notice/notmodify" method="get">
		<input type="hidden" id="NOTICE_BNO" name="NOTICE_BNO" value='<c:out value="${pageInfo.NOTICE_BNO}"/>'>
	</form>
<script>
	let form = $("#infoForm");        // 페이지 이동 form(리스트 페이지 이동, 조회 페이지 이동)
	let mForm = $("#notmodifyForm");    // 페이지 데이터 수정 from

	// 목록 페이지 이동 버튼
	$("#notlist_btn").on("click", function(e){
    	form.find("#NOTICE_BNO").remove();
    	form.attr("action", "/notice/notlist");
    	form.submit();
	});

	// 수정 하기 버튼
	$("#notmodify_btn").on("click", function(e){
    	mForm.submit();
	});

	/* 취소 버튼 */
	$("#cancel_btn").on("click", function(e){
    	form.attr("action", "/notice/notget");
    	form.submit();
	}); 	
</script>	
</body>
</html>