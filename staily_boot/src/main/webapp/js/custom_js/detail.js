//product_create.jsp
$("#pPrice").on("focus", function() {
    var x = $(this).val();
    x = removeCommas(x);
    $(this).val(x);
}).on("focusout", function() {
    var x = $(this).val();
    if(x && x.length > 0) {
        if(!$.isNumeric(x)) {
            x = x.replace(/[^0-9]/g,"");
        }
        x = addCommas(x);
        $(this).val(x);
    }
}).on("keyup", function() {
    $(this).val($(this).val().replace(/[^0-9]/g,""));
});

function productCreate() {
	var pName = $('#pName').val();
	var pPrice = $('#pPrice').val();
	var pUrl = $('#pUrl').val();
	var filesize1 = $('#filesize1').val();
	var filesize2 = $('#filesize2').val();
	
	//alert(pName + " === " + pPrice + " === " + pUrl + " === " + filesize1 + " === " + filesize2);
	
	if(pName == '' || pPrice == '' || pUrl == '' || filesize1 == '' || filesize2 == '') {
		swal({
			title: "필수 항목을 모두 입력해주세요",
			icon: "warning" //"info,success,warning,error" 중 택1
		});		
	}
	else {
		swal({
			title: "상품 등록이 완료되었습니다",
			icon: "success" //"info,success,warning,error" 중 택1
		})
		.then(() => {
			document.createP.action = "product_create_action";
			document.createP.method = "POST";
			document.createP.submit();
		});
	}
	
};


function work_search() {
	var url_string = window.location.href;
	var url = new URL(url_string);
	var wdEpisode = url.searchParams.get("wdEpisode");
	if(wdEpisode==null) {
		location.href="../detail/work_select";
	}
	else {
		location.href="../../detail/work_select";
	}
};

function execDaumPostcode() {
	new daum.Postcode({
		oncomplete : function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var addr = ''; // 주소 변수
			var extraAddr = ''; // 참고항목 변수

			// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				addr = data.roadAddress;
			} else { // 사용자가 지번 주소를 선택했을 경우(J)
				addr = data.jibunAddress;
			}

			// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
			if (data.userSelectedType === 'R') {
				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName
							: data.buildingName);
				}
				// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraAddr !== '') {
					extraAddr = ' (' + extraAddr + ')';
				}
				// 조합된 참고항목을 해당 필드에 넣는다.
				// document.getElementById("sample6_extraAddress").value =
				// extraAddr;

			} else {
				// document.getElementById("sample6_extraAddress").value = '';
			}

			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById("pAddress").value = addr;

			//상세 주소 입력창을 연다.
			$('#pDaddress').attr('readonly', false);
			$('#pDaddress').attr('placeholder', '상세 주소를 입력하세요');
			
			// 커서를 상세주소 필드로 이동한다.
			document.getElementById("pDaddress").focus();
		}
	}).open();
};

// product_detail.jsp
$('#workEpisode').change(function(e) {
    console.log('#workEpisode 변경');
    var contextPath = $("option:selected").attr("contextPath");
    var wNo = $("option:selected").attr("wNo");
    var wdEpisode = $("option:selected").val();
    var url_string = window.location.href;
    var url = new URL(url_string);
    var urlcheck = url.searchParams.get("wdEpisode");
    if(urlcheck != null) {
       var params = 'wNo=' + wNo + '&wdEpisode=' + wdEpisode;
       location.href="episode?"+params;
    }
    else {
       var params = 'wNo=' + wNo + '&wdEpisode=' + wdEpisode;
       location.href = "../main/worklist_select/episode?" + params;
    }
});

function create_bookmark2(userNo, pNo) {
	var params = "userNo=" + userNo + "&pNo=" + pNo;
	var product = "#product_" + pNo;

	$.ajax({
		url : "../main/create_bookmark",
		method : "POST",
		data : params,
		success : function(result) {
			if(result == 'true') {
				$('#createBmk').attr('alt', '즐겨찾기 제거');
				$('#createBmk').attr('src', '/staily/images/star.png');
				$('#createBmk').attr('onClick', 'select_bookmark2(' + userNo + ',' + pNo + ');return false;');
			}
		}			
	});
};

function select_bookmark2(userNo, pNo) {
	var params = "userNo=" + userNo + "&pNo=" + pNo;
	$.ajax({
		url : "../main/select_bookmark",
		method : "POST",
		data : params,
		success :function(bookset) {
			delete_bookmark2(bookset);
		}
	});
}

function delete_bookmark2(bookset) {
	var bmNo = "" + bookset;
	var userNo = 0;
	var pNo = 0;
	var product;
	
	if(bmNo.indexOf(",") != -1) {
		var bookset = bookset.split(',');
		bmNo = bookset[0];
		userNo = bookset[1];
		pNo = bookset[2];
		
		//alert(bookset + "===" + bmNo + "===" + userNo + "=== "+ pNo);
	}
	if(pNo == 0) {
		product = "#bookmark_" + bmNo;
	}
	else {
		product = "#product_" + pNo;
	}
	var params = "bmNo=" + bmNo + "&userNo=" + userNo + "&pNo=" + pNo;
		$.ajax({
			url : "../main/delete_bookmark",
			method : "POST",
			data : params,
			success : function(result) {
				if(result == 'true') {
					$('#createBmk').attr('alt', '즐겨찾기 추가');
					$('#createBmk').attr('src', '/staily/images/emptystar.png');
					$('#createBmk').attr('onClick','create_bookmark2(' + userNo + ',' + pNo + ');return false;');
				}
				else {
					swal({
						   title: "에러 발생",
						   icon: "error" //"info,success,warning,error" 중 택1
					});
				}
			}
		});
};

function deleteProduct() {
	swal({
		  title: "등록한 상품을 삭제하시겠습니까?",
		  icon: 'warning',
		  buttons: true,
		  dangerMode: true,
		}).then((willDelete) => {
			if(willDelete) {
				swal({
					title: "상품 삭제가 완료되었습니다",
					icon: "success" //"info,success,warning,error" 중 택1
				})
				.then(() => {
					document.pNo_request.action = "product_delete";
					document.pNo_request.method = "post";
					document.pNo_request.submit();
				});
			}				
			else {
				return false;
			}
		});	
}

$("#reply").on("click", function(e) {
	getReplies();
});

function getReplies() {
var pNo = $('#pNo').val();
var myNo = $('#mNo').val();
	
	$.ajax({
		url : "reply_list",
		type : "POST",
		data : {"pNo" : pNo},
		dataType : "json",
		async : false,
		success : function(data) {
			var a = '';
			for (i = 0; i < data.length; i++) {
				a += "<div class='row'>";
				a += "<h4 class='no-underline'>" + data[i].mId;
				if(data[i].mNo == myNo) {
					a += "<button onClick='deleteReply(" + data[i].rNo + ", " + data[i].mNo + ")' class='btn btn-ghost' style='float: right;'>삭제</button></h4>";
				}
				a += "<p>" + data[i].rContent + "</p>";
				//추천, 신고 눌렀는지 확인해 아이콘 변경
				var rNo = data[i].rNo;
				var rRecommend = data[i].rRecommend;
				var rReport = data[i].rReport;
				
				
				a += "<input type='image' src='../images/emptysiren.png' id='reportIcon" + i + "' name='reportIcon" + i + "' onClick='chkReport(" + data[i].rNo + ");return false;' style='float: right; width: 30px; height: 30px;'/><span style='float: right; margin: 4px'>" + data[i].rReport + "</span>";
				a += "<input type='image' src='../images/emptylike.png' id='recommandIcon" + i + "' name='recommandIcon" + i + "' onClick='chkRec(" + data[i].rNo + ");return false;' style='float: right; width: 30px; height: 30px;' value='" + data[i].rNo + "'><span style='float: right; margin: 4px'>" + data[i].rRecommend + "</span>";
				a += "</div>";
				
				$('#reply_space').html(a);
				
			
				(function(i) {
					$.ajax({
						url : "reply_check",
						type : "post",
						data : {"rNo" : rNo, "mNo" : myNo},
						dataType : "json",
						async : true,
						success : function(data) {
							var temp = i;
							//alert("data : " + data + ", temp :" + temp);
							
							if(data == '0') {
								$("#recommandIcon" + temp).attr('src', '../images/like.png');
								$("#reportIcon" + temp).attr('src', '../images/siren.png');
							}					
							else if(data =='1') {
								$("#recommandIcon" + temp).attr('src', '../images/like.png');
								$("#reportIcon" + temp).attr('src', '../images/emptysiren.png');
							}
							else if(data == '2') {
								$("#recommandIcon" + temp).attr('src', '../images/emptylike.png');
								$("#reportIcon" + temp).attr('src', '../images/siren.png');
							}
							else if(data == '3') {								
								$("#recommandIcon" + temp).attr('src', '../images/emptylike.png');
								$("#reportIcon" + temp).attr('src', '../images/emptysiren.png');
							}
						}
					});
					
				})(i);
				
			}
		}
	});
};


$('#createreply').on("click", function(e) {
	var pNo = $('#pNoo').val();
	var wNo = $('#wNo').val();
	var mNo = $('#mNo').val();
	var rContent = $('#rContent').val();

	//alert(pNo + ' : ' + mNo + ' : ' + rContent + ' : ' + wNo);

	if(rContent == '') {
		swal({
			   title: "내용을 입력해주세요",
			   icon: "error" //"info,success,warning,error" 중 택1
		});
	}
	else {
		$.ajax({
			url : "reply_create",
			type : "post",
			dataType : "text",
			data : {
				"mNo" : mNo,
				"wNo" : wNo,
				"pNo" : pNo,
				"rContent" : rContent
			},
			error : function(request, error) {
				swal({
					title: "실패",
					text: "code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error,
					icon: "error" //"info,success,warning,error" 중 택1
				});
			},
			success : function(data) {			
				getReplies();
				$('#rContent').val('');
			}
		});
	}
});

function deleteReply(rNo, mNo) {
	var replyNo = rNo;
	var pNo = $('#pNoo').val();
	var myNo = $('#mNo').val();
	var memNo = mNo;
	
	//alert(rNo + " " + pNo + " " + mNo);
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
						url : "reply_delete",
						data : {"rNo" : replyNo, "pNo" : pNo, "mNo" : myNo},
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

function chkRec(rNo) {
	var myNo = $('#mNo').val();
	
	if(myNo == '') {
		swal({
			title: "추천하려면 로그인하세요",
			icon: "warning" //"info,success,warning,error" 중 택1
		});
	}
	else {
		$.ajax({
			url : "reply_recommend",
			data : {"mNo" : myNo, "rNo" : rNo},
			type : "post",
			dataType : "json",
			success : function(data) {
				getReplies();
			},
			error : function() {
				swal({
					title: "실패",
					icon: "error" //"info,success,warning,error" 중 택1
				});
			}
		});
	}
}

function chkReport(rNo) {
	var myNo = $('#mNo').val();
	var pNo = $('#pNoo').val();
	
	if(myNo == '') {
		swal({
			   title: "신고하려면 로그인하세요",
			   icon: "warning" //"info,success,warning,error" 중 택1
		});
	}
	else {
		$.ajax({
			url : "reply_report",
			data : {"mNo" : myNo, "rNo" : rNo, "pNo" : pNo},
			type : "post",
			dataType : "json",
			success : function(data) {
				if(data == 2) {
					//alert(myNo + "----" + pNo + "----" + rNo);
					swal({
						title: "신고가 누적되어 댓글이 삭제되었습니다",
						icon: "warning" //"info,success,warning,error" 중 택1
					});
					getReplies();
				}
				else {
					getReplies();
				}
			},
			error : function() {
				swal({
					title: "실패",
					icon: "error" //"info,success,warning,error" 중 택1
				});
			}
		});
	}
}

//친구 추가
$('#searchDropdown a:nth-child(1)').click(function(e) {
	e.preventDefault();
	var html = "";
	var params = {
			"mNo" : $('#searchMessage').attr('value'),
			"mId" : $('#addFriend').attr('value')
	}
	var myNo = $('#mNo').val();
		
	$.ajax({
		url : "../mypage/friend_create",
		data : params,
		dataType : "json",
		success : function(result){
			if(result.status == 'success'){
				swal({
					title: "친구 추가가 성공했습니다",
					icon: "success" //"info,success,warning,error" 중 택1
				});
			}else if(result.status == 'D'){
				swal({
					title: "이미 친구 추가된 회원입니다",
					icon: "error" //"info,success,warning,error" 중 택1
				});
			}else if(result.status == 'M'){
				swal({
					title: "본인은 친구로 추가할 수 없습니다",
					icon: "error" //"info,success,warning,error" 중 택1
				});
			};
			
		},
		error : function(){
			location.href = '../404';
		}
	});
});

$('#searchword').click(function(e){
	var mId = $('#searchword').text();
	var myNo = $('#mNo').val();
	
	if(myNo == '') {
		swal({
			title: "이 기능을 이용하려면 로그인하세요",
			icon: "warning" //"info,success,warning,error" 중 택1
		});
	}
	else {
		var html = ""
			$.ajax({
				url : "../mypage/friend_find",
				data : "mId="+mId,
				dataType : "json",
				success : function(result){
					$('#searchMessage').attr('value',result.mNo);
					$('#addFriend').attr('value',result.mId);
				},
				error : function(){
					location.href = '../404';
				}
				
			});
		
	}
});

if($('#sidebar').length) {
	// 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
	var floatPosition = parseInt($("#sidebar").css('top'));
	// 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );

	$(window).scroll(function() {
		// 현재 스크롤 위치를 가져온다.
		var scrollTop = $(window).scrollTop();
		if(scrollTop<407){
			var newPosition = floatPosition + "px";				
		}
		else {
			var newPosition = scrollTop+ (floatPosition-400) + "px";
		}
		/* 애니메이션 없이 바로 따라감
		 $("#floatMenu").css('top', newPosition);
		 */

		$("#sidebar").stop().animate({
			"top" : newPosition
		}, 500);

	}).scroll();
}

//쪽지 보내기
$('#searchDropdown a:nth-child(2)').click(function(e){
	e.preventDefault();
	var noV = $(this).attr('value');
	window.open("../mypage/message?mNo="+noV, "_blank","width=750, height=550, left=1000, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
})