<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/tags.jspf"%>
<%@ include file="/WEB-INF/views/include/include_navbar.jsp"%>

<!-- Hero -->
<div id="content_hero" >
	<iframe class="ww"
			src="https://www.youtube-nocookie.com/embed/-Jvx0uqn3Zc?autoplay=1&amp;loop=1;playlist=-Jvx0uqn3Zc&controls=0&vq=hd720"
			frameborder="0"	allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
			allowfullscreen></iframe>
	<a href="#afterHeader" class="anchor">
		<img src="${pageContext.request.contextPath}/images/scroll-arrow.svg" alt="Scroll down" class="scroll" />
	</a>
</div>

<!-- Section -->
<div class="container news section totop">
	<!-- DataTales Example -->
	<h1>공지사항</h1>
	<div class="card shadow mb-4">
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable2" width="100%"
					cellspacing="0">
					<thead>
						<tr>
							<th>제목</th>
							<th>조회수</th>
							<th>작성 날짜</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="board" items="${data}">
							<tr>
								<td align="center"><a href="detail?bNo=${board.bNo}">
										${board.bTitle} </a></td>
								<td align="center">${board.bView}</td>
								<td align="center">${board.bDate}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
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
<%@ include file="/WEB-INF/views/admin/include/include_js.jsp"%>
<script type="text/javascript">
	$(function() {
		$("#dataTable_paginate > ul > li.paginate_button.page-item.active > a")
				.css("background-color", "#e76115");
		$("#dataTable_paginate > ul > li.paginate_button.page-item.active > a")
				.css("border-color", "#e76115");

		$("#dataTable_paginate > ul > .page-link").click(function() {
			$(".page-link").css("background-color", "#e76115");
			$(".page-link").css("border-color", "#e76115");
		});

		var table = $('#dataTable2').DataTable({
			"language" : {
				"emptyTable" : "데이터가 없어요.",
				"lengthMenu" : "페이지당 _MENU_ 개씩 보기",
				"info" : "현재 _START_ - _END_ / _TOTAL_건",
				"infoEmpty" : "데이터 없음",
				"infoFiltered" : "( _MAX_건의 데이터에서 필터링됨 )",
				"search" : "검색: ",
				"zeroRecords" : "일치하는 데이터가 없어요.",
				"loadingRecords" : "로딩중...",
				"processing" : "잠시만 기다려 주세요...",
				"paginate" : {
					"next" : "다음",
					"previous" : "이전"
				}
			},
			order : [ [ 0, 'desc' ] ],
		});
	});
</script>
<style>
.pagination>.active>a, .pagination>.active>a:hover {
	background-color: #e76115 !important;
	border-color: #e76115 !important;
}

.table-responsive {
	overflow-x: hidden;
}
</style>

</body>
</html>