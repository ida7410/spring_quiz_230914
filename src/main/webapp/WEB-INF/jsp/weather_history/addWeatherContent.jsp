<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<h2>날씨 입력</h2>
<form method="post" action="/weather-history/add-weather">
	<div class="d-flex justify-content-between mt-5">
		<div class="d-flex align-items-center">
			<div class="input-label">날짜</div>
			<input type="text" class="form-control" id="date" name="date">
		</div>
		<div class="d-flex align-items-center">
			<div class="input-label">날씨</div>
			<select class="form-control" name="weather">
				<option>맑음</option>
				<option>구름조금</option>
				<option>흐림</option>
				<option>비</option>
			</select>
		</div>

		<div class="d-flex align-items-center">
			<div class="input-label">미세먼지</div>
			<select class="form-control" name="microDust">
				<option>좋음</option>
				<option>보통</option>
				<option>나쁨</option>
				<option>최악</option>
			</select>
		</div>
	</div>

	<div class="d-flex justify-content-between my-5">
		<div class="d-flex align-items-center">
			<div class="input-label">기온</div>
			<div class="input-group">
				<input type="text" class="form-control" name="temperatures">
				<div class="input-group-append">
					<span class="input-group-text">℃</span>
				</div>
			</div>
		</div>
		<div class="d-flex align-items-center">
			<div class="input-label">강수량</div>
			<div class="input-group">
				<input type="text" class="form-control" name="precipitation">
				<div class="input-group-append">
					<span class="input-group-text">mm</span>
				</div>
			</div>
		</div>

		<div class="d-flex align-items-center">
			<div class="input-label">풍속</div>
			<div class="input-group">
				<input type="text" class="form-control" name="windSpeed">
				<div class="input-group-append">
					<span class="input-group-text">km/h</span>
				</div>
			</div>
		</div>
	</div>

	<div class="text-right">
		<button type="submit" class="btn btn-success btn-right">저장</button>
	</div>
</form>