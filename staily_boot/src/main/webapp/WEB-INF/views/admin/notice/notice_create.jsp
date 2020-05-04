<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/admin/include/include_top.jsp"%>
<!-- Section -->
<div class="container-fluid">
	<div class="row">
		<div class="col-sm-10">
			<div class=" col-sm-push-1 m-top-21" style="width: 80%">
				<form name="noticeWriteF" onSubmit="return false;">
					<input type="hidden" name="bType" value="A">
					<div class="row justify-content-md-center">
						제목 <input type="text" name="bTitle"
							class="form-control title_detail" autocomplete="off">
							
					</div>
					<div class="row justify-content-md-center">
						<textarea id="contents" name="bContent"></textarea>
						<script>
							CKEDITOR
									.replace(
											'contents',
											{
												filebrowserUploadUrl : '/staily/admin/imgUpload'
											});
						</script>
					</div>
					<div class="row justify-content-md-center">
						<button id= "noticeCreate"class="btn btn-ghost"
							style="width: 20%; font-weight: bold; margin-top: 15px;"
							onclick="createNoticeAction()">등 록</button>
					</div>
				</form>
			</div>
		</div>

	</div>
</div>
</body>
<%@ include file="/WEB-INF/views/admin/include/include_js.jsp"%>
<style>
.title_detail {
	margin-bottom: 15px;
}

.custom-select {
	float: left;
	margin-right: 5px;
	width: 115px;
	margin-bottom: 7px;
}

.add_btn_detail {
	background-color: #717171;
}
</style>

</html>