<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<link rel="stylesheet" href="/resources/css/main.css">
<!-- navbar drop 메뉴 해주는 js -->
<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <div class="container px-5">
                    <a class="navbar-brand" href="/main">Health KeePer</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                         <!-- 로그인 하지 않은 상태 -->
                            <c:if test="${ member == null }">
                            	<li class="nav-item"><a class="nav-link" href="<c:url value='/question/qslist'/>">질문게시판</a></li>
                            	<li class="nav-item"><a class="nav-link" href="contact.html">통계</a></li>
                            	<li class="nav-item"><a class="nav-link" href="<c:url value='/notice/notlist'/>">공지사항</a></li>
                            	<li class="nav-item"><a class="nav-link" href="<c:url value='/faq/faqlist'/>">FAQ</a></li>
                            	<li class="nav-item"><a class="nav-link" href="<c:url value='/member/login'/>">로그인</a></li>
                            	<li class="nav-item"><a class="nav-link" href="<c:url value='/member/join'/>">회원가입</a></li>
                            </c:if>
                            
                         <!-- 로그인한 상태 -->
							<c:if test="${member != null }">
    							<li class="nav-item"><a class="nav-link" href="<c:url value='/question/qslist'/>">질문게시판</a></li>
    							<li class="nav-item"><a class="nav-link" href="contact.html">통계</a></li>
    							<li class="nav-item"><a class="nav-link" href="<c:url value='/notice/notlist'/>">공지사항</a></li>
    							<li class="nav-item"><a class="nav-link" href="<c:url value='/faq/faqlist'/>">FAQ</a></li>
    							<li class="nav-item"><span class="nav-link">[ ${member.NAME}님 반갑습니다. ]</span></li>
							</c:if>
                         </ul>
                    </div>
                </div>
            </nav>
</body>
</html>