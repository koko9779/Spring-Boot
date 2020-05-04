<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link href="${pageContext.request.contextPath}/ckeditor/contents.css" rel="stylesheet">
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
			<div class="m-t--120">
			<%@ include file="/WEB-INF/views/style/include/include_board_sidebar.jsp"%>
			<!-- Section -->
					<input type="hidden" id="board_type" value="${boardOneList[0].bType}">
					<div class="col-sm-10">
						<article id="board" style="border-bottom: none;">
						<div id="board2">
						<input type="hidden" id="updateBNo" value="${boardOneList[0].bNo}">
						<h3 class="board-top p-top-21">자유게시판</h3>
						<div class="b-board-bottom border-b-1-d8d8d8 p-b-40">
							<div class="categories col-md-6 board-title f-s-25" id="board_title_read"><span class="">${boardOneList[0].bTitle}</span></div>
							<div class="col-md-6 text-left">
								<span class="font-large">작성자: ${boardOneList[0].mId} | 작성 날짜: ${boardOneList[0].bDate} | 조회수: ${boardOneList[0].bView}</span>
							</div>
						</div>
							<div class="p_content m-top-50" id="board_content_read">
								${boardOneList[0].bContent}
							</div> 
							<c:if test="${sessionScope.userNo eq boardOneList[0].mNo}">
								<a href="javascript:board_delete(${boardOneList[0].bNo});" class="btn btn-ghost sort">
									<span>삭제</span>
								</a>
								<a href="javascript:board_and_reply_modify(${boardOneList[0].bNo});" class="btn btn-ghost sort">
									<span>수정</span>
								</a>
							</c:if>
						</div>
						</article>
						<c:if test="${fn:length(boardOneList) > 1}">
							<h3 class="board-top reply-delete m-top-50" id="reply-top">답글</h3>
						</c:if>
						<c:forEach var="board" items="${boardOneList}" begin="1" varStatus="status">
						<article class="reply reply-delete reply_write" id="board_${board.bNo}">
								<div class="col-md-12 m-top--40 border-b-1-d8d8d8">
								<div class="categories col-md-6 board-title f-s-25">${board.bTitle}</div>
								<div class="col-md-6 text-left"><span class="font-large">작성자: ${board.mId} | 작성 날짜: ${board.bDate}</span></div>
								</div>
								<div class="p_content m-top-50 m-bottom-30" id="board_content_read">
									${board.bContent}
								</div> 
								<c:if test="${board.userRec == 1}">
									<a href="javascript:recommend(${board.bNo});"
									class="btn btn-ghost search-rec clicked-button">
										<span>추천하기  </span><span class="total_bd_count">${board.bdCount}</span>
									</a>
								</c:if>
								<c:if test="${board.userRec != 1}">
									<a href="javascript:recommend(${board.bNo});"
									class="btn btn-ghost search-rec">
										<span>추천하기  </span><span class="total_bd_count">${board.bdCount}</span>
									</a>
								</c:if>
								<c:if test="${sessionScope.userNo eq board.mNo}">
									<a href="javascript:reply_delete(${board.bNo});" class="btn btn-ghost sort">
										<span>삭제</span>
									</a>
									<a href="javascript:reply_update(${board.bNo});" class="btn btn-ghost sort">
										<span>수정</span>
									</a>
								</c:if>
						</article>
						</c:forEach>
						<c:choose>
							<c:when test="${fn:length(boardOneList) == 1}">
								<c:if test="${userNo == null || userNo == undefined}">
									<a href="javascript:required_login();" id="replyWirteFormB" class="btn btn-ghost sort">
											<span>답글 쓰기</span>
									</a>
								</c:if>
								<c:if test="${userNo != null}">
									<a href="javascript:reply_write_form();" id="replyWirteFormB" class="btn btn-ghost sort">
											<span>답글 쓰기</span>
									</a>
								</c:if>
							</c:when>
							<c:otherwise>
								<c:if test="${userNo == null || userNo == undefined}">
									<a href="javascript:required_login();" id="replyWirteFormB" class="btn btn-ghost sort m-top-25">
											<span>답글 쓰기</span>
									</a>
								</c:if>
								<c:if test="${userNo != null}">
									<a href="javascript:reply_write_form();" id="replyWirteFormB" class="btn btn-ghost sort m-top-25">
											<span>답글 쓰기</span>
									</a>
								</c:if>
							</c:otherwise>
						</c:choose>
						<form name='boardReplyWriteF' id="boardReplyWriteF" onSubmit='return false;' class="dispaly_none" style="margin-top: 100px;">
												<input type="hidden" name="bGroupNo" value="${boardOneList[0].bNo}">
												<div class='row justify-content-md-center'>
													제목
													<input type='text' id='repBTitle' name='bTitle' class='form-control title_detail empty'>
													<select class='custom-select form-control' name='bType' id='repBType'>
													<option selected value='S' >스타일코디</option>
													</select>
												</div>
												<div class='row justify-content-md-center'>
													<textarea id='recContents' name='bContent' class="empty"></textarea>
													<script>
														CKEDITOR.replace('recContents',{
															filebrowserUploadUrl : '/staily/style/ImgUpload'
														});
													</script>
												</div>
												<div class='row justify-content-md-center'>
													<button type='submit' class='btn btn-ghost'
															style='width: 20%; font-weight: bold; margin-top: 15px;'  
															onclick='reply_write();'>
														등 록
													</button>
													<button type='submit' id='canselB' class='btn btn-ghost'
														style='width: 20%; font-weight: bold; margin-top: 15px;' 
														onclick='cancel_reply_write();'>
														취 소
													</button>
												</div>
						</form>
					</div>
					</div>
				</div>
			</div>

			<!-- Pagination 
			<div class="section small-padding border-top">
				<div class="container">
					<div class="row">
						<div class="col-sm-12">
							<ul class="pagination">
								<li><a href="#">Prev</a></li>
								<li><a href="#">1</a></li>
								<li><a href="#" class="active">2</a></li>
								<li><span>&hellip;</span></li>
								<li><a href="#">7</a></li>
								<li><a href="#">8</a></li>
								<li><a href="#">Next</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			-->
	<%@ include file="/WEB-INF/views/include/include_footer.jsp"%>
	</body>

</html>