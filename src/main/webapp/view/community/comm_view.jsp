<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="${pageContext.request.contextPath}/js/jquery-3.7.1.min.js"></script>
<title>게시글 보기 - 야놀자</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/reset.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/community/community.css">
</head>
<body>
	<%@ include file="../header.jsp"%>
	<main>
		<div class="comm-layout">
			<section class="comm-write-head">
				<div class="comm-write-navigator">
					<p>야놀자 ></p>
					<p>ㅤ커뮤니티 ></p>
					<p>ㅤ잡답게시판</p>
				</div>
				<div class="comm-write-info">
					<span>작성자: ${community.author}</span> <span>작성일:
						${community.created_at}</span> <span>조회수: ${community.view_count}</span>
					<span>좋아요: ${community.like_count}</span>
				</div>
			</section>
			<hr>
			<div class="comm-view-title">
				<h1>${community.title}</h1>
			</div>
			<section class="comm-view-content">
				<div class="content-area">${community.content}</div>
			</section>
			<section class="comm-write-actions">
				<div class="action-buttons">
					<a href="/community" class="list-btn">목록으로</a> <a
						href="/community/write" class="write-btn">글쓰기</a>
				</div>
			</section>
		</div>
	</main>
	<%@ include file="../footer.jsp"%>
</body>
</html>
