<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 작성</title>
<script src="${pageContext.request.contextPath}/js/jquery-3.7.1.min.js"></script>
<script
	src="${pageContext.request.contextPath}/js/summernote/summernote-lite.js"></script>
<script
	src="${pageContext.request.contextPath}/js/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/summernote/summernote-lite.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/reset.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/community/community.css">
<script>
	$(document).ready(function() {
		$('#summernote').summernote({
			height : 750, // 에디터 높이
			minHeight : null, // 최소 높이
			maxHeight : null, // 최대 높이
			focus : true, // 에디터 로딩후 포커스를 맞출지 여부
			lang : "ko-KR", // 한글 설정
			placeholder : '최대 2048자까지 쓸 수 있습니다' //placeholder 설정
		});
	});
	
	function submitForm() {
		const title = document.getElementById('title').value;
		const content = $('#summernote').summernote('code');
		
		if(!title.trim()) {
			alert('제목을 입력해주세요.');
			return false;
		}
		
		if(!content.trim()) {
			alert('내용을 입력해주세요.');
			return false;
		}
		
		$.ajax({
			url: '/community/write',
			type: 'POST',
			data: {
				title: title,
				content: content
			},
			success: function(response) {
				if(response === 'success') {
					alert('게시글이 작성되었습니다!');
					window.location.href = '/community';
				} else if(response === 'login_required') {
					alert('로그인이 필요합니다.');
					window.location.href = '/login';
				} else {
					alert('게시글 작성에 실패했습니다.');
				}
			},
			error: function() {
				alert('게시글 작성 중 오류가 발생했습니다.');
			}
		});
		return false;
	}
	
	function clearForm() {
		if(confirm('정말로 모든 내용을 삭제하시겠습니까?')) {
			document.getElementById('title').value = '';
			$('#summernote').summernote('code', '');
		}
	}
</script>
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
				<div class="comm-write-title">
					<h3>제목:</h3>
					<input type="text" id="title" name="title" placeholder="제목을 입력하세요">
				</div>
			</section>
			<section class="comm-write-form">
				<form onsubmit="return submitForm()">
					<textarea id="summernote" name="content"></textarea>
				</form>
				<div class="submit-btn">
					<button type="button" class="del-btn" onclick="clearForm()">글 전체 삭제</button>
					<button type="button" class="save-btn" onclick="submitForm()">등록</button>
				</div>
			</section>
		</div>
	</main>
	<%@ include file="../footer.jsp" %>
</body>
</html>