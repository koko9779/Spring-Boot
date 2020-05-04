<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/tags.jspf" %>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/product_create.css"/>
<script src="${pageContext.request.contextPath}/css/admin/vendor/jquery/jquery.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<%@ include file="/WEB-INF/views/include/include_navbar.jsp"%>

<!-- Hero -->
<div id="content_hero" >
	<iframe class="ww"
			src="https://www.youtube-nocookie.com/embed/4_iiM-hftZc?autoplay=1&amp;loop=1;playlist=4_iiM-hftZc&controls=0&vq=hd720"
			frameborder="0"	allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
			allowfullscreen></iframe>
	<a href="#afterHeader" class="anchor">
		<img src="${pageContext.request.contextPath}/images/scroll-arrow.svg" alt="Scroll down" class="scroll" />
	</a>
</div>


<div class="totop" id="afterHeader">
	<div class="left" style="margin-top: -50px;">
		<div class="wrap" style="height: auto;">
			<input type="button" class="button_css2" value="작품 검색" onClick="work_search()">
		</div>
		<form name="work" method="post">
			<table class="table table=hover">
				<colgroup>
					<col class="col_wp25">
					<col class="col_auto">
				</colgroup>
				<tbody>
					<tr>
						<th scope="row" class="bg-light essentia"><label for="wName">
								작품명</label></th>
						<td class="text-left" style="text-align: left;">
							<div class="col">
								${workOne.getwName()}
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row" class="bg-light essentia"><label for="wCategory">
								카테고리</label></th>
						<td class="text-left" style="text-align: left;">
							<div class="col">
								<c:choose>
									<c:when test="${workOne.getwCategory() eq 'D'}">
										드라마
									</c:when>
									<c:otherwise>
										영화
									</c:otherwise>
								</c:choose>						
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row" class="bg-light essentia"><label for="wDate">
								처음 방영(개봉)일</label></th>
						<td class="text-left" style="text-align: left;">
							<div class="col">
								<fmt:parseDate value="${workOne.getwDate()}" var="dateFormat" pattern="yyyy-MM-dd"/>
								<fmt:formatDate value="${dateFormat}" pattern="yyyy-MM-dd(E)" type="both"/>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row" class="bg-light essentia"><label for="wTepisode">
								전체 회차</label></th>
						<td class="text-left" style="text-align: left;">
							<div class="col">
								${workOne.getwTepisode()}부작
							</div>
						</td>
					</tr>
					<tr>
						<th colspan="2" class="bg-light essentia" style="text-align: center;"><label for="wPoster">
								작품 포스터</label></th>
					</tr>
					<tr>
						<th colspan="2" style="text-align: center;">
						<img src='https://image.tmdb.org/t/p/w600_and_h900_bestv2/${workOne.wPoster}' width='280px' height='400px'></th>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	
	<div class="right" style="margin-top: -50px;">
		<form name="createP" method="post">
			<input type="hidden" id="wNo" name="wNo" value="${workOne.wNo}">
			<table class="table table=hover">
				<colgroup>
					<col class="col_wp25">
					<col class="col_auto">
				</colgroup>
				<tbody>
					<tr>
						<th scope="row" class="bg-light essentia"><label for="wdEpisode">
								상품이 나온 회차</label></th>
						<td class="text-left" style="text-align: left;">
							<div class="col">
								<select id="wdEpisode" name="wdEpisode">
									<c:forEach var="i" begin="1" end="${workOne.wTepisode}">
										<option value="${i}">${i}화</option>
									</c:forEach>
								</select>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row" class="bg-light essentia"><label for="pName">
								상품명 <span style="color: red;">*</span></label></th>
						<td class="text-left" style="text-align: left;">
							<div class="col">
								<input type="text" name="pName" id="pName" class="form-control"
									maxlength="100">
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row" class="bg-light essentia"><label for="pPrice">
								가격 <span style="color: red;">*</span></label></th>
						<td class="text-left" style="text-align: left;">
							<div class="col">
								<input type="text" name="pPrice" id="pPrice" class="form-control"
									maxlength="20" placeholder="숫자만 입력 가능합니다">
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row" class="bg-light essentia"><label for="pUrl">
								쇼핑몰 URL <span style="color: red;">*</span></label></th>
						<td class="text-left" style="text-align: left;">
							<div class="col">
								<input type="text" name="pUrl" id="pUrl" class="form-control"
									maxlength="300">
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row" class="bg-light essentia"><label for="pAddress">
								주소</label></th>
						<td class="text-left" style="text-align: left;">
							<div class="col">
								<input type="text" name="pAddress" id="pAddress" value="${param.pAddress}"
									onclick="execDaumPostcode()" placeholder="이 곳을 클릭하세요" class="form-control" readonly>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row" class="bg-light essentia"><label for="pDaddress">
								상세 주소</label></th>
						<td class="text-left" style="text-align: left;">
							<div class="col">					
								<input type="text" name="pDaddress" id="pDaddress" class="form-control"
									maxlength="20" placeholder="주소를 먼저 입력하세요" readonly>								
							</div>
						</td>
					</tr>					
					<tr>
						<th scope="row" class="bg-light essentia"><label for="pScene">
								상품이 나온 장면<br>(최대 1장) <span style="color: red;">*</span></label></th>
						<td class="text-left" style="text-align: left;">
							<div class="col">
								<button id="scene" type="button" class="button_css" onClick="sceneUp();">이미지 업로드</button>
								<div id="uploadedScene" style="padding-top: 7px"></div>
								<input type="hidden" id="realname1" name="realname1" /> 
								<input type="hidden" id="filename1" name="filename1" /> 
								<input type="hidden" id="filesize1" name="filesize1" />
							</div>
						</td>
					</tr>	
					<tr>
						<th scope="row" class="bg-light essentia"><label for="pScene">
								상품 이미지<br>(최대 10장) <span style="color: red;">*</span></label></th>
						<td class="text-left" style="text-align: left;">
							<div class="col">
								<button id="image" type="button" class="button_css" onClick="imageUp();">이미지 업로드</button>
								<div id="uploadedImage" style="padding-top: 7px"></div>
								<input type="hidden" id="realname2" name="realname2" /> 
								<input type="hidden" id="filename2" name="filename2" /> 
								<input type="hidden" id="filesize2" name="filesize2" />
															
							</div>
						</td>
					</tr>	
					<tr>
						<th scope="row" class="bg-light essentia" colspan="2"><label for="pScene">
								<span style="color: red;">*</span>은(는) 필수 항목입니다.</label></th>
					</tr>
				</tbody>		
			</table>
			<div id="splitspace">
			</div>
			<div class="wrap" style="height:auto;">
				<button class="button_css" type="button" onClick="productCreate()">작성하기</button>
				<button class="button_css" type="reset">다시 쓰기</button>
			</div>
			
		</form>
	</div>
</div>
</body>
<%@ include file="/WEB-INF/views/include/detail/include_detail_js.jsp"%>
<script src="${pageContext.request.contextPath}/js/custom_js/detail.js"></script>
<script>
function sceneUp() {
	window.open(
		"pdScene_create",
		"pdScene_create_frame",
		"width=700, height = 350"
	);
}

function imageUp() {
	window.open(
		"pdImage_create",
		"pdImage_create_frame",
		"width=700, height = 350"
	);
}
</script>
</html>