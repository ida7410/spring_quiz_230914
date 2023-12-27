<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날씨 정보</title>

<!-- bootstrap -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

<!-- My stylesheet -->
<link rel="stylesheet" type="text/css" href="/css/weather_history/weather_history_stylesheet.css">
</head>
<body>
	<div id="wrap" class="bg-secondary">
		<div class="contents bg-warning d-flex">
			<aside class="col-2 bg-info h-100">
				<jsp:include page="nav.jsp" />
			</aside>
			
			<section class="content w-100 m-3">
				<jsp:include page="weatherListContent.jsp" />
			</section>
		</div>
		
		<footer class="bg-success d-flex align-items-center">
			<jsp:include page="footer.jsp" />
		</footer>
	</div>
</body>
</html>