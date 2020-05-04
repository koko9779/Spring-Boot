<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<%@ include file="/WEB-INF/views/style/include/include_style_css.jsp"%>
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
										<font color="black">${userId }</font> 님 환영합니다.
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

			<div class="container">
				<div class="navbar-header">
					<a href="/staily/main/index" class="logo"
						title="Craft beer landing page"> <img
						src="${pageContext.request.contextPath}/images/8.png"
						alt="Craft Beer HTML Template">
					</a>
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target=".navbar-collapse">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar top-bar"></span> <span
							class="icon-bar middle-bar"></span> <span
							class="icon-bar bottom-bar"></span>
					</button>
				</div>
				<br>
				<div class="navbar-collapse collapse">
					<ul id="menu-primary" class="nav navbar-nav">
						<li class="active"><a href="/staily">메인페이지</a></li>
						<li><a href=#>상품목록</a></li>
						<li><a href="/staily/detail/product_detail">상품상세</a></li>
						<li class="dropdown"><a href="/staily/style/style_main_read">게시판</a>
							<ul class="dropdown-menu">
								<li><a href="/staily/style/style_main">스타일제안</a></li>
								<li><a href="/staily/style/style_main">질문답변</a></li>
								<li><a href="/staily/style/style_main">영주괴롭히기</a></li>
								<li><a href="/staily/style/style_main">영주괴롭히기</a></li>
							</ul></li>
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
	</div>
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
										<font color="black">${userId }</font> 님 환영합니다.
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

			<div class="container">
				<div class="navbar-header">
					<a href="/staily/main/index" class="logo"
						title="Craft beer landing page"> <img
						src="${pageContext.request.contextPath}/images/8.png"
						alt="Craft Beer HTML Template">
					</a>
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target=".navbar-collapse">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar top-bar"></span> <span
							class="icon-bar middle-bar"></span> <span
							class="icon-bar bottom-bar"></span>
					</button>
				</div>
				<br>
				<div class="navbar-collapse collapse">
					<ul id="menu-primary" class="nav navbar-nav">
						<li class="active"><a href="/staily">메인페이지</a></li>
						<li><a href=#>상품목록</a></li>
						<li><a href="/staily/detail/product_detail">상품상세</a></li>
						<li class="dropdown"><a href="/staily/style/style_main_read">게시판</a>
							<ul class="dropdown-menu">
								<li><a href="/staily/style/style_main">스타일제안</a></li>
								<li><a href="/staily/style/style_main">질문답변</a></li>
								<li><a href="/staily/style/style_main">영주괴롭히기</a></li>
								<li><a href="/staily/style/style_main">영주괴롭히기</a></li>
							</ul></li>
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
		<!-- Hero -->
<div id="content_hero"
	style="background-image: url(http://via.placeholder.com/1440x435)">

	<img src="${pageContext.request.contextPath}/images/scroll-arrow.svg"
		alt="Scroll down" class="scroll" />

	<!-- Content -->
	<div class="container">
		<div class="row blurb scrollme animateme" data-when="exit"
			data-from="0" data-to="1" data-opacity="0" data-translatey="100">
			<div class="col-md-9">
				<span class="title">The very latest</span>
				<h1>Cinema news</h1>
			</div>
		</div>
	</div>

</div>

<!-- Section -->
<div class="container section news">
	<div class="row">

		<%@ include file="/WEB-INF/views/include/include_work_sidebar.jsp"%>
