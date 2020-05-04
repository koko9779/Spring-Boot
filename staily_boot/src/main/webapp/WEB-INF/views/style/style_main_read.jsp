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
	<!--  
	<div class="row">

		<%--@ include file="/WEB-INF/views/include/include_work_sidebar.jsp"--%>

		<div class="col-sm-9 col-sm-push-1" style="width: 70%">
	-->
			<!-- Page Heading -->
			<%@ include file="/WEB-INF/views/style/include/include_board_sidebar.jsp"%>
			
			<div class="col-sm-10">
				<c:choose>
				<c:when test="${bType eq 'F'}">
					<h1 class="h3 mb-2 text-gray-800">자유 게시판</h1>
				</c:when>
				<c:when test="${bType eq 'Q'}">
					<h1 class="h3 mb-2 text-gray-800">1 : 1 문의</h1>
				</c:when>
				<c:otherwise>
					<h1 class="h3 mb-2 text-gray-800">스타일 Q & A</h1>
				</c:otherwise>
				</c:choose>
<!-- DataTales Example -->
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<div>
							총 질문 수: ${boardCount} / 총 답글 수: ${replyCount}
						</div>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered" id="dataTable2" width="100%"
								cellspacing="0">
								<thead>
									<tr>
										<th>번호</th>
										<th>제목</th>
										<th>글쓴이</th>
										<th>조회수</th>
										<th>작성 날짜</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="board" items="${data}">
										<tr>
											<td>${board.bIdx}</td>
											<td>
												<a href="style_detail_read?bNo=${board.bNo}">
													${board.bTitle}
												</a>
											</td>
											<td>${board.mId}</td>
											<td>${board.bView}</td>
											<td>${board.bDate}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
								<c:choose>
									<c:when test="${userNo == '' || userNo == undefined || userNo == null}">
										<a href="javascript:required_login();" class="btn btn-ghost sort">
											<span>쓰기</span>
										</a>
									</c:when>
									<c:otherwise>
										<a href="javascript:move_style_board_create('${bType}');" class="btn btn-ghost sort">
											<span>쓰기</span>
										</a>
									</c:otherwise>
								</c:choose>
							<div id="msg">
							</div>
						</div>
					</div>
				</div>
			</div>


</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/include_footer.jsp"%>
<%@ include file="/WEB-INF/views/admin/include/include_js.jsp" %>
<script type="text/javascript">
$(function (){
		$("#dataTable_paginate > ul > li.paginate_button.page-item.active > a").css("background-color", "#e76115");
		$("#dataTable_paginate > ul > li.paginate_button.page-item.active > a").css("border-color", "#e76115");
	
	$("#dataTable_paginate > ul > .page-link").click(function() {
		$(".page-link").css("background-color", "#e76115");
		$(".page-link").css("border-color", "#e76115");
	});
	
	
	
	
	var table =  $('#dataTable2').DataTable({
	    "language": {
	        "emptyTable": "데이터가 없어요.",
	        "lengthMenu": "페이지당 _MENU_ 개씩 보기",
	        "info": "현재 _START_ - _END_ / _TOTAL_건",
	        "infoEmpty": "데이터 없음",
	        "infoFiltered": "( _MAX_건의 데이터에서 필터링됨 )",
	        "search": "검색: ",
	        "zeroRecords": "일치하는 데이터가 없어요.",
	        "loadingRecords": "로딩중...",
	        "processing":     "잠시만 기다려 주세요...",
	        "paginate": {
	            "next": "다음",
	            "previous": "이전"
	        }
	    },
	    order: [[0, 'desc']], 
	});
});
</script>

</body>
</html>