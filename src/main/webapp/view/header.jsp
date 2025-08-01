<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>야입자</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/reset.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/header.css">
</head>
<body>
	<header>
		<section class="top-menu">
			<nav>
				<ul class="top-menu-item">
					<li><a href="/signup">회원가입</a></li>
					<li><a href="/login">로그인</a></li>
					<li><a href="/logout">로그아웃</a></li>
					<li><a href="/myprofile">마이페이지</a></li>
				</ul>
			</nav>
		</section>
		<section class="bottom-item">
			<div class="header-logo">
				<img src="${pageContext.request.contextPath}/img/yaeipja.png" />
			</div>
			<div>
				<nav>
					<ul class="bottom-menu-item">
						<li><a href="/">옷</a></li>
						<li><a href="/">신발</a></li>
						<li><a href="/">공지사항</a></li>
						<li><a href="/community">커뮤니티</a></li>
						<li><a href="/conn">연결</a></li>
					</ul>
				</nav>
			</div>
		</section>
	</header>
</body>
</html>