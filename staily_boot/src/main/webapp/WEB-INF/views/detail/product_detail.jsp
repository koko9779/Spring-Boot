<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include
	file="/WEB-INF/views/include/detail/include_css_product_detail.jsp"%>
<%@ include file="/WEB-INF/views/include/tags.jspf"%>
<%@ include file="/WEB-INF/views/include/include_navbar.jsp"%>
<style>
.scale {
  transform: scale(1);
  -webkit-transform: scale(1);	/*크롬*/
  -moz-transform: scale(1); /*fire fox*/
  -ms-transform: scale(1); /*익스플로러*/
  -o-transform: scale(1); /*opera*/
  transition: all 0.3s ease-in-out;   /* 부드러운 모션을 위해 추가*/
}
.scale:hover {
  width: 600px;
  hight: 400px;
  transform: scale(1.2);
  -webkit-transform: scale(1.2);
  -moz-transform: scale(1.2);
  -ms-transform: scale(1.2);
  -o-transform: scale(1.2);
}
</style>
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
	<div class="row" id="afterHeader">
		<%@ include file="/WEB-INF/views/include/include_work_sidebar.jsp"%>
		<div class="col-sm-9 col-sm-push-1">
			<h2 style="margin-bottom: 0;">이 상품이 나온 장면</h2>
			<img
				src="${pageContext.request.contextPath}/images/product/scene/${productOne.get(0).getpScene()}.jpg"
				style="padding: 20px; height: 450px; width: 850px;">
			
			<!-- Section -->
			<h2 style="margin-top:5%;">상품 이미지</h2>
			<div class="slick-carousel news-carousel" style="height: 280px">
				<c:forEach var="product" items="${productOne}">
					<div > 
						<img class="scale" src="${pageContext.request.contextPath}/images/product/image/${product.pdImage}.jpg">
					</div>
				</c:forEach>
			</div>

			<!-- Section -->
			<div class="row">
				<div class="tabs" style="margin-top: 60px;">
					<ul>
						<li><a href="#one">상품 정보</a></li>
						<c:if test="${not empty productOne.get(0).getpAddress()}">
							<li><a href="#two" id="maps">매장 지도</a></li>
						</c:if>
						<li><a href="#three" id="reply">댓글</a></li>
					</ul>
					<div id="one">
					<table class="table table=hover">
						<colgroup>
							<col class="col_wp25">
							<col class="col_auto">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row" class="bg-light essentia"><label for="mId">작성자</label></th>
								<td class="text-left" style="text-align: left;">
									<div class="dropdown" id="results">
										<button class="btn btn-primary dropdown-toggle"
											style="display: inline-block;" data-toggle="dropdown"
											id="searchword" value="${productOne.get(0).getmId()}">
											${productOne.get(0).getmId()}</button>
										<c:choose>
											<c:when test="${not empty userNo}">
												<div class="dropdown-menu" id='searchDropdown'>
														<a class="dropdown-item" href="#" onClick="return false;" id="addFriend">친구 추가</a> 
														<a class="dropdown-item" href="#" onClick="return false;" id="searchMessage">쪽지 보내기</a>
													</div>
											</c:when>
											<c:otherwise>
											</c:otherwise>
										</c:choose>
										<c:choose>
											<c:when test="${userNo eq productOne.get(0).getmNo()}">
												<button class="btn btn-primary" style="display: inline-block;"
													onClick="deleteProduct()" value="${productOne.get(0).getmId()}">
													상품 삭제하기
												</button>
											</c:when>
											<c:otherwise>
											</c:otherwise>
										</c:choose>
									</div>
								</td>
							</tr>
							<c:choose>
								<c:when test="${not empty bmNo}">
								<tr>
									<th scope="row" class="bg-light essentia"><label for="favorite">즐겨찾기</label></th>
									<td class="text-left" style="text-align: left;">
										<div class="col">
											<input class="material-icons bookmark" type="image" alt="즐겨찾기 제거" id="createBmk"
												src="${pageContext.request.contextPath}/images/star.png" style="width : 4%;"
												onClick='select_bookmark2(" + ${userNo} + "," + ${productOne.get(0).getpNo()} + ");return false;'>
										</div>
									</td>
								</tr>
									
								</c:when>
								<c:otherwise>
									<c:choose>
										<c:when test="${not empty userNo}">
											<tr>
												<th scope="row" class="bg-light essentia"><label for="favorite">즐겨찾기</label></th>
												<td class="text-left" style="text-align: left;">
													<div class="col">
														<input class="material-icons bookmark" type="image" alt="즐겨찾기 추가" id="createBmk"
															src="${pageContext.request.contextPath}/images/emptystar.png" style="width: 4%;"
															onClick='create_bookmark2(" + ${userNo} + "," + ${productOne.get(0).getpNo()} + ");return false;'>
													</div>
												</td>
											</tr>
										
										</c:when>
										<c:otherwise>
										</c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>
							<tr>
								<th scope="row" class="bg-light essentia"><label for="pName">상품명</label></th>
								<td class="text-left" style="text-align: left;">
									<div class="col">${productOne.get(0).getpName()}</div>
								</td>
							</tr>
							<tr>
								<th scope="row" class="bg-light essentia"><label for="pPrice">가격</label></th>
								<td class="text-left" style="text-align: left;">
									<div class="col">${productOne.get(0).getpPrice()}원</div>
								</td>
							</tr>
							<tr>
								<th scope="row" class="bg-light essentia"><label for="pUrl">쇼핑몰 URL</label></th>
								<td class="text-left" style="text-align: left;">
									<div class="col"><a href='${productOne.get(0).getpUrl()}' target="_blank">${productOne.get(0).getpUrl()}</a></div>
								</td>
							</tr>
							<c:if test="${not empty productOne.get(0).getpAddress()}">
								<tr>
									<th scope="row" class="bg-light essentia"><label for="pAddress">오프라인 주소</label></th>
									<td class="text-left" style="text-align: left;">
										<div class="col">${productOne.get(0).getpAddress()} ${productOne.get(0).getpDaddress()}</div>
									</td>
								</tr>
							</c:if>
						</tbody>
					</table>
					</div>
					<c:if test="${not empty productOne.get(0).getpAddress()}">
						<div id="two">
							<div id="map" style="width: 100%; height: 600px">
							
							</div>
						</div>
					</c:if>
					<div id="three">
						<div class="comments">
							<div class="col-sm-12">
								<form name="rpl">
									<c:choose>
										<c:when test="${not empty userNo}">
											<div class="form-group">
												<label>댓글 입력</label>
												<textarea rows="2" name="rContent" id="rContent"></textarea>
											</div>
											<div class="form-group right-align">
												<button type="button" class="btn btn-ghost" id="createreply">작성하기</button>
											</div>
										</c:when>
										<c:otherwise>
										</c:otherwise>
									</c:choose>
									<input type="hidden" name="mNo" id="mNo" value="${userNo}">
									<input type="hidden" name="mId" id="mId" value="${userId}">
									<input type="hidden" name="pNoo" id="pNoo" value="${productOne.get(0).getpNo()}">
									<input type="hidden" name="wNo" id="wNo" value="${wNo}">
								</form>
								<div id="reply_space"></div>
							</div>
						</div>
					</div>
				</div>
				<form name="pNo_request" method="POST">
					<input type="hidden" id="pNo" name="pNo"
						value="${productOne.get(0).getpNo()}">
				</form>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/detail/include/include_product_detail_js.jsp"%>
<%@ include file="/WEB-INF/views/include/detail/include_detail_js.jsp"%>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=727c99111bf8164d3824366e553400b6&libraries=services"></script>
<style>
.iw_inner {
	padding:10px;
}

.iw_inner h3 {
	font-size: 18px; 
	padding-bottom: 7px;
}

.wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 15px;font-family: 'arita';line-height: 1.5;src:url(fonts/GodoM.ttf)}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;padding: 5%;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 15px;color: #888;margin-top: -2px;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
</style>
<script>
var address1 = "${productOne.get(0).getpAddress()}";

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    level: 3, // 지도의 확대 레벨
    disableDoubleClickZoom: true
    
};  

//지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

//일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
var mapTypeControl = new kakao.maps.MapTypeControl();

// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
var zoomControl = new kakao.maps.ZoomControl();
map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

//주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

//주소로 좌표를 검색합니다
geocoder.addressSearch(address1, function(result, status) {
	

	// 정상적으로 검색이 완료됐으면 
	if (status === kakao.maps.services.Status.OK) {
		var count = 0;

	    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	    // 결과값으로 받은 위치를 마커로 표시합니다
	    var marker = new kakao.maps.Marker({
	        map: map,
	        position: coords
	    });
	    
	    var roadview = "https://map.kakao.com/link/roadview/" + result[0].y + "," + result[0].x;
	    var direction = "https://map.kakao.com/link/to/" + address1 + "," + result[0].y + "," + result[0].x;
	    
		// 커스텀 오버레이에 표시할 컨텐츠 입니다
		// 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
		// 별도의 이벤트 메소드를 제공하지 않습니다 
		var content = '<div class="wrap">' + 
		            '    <div class="info">' + 
		            '        <div class="body">' + 
		            '            <div class="desc">' + 
		            '                <div class="ellipsis">${productOne.get(0).getpAddress()}</div>' + 
		            '                <div class="jibun ellipsis">${productOne.get(0).getpDaddress()}</div>' + 
		            '                <div><a href="${productOne.get(0).getpUrl()}" target="_blank" class="link">홈페이지</a></div>' + 
		            '            </div>' + 
		            '            <div class="toolbar" style="text-align: center;">' + 
		            '           	 <div class="roadview" style="float: left;width: 50%;padding: 4%">' + 
		            '           	 	<a href="' + roadview + '" target="_blank">로드뷰</a>' + 
		            '           	 </div>' + 
		            '           	 <div class="direction" style="float: left;width: 50%;padding: 4%">' + 
		            '           	 	<a href="' + direction + '" target="_blank">길찾기</a>' + 
		            '           	 </div>' + 
		            '            </div>' + 
		            '        </div>' + 
		            '    </div>' +    
	            	'  </div>';
			
		// 마커 위에 커스텀오버레이를 표시합니다
		// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
		var overlay = new kakao.maps.CustomOverlay({
		    content: content,
		    map: map,
		    position: marker.getPosition()       
		});
		
	
	    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	    map.setCenter(coords);
		
		// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
		kakao.maps.event.addListener(marker, 'click', function() {
			if(count == 0) {
			    overlay.setMap(null);
			    count = 1;				
			}
			else {
			    overlay.setMap(map);
			    count = 0;
			}
		});
	
	}
});  

	
$("#maps").on("click", function(e) {
	geocoder.addressSearch(address1);
});



</script>
</body>
</html>