<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/admin/include/include_top.jsp"%>
<!-- Page Heading -->
<div class="col-lg-10">
	<h1 class="h3 mb-2 text-gray-800">회원관리페이지</h1>
	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">
					<thead>
						<tr>
							<th></th>
							<th>회원번호</th>
							<th>회원아이디</th>
							<th>회원이름</th>
							<th>이메일</th>
							<th>주소</th>
							<th>상세주소</th>
							<th>회원구분</th>
							<th>회원수정</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="member" items="${data }">
							<tr>
								<td><input type="checkbox" name="member_CheckBox"></td>
								<td>${member.mNo}</td>
								<td>${member.mId}</td>
								<td>${member.mName}</td>
								<td>${member.mEmail}</td>
								<td>${member.mAddress}</td>
								<td>${member.mDaddress}</td>
								<c:if test="${member.mType =='M'}">
									<td>일반회원</td>
								</c:if>
								<c:if test="${member.mType =='C'}">
									<td>기업회원</td>
								</c:if>
								<c:if test="${member.mType =='A'}">
									<td>갓리자</td>
								</c:if>
								<td><button type="button" class="btn btn-default btn-lg io-data io-fn-nextStep"
								id="mCheckBtn">수정</button></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<button type="button" class="btn btn-outline btn-primary pull-right"
					id="mSelectBtn">선택삭제</button>
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