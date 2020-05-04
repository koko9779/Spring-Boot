<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/include_css.jsp"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Staily</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/product_create.css"/>
<script src="${pageContext.request.contextPath}/css/admin/vendor/jquery/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/gu-upload/css/guupload.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/gu-upload/guuploadManager.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<style>
body {
    overflow: hidden;
}

.guFileList_thumbnail .filerow {
    width: 100px;
    height: 91%;
    overflow: hidden;
    margin: 3px;
    padding: 1px;
    border: solid 1px #E8E8E8;
    background-color: #F7F7F7;
    display: inline-block;
    float: left;
}
</style>
<body>
	<div style="margin: 5%;">
		<form name="pdScene" method="post">
			<table class="table table=hover">
				<colgroup>
					<col class="col_wp25">
					<col class="col_auto">
				</colgroup>
				<tbody>
					<tr>
						<th scope="row" class="bg-light essentia"><label for="pScene">
								상품이 나온 장면<br>(최대 1장) <span style="color: red;">*</span></label></th>
						<td class="text-left">
							<div class="col">
								<div id="uploadScene" style="width: 100%;"></div>
								<input type="hidden" id="realname1" name="realname1" /> 
								<input type="hidden" id="filename1" name="filename1" /> 
								<input type="hidden" id="filesize1" name="filesize1" />
							</div>
						</td>
					</tr>
				</tbody>
			</table>
			<div class="wrap" style="height: auto;">
				<button class="button_css" type="button" id="sceneCreate">올리기</button>
				<button class="button_css" type="button" onClick="javascript:window.close();">닫기</button>
			</div>
		</form>
	</div>
</body>

<script type="text/javascript">
var guManager = null;

window.onload = function() {
	var option = {
		listtype : "thumbnail",
		fileid : "uploadScene",
		uploadURL : "upload",
		maxFileCount : 1,
		maxFileSize : 3,
		afterFileTransfer : afterFileTransfer
	}
	guManager = new guUploadManager(option);	
}

function afterFileTransfer(realname1, filename1, filesize1) {

	var realname9 = document.getElementById('realname1');
	var filename9 = document.getElementById('filename1');
	var filesize9 = document.getElementById('filesize1');

	realname9.value = realname1;
	filename9.value = filename1;
	filesize9.value = filesize1;

	$.ajax({
		url : "pdScene_create_action",
		data : {"filesize1" : filesize1, "filename1" : filename1},
		type : "post",
		success : function(data) {
			$(opener.document).find('#filesize1').val(filesize1);
			$(opener.document).find('#scene').hide();
			$(opener.document).find("#uploadedScene").append(filename1);
			self.close();
		}
	});
	
}

$("#sceneCreate").click(function(){
var check = $('.filerow').val();
	
	if(check == null) {
		swal({
			title: "이미지를 업로드 해주세요",
			icon: "warning" //"info,success,warning,error" 중 택1
		});	
	}
	else {
		guManager.uploadFiles();
	}
});


</script>
</html>