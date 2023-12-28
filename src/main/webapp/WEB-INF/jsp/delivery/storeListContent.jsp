<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="title my-3 display-4">우리동네 가게</div>
<c:forEach items="${stores}" var="store" varStatus="status">
	<a href="/delivery/review-list-view?storeId=${store.id}&storeName=${store.name}"
		class="store-item">
		<div class="rounded border border-info p-3 my-3">
			<h3 class="font-weight-bold">${store.name}</h3>
			<div>전화 번호: ${store.phoneNumber}</div>
			<div>주소: ${store.address}</div>
		</div>
	</a>
</c:forEach>