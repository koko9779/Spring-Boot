<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/tags.jspf"%>
<div class="col-lg-2" style="margin-top: 21px;">
	<aside class="col-sm-push-1 sidebar">
		<div class="widget">
			<h3>회원관리</h3>
			<ul id="sideCheck">
				<li><a href="member_select">회원정보수정</a></li>
				<li><a href="friend_list">친구리스트</a></li>
				<li><a href="bookmark_list">즐겨찾기</a></li>
				<li><a href="member_write">내상품목록</a></li>
				<li><a href="#">메시지보관함</a></li>
			</ul>
		</div>
		<c:if test="${userType =='C'}">
		<div class="widget">
			<h3>결제관리</h3>
			<ul>
				<li><a href="payment">결제하기</a></li>
				<li><a href="payment_list">결제내역</a></li>
			</ul>
		</div>
		</c:if>
	</aside>
	</div>
