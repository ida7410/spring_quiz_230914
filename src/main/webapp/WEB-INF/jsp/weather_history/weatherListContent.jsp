<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<h2>과거 날씨</h2>
<table class="table text-center">
	<thead>
		<tr>
			<th>날짜</th>
			<th>날씨</th>
			<th>기온</th>
			<th>강수량</th>
			<th>미세먼지</th>
			<th>풍속</th>
		</tr>
	</thead>

	<tbody>

		<c:forEach items="${weatherList}" var="weather" varStatus="statuc">
			<tr>
				<td>${weather.date}</td>
				<td>${weather.weater}</td>
				<td>${weather.temperature}</td>
				<td>${weather.precipitation}</td>
				<td>${weather.microDust}</td>
				<td>${weather.updatedAt}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>