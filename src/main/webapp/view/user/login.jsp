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
				<form class="login-form" onsubmit="return validateLogin()">
					<div class="login-input-layout">
						<label for="id"> 아이디: </label> <input
							id="id" name="id" type="text"
							placeholder="아이디를 입력하세요." />
					</div>
					<div class="login-input-layout">
						<label for="pw"> 비밀번호: </label> <input
							id="pw" name="pw" type="password"
							placeholder="비밀번호를 입력하세요." />
					</div>
					<div class="submit-btn-info">
						<button type="submit" class="login-btn">로그인</button>
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
	<script>		
		function validateLogin() {
			const id = document.getElementById("id").value;
			const pw = document.getElementById("pw").value;
			
			if(id.trim() == "") {
				alert("아이디가 공백입니다.");
				return false;
			}
			
			if(pw.trim() == "") {
				alert("비밀번호가 공백입니다.");
				return false;
			}
			
			$.ajax({
				url: '/login',
				type: 'POST',
				data: {
					id: id,
					pw: pw,
				},
				success: function (response) {
					if(response === "success") {
						window.location.href = "/";
					} else {
						alert(response)
						alert("계정 정보가 존재하지 않습니다!");
					}
				},
				error: function() {
					alert("로그인 중 오류가 발생하였습니다.");
				}
			})
			return false; // 폼 제출 방지
		}
	</script>
</body>
</html>