<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/tags.jspf" %>
<%@ include file="/WEB-INF/views/include/include_navbar.jsp"%>
<script src="${pageContext.request.contextPath}/css/admin/vendor/jquery/jquery.min.js"></script>

<!-- Hero -->
<div id="content_hero" >
	<iframe class="ww"
			src="https://www.youtube-nocookie.com/embed/${w.wVideo}?autoplay=1&amp;loop=1;playlist=${w.wVideo}&controls=0&vq=hd720"
			frameborder="0"	allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
			allowfullscreen></iframe>
	<a href="#afterHeader" class="anchor">
		<img src="${pageContext.request.contextPath}/images/scroll-arrow.svg" alt="Scroll down" class="scroll" />
	</a>
</div>

<!-- Section -->
<div class="container section news totop">
	<div class="row"   id="afterHeader">
	<%@ include file="/WEB-INF/views/include/include_work_sidebar.jsp"%>
		<div class="col-sm-9 col-sm-push-1" id="work_list_main" >
			<!-- 기업회원 -->					
			<h2>HOT AD</h2>
			<div class="slick-carousel newIn" >
				<c:forEach var="cw" items="${cw}">
					<form id="product_${cw.product[0].pNo}">
						<input type="hidden" value="${userNo}" name="userNo">
						<input type="hidden" value="${cw.product[0].wNo}" name="wNo">
						<input type="hidden" value="${cw.product[0].pNo}" name="pNo">
						<div class="movie-slide">
							<div class="movie-poster2">
								<a href="#" onclick="productpage(${cw.product[0].pNo})"> <img
									src="${pageContext.request.contextPath}/images/product/scene/${cw.product[0].pScene}.jpg"
									alt="${cw.product[0].pName}" style="width:100%; height:108px;"/>
								</a>
							</div>
							<div pNo="${cw.product[0].pNo}">
								<c:choose>
									<c:when test="${!empty userNo}">
										<c:set var="cnt" value="0"/>
										<c:forEach var="bm" items="${bmList}">
											<c:if test="${cw.product[0].pNo eq bm.product.pNo}">
												<c:set var="cnt" value="1"/>
											</c:if>
										</c:forEach>
										<c:choose>
											<c:when test="${cnt==1}">
												<input class="material-icons" type="image"
														style="border: none; width: 10%; float:left; padding: 0px; margin: 0 5%;" alt="즐겨찾기 제거"
														src="${pageContext.request.contextPath}/images/star.png"
														onclick="select_bookmark(${userNo},${cw.product[0].pNo});return false;">
											</c:when>
											<c:otherwise>
												<input class="material-icons" type="image"
												style="border: none; width: 10%; float:left; padding: 0px; margin: 0 5%;" alt="즐겨찾기 등록"
												src="${pageContext.request.contextPath}/images/emptystar.png"
												onclick="create_bookmark(${userNo},${cw.product[0].pNo});return false;">	
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:otherwise>
										<input class="material-icons" type="image"
										style="border: none; width: 10%; float:left; padding: 0px; margin: 0 5%;" alt="즐겨찾기 등록"
										src="${pageContext.request.contextPath}/images/emptystar.png"
										onclick="login_advice(); return false;">													
									</c:otherwise>
								</c:choose>
								<div class="no-underline" style="margin: 2% 0px;text-align:right;">${cw.product[0].pName}</div>
								<div style="text-align:right; margin: 8% 0;">조회수: ${cw.product[0].pView}</div>
							</div>
						</div>
					</form>
				</c:forEach>
			</div>
					
			<!-- 일반회원 -->
			<article class="mwList" id="mwList">
				<c:choose>
					<c:when test="${mwe ne null}">
						<c:forEach var="mw" items="${mwe}">
							<form id="product_${mw.product[0].pNo}" style='margin:7% 0;'>
								<h2 value="상품이름" >${mw.product[0].pName}</h2>
								<input type="hidden" value="${userNo}" name="userNo">
								<input type="hidden" class="wNoo" value="${mw.product[0].wNo}" name="wNo">
								<input type="hidden" value="${mw.product[0].pNo}" name="pNo">
								<div class="movie-poster2">
									<img onclick="productpage(${mw.product[0].pNo})"
										src="${pageContext.request.contextPath}/images/product/scene/${mw.product[0].pScene}.jpg"
										alt="${mw.product[0].pName}" style="width:850px; height:450px; margin: 0;cursor: pointer;"/>
								</div>
								<div style="height:35px;">
									<c:choose>
										<c:when test="${!empty userNo}">
											<c:set var="cnt" value="0"/>
											<c:forEach var="bm" items="${bmList}">
												<c:if test="${mw.product[0].pNo eq bm.product.pNo}">
													<c:set var="cnt" value="1"/>
												</c:if>
											</c:forEach>
											<c:choose>
												<c:when test="${cnt==1}">
													<input class="material-icons" type="image" 
															style="border: none; width: 4%; float:left; padding: 0px;" alt="즐겨찾기 제거"
															src="${pageContext.request.contextPath}/images/star.png"
															onclick="select_bookmark(${userNo},${mw.product[0].pNo});return false;">
												</c:when>
												<c:otherwise>
													<input class="material-icons" type="image"
													style="border: none; width: 4%; float:left; padding: 0px;" alt="즐겨찾기 등록"
													src="${pageContext.request.contextPath}/images/emptystar.png"
													onclick="create_bookmark(${userNo},${mw.product[0].pNo});return false;">	
												</c:otherwise>
											</c:choose>
										</c:when>
										<c:otherwise>
											<input class="material-icons" type="image"
											style="border: none; width: 4%; float:left; padding: 0px;" alt="즐겨찾기 등록"
											src="${pageContext.request.contextPath}/images/emptystar.png"
											onclick="login_advice(); return false;">													
										</c:otherwise>
									</c:choose>
									<div style="float:right;">
										<span value="작성자">작성자: ${mw.product[0].mId}</span>
										<span class="categories tag" value="조회수">조회수: ${mw.product[0].pView}</span>
										<span class="categories tag" value="에피소드">${mw.wdEpisode}회</span>
									</div>
								</div>
							</form>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<div  style="text-align: center;margin: 20% 0;">게시글이 없습니다.</div>
					</c:otherwise>
				</c:choose>
			</article>
			<div class="mwListEnd" >
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/include_js.jsp" %>
</body>	
</html>