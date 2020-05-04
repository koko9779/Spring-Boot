<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/tags.jspf"%>
<%@ include file="/WEB-INF/views/include/include_navbar.jsp"%>

		<!-- Hero -->
	<div id="hero" class="carousel carousel-fade" data-ride="carousel">
		<iframe class="ww"
			src="https://www.youtube-nocookie.com/embed/9Dfkx9vEPw0?autoplay=1&amp;loop=1;playlist=9Dfkx9vEPw0&controls=0&vq=hd720"
			frameborder="0"	allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
			allowfullscreen></iframe>
		<a href="#afterHeader" class="anchor">
			<img src="${pageContext.request.contextPath}/images/scroll-arrow.svg" alt="Scroll down" class="scroll" />
		</a>
 
	</div>
	<!-- Indicators -->
	
	<!-- Section -->
	<div class="mainpage_container">
		<!-- BOOKMARK -->
		<c:if test="${not empty userNo}">
		<div class="container section" style="padding-top: 40px;">
			<div class="row">
				<div class="col-sm-12" id="afterHeader">
					<h2>즐겨찾기</h2>
					<c:choose>
						<c:when test="${not empty bmList}">
							<div class="slick-carousel newIn">
								<c:forEach var="bm" items="${bmList}">
									<form id="bookmark_${bm.bmNo}" method="post">
										<input type="hidden" value="${bm.bmNo}" name="bmNo" />
										<input type="hidden" value="${bm.product.wNo}" name="wNo" />
										<input type="hidden" value="${bm.product.pNo}" name="pNo"/>
										<div class="movie-slide">
												<div class="movie-poster2">
													<a href="#" onclick="bm_productpage(${bm.bmNo},${bm.product.pNo})"> <img
														src="${pageContext.request.contextPath}/images/product/scene/${bm.product.pScene}.jpg"
														alt="${bm.product.pName}" style="width:100%; height:150px;" />
													</a>
												</div>
											<div>
												<input class="material-icons bookmark" type="image" alt="즐겨찾기 제거"
													src="${pageContext.request.contextPath}/images/star.png"
													onclick="delete_bookmark(${bm.bmNo});">
												<span class="no-underline p_name" style="width: 80%;">${bm.product.pName}</span>
											</div>
										</div>
									</form>
								</c:forEach>
							</div>
						</c:when>
						<c:when test="${empty bmList}">
							<div style="text-align:center;margin-top:75px;">즐겨찾기로 등록한 상품이 없습니다</div>
						</c:when>
					</c:choose>
				</div>
			</div>
		</div>
		</c:if>
		<!-- HOT -->
		<div class="container section remove-top-padding" style="padding-top: 40px;">
			<div class="row">
				<div class="col-sm-12" id="afterHeader">
					<h2>HOT</h2>
	
					<div class="slick-carousel newIn">
						<c:forEach var="hot" items="${hotList}">
							<form id="product_${hot.pNo}" method="post">
								<input type="hidden" value="${hot.wNo}" name="wNo"/>
								<input type="hidden" value="${hot.pNo}" name="pNo"/>
								<div class="movie-slide">
									<div class="movie-poster2">
										<a href="#" onclick="productpage(${hot.pNo})"> <img
											src="${pageContext.request.contextPath}/images/product/scene/${hot.pScene}.jpg"
											alt="${hot.pName}" style="width:100%; height:150px;" />
										</a>
									</div>
									<h4 class="no-underline p_name">${hot.pName}</h4>
								</div>
							</form>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
		<!-- TODAY -->
		<div class="container section remove-top-padding">
			<div class="row">
				<div class="col-sm-12" id="afterHeader">
					<h2>TODAY</h2>
					<c:choose>
						<c:when test="${not empty todayList}">
						<div class="slick-carousel newIn">
							<c:forEach var="today" items="${todayList}">
								<form id="work_${today.wNo}" method="post">
									<input type="hidden" value="${today.wNo}" name="wNo" />
									<div class="movie-slide">
										<div class="movie-poster2">
											<a href="#" onclick="workpage(${today.wNo})"> <img
												src="https://image.tmdb.org/t/p/w600_and_h900_bestv2/${today.wPoster}"
												alt="${today.wNo}" style="width:263px; height:372px;"/>
											</a>
										</div>
									</div>
								</form>
							</c:forEach>
						</div>
						</c:when>
						<c:when test="${empty todayList}">
							<div style="text-align:center;margin-top:75px;">오늘의 작품이 없습니다</div>
						</c:when>
					</c:choose>
				</div>
			</div>
	
		</div>
		<!-- DRAMA -->
		<div class="container section remove-top-padding">
			<div class="row">
				<div class="col-sm-12" id="afterHeader">
					<h2>드라마</h2>
	
					<div class="slick-carousel newIn" >
						<c:forEach var="drama" items="${dramaList}">
							<form id="work_${drama.wNo}" method="post">
								<input type="hidden" value="${drama.wNo}" name="wNo" />
								<div class="movie-slide">
									<div class="movie-poster2">
										<a href="#" onclick="workpage(${drama.wNo})"> <img
											src="https://image.tmdb.org/t/p/w600_and_h900_bestv2/${drama.wPoster}"
											alt="${drama.wNo}" style="width:263px; height:372px;"/>
										</a>
									</div>
								</div>
							</form>
						</c:forEach>
					</div>
				</div>
			</div>
	
		</div>
		<!-- MOVIE -->
		<div class="container section remove-top-padding">
			<div class="row">
				<div class="col-sm-12" id="afterHeader">
					<h2>영화</h2>
	
					<div class="slick-carousel newIn">
						<c:forEach var="movie" items="${movieList}">
							<form id="work_${movie.wNo}" method="post">
								<input type="hidden" value="${movie.wNo}" name="wNo" />
								<div class="movie-slide">
									<div class="movie-poster2">
										<a href="#" onclick="workpage(${movie.wNo})"> <img
											src="https://image.tmdb.org/t/p/w600_and_h900_bestv2/${movie.wPoster}"
											alt="${movie.wNo}" style="width:263px; height:372px;"/>
										</a>
									</div>
								</div>
							</form>
						</c:forEach>
					</div>
				</div>
			</div>
		<input type="hidden" id="payment" value="${result}"/>
		</div>
	</div>
<%@ include file="/WEB-INF/views/include/include_footer.jsp"%>
</body>
</html>