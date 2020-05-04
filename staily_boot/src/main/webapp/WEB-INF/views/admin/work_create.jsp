<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include
	file="/WEB-INF/views/admin/include/include_popup_css.jsp"%>
<style>
.poster-image {
	margin: auto;
	max-width: 60%;
	height: auto
}
</style>
<form id="work_create" name="work_create" method="post">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div align="center">
					<img
						src="https://image.tmdb.org/t/p/w600_and_h900_bestv2/${work.wPoster}"
						class="poster-image">
				</div>
			</div>
		</div>
		<input type="hidden" id="wPoster" name="wPoster"
			value="${work.wPoster}"> <input type="hidden" id="wCategory"
			name="wCategory" value="${work.wCategory}">
		<table class="table table-hover">
			<colgroup>
				<col class="col_wp25">
				<col class="col_auto">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row" class="bg-light essentia"><label for="wName">
							작품이름</label></th>
					<td class="text-left">
						<div class="col">
							<input type="text" name="wName" id="wName" class="form-control"
								value="${work.wName}" maxlength="20">
						</div>
					</td>
				</tr>

				<tr>
					<th scope="row" class="bg-light essentia"><label
						for="wCategory"> 카테고리</label></th>
					<td class="text-left"><c:if test="${work.wCategory=='D'}">
							<div class="col" align="left">드라마</div>
						</c:if> <c:if test="${work.wCategory=='M'}">
							<div class="col" align="left">영화</div>
						</c:if></td>
				</tr>
				<tr>
					<th scope="row" class="bg-light essentia"><label for="wDate">
							상영일</label></th>
					<td class="text-left">
						<div class="col">
							<input type="text" name="wDate" id="wDate" class="form-control"
								value="${work.wDate}">
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="bg-light essentia"><label> 총회차</label></th>
					<td class="text-left">
						<div class="col">
							<input type="text" name="wTepisode" id="wTepisode"
								class="form-control" value="">
						</div>
					</td>
				</tr>
			</tbody>
		</table>
		<label> 설명</label>
		<div class="col">${wOverview}</div>
		<div class="text-center">
			<button type="button"
				class="btn btn-default btn-lg io-data io-fn-nextStep" data-step="2"
				id="wCreateBtn">등록</button>
			<button type="button"
				class="btn btn-default btn-lg io-data io-fn-nextStep" data-step="2"
				onclick="window_back()">다른작품선택</button>
			<button type="button"
				class="btn btn-default btn-lg io-data io-fn-nextStep" data-step="2"
				onclick="window_close()">닫기</button>
		</div>
</form>

<%@ include file="/WEB-INF/views/admin/include/include_js.jsp"%>
</body>
</html>

