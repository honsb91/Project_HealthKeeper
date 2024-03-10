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
    <div id="faq">
        <h2>FAQ</h2>
        <ol class="qna-list accordion">
            <c:forEach items="${faqlist}" var="faq">
                <li class="qna-item">
                    <div class="question-article">
                        <a href="#" class="question btn-fold">
                            <strong class="blind">질문:</strong>
                            <span class="q">Q</span><c:out value="${faq.TITLE}"/>
                        </a>
                    </div>
                    <div class="answer-article">
                        <strong class="blind">답변</strong>
                        <div id="answer-cnt_${faq.FAQ_ID}">
                            <p><c:out value="${faq.CONTENT}"/></p>
                        </div>
                        <form id="editForm_${faq.FAQ_ID}" style="display: none;" action="/faq/faqupdate" method="post">
                            <input type="hidden" name="FAQ_ID" value="${faq.FAQ_ID}"/>
                            <textarea name="editedContent"></textarea>
                            <button type="submit">저장</button>
                        </form>
                        <button onclick="editAnswer('${faq.FAQ_ID}')">수정</button>
                        <button onclick="cancelEdit('${faq.FAQ_ID}')">취소</button>
                    </div>
                </li>
            </c:forEach>
        </ol>
    </div>
<script>
// 글 목록을 접었다 폈다 하는 js코드
$(function() {
    $('.btn-fold').on('click', function() {
        var $qnaItem = $(this).closest('.qna-item');
        if (!$qnaItem.hasClass('on')) {
            $('.qna-item').removeClass('on').find('.answer-article').hide();
            var offsetTop = $(this).offset().top;
            $('html,body').stop().animate({
                scrollTop : offsetTop - 250
            }, 300)
            $qnaItem.addClass('on').find('.answer-article').slideDown(300);
        } else {
            $qnaItem.removeClass('on').find('.answer-article').slideUp(300);
        }
    });
});

function editAnswer(faqId) {
    var answerCnt = document.getElementById("answer-cnt_" + faqId);
    var editForm = document.getElementById("editForm_" + faqId);
    var currentContent = answerCnt.innerText.trim();

    // Set the current content in textarea
    editForm.querySelector("textarea").value = currentContent;

    // Hide answer content, display edit form
    answerCnt.style.display = "none";
    editForm.style.display = "block";
}

function cancelEdit(faqId) {
    var answerCnt = document.getElementById("answer-cnt_" + faqId);
    var editForm = document.getElementById("editForm_" + faqId);

    // Hide edit form, display answer content
    answerCnt.style.display = "block";
    editForm.style.display = "none";
}
</script>
</body>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</html>