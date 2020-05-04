<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/tags.jspf" %>
<aside class="col-sm-3 col-sm-pull-1 sidebar" id="sidebar">
	<div class="widget">
		<form id="work_${w.wNo}" method="post">
			<input type="hidden" value="${w.wNo}" name="wNo" />
			<img src="https://image.tmdb.org/t/p/w600_and_h900_bestv2/${w.wPoster}" alt="${w.wName}" onclick="workpage(${w.wNo}); return false;" style="cursor: pointer;width:100%;"/>
			<h3 style="margin:50px auto;">${w.wName}</h3>
		</form>
	</div>
	<div class="widget">
		<select class="form-control" id="workEpisode">
			<c:forEach begin="0" end="${tepisode}" step="1" varStatus="status">
				<c:choose>
					<c:when test="${status.current eq 0}">
		 				<option value="${status.current}" wNo="${w.wNo}" contextPath = "${pageContext.request.contextPath}">회차 선택하기</option>					
					</c:when>
					<c:otherwise>
	 					<option value="${status.current}" wNo="${w.wNo}" contextPath = "${pageContext.request.contextPath}">${status.current}회</option>
	 				</c:otherwise>
 				</c:choose>
			</c:forEach>
		</select>
	</div>	
	<!--
	<div class="widget">
		<form>
			<input type="text" placeholder="Search..." class="search" />
			<i class="material-icons">search</i>
		</form>
	</div>
	-->
	<button type="button" class="btn btn-ghost" onClick="work_search()">상품 등록</button>
</aside>
