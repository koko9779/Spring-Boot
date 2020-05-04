<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/tags.jspf"%>	
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/include_css.jsp"%>
<style type="text/css">
iframe {
    width: 100vw;
    height: calc(100vw/1.77);
}
</style>
</head>
<body>
	<!-- Wrapper -->
		<div class="wrapper">
			<!-- Navigation -->
			<div class="navbar" role="navigation">
				<!-- Heading -->
				<div class="heading">
					<div class="container">
						<div class="row">
							<div class="col-sm-12">
							<div class="tel">
								<c:choose>
									<c:when test="${userNo ==null}">
										<a href="/staily/login/login"> <i class="material-icons"></i>
											로그인
										</a>
									</c:when>
									<c:when test="${userNo !=null}">
										<font color="orange">${userId }</font> 님 환영합니다.
										<a href="/staily/login/logout_action"> <i class="material-icons"></i>
											로그아웃
										</a>
									</c:when>
								</c:choose>
								
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="container" style="margin: 20px auto;">
				<div class="navbar-header">
					<a href="/staily/main/index" class="logo"
						title="Craft beer landing page"> <img
						src="${pageContext.request.contextPath}/images/8.png"
						alt="Craft Beer HTML Template" style="margin:0;">
					</a>
				</div>
				<div class="navbar-collapse collapse">
					<ul id="menu-primary" class="nav navbar-nav naviii">
						<li class="active"><a href="/staily">메인페이지</a></li>
						<li><a href="/staily/main/productlist_select">상품목록</a></li>
						<li class="dropdown"><a href="/staily/style/style_main_read">커뮤니티</a>
							<ul class="dropdown-menu">
								<li><a href="/staily/style/style_main_read">스타일Q&A</a></li>
								<li><a href="/staily/style/style_main_read?bType=F">자유게시판</a></li>
								<li><a href="/staily/style/style_main_read?bType=Q">1:1문의</a></li>
							</ul></li>
						<li><a href="/staily/notice/main">공지사항</a></li>
						<c:choose>
							<c:when test="${userId eq 'admin'}">
								<li><a href="/staily/admin/main">관리자페이지</a></li>
							</c:when>
							<c:when test="${userId != null && userId !='admin' }">
								<li><a href="/staily/mypage/member_select">마이페이지</a></li>
							</c:when>
						</c:choose>
					</ul>
				</div>
			</div>
		</div>