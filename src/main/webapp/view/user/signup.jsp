<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 - 야놀자</title>
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
				<h1>회원가입</h1>
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
					<div class="login-input-layout">
						<label for="login-repw-input"> 비밀번호 재확인: </label> <input
							id="login-repw-input" name="login-pw-input" type="password"
							placeholder="입력한 비밀번호를 재입력하세요." />
					</div>
					<div class="login-input-layout">
						<label for="login-pw-input"> 전화번호: </label> <input
							id="login-pw-input" name="login-pw-input" type="password"
							placeholder="전화번호를 입력하세요." />
					</div>
					<div class="check-sex">
						남성: <input type="radio" name="sex" value="male">
						여성: <input type="radio" name="sex" value="femail">
					</div>
					<div class="submit-btn-info">
						<button class="login-btn">회원가입</button>
					</div>
				</form>
			</section>
		</div>
	</main>
	<%@ include file="../footer.jsp"%>
</body>
</html>