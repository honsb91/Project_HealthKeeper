<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/patient/login.css">
<!-- 부트스트랩 CDN -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet">
<!-- 폰트어썸 CDN -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
</head>
<body>
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
<body>
<section class="vh-100">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col col-xl-10">
        <div class="card" style="border-radius: 1rem;">
          <div class="row g-0">
            <div class="col-md-6 col-lg-5 d-none d-md-block">
              <img src="/resources/assets/img/login.jpg" alt="login form" class="img-fluid login-image" style="border-radius: 1rem 0 0 1rem;" />
            </div>
            <div class="col-md-6 col-lg-7 d-flex align-items-center">
              <div class="card-body p-4 p-lg-5 text-black">
                <form id="login_form" method="post">
                  <div class="d-flex align-items-center mb-3 pb-1">
                    <i class="fas fa-cubes fa-2x me-3" style="color: #00ced1;"></i>
                    <span class="h1 fw-bold mb-0">환자 로그인</span>
                  </div>
                  <div class="form-outline mb-4">
                    <input type="text" name="patient_id" class="form-control form-control-lg" />
                    <label class="form-label" for="form2Example17">아이디</label>
                  </div>

                  <div class="form-outline mb-4">
                    <input type="password" name="patient_pw" class="form-control form-control-lg" />
                    <label class="form-label" for="form2Example27">비밀번호</label>
                  </div>
                  
                  <div class="pt-1 mb-4">
    <button class="btn btn-login btn-lg btn-block" name="login_button" type="button">Login</button>
</div>
                  
                  <a id="kakao-login-btn" href="#" onclick="loginWithKakao()">
        				<img alt="카카오로그인" src="/resources/img/kakao.png">
    			  </a>
    			  <a id="naver-login-btn" href="#" onclick="loginWithNaver()">
        				<img alt="네이버로그인" src="/resources/img/naver.png">
    			  </a>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
</body>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</html>