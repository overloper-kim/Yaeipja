<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 - 야입자</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/reset.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/user/login.css">
<script src="${pageContext.request.contextPath}/js/jquery-3.7.1.min.js"></script>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<main>
		<div class="login-layout">
			<section class="login-title">
				<h1>로그인</h1>
			</section>
			<hr>
			<section class="wrap-login-form">
				<form class="login-form">
					<div class="login-input-layout">
						<label for="login-id-input"> 아이디: </label> <input
							id="login-id-input" name="login-id-input" type="text"
							placeholder="아이디를 입력하세요." />
					</div>
					<div class="login-input-layout">
						<label for="login-pw-input"> 비밀번호: </label> <input
							id="login-pw-input" name="login-pw-input" type="password"
							placeholder="비밀번호를 입력하세요." />
					</div>
					<div class="submit-btn-info">
						<button class="login-btn">로그인</button>
						<div class="login-info">
							<a>비밀번호 찾기</a>
							<a href="/signup">회원가입</a>
						</div>
					</div>
				</form>
			</section>
		</div>
	</main>
	<%@ include file="../footer.jsp" %>
</body>
</html>