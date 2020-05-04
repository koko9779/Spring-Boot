<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/admin/include/include_top.jsp"%>
<!-- Page Heading -->
<div class="col-lg-10">
	<h1 class="h3 mb-2 text-gray-800">상품관리페이지</h1>
	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">
					<thead>
						<tr>
							<th></th>
							<th hidden="pNo1"></th>
							<th>이름</th>
							<th>가격</th>
							<th>주소</th>
							<th>상세주소</th>
							<th>조회수</th>
							<th>승인여부</th>
							<th>상세정보</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="product" items="${data }">
							<tr>
								<td><input type="checkbox" name="product_CheckBox"></td>
								<td hidden="pNo2">${product.pNo}</td>
								<td>${product.pName}</td>
								<td style="text-align: right"><fmt:formatNumber value="${product.pPrice}" pattern="#,###" />
원</td>
								<td>${product.pAddress}</td>
								<td>${product.pDaddress}</td>
								<td>${product.pView}</td>
								<td>${product.pCheck}</td>
								<td><button type="button" class="btn btn-default btn-lg io-data io-fn-nextStep"
								id="pCheckBtn">수정</button></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<button type="button" class="btn btn-outline btn-primary pull-right"
					id="pSelectBtn">선택삭제</button>
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
