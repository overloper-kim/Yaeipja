<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 | Yaeipja</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<script src="${pageContext.request.contextPath}/js/jquery-3.7.1.min.js"></script>
  <style>
    *,
    *::before,
    *::after {
      box-sizing: border-box;
    }

    body {
      margin: 0;
      padding: 0;
      font-family: 'Inter', sans-serif;
      background-color: #fcfcfc;
      color: #1e1e1e;
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
    }

    .login-container {
      display: flex;
      flex-direction: column;
      align-items: center;
      width: 100%;
      padding: 20px;
    }

    .login-title {
      color: #000000;
      font-family: 'Inter', sans-serif;
      font-weight: 400;
      font-size: 36px;
      line-height: 43.57px;
      text-align: center;
      margin: 0 0 155px 0;
    }

    .login-form {
      background-color: #ffffff;
      border: 1px solid #d9d9d9;
      border-radius: 8px;
      padding: 24px;
      display: flex;
      flex-direction: column;
      gap: 24px;
      width: 100%;
      max-width: 589px;
    }

    .form-group {
      display: flex;
      flex-direction: column;
      gap: 8px;
    }

    .form-label {
      color: #1e1e1e;
      font-family: 'Inter', sans-serif;
      font-weight: 400;
      font-size: 16px;
      line-height: 22.4px;
    }

    .form-input {
      background-color: #ffffff;
      border: 1px solid #d9d9d9;
      border-radius: 8px;
      padding: 12px 16px;
      font-family: 'Inter', sans-serif;
      font-size: 16px;
      line-height: 1.5;
      color: #1e1e1e;
    }

    .form-input::placeholder {
      color: #b3b3b3;
      font-family: 'Inter', sans-serif;
      font-weight: 400;
      font-size: 16px;
      line-height: 16px;
    }

    .submit-btn {
      background-color: #2c2c2c;
      border: 1px solid #2c2c2c;
      border-radius: 8px;
      padding: 12px;
      display: flex;
      justify-content: center;
      align-items: center;
      gap: 8px;
      color: #f5f5f5;
      font-family: 'Inter', sans-serif;
      font-weight: 400;
      font-size: 16px;
      line-height: 16px;
      cursor: pointer;
      width: 100%;
    }

    .form-link {
      color: #1e1e1e;
      font-family: 'Inter', sans-serif;
      font-weight: 400;
      font-size: 16px;
      line-height: 22.4px;
      text-decoration: none;
      align-self: flex-start;
    }

    .form-link:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>
<%@ include file="../header.jsp" %>
 <main id="login-section" class="login-container">
    <h1 class="login-title">로그인</h1>
    <form class="login-form">
      <div class="form-group">
        <label for="id" class="form-label">ID</label>
        <input type="text" id="id" class="form-input" placeholder="아이디를 입력하시오.">
      </div>
      <div class="form-group">
        <label for="password" class="form-label">Password</label>
        <input type="password" id="password" class="form-input" placeholder="비밀번호를 입력하시오.">
      </div>
      <button type="submit" class="submit-btn">로그인</button>
      <a href="#" class="form-link">비밀번호찾기</a>
      <a href="#" class="form-link">회원가입</a>
    </form>
  </main>

</body>
</html>