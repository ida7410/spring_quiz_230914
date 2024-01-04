<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통나무 팬션</title>

<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>

<!-- bootstrap CDN link -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

<!-- datepicker 라이브러리 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
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
			<div class="d-flex justify-content-center w-100">
				<div class="col-4">
					<h3 class="font-weight-bold text-center py-3">예약 하기</h3>
					<div class="form-group">
						<span class="font-weight-bold">이름</span>
						<input type="text" id="name" class="form-control">
					</div>
					<div class="form-group">
						<span class="font-weight-bold">예약날짜</span>
						<input type="text" id="date" class="form-control">
					</div>
					<div class="form-group">
						<span class="font-weight-bold">숙박일수</span>
						<input type="text" id="day" class="form-control">
					</div>
					<div class="form-group">
						<span class="font-weight-bold">숙박인원</span>
						<input type="text" id="headcount" class="form-control">
					</div>
					<div class="form-group">
						<span class="font-weight-bold">전화번호</span>
						<input type="text" id="phoneNumber" class="form-control">
					</div>
					<div class="form-group">
						<button type="button" id="addBookingBtn" class="form-control btn btn-warning">예약하기</button>
					</div>
				</div>
			</div>
		</section>

		<!-- footer -->
		<footer class="bg-warning p-3 d-flex align-items-center">
			<jsp:include page="footer.jsp" />
		</footer>
	</div>
	
	
	
	<script>
            $(document).ready(function() {
            	$("#date").datepicker({
                    dateFormat:"yy-mm-dd"
                    , minDate:0
                });
            	
            	$("#addBookingBtn").on("click", function() {
            		let name = $("#name").val();
            		let date = $("#date").val();
            		let day = $("#day").val();
            		let headcount = $("#headcount").val();
            		let phoneNumber = $("#phoneNumber").val();
            		
            		// validation check
            		if (!name) {
            			alert("이름을 입력해주세요.");
            			return;
            		}
            		if (!date) {
            			alert("날짜를 입력해주세요.");
            			return;
            		}
            		if (!day) {
            			alert("숙박일수를 입력해주세요.");
            			return;
            		}
            		if (isNaN(day)) {
            			alert("숙박일수는 숫자만 입력 가능합니다.");
            			return;
            		}
            		if (!headcount) {
            			alert("숙박인원을 입력해주세요.");
            			return;
            		}
            		if (isNaN(headcount)) {
            			alert("숙박인원은 숫자만 입력 가능합니다.");
            			return;
            		}
            		if (!phoneNumber) {
            			alert("전화번호를 입력해주세요.");
            			return;
            		}
            		
            		if (!phoneNumber.startsWith("010")) {
            			alert("전화번호는 010으로 시작해야 합니다.")
            			return;
            		}
            		
            		$.ajax({
            			type:"post"
            			, url:"/booking/make-booking"
            			, data:{"name":name, "date":date, "day":day, "headcount":headcount, "phoneNumber":phoneNumber}
            		
            			, success:function(data) {
            				if (data.code == 200) {
            					location.href="/booking/booking-list-view";
            				}
            				else if (data.code == 500) {
            					alert(error_message);
            				}
            			}
            			
            			, error:function(request, status, error) {
            				alert("예약에 실패했습니다. 관리자에게 문의해주세요.");
            			}
            		});
            	});
            });
        </script>
</body>
</html>