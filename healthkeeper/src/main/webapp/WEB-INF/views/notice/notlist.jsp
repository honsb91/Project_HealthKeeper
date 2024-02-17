<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/notice/notlist.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>
<h1>목록페이지입니다.</h1>

<div class="table_wrap">
	<a href="/notice/notregistr" class="top_btn">게시판 등록</a>
	<table>
		<thead>
			<tr>
				<th class="bno_width">번호</th>
				<th class="title_width">제목</th>
				<th class="writer_width">작성자</th>
				<th class="regdate_width">작성일</th>
			</tr>
		</thead>
			<c:forEach items="${notlist}" var="list">
            	<tr>
                	<td><c:out value="${list.NOTICE_BNO}"/></td>
                	<td><c:out value="${list.NOTICE_TITLE}"/></td>
                	<td><c:out value="${list.NOTICE_WRITER}"/></td>
                	<td><fmt:formatDate pattern="yyyy/MM/dd" value="${list.NOTICE_REGDATE}"/></td>
            	</tr>
        	</c:forEach>
	</table>
</div>
<script>
	// 공지사항 등록시 알람창 js 코드
	$(document).ready(function(){
	
		let result = '<c:out value="${result}"/>';
		checkAlert(result);
		function checkAlert(result){
		
			if(result === ''){
				return;
			}
			if(result === "registr success"){
				alert("공지사항이 등록되었습니다.");
			}
		}	
	});
</script>
</body>
</html>