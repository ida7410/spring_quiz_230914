<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통나무 팬션</title>

<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>

<!-- bootstrap CDN link -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
	crossorigin="anonymous"></script>

<!-- datepicker 라이브러리 -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<!-- 외부 스타일 시트 -->
<link rel="stylesheet" type="text/css" href="/css/booking/style.css">

</head>
<body>
	<div id="wrap" class="bg-secondary">

		<!-- header -->
		<header class="bg-primary d-flex align-items-center justify-content-center">
			<jsp:include page="header.jsp" />
		</header>

		<!-- menu -->
		<nav class="menu bg-success d-flex justify-content-around">
			<jsp:include page="nav.jsp" />
		</nav>

		<!-- content -->
		<section class="contents bg-danger">
			<h3 class="font-weight-bold text-center py-3">예약 목록 보기</h3>
			<table class="table text-center">
				<thead>
					<tr>
						<th>이름</th>
						<th>예약날짜</th>
						<th>숙박일수</th>
						<th>숙박인원</th>
						<th>전화번호</th>
						<th>예약상태</th>
						<th></th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach items="${bookingList}" var="booking">
					<tr>
						<td>${booking.name}</td>
						<td>${booking.date}</td>
						<td>${booking.day}</td>
						<td>${booking.headcount}</td>
						<td>${booking.phoneNumber}</td>
						<td>
						<c:choose>
							<c:when test="${booking.state == '대기중'}">
								<span class="text-info">${booking.state}</span>
							</c:when>
							<c:when test="${booking.state == '확정'}">
								<span class="text-success">${booking.state}</span>
							</c:when>
							<c:when test="${booking.state == '취소'}">
								<span class="text-danger">${booking.state}</span>
							</c:when>
						</c:choose>
						</td>
						<td>
							<button type="button" class="delete-btn btn btn-danger" data-booking-id="${booking.id}">삭제</button>
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</section>

		<!-- footer -->
		<footer class="bg-warning p-3 d-flex align-items-center">
			<jsp:include page="footer.jsp" />
		</footer>
	</div>
	
	
	
	<script>
            $(document).ready(function() {
				$(".delete-btn").on("click", function() {
					let id = $(this).data("booking-id");
					alert(id);
					$.ajax({
						type:"delete"
						, url:"/booking/delete-booking"
						, data:{"id":id}
					
						, success:function(data) {
							if (data.code == 200) {
								location.reload(true);
							}
							else if (data.code == 500) {
								alert(data.error_message);
							}
						}
						
						, error:function(request, status, error) {
							alert("삭제하는 데 실패했습니다. 관리자에게 문의해주세요.");
						}
					});
				});
            });
        </script>
</body>
</html>