<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="title my-3 display-4">${storeName} - 리뷰</div>
<c:forEach items="${reviews}" var="review" varStatus="status">
	<div class="rounded border border-info p-3 my-3">
		<div class="d-flex">
			<span class="font-weight-bold mr-2">${review.userName}</span>
			<div>
				<c:forEach begin="0" end="4" var="star">
					<c:choose>
						<c:when test="${review.point > star}">
							<c:choose>
								<c:when test="${review.point == star + 0.5 }">
									<img src="/img/lesson05/delivery/star_half.png" width="17px">
								</c:when>
								<c:otherwise>
									<img src="/img/lesson05/delivery/star_fill.png" width="17px">
								</c:otherwise>
							</c:choose>
						</c:when>
						<c:otherwise>
							<img src="/img/lesson05/delivery/star_empty.png" width="17px">
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</div>
		</div>
		
		<div class="text-secondary my-2">
			<fmt:formatDate value="${review.updatedAt}" pattern="yyyy년 m월 d일" />
		</div>
		
		<c:if test="${!empty review.review}">
			<div class="mb-2">${review.review }</div>
		</c:if>
		
		
		<span class="rounded menu">${review.menu }</span>
	</div>
</c:forEach>