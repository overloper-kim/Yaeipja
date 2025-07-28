<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 작성</title>
<script src="${pageContext.request.contextPath}/js/jquery-3.7.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/summernote/summernote-lite.js"></script>
<script src="${pageContext.request.contextPath}/js/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="${pageCotext.request.contextPath}/css/summernote/summernote-lite.css"/>
<link rel="stylesheet" href="${pageCotext.request.contextPath}/css/reset.css">
<link rel="stylesheet" href="${pageCotext.request.contextPath}/css/style.css">
<link rel="stylesheet" href="${pageCotext.request.contextPath}/css/community/community.css">
<script>
$(document).ready(function() {
	$('#summernote').summernote({
		  height: 300,                 // 에디터 높이
		  minHeight: null,             // 최소 높이
		  maxHeight: null,             // 최대 높이
		  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		  lang: "ko-KR",					// 한글 설정
		  placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정
	});
});
</script>
</head>
<body>
	<%@ include file="../header.jsp" %>
	<main>
		<div class="comm-layout">
			<section class="comm-write-head">
				
			</section>
			<section class="comm-write-form">
				<form>
					<textarea id="summernote" name="editordata"></textarea>
				</form>
			</section>
		</div>
	</main>
</body>
</html>