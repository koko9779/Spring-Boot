var clone;
var h3ReplyHeader;
var $replyF;
var boardType;

$(function() {
	clone = $("#board2").clone();
	h3ReplyHeader = $("<h3 class='board-top reply-delete m-top-50' id='reply-top'>스타일 답변</h3>");
	boardType = $("#board_type").val();
});

/*
 * path : 전송 URL
 * params : 전송 데이터 {'q':'a','s':'b','c':'d'...}으로 묶어서 배열 입력
 * method : 전송 방식(생략가능)
 */

function post_to_url(path, params, method) {
    method = method || "post"; // Set method to post by default, if not specified.
    // The rest of this code assumes you are not using a library.
    // It can be made less wordy if you use one.
    var form = document.createElement("form");
    form.setAttribute("method", method);
    form.setAttribute("action", path);
    for(var key in params) {
        var hiddenField = document.createElement("input");
        hiddenField.setAttribute("type", "hidden");
        hiddenField.setAttribute("name", key);
        hiddenField.setAttribute("value", params[key]);
        form.appendChild(hiddenField);
    }
    document.body.appendChild(form);
    form.submit();
}

//(공용함수)로그인된 회원만 가능하도록 로그인창으로 보내는 함수
function required_login () {
		swal({
			title: '로그인이 필요한 서비스입니다',
			icon: 'info',
			text: '로그인 하시겠습니까?',
			closeOnClickOutside: false,
			buttons : {
				cancle: {
					text: "취소",
					value: false
				},
				confirm : {
					text: "로그인",
					value: true
				}
			}
		}).then((result) => {
			if(result) {
				location.href="../login/login";
			}
		});
}

function move_style_board_create(bType) {
	if(!(bType == 'S' || bType == 'Q' || bType == 'F')) {
		return;
	}
	
	location.href="style_board_create?bType=" + bType;
}

function board_delete(bNo) {
	var replyArray = document.querySelectorAll(".reply");
	if(replyArray.length > 0) {
		//confirm("게시글을 지우면 댓글들도 모두 지워집니다 정말 지우시겠습니까?");
		swal({
			  title: "게시글을 지우면 댓글들도 모두 지워집니다 정말 지우시겠습니까?",
			  icon: 'warning',
			  buttons: true,
			  dangerMode: true
			}).then((willDelete) => { 
				if(willDelete) {
					post_to_url("style_board_delete_action", {"bNo" : bNo});
				}
			});
	} else {
		post_to_url("style_board_delete_action", {"bNo" : bNo});
	}
}

function reply_write_form() {
	
		$("#boardReplyWriteF").fadeOut(500);
		$("#boardReplyUpdateF").fadeOut(500, function() {
			var bNoinput = $("#boardReplyUpdateF").find("#form_board_no").val();
			$("#boardReplyUpdateF").remove();
			$("#board_" + bNoinput).fadeIn( 500 );
			
		});
	
		var display = $("#boardReplyWriteF").css("display");
		if(display === "none") {
			$("#boardReplyWriteF").find("#repBTitle").val("");
			CKEDITOR.instances.recContents.setData("");
			$("#boardReplyWriteF").fadeIn(500);
		}else {
			$("#boardReplyWriteF").fadeOut(500);
		}

}

function board_and_reply_modify(bNo) {
	var q = "스타일 질문";
	var r = "<option selected value='S'>스타일코디</option>";
	var selectBox = "<select class='custom-select form-control' name='bCategory' id='bCategory'>" + 
						"<option selected value=''>카테고리</option>" +
						"<option value='M'>영화</option>" +
						"<option value='D'>드라마</option>" +
					"</select>";
	
	
	$.ajax({
		url: "board_one_for_udate_read",
		type: 'get',
		data: {"bNo" : bNo},
		async : false,
		dataType: "json",
		success: function(boardJson) {
							$('#board').fadeOut(500, function() {
								if(boardType === "Q") {
									q = "1 : 1 문의";
									r = "<option selected value='Q'>1:1 문의</option>";
									selectBox = "";
								}else if(boardType === "F") {
									q = "자유게시판";
									r = "<option selected value='F'>자유게시판</option>";
									selectBox = "";
								}
								
								$("#board").html("<h3 class='board-top p-top-21'>" + q + "</h3>" +
										 "<form name='boardWriteF' onSubmit='return false;'>" +
										 			"<input type='hidden' id='bNo' name='bNo' value='" + bNo + "'>" +
													"<div class='row justify-content-md-center'>" +
														"제목" +
														"<input type='text' id='bTitle' name='bTitle' class='form-control title_detail' value='" + boardJson.bTitle + "'>" +
														"<select class='custom-select form-control' name='bType' id='inputGroupSelect03'>" +
															r +
														"</select>" +
															selectBox+
													"</div>" +
													"<div class='row justify-content-md-center'>" +
														"<textarea id='contents' name='bContent'>" + boardJson.bContent + "</textarea>" +
														"<script>" +
															"CKEDITOR.replace('contents',{" +
																"filebrowserUploadUrl : '/staily/style/ImgUpload'" +
															"});" +
														"</script>" +
													"</div>" +
													"<div class='row justify-content-md-center'>" +
														"<button type='submit' class='btn btn-ghost' " + 
																"style='width: 20%; font-weight: bold; margin-top: 15px;' " + 
																"onclick='board_and_reply_modify_action();'>" + 
															"등 록" +
														"</button>" +
														"<button type='submit' id='canselB' class='btn btn-ghost' " + 
															"style='width: 20%; font-weight: bold; margin-top: 15px;' " + 
															"onclick='cancel_board_update(" + bNo + ");'>" + 
															"취 소" +
														"</button>" +
													"</div>" +
											"</form>");	
								$("#board").find("#bCategory").val(boardJson.bCategory);
								$( "#board" ).fadeIn( 500 );
					        });
				}
	});
}

function cancel_board_update(bNo) {
		$('#board').fadeOut(500, function() {
		$('#board').find('.title_detail').val("");
		CKEDITOR.instances.recContents.setData("");
		
		$.ajax({
			url: "board_one_for_udate_read",
			type: 'get',
			data: {"bNo" : bNo},
			async : false,
			dataType: "json",
			success: function(boardJson) {
				$("#board").html("<div id='board2'>'" + 
						"<input type='hidden' id='updateBNo' value='" + bNo + "'>" +
						"<h3 class='board-top'>스타일 질문</h3>" +
						"<div class='categories col-md-6 board-title f-s-25' id='board_title_read'>"+ boardJson.bTitle + "</div>" +
						"<div class='col-md-6 text-left'>" +
							"<span class='font-large'>작성자: " + boardJson.mId + " | 작성 날짜: " + boardJson.bDate + " | 조회수: " + boardJson.bView + "</span>" +
						"</div>" +
						"<div class='p_content m-top-50' id='board_content_read'>" +
							boardJson.bContent +
						"</div>" +
						"<a href='javascript:board_delete(" + bNo + ");' class='btn btn-ghost sort'>" +
							"<span>삭제</span>" +
						"</a>" +
						"<a href='javascript:board_and_reply_modify(" + bNo + ");' class='btn btn-ghost sort'>"+
							"<span>수정</span>" +
						"</a>" +
				"</div>");
				$('#board').fadeIn(500);
			}
		});
		
	});
}

function cancel_reply_write() {
	$("#boardReplyWriteF").fadeOut(500);
}

function cancel_reply_update(bNo) {
	$("#boardReplyUpdateF").fadeOut(500);
	$("#boardReplyUpdateF").remove();
	$("#board_" + bNo).fadeIn(500);
	
}


function reply_write() {
	CKEDITOR.instances.recContents.updateElement(); 
	 var queryString = $("form[name=boardReplyWriteF]").serialize();

	var boardBNo = $("#updateBNo").val();
	if(document.boardReplyWriteF.bTitle.value === "") { 
		swal({
			title: "제목을 입력해 주세요",
			icon: "warning" 
		});
		return; 
	}else if(document.boardReplyWriteF.bContent.value === "") { 
		swal({
			title: "내용을 입력해 주세요",
			icon: "warning" 
		});
		return; 
	}else {
		$.ajax({
			url: "style_reply_create",
			type: 'post',
			data: queryString,
			async : false,
			dataType: "json",
			success: function(replyBoard) {
						var replyCount = $(".reply").length;
									$('#boardReplyWriteF').fadeOut( 500, function() {
										if(replyCount === 0) {
											$("#board").after(h3ReplyHeader.clone().attr("style","display: none;"));
										}
										$("#reply-top").after(
										"<article class='reply reply-delete reply_write' id='board_" + replyBoard.bNo + "' style='display: none;'>" +
												"<div class='col-md-12 m-top--40 border-b-1-d8d8d8'>" +
												"<div class='categories col-md-6 board-title f-s-25'>" + replyBoard.bTitle +"</div>" +
												"<div class='col-md-6 text-left'><span class='font-large'>작성자: " + replyBoard.mId + " | 작성 날짜: " + replyBoard.bDate + "</span></div>" +
												"</div>" +
												"<div class='p_content m-top-50 m-bottom-30' id='board_content_read'>" +
													replyBoard.bContent +
												"</div>" + 
												"<a href='javascript:recommend(" + replyBoard.bNo + ");' class='btn btn-ghost search-rec'>" +
													"<span>추천하기</span><span class='total_bd_count'>0</span>" +
												"</a>" +
												"<a href='javascript:reply_delete(" + replyBoard.bNo + ");' class='btn btn-ghost sort'>" +
													"<span>삭제</span>" +
												"</a>" +
												"<a href='javascript:reply_update(" + replyBoard.bNo + ");' class='btn btn-ghost sort'>" +
													"<span>수정</span>" +
												"</a>" +
										"</article>");
										$("#reply-top").fadeIn( 500 );
										$("#board_" + replyBoard.bNo).fadeIn( 500 );
							        });
			}
		});
	}
}

function recommend(bNo) {
	$.ajax({
		url: "user_recomend",
		type: 'post',
		data: {"bNo" : bNo},
		async : false,
		dataType: "json",
		success: function(board) {
			if(board.bContent === "login") {
				var isOk = confirm("로그인 후 이용 가능합니다\n" +
					  				"로그인 하시겠습니까?");
				if(isOk) {
					document.location.href="../login/login";
				}
					
			} else {
				if(board.bContent === "i") {
					$("#board_" + bNo).find(".search-rec").addClass("clicked-button");
					$("#board_" + bNo).find(".total_bd_count").text(board.bdCount);
				}else if(board.bContent === "d") {
					$("#board_" + bNo).find(".search-rec").removeClass("clicked-button");
					$("#board_" + bNo).find(".total_bd_count").text(board.bdCount);
				}
			}
		}
	});
	
	
}


function reply_update(bNo) {
	$("#boardReplyWriteF").fadeOut(500);
	$("#boardReplyUpdateF").fadeOut(500, function() {
		var bNoinput = $("#boardReplyUpdateF").find("#form_board_no").val();
		$("#boardReplyUpdateF").remove();
		$("#board_" + bNoinput).fadeIn( 500 );
		
	});
	
	$.ajax({
		url: "board_one_for_udate_read",
		type: 'post',
		data: {"bNo" : bNo},
		async : false,
		dataType: "json",
		success: function(board) {
			$("#board_" + bNo).fadeOut( 500, function() {
				$("#board_" + bNo).after($("<form name='boardReplyUpdateF' id='boardReplyUpdateF' onSubmit='return false;' class='dispaly_none border-b-1-d8d8d8 p-b-25' style='margin-top: 100px; display:none;'>" +
						"<input type='hidden' id='form_board_no' name='bNo'  value='"+ board.bNo +"'/>" + 						
						"<div class='row justify-content-md-center'>" +
												"제목" +
												"<input type='text' id='repUpBTitle' name='bTitle' class='form-control title_detail empty' value='" + board.bTitle + "' >" +
												"<select class='custom-select form-control' name='bType' id='repUpBType'>" +
												"<option selected value='S' >스타일코디</option>" +
												"</select>" +
											"</div>" +
											"<div class='row justify-content-md-center'>" +
												"<textarea id='recUpContents' name='bContent' class='empty'>" + board.bContent  + "</textarea>" +
												"<script>" +
													"CKEDITOR.replace('recUpContents',{" +
														"filebrowserUploadUrl : '/staily/style/ImgUpload'" +
													"});" +
												"</script>" +
											"</div>" +
											"<div class='row justify-content-md-center'>" +
												"<button type='submit' class='btn btn-ghost'" +
														"style='width: 20%; font-weight: bold; margin-top: 15px;'" +
														"onclick='reply_update_action();'>" +
													"등 록" +
												"</button>" +
												"<button type='submit' id='canselB' class='btn btn-ghost'" +
													"style='width: 20%; font-weight: bold; margin-top: 15px;'" + 
													"onclick='cancel_reply_update(" + bNo + ");'>" +
													"취 소" +
												"</button>" +
											"</div>" +
										"</form>"));
				$("#boardReplyUpdateF").fadeIn( 500 );
			});
		}
});
}


function reply_update_action() {
	CKEDITOR.instances.recUpContents.updateElement(); 
	 var queryString = $("form[name=boardReplyUpdateF]").serialize();

	if(document.boardReplyUpdateF.bTitle.value === "") { 
		swal({
			title: "제목을 입력해 주세요",
			icon: "warning" 
		});
		return; 
	}else if(document.boardReplyUpdateF.bContent.value === "") { 
		swal({
			title: "내용을 입력해 주세요",
			icon: "warning" 
		});
		return; 
	}else {
		$.ajax({
			url: "reply_update_action",
			type: 'post',
			data: queryString,
			async : false,
			dataType: "json",
			success: function(replyBoard) {
				$("form[name=boardReplyUpdateF]").fadeOut(500, function() {
					$("form[name=boardReplyUpdateF]").remove();
					$("#board_"+replyBoard.bNo).find(".board-title").text(replyBoard.bTitle);
					$("#board_"+replyBoard.bNo).find(".p_content").html(replyBoard.bContent);
					$("#board_"+replyBoard.bNo).fadeIn(500);
				});
				
			}
		})
	};
}

function reply_delete(bNo) {
	var replyCount = $(".reply").length;
	$.ajax({
		url: "style_reply_delete_action",
		type: 'post',
		data: {"bNo" : bNo},
		async : false,
		dataType: "json",
		success: function(isDelete) {
			if(isDelete === false) {
				swal({
					title: "댓글 삭제에 실패하였습니다",
					icon: "error" 
				});
			}else {
				if(replyCount === 1) {
					$(".reply-delete").fadeOut(500, function() {
						$(".reply-delete").remove();
					});
				}else if(replyCount >= 2) {
					$("#board_"+bNo).fadeOut(500, function() {
						$("#board_"+bNo).remove();
					});
				}
			}
		}
	});
	
}

function board_create() { 
	CKEDITOR.instances.contents.updateElement(); 
	if(document.boardWriteF.bTitle.value === "") { 
		swal({
			title: "제목을 입력해 주세요",
			icon: "warning" 
		});
		return; 
	}else if(document.boardWriteF.bContent.value === "") { 
		swal({
			title: "내용을 입력해 주세요",
			icon: "warning" 
		});
		return; 
	}else if(document.boardWriteF.bCategory.value === "카테고리") { 
		swal({
			title: "카테고리를 지정해 주세요",
			icon: "warning" 
		});
		return; 
	}else {
		document.boardWriteF.action = "style_create_board_action";
		document.boardWriteF.method = "POST";
		document.boardWriteF.submit();
	} 
}

function board_create_other() {
	CKEDITOR.instances.contents.updateElement(); 
	if(document.boardWriteF.bTitle.value === "") { 
		swal({
			title: "제목을 입력해 주세요",
			icon: "warning" 
		});
		return;
	}else if(document.boardWriteF.bContent.value === "") { 
		swal({
			title: "내용을 입력해 주세요",
			icon: "warning" 
		});
		return; 
	}else {
		document.boardWriteF.action = "style_create_board_action";
		document.boardWriteF.method = "POST";
		document.boardWriteF.submit();
	} 
}

function board_and_reply_modify_action() {
	CKEDITOR.instances.contents.updateElement(); 
	var bNo = $("#bNo").val();
	var bTitle = $("#bTitle").val();
	var bContent = $("#contents").val();
	var bCategory = $("#bCategory").val();
	
	var boardBNo = $("#updateBNo").val();


	if(document.boardWriteF.bTitle.value === "") { 
		swal({
			title: "제목을 입력해 주세요",
			icon: "warning" 
		});
		return; 
	}else if(document.boardWriteF.bContent.value === "") { 
		swal({
			title: "내용을 입력해 주세요",
			icon: "warning" 
		});
		return; 
	}else if(document.boardWriteF.bCategory.value === "카테고리") { 
		swal({
			title: "카테고리를 지정해 주세요",
			icon: "warning" 
		});
		return; 
	}else {
		$.ajax({
			url: "style_board_and_reply_update",
			type: 'post',
			data: {bNo : bNo,
				   bTitle : bTitle,
				   bContent : bContent,
				   bCategory : bCategory},
			async : false,
			dataType: "json",
			success: function(updateBoard) {
				console.log(updateBoard);
				clone.find("#board_title_read").text(updateBoard.bTitle);
				clone.find("#board_content_read").html(updateBoard.bContent);
				$('#board').fadeOut( 500, function() {
					$("#board").empty();
					$("#board").append(clone);
					$( "#board" ).fadeIn( 500 );
		        });
			}
		});
	}
}

