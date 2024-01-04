<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

			<!-- banner -->
			<section class="bannerSection bg-info">
				<img id="banner" src="/img/booking/test06_banner1.jpg" alt="banner">
			</section>

			<!-- booking -->
			<section class="bookingSection d-flex bg-primary">

				<!-- book right now -->
				<div id="bookRightNow" class="col-4 d-flex justify-content-center align-items-center bg-dark">
					<h1 class="font-weight-light text-light">
						실시간<br>예약하기
					</h1>
				</div>

				<!-- check booking -->
				<div id="checkBooking" class="col-5 bg-light p-0">
					
					<div id="checkBookingMenu" class="p-2 pt-3 pl-3 bg-warning">
						<span class="font-size-25 font-weight-bold mr-3 text-white">예약 확인</span>
					</div>
					
					<div class="bg-success d-flex d-none">
						<div id="subjectMem" class="subject bg-primary col-3">
							<small class="font-weight-bold d-flex justify-content-center py-3 text-white">이름</small>
							<small class="font-weight-bold d-flex justify-content-center py-3 text-white">전화번호</small>
						</div>
						<div class="inputMem col-9 bg-danger pr-5">
							<input id="name" type="text" class="form-control my-3">
							<input id="phoneNumber" type="text" class="form-control my-3">
						</div>
					</div>

					<div id="btnSection" class="d-flex justify-content-end bg-info pr-3">
						<button type="button" id="lookUpBtn" class="btn btn-success">조회하기</button>
					</div>
				</div>

				<!-- customer service -->
				<div id="askBooking" class="col-3 d-flex justify-content-center align-items-center p-0 bg-secondary">
					<h3 class="font-weight-bold text-white">
						예약 문의:<br> 010-<br> 000-1111
					</h3>
				</div>

			</section>
		</section>

		<!-- footer -->
		<footer class="bg-warning p-3 d-flex align-items-center">
			<jsp:include page="footer.jsp" />
		</footer>
	</div>



	<script>
		$(document).ready(function() {
			let banners = [ "/img/booking/test06_banner1.jpg",
							"/img/booking/test06_banner2.jpg",
							"/img/booking/test06_banner3.jpg",
							"/img/booking/test06_banner4.jpg" ];
			let index = 0;
			setInterval(function() {
				index++;
				if (index >= banners.length) {
					index = 0;
				}
				$("#banner").attr("src", banners[index]);
			}, 3000);

			$("#lookUpBtn").on("click", function() {
				let name = $("#name").val();
				let phoneNumber = $("#phoneNumber").val();

				if (name == "") {
					alert("이름을 입력해주세요.");
					return;
				}
				if (phoneNumber == "") {
					alert("전화번호를 입력해주세요.");
					return;
				}
				if (!phoneNumber.startsWith("010")) {
					alert("전화번호는 010으로 시작해야 합니다.");
					return;
				}
				
				$.ajax({
					type:"post"
					, url:"/booking/check-booking"
					, data:{"name":name, "phoneNumber":phoneNumber, "phoneNumber":phoneNumber}
					
					, success:function(data) {
						if (data.code == 200) {
							alert(data.result);
						}
						else if (data.code == 201) {
							alert(data.result);e
						}
					}
				});
			});

			$("#date").datepicker({
				dateFormat : "yyyy-MM-dd",
				minDate : 0
			});
		});
	</script>
</body>
</html>