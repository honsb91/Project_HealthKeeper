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
<div id="notice_header" class="notice_header"> 
	<p class="nh_title">
		<span class="blind">HealthKeeper 공지사항입니다.</span>
	</p> 
</div>

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
                	<td>
                		<a class="move" href='<c:out value="${list.NOTICE_BNO}"/>'>
        					<c:out value="${list.NOTICE_TITLE}"/>
    					</a>
                    </td>
                	<td><c:out value="${list.NOTICE_WRITER}"/></td>
                	<td><fmt:formatDate pattern="yyyy/MM/dd" value="${list.NOTICE_REGDATE}"/></td>
            	</tr>
        	</c:forEach>
	</table>
	<!-- 번호페이지 구현 -->
	<div class="pageInfo_wrap" >
        <div class="pageInfo_area">
        	<ul id="pageInfo" class="pageInfo">
        	<!-- 이전페이지 버튼 -->
                <c:if test="${npageMake.prev}">
                    <li class="pageInfo_btn previous"><a href="${npageMake.startPage-1}">이전</a></li>
                </c:if>
 			<!-- 각 번호 페이지 버튼 -->
                <c:forEach var="num" begin="${npageMake.startPage}" end="${npageMake.endPage}">
                	<li class="pageInfo_btn ${npageMake.ncri.pageNum == num ? "active":"" }"><a href="${num}">${num}</a></li>
                </c:forEach>
             <!-- 다음페이지 버튼 -->
                <c:if test="${npageMake.next}">
                    <li class="pageInfo_btn next"><a href="${npageMake.endPage + 1 }">다음</a></li>
                </c:if> 
            </ul>
        </div>
    </div>
	<form id="moveForm" method="get">
		<input type="hidden" name="pageNum" value="${npageMake.ncri.pageNum }">
        <input type="hidden" name="amount" value="${npageMake.ncri.amount }">     
    </form>
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
			
			if(result === "notmodify success"){
	            alert("수정이 완료되었습니다.");
	        }
			
			if(result === "notdelete success"){
	            alert("삭제가 완료되었습니다.");
	        }
		}	
	});
	
	// 공지사항 목록페이지 이동 js 코드
	let moveForm = $("#moveForm");
	 
    $(".move").on("click", function(e){
        e.preventDefault();
//         moveForm.empty();
        
        moveForm.append("<input type='hidden' name='NOTICE_BNO' value='"+ $(this).attr("href")+ "'>");
        moveForm.attr("action", "/notice/notget");
        moveForm.submit();
    });
    
    // 페이지 이동 js 코드
    $(".pageInfo a").on("click", function(e){
 
        e.preventDefault();
        moveForm.find("input[name='pageNum']").val($(this).attr("href"));
        moveForm.attr("action", "/notice/notlist");
        moveForm.submit();
        
    });
</script>
</body>
</html>