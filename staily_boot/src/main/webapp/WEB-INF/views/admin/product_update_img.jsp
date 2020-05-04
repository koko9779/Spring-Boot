<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include
	file="/WEB-INF/views/admin/include/include_popup_css.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/gu-upload/css/guupload.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/gu-upload/guuploadManager.js"></script>
<style>
image {
	margin: auto;
}
</style>
<form id="product_img" name="product_img" method="post"
	enctype="multipart/form-data">
	<input type="hidden" id="pScene" name="pScene" value="${pScene }">
	<table class="table table-hover">
		<tbody>
			<tr>
				<th scope="row" class="bg-light essentia"><label for="image">
						변경할 이미지 업로드<br>
				</label></th>
				<td class="text-left">
					<div id="uploadScene" style="width: 100%;"></div> <input
					type="hidden" id="realname" name="realname" /> <input
					type="hidden" id="filename" name="filename" /> <input
					type="hidden" id="filesize" name="filesize" />
				</td>
			</tr>
		</tbody>
	</table>
	<div class="text-center">
		<button type="submit" value="submit"
			class="btn btn-default btn-lg io-data io-fn-nextStep" data-step="2"
			id="pSceneUpdate">수정</button>
		<button type="button"
			class="btn btn-default btn-lg io-data io-fn-nextStep" data-step="2"
			onclick="window_close()">닫기</button>
	</div>
</form>
<%@ include file="/WEB-INF/views/admin/include/include_js.jsp"%>
</body>
<script type="text/javascript">
	window.onload = function() {
		var option = {
			listtype : "thumbnail",
			fileid : "uploadScene",
			uploadURL : "update_img",
			maxFileCount : 1,
			maxFileSize : 3,
			afterFileTransfer : afterFileTransfer
		}
		guManager = new guUploadManager(option);
	};
	function afterFileTransfer(realname, filename, filesize) {

		var realname9 = document.getElementById('realname');
		var filename9 = document.getElementById('filename');
		var filesize9 = document.getElementById('filesize');

		realname9.value = realname;
		filename9.value = filename;
		filesize9.value = filesize;

		/*
		document.product_img.action = "pdImage_create_action";
		document.product_img.submit();
		var spl = realname9.value.split('.');
		console.log(spl);
		
		if (spl[1] != "jpg" && spl[1] != "png") {
			document.form1.submit();
		} else {
			alert("이미지 파일만 올려주세요");
		}
		 */
	};
$(function() {
	$(document).on('click','#pSceneUpdate',function(){
		guManager.uploadFiles();
	});
});
</script>
</html>

