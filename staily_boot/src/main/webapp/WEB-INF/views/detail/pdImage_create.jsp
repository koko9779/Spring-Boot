<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/include_css.jsp"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/product_create.css"/>
<script src="${pageContext.request.contextPath}/css/admin/vendor/jquery/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/gu-upload/css/guupload2.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/gu-upload/guuploadManager2.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<style>
body {
    overflow: hidden;
}

.guFileList2_thumbnail .filerow2 {
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
		<form name="pdImage" method="post">
			<table class="table table=hover">
				<colgroup>
					<col class="col_wp25">
					<col class="col_auto">
				</colgroup>
				<tbody>
					<tr>
						<th scope="row" class="bg-light essentia"><label for="pdImage">
								상품 이미지<br>(최대 10장) <span style="color: red;">*</span></label></th>
						<td class="text-left">
							<div class="col">
								<div id="uploadImage" style="width: 100%;"></div>
								<input type="hidden" id="realname2" name="realname2" /> 
								<input type="hidden" id="filename2" name="filename2" /> 
								<input type="hidden" id="filesize2" name="filesize2" />
							</div>
						</td>
					</tr>
				</tbody>
			</table>
			<div class="wrap" style="height: auto;">
				<button class="button_css" type="button" id="imageCreate">올리기</button>
				<button class="button_css" type="button" onClick="javascript:window.close();">닫기</button>
			</div>
		</form>
	</div>
</body>

<script type="text/javascript">
var guManager2 = null;

window.onload = function() {
	var option2 = {
		listtype : "thumbnail",
		fileid : "uploadImage",
		uploadURL : "upload2",
		maxFileCount : 10,
		maxFileSize : 3,
		afterFileTransfer : afterFileTransfer2
	}
	guManager2 = new guUploadManager2(option2);	
}

function afterFileTransfer2(realname2, filename2, filesize2) {

	var realname9 = document.getElementById('realname2');
	var filename9 = document.getElementById('filename2');
	var filesize9 = document.getElementById('filesize2');

	realname9.value = realname2;
	filename9.value = filename2;
	filesize9.value = filesize2;
	
	$.ajax({
		url : "pdImage_create_action",
		data : {"filesize2" : filesize2},
		type : "post",
		success : function() {
			$(opener.document).find('#filesize2').val(filesize2);
			$(opener.document).find('#image').hide();
			
			var namesplit = filename2.split(',');
			var sizesplit = filesize2.split(',');
			
			for(var i in namesplit) {
				$(opener.document).find("#uploadedImage").append(namesplit[i] + "<br>");
				$(opener.document).find("#splitspace").append("<input type='hidden' id='filesize2" + i + "' name='filesize3' value='" + sizesplit[i] + "' />");
			}
			
			self.close();
		}
	});
}

$("#imageCreate").click(function(){
	var check = $('.filerow2').val();
		
		if(check == null) {
			swal({
				title: "이미지를 업로드 해주세요",
				icon: "warning" //"info,success,warning,error" 중 택1
			});	
		}
		else {
			guManager2.uploadFiles();
		}
	});

</script>
</html>