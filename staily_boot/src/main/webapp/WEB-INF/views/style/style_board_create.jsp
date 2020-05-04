<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/tags.jspf"%>
<%@ include file="/WEB-INF/views/include/include_navbar.jsp"%>

<!-- Hero -->
<div id="content_hero" >
	<iframe class="ww"
			src="https://www.youtube-nocookie.com/embed/YubXq6Fh4S0?autoplay=1&amp;loop=1;playlist=YubXq6Fh4S0&controls=0&vq=hd720"
			frameborder="0"	allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
			allowfullscreen></iframe>
	<a href="#afterHeader" class="anchor">
		<img src="${pageContext.request.contextPath}/images/scroll-arrow.svg" alt="Scroll down" class="scroll" />
	</a>
</div>


<!-- Section -->
<div class="container-fluid totop">
	<div class="row" id="afterHeader">
		<%@ include file="/WEB-INF/views/style/include/include_board_sidebar.jsp"%>
		
		<div class="col-sm-10">
			<div class=" col-sm-push-1 m-top-21" style="width: 95%">
				<form id="boardWriteF" name="boardWriteF" onSubmit="return false;">
					<div class="row justify-content-md-center">
							제목
							<input type="text" name="bTitle" class="form-control title_detail" autocomplete ="off">
							<span>
							
							
							<c:choose>
							<c:when test="${param.bType eq 'F'}">
								<select class="custom-select form-control" name="bType" id="inputGroupSelect03">
									<option value="F">자유게시판</option>
								</select>
							</c:when>
							<c:when test="${param.bType eq 'Q'}">
								<select class="custom-select form-control" name="bType" id="inputGroupSelect03">
									<option value="Q">1 : 1 문의</option>
								</select>
							</c:when>
							<c:otherwise>
								<select class="custom-select form-control" name="bType" id="inputGroupSelect03">
									<option value="S">스타일코디</option>
								</select>
							</c:otherwise>
							</c:choose>
							
							<c:if test="${param.bType eq 'S' || param.bType == null }">
								<select class="custom-select form-control" name="bCategory" id="inputGroupSelect04">
									<option selected>카테고리</option>
									<option value="M">영화</option>
									<option value="D">드라마</option>
								</select>
							</c:if>
							</span>
					 </div>
					<div class="row justify-content-md-center">
								<textarea id="contents" name="bContent"></textarea>
								<script>
									CKEDITOR.replace('contents',{
										filebrowserUploadUrl : '/staily/style/ImgUpload'
									});
								</script>
					</div>
					<div class="row justify-content-md-center">
						<c:choose>
						<c:when test="${param.bType eq 'S' || param.bType == null}">
							<button type="submit" class="btn btn-ghost"
								style="width: 20%; font-weight: bold; margin-top: 15px;" onclick="board_create();">등 록</button>
						</c:when>
						<c:when test="${param.bType eq 'Q' || param.bType eq 'F'}">
							<button type="submit" class="btn btn-ghost"
								style="width: 20%; font-weight: bold; margin-top: 15px;" onclick="board_create_other();">등 록</button>
						</c:when>
						</c:choose>
					</div>
				</form>
			</div>
		</div>
		
	</div>
</div>
<%@ include file="/WEB-INF/views/include/include_js.jsp"%>
<%@ include file="/WEB-INF/views/include/include_footer.jsp"%>
</body>
</html>