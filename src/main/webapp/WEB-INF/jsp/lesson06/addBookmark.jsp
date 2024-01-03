<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- bootstrap -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

<%-- AJAX를 사용하려면 jquery 원본 필요 --%>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
	
</head>
<body>
	<div class="container">
		<h1 class="font-weight-bold">즐겨 찾기 추가하기</h1>
		<div class="form-group">
			제목
			<input type="text" id="name" class="form-control">
		</div>
		<div class="form-group">
			주소
			<div class="d-flex">
				<input type="text" id="url" class="form-control">
				<button type="button" id="urlStatusBtn" class="btn btn-info ml-3 col-1">중복확인</button>
			</div>
			
			<small id="urlStatusArea"></small>
		</div>
		
		<button type="button" id="addBtn" class="btn btn-success form-control">추가</button>
	</div>
	
	<script>
		$(document).ready(function() {
			
			let isDuplicated = true;
			let checkedIsDuplicated = false;
			
			$("#urlStatusBtn").on("click", function() {
				$("#urlStatusArea").empty();
				
				let url = $("#url").val();
				if (url == "") {
					$("#urlStatusArea").append('<span class="text-danger">주소를 입력하세요</span>');
					return;
				}
				
				$.ajax({
					type:"get"
					, url:"/lesson06/is-duplicated-url"
					, data:{"url":url}
					
					, success: function(data) {
						if (data.is_duplicated) {
							$("#urlStatusArea").append('<span class="text-danger">중복된 주소입니다</span>');
							isDuplicated = true;
							checkedIsDuplicated = false;
						}
						else {
							$("#urlStatusArea").append('<span class="text-success">저장 가능한 주소입니다</span>');
							isDuplicated = false;
							checkedIsDuplicated = true;
						}
					}
					, error:function(request, status, error) {
						
					}
				});
			});
			
			$("#addBtn").on("click", function() {
				
				// validation check
				let name = $("#name").val();
				let url = $("#url").val();
				console.log(name);
				console.log(url);
				
				if (name == "") {
					alert("제목을 입력하세요");
					return;
				}
				if (url == "") {
					alert("주소를 입력하세요");
					return;
				}
				
				// http 또는 https 프로토콜
				if (!url.startsWith("http://") && !url.startsWith("https://")) {
					alert("주소 형식이 잘못 되었습니다.");
					return;
				}
				
				// check duplicated
				if (!checkedIsDuplicated) {
					alert("중복된 주소인지 확인해주세요.");
					return;
				}
				if (isDuplicated) {
					alert("중복된 주소는 추가할 수 없습니다");
					return;
				}
				
				
				// AJAX
				$.ajax({
					type:"post"
					,url:"/lesson06/add-bookmark"
					,data:{"name":name, "url":url}
					
					,success:function(data) { // data: JSON String => parsing(by ajax function in jquery) => dict
						if (data.code == 200) {
							location.href="/lesson06/bookmark-list-view"; // get
						}
					}
					
					,error:function(request, status, error) {
						alert("추가하는 데 실패했습니다. 관리자에게 문의해주세요.");
					}
				});
				
			});
			
		});
	</script>
</body>
</html>