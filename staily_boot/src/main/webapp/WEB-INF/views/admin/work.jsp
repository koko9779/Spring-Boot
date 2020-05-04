<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/admin/include/include_top.jsp"%>

<!-- Page Heading -->
<div class="col-lg-10">
	<h1 class="h3 mb-3 text-gray-800">작품관리페이지</h1>
	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">
					<thead>
						<tr valign="middle" align="center">
							<th></th>
							<th hidden="wNo">번호</th>
							<th>이름</th>
							<th>카테고리</th>
							<th>방영일</th>
							<th>전체회차</th>
							<th>작품상세정보</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="work" items="${data }">
							<tr valign="middle" align="center">
								<td><input type="checkbox" name="work_CheckBox"></td>
								<td hidden="wNo2">${work.wNo}</td>
								<td>${work.wName}</td>
								<c:choose>
									<c:when test="${work.wCategory =='D'}">
										<td>드라마</td>
									</c:when>
									<c:when test="${work.wCategory =='M'}">
										<td>영화</td>
									</c:when>
								</c:choose>
								<td>${work.wDate}</td>
								<td>${work.wTepisode}</td>
								<td><button type="button" class="btn btn-default btn-lg io-data io-fn-nextStep"
								id="wCheckBtn">수정</button></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<button type="button" class="btn btn-outline btn-primary pull-right"
					id="wSelectBtn">선택삭제</button>
				<button type="button" class="btn btn-outline btn-primary pull-right"
					id="createtBtn" onclick="searchWork()">작품등록</button>
			</div>
		</div>
	</div>
</div>

</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->

<%@ include file="/WEB-INF/views/admin/include/include_js.jsp"%>
</body>
</html>