<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 - 야놀자</title>
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
			<section class="comm-title">
				<h1>커뮤니티</h1>
			</section>
			<div class="comm-write-btn">
				<a href="/community/write" class="write-btn">글쓰기</a>
			</div>
			<hr>
			<section class="comm-list">
				<table class="comm-table">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
							<th>좋아요</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="post" items="${communityList}">
							<tr>
								<td>${post.id}</td>
								<td><a href="/community/view?id=${post.id}">${post.title}</a></td>
								<td>${post.author}</td>
								<td>${post.created_at}</td>
								<td>${post.view_count}</td>
								<td>${post.like_count}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</section>
		</div>
	</main>
	<%@ include file="../footer.jsp"%>
</body>
</html>