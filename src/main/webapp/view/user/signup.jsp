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

			<!-- 에러/성공 메시지 표시 -->
			<%
			if (request.getParameter("error") != null) {
			%>
			<div class="error-message">
				<%
				if (request.getParameter("error").equals("duplicate")) {
				%>
				이미 존재하는 아이디입니다.
				<%
				} else if (request.getParameter("error").equals("fail")) {
				%>
				회원가입에 실패했습니다. 다시 시도해주세요.
				<%
				} else {
				%>
				오류가 발생했습니다. 다시 시도해주세요.
				<%
				}
				%>
			</div>
			<%
			}
			%>

			<section class="wrap-login-form">
				<form class="login-form" action="/signup" method="post"
					onsubmit="return validateForm()">
					<div class="login-input-layout">
						<label for="id"> 아이디: </label> <input id="id" name="id"
							type="text" placeholder="아이디를 입력하세요." required />
						<button class="vali-id" type="button" onclick="checkId()">중복확인</button>
						<div id="id-check-result" class="id-check-result"></div>
					</div>

					<div class="login-input-layout">
						<label for="pw"> 비밀번호: </label> <input id="pw" name="pw"
							type="password" placeholder="비밀번호를 입력하세요." required />
					</div>

					<div class="login-input-layout">
						<label for="repw"> 비밀번호 재확인: </label> <input id="repw" name="repw"
							type="password" placeholder="입력한 비밀번호를 재입력하세요." required />
					</div>

					<div class="login-input-layout">
						<label for="nickname"> 닉네임: </label> <input id="nickname"
							name="nickname" type="text" placeholder="닉네임을 입력하세요." required />
					</div>

					<div class="login-input-layout">
						<label for="birth_date"> 생년월일: </label> <input id="birth_date"
							name="birth_date" type="date" required />
					</div>

					<div class="login-input-layout">
						<label for="phone"> 전화번호: </label> <input id="phone" name="phone"
							type="tel" placeholder="전화번호를 입력하세요." required />
					</div>

					<div class="login-input-layout">
						<label for="address"> 주소: </label> <input id="address"
							name="address" type="text" placeholder="주소를 입력하세요." />
					</div>

					<div class="check-sex">
						<label>성별:</label> <input type="radio" name="sex" value="M"
							required> 남성 <input type="radio" name="sex"
							value="FM" required> 여성
					</div>

					<div class="login-input-layout">
						<label for="height"> 키 (cm): </label> <input id="height"
							name="height" type="number" placeholder="키를 입력하세요." />
					</div>

					<div class="login-input-layout">
						<label for="weight"> 몸무게 (kg): </label> <input id="weight"
							name="weight" type="number" placeholder="몸무게를 입력하세요." />
					</div>

					<div class="submit-btn-info">
						<button type="submit" class="login-btn">회원가입</button>
					</div>
				</form>
			</section>
		</div>
	</main>
	<%@ include file="../footer.jsp"%>

	<script>
		let idChecked = false;
		let idAvailable = false;

		// 아이디 중복 확인
		function checkId() {
			const id = document.getElementById('id').value;
			const resultDiv = document.getElementById('id-check-result');

			if (!id) {
				resultDiv.innerHTML = '아이디를 입력해주세요.';
				resultDiv.className = 'id-check-result duplicate';
				return;
			}

			$.ajax({
				url : '/checkId',
				type : 'POST',
				data : {
					id : id
				},
				success : function(response) {
					if (response === 'available') {
						resultDiv.innerHTML = '사용 가능한 아이디입니다.';
						resultDiv.className = 'id-check-result available';
						idChecked = true;
						idAvailable = true;
					} else {
						resultDiv.innerHTML = '이미 사용 중인 아이디입니다.';
						resultDiv.className = 'id-check-result duplicate';
						idChecked = true;
						idAvailable = false;
					}
				},
				error : function() {
					resultDiv.innerHTML = '중복 확인 중 오류가 발생했습니다.';
					resultDiv.className = 'id-check-result duplicate';
				}
			});
		}

		// 아이디 입력 시 중복 확인 초기화
		document.getElementById('id').addEventListener('input', function() {
			idChecked = false;
			idAvailable = false;
			document.getElementById('id-check-result').innerHTML = '';
		});

		// 폼 유효성 검사
		function validateForm() {
			const id = document.getElementById('id').value;
			const pw = document.getElementById('pw').value;
			const repw = document.getElementById('repw').value;
			const nickname = document.getElementById('nickname').value;
			const phone = document.geleElementById('phone').value;
			const address = document.getElementById('address').value;
			const height = document.getElementById('height').value;
			const weight = document.getElementById('weight').value;
			const selectSex = document.querySelector('input[name="sex"]:checked').value;

			// 아이디 중복 확인 체크
			if (!idChecked) {
				alert('아이디 중복 확인을 해주세요.');
				return false;
			}

			if (!idAvailable) {
				alert('사용할 수 없는 아이디입니다.');
				return false;
			}

			// 비밀번호 확인
			if (pw !== repw) {
				alert('비밀번호가 일치하지 않습니다.');
				return false;
			}

			// 비밀번호 길이 체크
			if (pw.length < 6) {
				alert('비밀번호는 6자 이상이어야 합니다.');
				return false;
			}

			$.ajax({
				url: '/signup',
				type: 'POST',
				data: {
					id: id,
					pw: pw,
					nickname: nickname,
					phone: phone,
					address: address,
					height: height,
					weight: weight,
					sex: selectSex,
				},
				success: function (response) {
					if (response === "success") {
						window.location.href("/login");
					} else {
						alert("회원가입 실패");
					}
				}
			})
			return true;
		}
	</script>
</body>
</html>