<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/faq/faqlist.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
    integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
    crossorigin="anonymous"></script>
</head>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<body>
<a href="/faq/faqregistr">게시판 등록</a>
    <%-- <form action="/faq/faqregistr" method="post">
        <div id="faq">
            <h2>FAQ</h2>
            <ol class="qna-list accordion">
                <c:forEach items="${faqList}" var="faq">
                    <li class="qna-item">
                        <div class="question-article">
                            <a href="#!" class="question btn-fold"> <strong class="blind">질문:</strong>
                                <span class="q">Q</span><c:out value="${faq.question}"/>
                            </a>
                        </div>
                        <div class="answer-article">
                            <strong class="blind">답변</strong>
                            <div id="answer-cnt">
                                <p><c:out value="${faq.answer}"/></p>
                            </div>
                        </div>
                    </li>
                </c:forEach>
            </ol>
        </div>
    </form> --%>
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
    
    // 알람 js 코드
    $(document).ready(function(){
        
        let result = '<c:out value="${result}"/>';
        checkAlert(result);
        function checkAlert(result){
            if(result === ''){
                return;
            }
            if(result === "faqregistr success"){
                alert("FAQ 게시글이 등록되었습니다.");
            }
        }
    });
</script>
</body>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</html>