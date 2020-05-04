<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include
	file="/WEB-INF/views/admin/include/include_popup_css.jsp"%>
<style>
.text-left {
	text-align: left;
}

.scale {
  transform: scale(1);
  -webkit-transform: scale(1);
  -moz-transform: scale(1);
  -ms-transform: scale(1);
  -o-transform: scale(1);
  transition: all 0.3s ease-in-out;   /* 부드러운 모션을 위해 추가*/
}
.scale:hover {
  transform: scale(1.2);
  -webkit-transform: scale(1.2);
  -moz-transform: scale(1.2);
  -ms-transform: scale(1.2);
  -o-transform: scale(1.2);
}
</style>
<body>
<!-- Page Heading -->
<h1 class="h3 mb-2 text-gray-800">상품정보페이지</h1>
<!-- DataTales Example -->
<div class="join-step2">
	<!--<div class="text-header">기본정보 ( * 필수 입력 항목)</div>-->
	<div class="border border-secondary">
<form id="product_detail" name="product_detail" method="post">
	<div class="container-fluid">
		<input type="hidden" name="pNo" id="pNo" value="${productList[0].pNo}">
		<input type="hidden" name="mNo" id="mNo" value="${productList[0].mNo}">
		<input type="hidden" name="wNo" id="wNo" value="${productList[0].wNo}">
		<input type="hidden" name="pView" id="pView"
			value="${productList[0].pView}"> <input type="hidden"
			name="pScene" id="pScene" value="${productList[0].pScene}"> <input
			type="hidden" name="pDate" id="pDate" value="${productList[0].pDate}">
		<input type="hidden" name="pCheck" id="pCheck"
			value="${productList[0].pCheck}">
		<c:forEach var="product" items="${productList }">
			<input type="hidden" name="pdNo" id="pdNo" value="${product.pdNo }">
		</c:forEach>
		<table class="table table-hover">
			<colgroup>
				<col class="col_wp25">
				<col class="col_auto">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row" class="bg-light essentia" colspan="2"><label
						for="pName"> 상품이름</label></th>
					<td class="text-left" colspan="2">
						<div class="col">
							<input type="text" name="pName" id="pName" class="form-control"
								value="${productList[0].pName }" maxlength="20">
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="bg-light essentia" colspan="2"><label
						for="pPrice"> 상품가격</label></th>
					<td class="text-left" colspan="2">
						<div class="col">
							<input type="text" name="pPrice" id="pPrice" class="form-control"
								value="${productList[0].pPrice }" maxlength="20">
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="bg-light essentia" colspan="2"><label
						for="pUrl"> 상품URL</label></th>
					<td class="text-left">
						<div class="col" colspan="2">
							<input type="text" name="pURL" id="pURL" class="form-control"
								value="${productList[0].pUrl }">
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="bg-light essentia" colspan="2"><label
						for="pAddress">오프라인주소</label></th>
					<td class="text-left" colspan="2">
						<div class="col">
							<input type="text" name="pAddress" id="pAddress"
								onclick="execDaumPostcode('pAddress')" value="${productList[0].pAddress }"
								readonly="readonly" class="form-control">
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="bg-light essentia" colspan="2"><label
						for="daddress">상세주소</label></th>
					<td class="text-left" colspan="2">
						<div class="col">
							<input type="text" name="pDaddress" id="pDaddress"
								class="form-control" value="${productList[0].pDaddress }">
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="bg-light essentia" colspan="2"><label>
							상품조회수</label></th>
					<td class="text-left" colspan="2" align="left">
						<div class="col">${productList[0].pView }</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="bg-light essentia" colspan="2"><label
						for="pCheck">장면이미지변경</label></th>
					<td class="text-left"><img class="scale" width="auto" height="auto"
						src="${pageContext.request.contextPath}/images/product/scene/${productList[0].pScene }.jpg"
						alt="${productList[0].pScene }"> <input type="hidden"
						value="${productList[0].pScene }"></td>
					<td class="text-left"><button type="button" name="modalBtn"
							class="btn btn-outline btn-primary pull-right" onclick="sceneUpdate(${productList[0].pScene })">수정하기</button></td>
				</tr>
				<c:forEach var="product" items="${productList }">
					<tr>
						<th scope="row" class="bg-light essentia" colspan="2"><label
							for="pCheck">상품이미지변경</label></th>
						<td class="text-left">
							<div class="col" align="center">
								<img class="scale" width="auto" height="auto"
									src="${pageContext.request.contextPath}/images/product/image/${product.pdImage}.jpg" >
							</div>
						</td>
						<td class="text-left"><button type="button" name="modalBtn"
								class="btn btn-outline btn-primary pull-right" onclick="imageUpdate(${product.pdImage})">수정하기</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="text-center">
			<button type="button"
				class="btn btn-default btn-lg io-data io-fn-nextStep" data-step="2"
				id="pUpdate">수정</button>
			<button type="button"
				class="btn btn-default btn-lg io-data io-fn-nextStep" data-step="2"
				onclick="product_confirm(${productList[0].pNo})">승인</button>
			<button type="button"
				class="btn btn-default btn-lg io-data io-fn-nextStep" data-step="2"
				onclick="product_reject(${productList[0].mNo})">거부</button>
		</div>
</form>
	</div>
</div>
<!-- DataTales Example -->
</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->
<%@ include file="/WEB-INF/views/admin/include/include_js.jsp"%>
</body>
</html>

