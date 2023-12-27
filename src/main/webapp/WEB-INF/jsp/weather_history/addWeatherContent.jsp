<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<h2>날씨 입력</h2>

<form method="post" action="/weather-history/add-weather">
	<div class="d-flex justify-content-between mt-5">
		<div class="form-group col-4 align-items-center">
			<div class="d-flex align-items-center">
				<label for="date">날짜</label>
				<input type="date" name="date" id="date" class="form-control">
			</div>
		</div>

		<div class="form-group col-3">
			<div class="d-flex align-items-center">
				<label for="weather">날씨</label>
				<select id="weather" name="weather" class="form-control">
					<option selected value="sunny">맑음</option>
					<option value="partlyCloudy">구름조금</option>
					<option value="cloudy">흐림</option>
					<option value="rainy">비</option>
				</select>
			</div>
		</div>


		<div class="form-group col-3">
			<div class="d-flex align-items-center">
				<label for="fineDust">미세먼지</label>
				<select id="fineDust" name="fineDust" class="form-control">
					<option selected value="good">좋음</option>
					<option value="normal">보통</option>
					<option value="bad">나쁨</option>
					<option value="worst">최악</option>
				</select>
			</div>
		</div>
	</div>

	<div class="d-flex justify-content-between">
		<div class="form-group col-3">
			<div class="d-flex align-items-center">
				<label for="temperature">기온</label>
				<div class="input-group mb-3">
					<input id="temperature" name="temperature" type="text" class="form-control">
					<div class="input-group-append">
						<span class="input-group-text">°C</span>
					</div>
				</div>
			</div>
		</div>

		<div class="form-group col-3">
			<div class="d-flex align-items-center">
				<label for="precipitation">강수량</label>
				<div class="input-group mb-3">
					<input id="precipitation" name="precipitation" type="text" class="form-control">
					<div class="input-group-append">
						<span class="input-group-text">mm</span>
					</div>
				</div>
			</div>
		</div>

		<div class="form-group col-3">
			<div class="d-flex align-items-center">
				<label for="wind">풍속</label>
				<div class="input-group mb-3">
					<input id="wind" name="wind" type="text" class="form-control">
					<div class="input-group-append">
						<span class="input-group-text">km/h</span>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="text-right">
		<button type="submit" class="btn btn-success btn-right">저장</button>
	</div>
</form>