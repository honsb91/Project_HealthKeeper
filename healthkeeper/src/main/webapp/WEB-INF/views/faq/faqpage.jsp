<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 목록</title>
<link rel="stylesheet" href="/resources/css/faq/faqlist.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
    integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
    crossorigin="anonymous"></script>
</head>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<body>
<a href="/faq/faqregistr">게시판 등록</a>
    <form action="/faq/faqregistr" method="post">
        <div id="faq">
            <h2>FAQ</h2>
            <ol class="qna-list accordion">
                <c:forEach items="${faqlist}" var="faq">
                    <li class="qna-item">
                        <div class="question-article">
                            <a href="#!" class="question btn-fold"> <strong class="blind">질문:</strong>
                                <span class="q">Q</span><c:out value="${faq.TITLE}"/>
                            </a>
                        </div>
                        <div class="answer-article">
                            <strong class="blind">답변</strong>
                            <div id="answer-cnt">
                                <p><c:out value="${faq.CONTENT}"/></p>
                            </div>
                        </div>
                        <!-- 수정 버튼 -->
                        <div>
                            <c:url var="updateUrl" value="/faq/faqupdate">
    <c:param name="faq_Id" value="${faq.FAQ_ID}" />
</c:url>
<a href="${updateUrl}" class="edit-button">수정</a>
                            <!-- 취소 버튼 -->
                            <button type="button" class="cancel-button">취소</button>
                        </div>
                    </li>
                </c:forEach>
            </ol>
        </div>
    </form>
<script>
// 글 목록을 접었다 폈다 하는 js코드
  $(function() {
    $('.btn-fold').on(
      'click',
      function() {
      if(!$(this).closest('.qna-item').hasClass('on')) {
       	                $('.qna-item').removeClass('on')
                        .find('.answer-article').hide();
                        var oft = $(this).offset().top;
                        $('html,body').stop().animate({
                        scrollTop : oft - 250
                        }, 300)
                        $(this).closest('.qna-item').addClass('on').find(
                        '.answer-article').slideDown(300)

                    } else {
                        $(this).closest('.qna-item').removeClass('on').find(
                                '.answer-article').slideUp(300)
                    }
                })
    });

// 취소 버튼 클릭 시 이벤트 처리
$('.cancel-button').on('click', function() {
    // 현재 페이지에 대한 처리 (예: 경고 메시지 표시 등)
    alert('수정 취소됨');
    // 추가적인 처리 (예: 이전 페이지로 이동)
    // window.history.back();
});
</script>
</body>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</html>