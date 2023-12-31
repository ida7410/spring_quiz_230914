<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL Core Library(1)</title>
</head>
<body>
	<h1>1. JSTL core 변수</h1>
	<c:set var="number1" value="36" />
	<c:set var="number2" value="3" />
	<h3>첫번째 숫자: ${number1}</h3>
	<h3>두번째 숫자: ${number2}</h3>
	
	<h1>2. JST core 연산</h1>
	<h3>add: ${number1 + number2}</h3>
	<h3>subtract: ${number1 - number2}</h3>
	<h3>multiply: ${number1 * number2}</h3>
	<h3>divide: ${number1 / number2}</h3>
	
	<h1>3. JSTL core out</h1>
	<c:out value="<title>core out</title>" />
	
	<h1>4. JSTL core if</h1>
	<c:set var="average" value="${(number1 + number2) / 2}" />
	<c:if test="${average >= 10 }">
		<h1>${average}</h1>
	</c:if>
	<c:if test="${average < 10 }">
		<h3>${average}</h3>
	</c:if>
	
	<c:if test="${(number1 * number2) > 100 }">
		<c:out value="<script>alert('the number is too big')</script>" escapeXml="false" />
	</c:if>
</body>
</html>