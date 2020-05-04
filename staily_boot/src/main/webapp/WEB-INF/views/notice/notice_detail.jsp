<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.p_content>h1, .p_content>h2, .p_content>h3, .p_content>h4 {
	line-height: inherit;
	position: relative;
	margin: inherit;
	padding: inherit;
	border-bottom: inherit;
	font-size: inherit;
	font-family: inherit;
	font-weight: inherit;
	line-height: inherit;
	color: inherit;
	margin: inherit;
	font-size: inherit;
	font-weight: normal;
	line-height: inherit;
	font-size: inherit;
	margin-block-start: inherit;
	margin-block-end: inherit;
	margin-inline-start: inherit;
	margin-inline-end: inherit;
	font-weight: inherit;
	border-bottom: none;
	background-image: none !important;
	all: unset;
}

.p_content>h2:after, .p_content>h3:after, .p_content>h4:after,
	.p_content>h5:after {
	background-image: none !important;
}
</style>
<link href="${pageContext.request.contextPath}/ckeditor/contents.css"
	rel="stylesheet">
<%@ include file="/WEB-INF/views/include/include_navbar.jsp"%>

<!-- Hero -->
<div id="content_hero">
	<iframe class="ww"
		src="https://www.youtube-nocookie.com/embed/-Jvx0uqn3Zc?autoplay=1&amp;loop=1;playlist=-Jvx0uqn3Zc&controls=0&vq=hd720"
		frameborder="0"
		allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
		allowfullscreen></iframe>
	<a href="#afterHeader" class="anchor"> <img
		src="${pageContext.request.contextPath}/images/scroll-arrow.svg"
		alt="Scroll down" class="scroll" />
	</a>
</div>

<!-- Section -->
<div class="container news section">
	<div class="row">
		<div class="col-sm-12">
			<article id="board" style="border-bottom: none;">
				<div id="board2">
					<input type="hidden" id="updateBNo" value="${board.bNo}">
					<h2 class="board-top p-top-40">${board.bTitle}</h2>
					<div class="col-md-12-push" style="text-align: right">
						<span class="font-small">${board.bDate}.조회수: ${board.bView}</span>
					</div>
					<div class="p_content m-top-50" id="board_content_read">
						${board.bContent}</div>
				</div>
			</article>
		</div>
	</div>
</div>
<div class="container news section">
	<div class="row">
		<div class="col-sm-12" style="margin-top: 50px">
			<form name="rpl">
				<c:choose>
					<c:when test="${not empty userNo}">
						<div>
							<label>댓글 입력</label>
							<textarea rows="2" name="rContent" id="rContent"></textarea>
						</div>
						<div class="form-group right-align" style="text-align: right;">
							<button type="button" class="btn btn-ghost" id="wCreatereply" style="margin-top: 40px">작성하기</button>
						</div>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
				<input type="hidden" name="mNo" id="mNo" value="${userNo}">
				<input type="hidden" name="mId" id="mId" value="${userId}">
				<input type="hidden" name="pNoo" id="pNoo"
					value="${productOne.get(0).getpNo()}"> <input type="hidden"
					name="wNo" id="wNo" value="${wNo}">
			</form>
			<div id="reply_space">
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/include_footer.jsp"%>
</body>
<script>
$(document).ready(function() {
	getReplies();
})

function getReplies() {
	var myNo = $('#mNo').val();

		$.ajax({
			url : "../notice/reply_select",
			type : "POST",
			dataType : "json",
			success : function(data) {
				var a = '';

				for (i = 0; i < data.length; i++) {
					a += "<div class='col-sm-12'>";
					a += "<h4 class='no-underline'>" + data[i].mId;
					if(data[i].mNo == myNo) {
						a += "<button onClick='deleteReply(" + data[i].nrNo + "," + data[i].mNo + ")' class='btn btn-ghost' style='float: right;'>삭제</button></h4>";
					}
					a += "<p style='padding-bottom: 15px'>" + data[i].nrContent + "</p>";
					a += "</div>";
					
					$('#reply_space').html(a);
					
				}
			}
		});
	};

$('#wCreatereply').on("click", function() {
	var mNo = $('#mNo').val();
	var rContent = $('#rContent').val();
	/*
	if(rContent == '') {
		swal({
			   title: "내용을 입력해주세요",
			   icon: "error" //"info,success,warning,error" 중 택1
		});
	}
	else {}
	*/
		$.ajax({
			url : "reply_create",
			data : {"mNo" : mNo, "rContent" : rContent},
			dataType : "json",
			type : "post",
			success : function(data) {
				alert('게을러치타');
				getReplies();
				$('#rContent').val('');
			}
		});
});

function deleteReply(rNo, mNo) {
	var myNo = $('#mNo').val();
	var memNo = mNo;
	
	//alert(rNo + "==" + "==" + memNo);
	//alert("나 : " + myNo + " 댓글 작성자 : " + memNo);
	
	swal({
		  title: "댓글을 삭제하시겠습니까?",
		  icon: 'warning',
		  buttons: true,
		  dangerMode: true,
		}).then((willDelete) => {
			if(willDelete) {
				if(myNo == memNo) {
					$.ajax({
						url : "../notice/reply_delete",
						data : {"nrNo" : rNo, "mNo" : myNo},
						type : "post",
						dataType : "json",
						success : function(data) {
							if(data == 1) {
								swal({
									title: "댓글이 삭제되었습니다",
									icon: "success" //"info,success,warning,error" 중 택1
								});
								getReplies();
							}
 							else {
								swal({
									title: "오류가 발생했습니다",
									icon: "error" //"info,success,warning,error" 중 택1
								});
								getReplies();
							}
						}
					});
				}
				else {
					swal({
						title: "다른 사람의 댓글은 삭제할 수 없습니다.",
						icon: "error" //"info,success,warning,error" 중 택1
					});
				}				
			}
			else {
				return false;
			}
		})		
}
</script>
</html>