/**
 * 
 * 
 */
/** ***********공용*************** */

function window_close() {
	window.close();
};
function window_back() {
	location.href = document.referrer;
};

/** ***********통계 일반*************** */

/** ***********작품 일반*************** */

function searchWork() {
	window.open("work_seach", "작품정보수정",
	"width=500, height=800, toolbar=no, menubar=no, scrollbars=no, resizable=no ,status=no")
};
function workCreate(i) {
	document.getElementById("searchResult"+i+"").action = "work_create";
	document.getElementById("searchResult"+i+"").submit();
};

function product_confirm(pNo) {
	var no = "pNo="+pNo;
	console.log(pNo);
	$.ajax({
		url: 'product_confirm',
		data: no,
		method: 'POST',
		dataType: 'text',
		success: function() {
			swal({
				   title: "상품이 승인되었습니다..",
				   text: "버튼을 클릭해주세요!",
				   icon: "success" // "info,success,warning,error" 중 택1
				}).then(() => {
					window.opener.location.reload();
					window.close();
				});
		}
	});
};
function product_reject(rNo) {
	var no = "rNo="+rNo;
	$.ajax({
		url: 'product_reject',
		data: no,
		method: 'POST',
		dataType: 'text',
		success: function() {
			swal({
				title: "상품이 승인이 거부되었습니다.",
				text: "버튼을 클릭해주세요!",
				icon: "warning" // "info,success,warning,error" 중 택1
			}).then(() => {
				window.opener.location.reload();
				window.close();
			});
		}
	});
};
function sceneUpdate(scn) {
	window.open("product_update_scene?" + "pScene="+ scn,"이미지정보수정",
	"width=500, height=300, toolbar=no, menubar=no, scrollbars=no, resizable=no ,status=no")
};
function imageUpdate(img) {
	window.open("product_update_img?" + "pdImage="+ img,"이미지정보수정",
	"width=500, height=300, toolbar=no, menubar=no, scrollbars=no, resizable=no ,status=no")
};
/** ***********주소 일반*************** */

function execDaumPostcode() {
	new daum.Postcode({
		oncomplete : function(data) {
			var addr = ''; // 주소 변수
			var extraAddr = ''; // 참고항목 변수

			// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				addr = data.roadAddress;
			} else { // 사용자가 지번 주소를 선택했을 경우(J)
				addr = data.jibunAddress;
			}
			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			// document.getElementById('new_address_zipcode').value =
			// data.zonecode;
			document.getElementById("mAddress").value = addr;
			// 커서를 상세주소 필드로 이동한다.
			document.getElementById("mDaddress").focus();
		}
	}).open();
};
/** ***********TMDB API************** */
function sucess(item) {
	$('#resultF').empty();
	var content = JSON.parse(item);
	console.log(content);
	var count = content.total_results;
	for (var i = 0; i < count; i++) {
		if(content.results[i].name != null){
			var name = content.results[i].name;
		}else{
			var name = content.results[i].title
		}
		if(content.results[i].first_air_date != null){
			var date = content.results[i].first_air_date
		}else{
			var date = content.results[i].release_date
		}
		if(content.results[i].media_type=='tv'){
			var category = 'D';
		}else{
			var category = 'M';
		}
		var poster = content.results[i].poster_path;
		var overview = content.results[i].overview
		var tag = "";
		tag += "<form id='searchResult"+i+"' name='searchResult"+i+"'>";
		tag += "<input type='hidden' id='wName' name='wName' value='" + name + "'>";
		tag += "<input type='hidden' id='wPoster' name='wPoster' value='" + poster + "'>";
		tag += "<input type='hidden' id='wDate' name='wDate' value='" + date + "'>";
		tag += "<input type='hidden' id='wCategory' name='wCategory' value='" + category + "'>";	
		tag += "<input type='hidden' id='wOverview' name='wOverview' value='" + overview + "'>";	
		tag += "<table>";
		tag += "<tr>";
		tag += "<th></th>";
		tag += "<th hidden='poster'></th>";
		tag += "<th hidden='date'></th>";
		tag += "<th hidden='category'></th>";
		tag += "<th hidden='overview'></th>";
		tag += "<th></th>";
		tag += "</tr>";
		tag += "<tr>";
		tag += "<td>" + name + "</td>";
		tag += "<td hidden='poster2'>" + poster + "</td>";
		tag += "<td hidden='date2'>" + date + "</td>";
		tag += "<td hidden='category2'>" + category + "</td>";
		tag += "<td hidden='overview2'>" + overview + "</td>";
		tag += "</tr>";
		tag += "</table>";
		tag += "<button type='submit' value='submit' class='btn' data-step='2' onclick='workCreate("+i+")'>선택</button>";
		tag += "</form>"
			
			$("#resultF").append(tag);
	}
};
function error(test) {
	console.log('실패~', test);
};
function searchItemM(item) {
	theMovieDb.search.getMulti({
		"query" : item
	}, sucess, error);
};
/** *****멤버 펑션 시작********** */
function messagePopup() {
	window.open("create_message?", "메세지보내기",
	"width=575, height=400, toolbar=no, menubar=no, scrollbars=no, resizable=no ,status=no")
};
function messageCreate() {
	$.ajax({
		url : 'create_message_action',
		data : $('#noticeMessage').serializeArray(),
		dataType : 'text',
		success : function(result){
			if(result == 'success'){
				swal({
					   title: "메세지전송성공",
					   text: "버튼을 클릭해주세요!",
					   icon: "success" // "info,success,warning,error"
										// 중 택1
					}).then(() => {
						window.opener.location.reload();
						window.close();
					});
			}else if(result == 'fail'){
				swal({
					   title: "메세지전송실패",
					   text: "버튼을 클릭해주세요!",
					   icon: "error" // "info,success,warning,error"
										// 중 택1
					});
			}
		},
		error : function(){
			swal({
				   title: "메세지전송실패",
				   text: "버튼을 클릭해주세요!",
				   icon: "error" // "info,success,warning,error"
									// 중 택1
				});
		}
	})
};
$(function() {
	$(document).on('click','#mCheckBtn',function(e) {
		var checkBtn = $(this);
		var tr = checkBtn.parent().parent();
		var td = tr.children();
		var no = td.eq(1).text();
		window.open("member_select?" + "mNo="+ no, "회원정보수정",
		"width=695, height=685, toolbar=no, menubar=no, scrollbars=no, resizable=no ,status=no")
	});
});
$(function() {
	$(document).on('click','#mSelectBtn',
			function() {
				var checkbox = $("input[name=member_CheckBox]:checked");
				var tdArray = new Array();
				checkbox.each(function(i) {
					var tr = checkbox.parent().parent().eq(i);
					var td = tr.children();
					var mNo = "mNo="+td.eq(1).text();
					$.ajax({
						url : 'member_delete',
						data : mNo,
						method : 'POST',
						success:function(){
							swal({
								title: "회원삭제성공",
								text: "버튼을 클릭해주세요!",
								icon: "success" // "info,success,warning,error" 중 택1
							}).then(() => {
								location.reload();
							});
						}
					});
				});
	});
});

/** *****상품 펑션 시작********** */
$(function() {
	$(document).on('click','#pCheckBtn',function() {
					var checkBtn = $(this);
					var tr = checkBtn.parent().parent();
					var td = tr.children();
					var no = td.eq(1).text();
					window.open("product_select?" + "pNo="+ no, "상품정보수정",
								"width=800, height=685, toolbar=no, menubar=no, scrollbars=no, resizable=no ,status=no")
						});	
});
$(function() {
	$(document).on('click','#pUpdate',function() {
		var params = $('#product_detail').serializeArray();
		$.ajax({
			url:"product_update",
			data:params,
			method:'post',
			success: function(result) {
				 if(result == 'success'){
					 swal({
						   title: "상품변경성공",
						   text: "버튼을 클릭해주세요!",
						   icon: "success" // "info,success,warning,error"
											// 중 택1
						}).then(() => {
							window.opener.location.reload();
							window.close();
						});
						// window.opener.location.reload();
						// window.close();
			     }else{
			       	swal({
						   title: "상품변경실패",
						   text: "버튼을 클릭해주세요!",
						   icon: "error" // "info,success,warning,error"
													// 중 택1
					});
			            }
			     },
			     error:function(request, error) {
			    	 swal({
						   title: "상품변경실패",
						   text: "버튼을 클릭해주세요!",
						   icon: "error" // "info,success,warning,error"
											// 중 택1
						});
			 		 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			 	}
		  });
	  });					
});	
$(function() {
	$(document).on('click','#pSelectBtn',function() {
		var checkbox = $("input[name=product_CheckBox]:checked");
		var tdArray = new Array();
		checkbox.each(function(i) {
			var tr = checkbox.parent().parent()
			.eq(i);
			var td = tr.children();
			var pNo = 'pNo='+td.eq(1).text();
			$.ajax({
				url : 'product_delete',
				data : pNo,
				method : 'POST',
				success:function(){
					swal({
						title: "상품삭제성공",
						text: "버튼을 클릭해주세요!",
						icon: "success" // "info,success,warning,error" 중 택1
					}).then(() => {
						location.reload();
					});
				}
			});
		});
	});
});
function openProduct(no){
	window.open("product_select?" + "pNo="+ no, "상품정보수정",
	"width=800, height=685, toolbar=no, menubar=no, scrollbars=no, resizable=no ,status=no")
}
/** *****작품 펑션 시작********** */	
$(function() {
		$(document).on('click','#wUpdateBtn', function() {
				 var params = $('#work_update').serializeArray();
				  $.ajax({
					url: 'work_update',
					data: params,
					method:'post',
					dataType: 'text',
					success: function(result) {
						 if(result == 'success'){
							 swal({
								   title: "작품변경성공",
								   text: "버튼을 클릭해주세요!",
								   icon: "success" // "info,success,warning,error"
													// 중 택1
								}).then(() => {
									window.opener.location.reload();
									window.close();
								});
								// window.opener.location.reload();
								// window.close();
					     }else{
					       	swal({
								   title: "작품변경실패",
								   text: "버튼을 클릭해주세요!",
								   icon: "error" // "info,success,warning,error"
															// 중 택1
							});
					            }
					     },
					     error:function(request, error) {
					    	 swal({
								   title: "작품변경실패",
								   text: "버튼을 클릭해주세요!",
								   icon: "error" // "info,success,warning,error"
													// 중 택1
								});
					 		 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					 	}
				  });
			  });					
});	

$(function() {
	$(document).on('click','#wCheckBtn',function(e) {
			var checkBtn = $(this);
			var tr = checkBtn.parent().parent();
			var td = tr.children();
			var no = td.eq(1).text();
			window.open("work_select?" + "wNo="+ no, "작품정보수정",
						"width=500, height=800, toolbar=no, menubar=no, scrollbars=no, resizable=no ,status=no")
	});
});
$(function() {
	$(document).on('click','#wCreateBtn', function() {
			  var params = $('#work_create').serializeArray(); 
			  $.ajax({
				  url: 'work_create_action',
				  data: params,
				  method:'post',
				  dataType: 'text',
				  success: function(result) {
						 if(result == 'success'){
							 swal({
								   title: "작품등록성공",
								   text: "버튼을 클릭해주세요!",
								   icon: "success" // "info,success,warning,error"
													// 중 택1
								}).then(() => {
									window.opener.location.reload();
									window.close();
								});
								// window.opener.location.reload();
								// window.close();
					     }else{
					       	swal({
								   title: "작품등록실패",
								   text: "버튼을 클릭해주세요!",
								   icon: "error" // "info,success,warning,error"
															// 중 택1
							});
					            }
					     },
					     error:function(request, error) {
					    	 swal({
								   title: "작품등록실패",
								   text: "버튼을 클릭해주세요!",
								   icon: "error" // "info,success,warning,error"
													// 중 택1
								});
					 		 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					 	}
				  });
			  });					
});	

$(function() {
	$(document).on('click','#wSelectBtn',function() {
		var checkbox = $("input[name=work_CheckBox]:checked");
		var tdArray = new Array();
		checkbox.each(function(i) {
			var tr = checkbox.parent().parent().eq(i);
			var td = tr.children();
			var wNo = 'wNo='+td.eq(1).text();
			$.ajax({
				url : 'work_delete',
				data : wNo,
				method : 'POST',
				success: function() {
					swal({
						title: "작품삭제성공",
						text: "버튼을 클릭해주세요!",
						icon: "success" // "info,success,warning,error" 중 택1
					}).then(() => {
						location.reload();
					});
				}	
			});
		});
	});
});

function openWork(no){
	window.open("work_select?" + "wNo="+ no, "작품정보수정",
	"width=500, height=800, toolbar=no, menubar=no, scrollbars=no, resizable=no ,status=no")
}
/** **********공지사항펑션 이벤트***************** */
$(function() {
	$(document).on('click','#nCheckBtn',function(e) {
		var checkBtn = $(this);
		var tr = checkBtn.parent().parent();
		var td = tr.children();
		var nNo = td.eq(1).text();
		window.open("notice_detail?" + "bNo="+ nNo,"공지수정",
		"width=800, height=600, toolbar=no, menubar=no, scrollbars=no, resizable=no ,status=no")
	});
});

function createNotice() {
	location.href='notice_create';
}
$(function() {
	$(document).on('click','#nDeleteBtn',function() {
		var checkbox = $("input[name=notice_CheckBox]:checked");
		var tdArray = new Array();
		checkbox.each(function(i) {
			var tr = checkbox.parent().parent().eq(i);
			var td = tr.children();
			var bNo = 'bNo='+td.eq(1).text();
			$.ajax({
				url : 'notice_delete',
				data : bNo,
				method : 'POST',
				success: function() {
					swal({
						title: "공지삭제성공",
						text: "버튼을 클릭해주세요!",
						icon: "success" // "info,success,warning,error" 중 택1
					}).then(() => {
						location.reload();
					});
				}	
			});
		});
	});
});
function createNoticeAction() { 
	CKEDITOR.instances.contents.updateElement(); 
	if(document.noticeWriteF.bTitle.value === "") { 
		alert("제목을 입력해 주세요"); 
		return; 
	}else if(document.noticeWriteF.bContent.value === "") { 
		alert("내용을 입력해 주세요"); 
		return; 
	}else {
		document.noticeWriteF.action = "notice_create_action";
		document.noticeWriteF.method = "POST";
		document.noticeWriteF.submit();
	} 
}
/** **********document ready 이벤트***************** */
$(document).ready(function() {
	/** *****멤버 validate 시작********** */
	$('#memberInfoFrm').validate({
		rules:{
			mPw:{
				required: true,
				passwordCk : true,
				minlength: 8,
				maxlength: 15
			},
			repeatPw:{
				required: true,
				equalTo : '#mPw'
			},
			mEmail:{
				required: true,
				email : true
			}
		},
		messages:{
			mPw:{
				required: "비밀번호를 입력해주세요",
				passwordCk: "영문, 숫자, 특수문자를 조합해서 입력해야 합니다.",
				minlength:"비밀번호는 8자리 이상으로 구성해야 합니다." ,
				maxlength:"비밀번호는 16자리 미만으로 구성해야 합니다"
			},
			repeatPw:{
				required: "비밀번호를 확인해주세요",
				equalTo : '비밀번호가 다릅니다.'
				
			},
			mEmail:{
				required: "이메일을 입력해주세요",
				email : "이메일 형식으로 입력하셔야합니다."
			}
		},
		submitHandler:function(f){
			$.ajax({
				url: f.action,
				data: $(f).serializeArray(),
				dataType: 'text',
				success: function() {
					swal({
						   title: "회원정보가  변경되었습니다.",
						   text: "버튼을 클릭해주세요!",
						   icon: "success" // "info,success,warning,error"
											// 중 택1
						}).then(() => {
							window.opener.location.reload();
							window.close();
						});
				}
			});
		},
		errorClass:"error_validate",
		validClass:"valid"
	});
	$.validator.addMethod("passwordCk",  function( value, element ) {
		   return this.optional(element) ||  /^.*(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/.test(value);
		});

	function execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가
							// 도로명
							// 주소를
							// 선택했을
							// 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}
						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						// document.getElementById('new_address_zipcode').value
						// = data.zonecode;
						document.getElementById("mAddress").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("mDaddress")
								.focus();
					}
				}).open();
	};
	
	$('#slider-div').slick({
		slide: 'div',		// 슬라이드 되어야 할 태그 ex) div, li
		infinite : true, 	// 무한 반복 옵션
		slidesToShow : 1,		// 한 화면에 보여질 컨텐츠 개수
		slidesToScroll : 1,		// 스크롤 한번에 움직일 컨텐츠 개수
		speed : 100,	 // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
		arrows : true, 		// 옆으로 이동하는 화살표 표시 여부
		dots : false, 		// 스크롤바 아래 점으로 페이지네이션 여부
		autoplay : true,			// 자동 스크롤 사용 여부
		autoplaySpeed : 5000, 		// 자동 스크롤 시 다음으로 넘어가는데 걸리는
									// 시간 (ms)
		pauseOnHover : true,		// 슬라이드 이동 시 마우스 호버하면 슬라이더
									// 멈추게 설정
		vertical : false,		// 세로 방향 슬라이드 옵션
		prevArrow : "<button type='button' class='slick-prev'>Previous</button>",		// 이전
																						// 화살표
																						// 모양
																						// 설정
		nextArrow : "<button type='button' class='slick-next'>Next</button>",		// 다음
																					// 화살표
																					// 모양
																					// 설정
		dotsClass : "slick-dots", 	// 아래 나오는 페이지네이션(점) css
									// class 지정
		draggable : true, 	// 드래그 가능 여부
		pade: true,
		responsive: [ // 반응형 웹 구현 옵션
			{  
				breakpoint: 960, // 화면 사이즈 960px
				settings: {
					// 위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
					slidesToShow:1
				} 
			},
			{ 
				breakpoint: 768, // 화면 사이즈 768px
				settings: {	
					// 위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
					slidesToShow:1 
				} 
			}
		]

	});
	$('.slider-for').slick({
          autoplay: true, // 자동슬라이드
          slidesToShow: 1, // 큰이미지 몇개 보여줄것인지
          slidesToScroll: 1,
          arrows: true,
          fade: false,
          centerMode: true,
          variableWidth: true,
          variableHeight: true,
          centerPadding: "50px",
          asNavFor: '.slider-nav',
       });
       $('.slider-nav').slick({
          slidesToShow: 3, // 작은이미지 몇개 보여줄것인지..
          slidesToScroll: 1,
          centerMode: true,
          centerPadding: "50px",
          variableWidth: true,
          variableHeight: true,
          asNavFor: '.slider-for',
          focusOnSelect: true,
       });
});	

/*차트 플러그인 
(function () {
  'use strict';

  if (typeof Chart === 'undefined') {
    console.error('Can not find Chart object.');
    return;
  }

  if (typeof Object.assign != 'function') {
    Object.assign = function (target, varArgs) {
      if (target == null) {
        throw new TypeError('Cannot convert undefined or null to object');
      }
      var to = Object(target);
      for (var index = 1; index < arguments.length; index++) {
        var nextSource = arguments[index];
        if (nextSource != null) {
          for (var nextKey in nextSource) {
            if (Object.prototype.hasOwnProperty.call(nextSource, nextKey)) {
              to[nextKey] = nextSource[nextKey];
            }
          }
        }
      }
      return to;
    };
  }

  var SUPPORTED_TYPES = {};
  ['pie', 'doughnut', 'polarArea', 'bar'].forEach(function (t) {
    SUPPORTED_TYPES[t] = true;
  });

  function Label() {
    this.renderToDataset = this.renderToDataset.bind(this);
  }

  Label.prototype.setup = function (chart, options) {
    this.chart = chart;
    this.ctx = chart.ctx;
    this.args = {};
    this.barTotal = {};
    var chartOptions = chart.config.options;
    this.options = Object.assign({
      position: 'default',
      precision: 0,
      fontSize: chartOptions.defaultFontSize,
      fontColor: chartOptions.defaultFontColor,
      fontStyle: chartOptions.defaultFontStyle,
      fontFamily: chartOptions.defaultFontFamily,
      shadowOffsetX: 3,
      shadowOffsetY: 3,
      shadowColor: 'rgba(0,0,0,0.3)',
      shadowBlur: 6,
      images: [],
      outsidePadding: 2,
      textMargin: 2,
      overlap: true
    }, options);
    if (chart.config.type === 'bar') {
      this.options.position = 'default';
      this.options.arc = false;
      this.options.overlap = true;
    }
  };

  Label.prototype.render = function () {
    this.labelBounds = [];
    this.chart.data.datasets.forEach(this.renderToDataset);
  };

  Label.prototype.renderToDataset = function (dataset, index) {
    this.totalPercentage = 0;
    this.total = null;
    var arg = this.args[index];
    arg.meta.data.forEach(function (element, index) {
      this.renderToElement(dataset, arg, element, index);
    }.bind(this));
  };

  Label.prototype.renderToElement = function (dataset, arg, element, index) {
    if (!this.shouldRenderToElement(arg.meta, element)) {
      return;
    }
    this.percentage = null;
    var label = this.getLabel(dataset, element, index);
    if (!label) {
      return;
    }
    var ctx = this.ctx;
    ctx.save();
    ctx.font = Chart.helpers.fontString(this.options.fontSize, this.options.fontStyle, this.options.fontFamily);
    var renderInfo = this.getRenderInfo(element, label);
    if (!this.drawable(element, label, renderInfo)) {
      ctx.restore();
      return;
    }
    ctx.beginPath();
    ctx.fillStyle = this.getFontColor(dataset, element, index);
    this.renderLabel(label, renderInfo);
    ctx.restore();
  };

  Label.prototype.renderLabel = function (label, renderInfo) {
    return this.options.arc ? this.renderArcLabel(label, renderInfo) : this.renderBaseLabel(label, renderInfo);
  };

  Label.prototype.renderBaseLabel = function (label, position) {
    var ctx = this.ctx;
    if (typeof label === 'object') {
      ctx.drawImage(label, position.x - label.width / 2, position.y - label.height / 2, label.width, label.height);
    } else {
      ctx.save();
      ctx.textBaseline = 'top';
      ctx.textAlign = 'center';

      if (this.options.textShadow) {
        ctx.shadowOffsetX = this.options.shadowOffsetX;
        ctx.shadowOffsetY = this.options.shadowOffsetY;
        ctx.shadowColor = this.options.shadowColor;
        ctx.shadowBlur = this.options.shadowBlur;
      }

      var lines = label.split('\n');
      for (var i = 0; i < lines.length; i++) {
        var y = position.y - this.options.fontSize / 2 * lines.length + this.options.fontSize * i;
        ctx.fillText(lines[i], position.x, y);
      }
      ctx.restore();
    }
  };

  Label.prototype.renderArcLabel = function (label, renderInfo) {
    var ctx = this.ctx, radius = renderInfo.radius, view = renderInfo.view;
    ctx.save();
    ctx.translate(view.x, view.y);
    if (typeof label === 'string') {
      ctx.rotate(renderInfo.startAngle);
      ctx.textBaseline = 'middle';
      ctx.textAlign = 'left';
      var lines = label.split('\n'), max = 0, widths = [], offset = 0;
      if (this.options.position === 'border') {
        offset = (lines.length - 1) * this.options.fontSize / 2;
      }
      for (var j = 0; j < lines.length; ++j) {
        var mertrics = ctx.measureText(lines[j]);
        if (mertrics.width > max) {
          max = mertrics.width;
        }
        widths.push(mertrics.width);
      }
      for (var j = 0; j < lines.length; ++j) {
        var line = lines[j];
        var y = (lines.length - 1 - j) * -this.options.fontSize + offset;
        ctx.save();
        var padding = (max - widths[j]) / 2;
        ctx.rotate(padding / radius);
        for (var i = 0; i < line.length; i++) {
          var char = line.charAt(i);
          mertrics = ctx.measureText(char);
          ctx.save();
          ctx.translate(0, -1 * radius);
          ctx.fillText(char, 0, y);
          ctx.restore();
          ctx.rotate(mertrics.width / radius);
        }
        ctx.restore();
      }
    } else {
      ctx.rotate((view.startAngle + Math.PI / 2 + renderInfo.endAngle) / 2);
      ctx.translate(0, -1 * radius);
      this.renderLabel(label, { x: 0, y: 0 });
    }
    ctx.restore();
  };

  Label.prototype.shouldRenderToElement = function (meta, element) {
    return !meta.hidden && !element.hidden && (
      this.options.showZero ||
      this.chart.config.type === 'polarArea' ? element._view.outerRadius !== 0 : element._view.circumference !== 0
    );
  };

  Label.prototype.getLabel = function (dataset, element, index) {
    var label;
    if (typeof this.options.render === 'function') {
      label = this.options.render({
        label: this.chart.config.data.labels[index],
        value: dataset.data[index],
        percentage: this.getPercentage(dataset, element, index),
        dataset: dataset,
        index: index
      });
    } else {
      switch (this.options.render) {
        case 'value':
          label = dataset.data[index];
          break;
        case 'label':
          label = this.chart.config.data.labels[index];
          break;
        case 'image':
          label = this.options.images[index] ? this.loadImage(this.options.images[index]) : '';
          break;
        case 'percentage':
        default:
          label = this.getPercentage(dataset, element, index) + '%';
          break;
      }
    }
    if (typeof label === 'object') {
      label = this.loadImage(label);
    } else if (label !== null && label !== undefined) {
      label = label.toString();
    }
    return label;
  };

  Label.prototype.getFontColor = function (dataset, element, index) {
    var fontColor = this.options.fontColor;
    if (typeof fontColor === 'function') {
      fontColor = fontColor({
        label: this.chart.config.data.labels[index],
        value: dataset.data[index],
        percentage: this.getPercentage(dataset, element, index),
        backgroundColor: dataset.backgroundColor[index],
        dataset: dataset,
        index: index
      });
    } else if (typeof fontColor !== 'string') {
      fontColor = fontColor[index] || this.chart.config.options.defaultFontColor;
    }
    return fontColor;
  };

  Label.prototype.getPercentage = function (dataset, element, index) {
    if (this.percentage !== null) {
      return this.percentage;
    }
    var percentage;
    if (this.chart.config.type === 'polarArea') {
      if (this.total === null) {
        this.total = 0;
        for (var i = 0;i < dataset.data.length; ++i) {
          this.total += dataset.data[i];
        }
      }
      percentage = dataset.data[index] / this.total * 100;
    } else if (this.chart.config.type === 'bar') {
      if (this.barTotal[index] === undefined) {
        this.barTotal[index] = 0;
        for (var i = 0;i < this.chart.data.datasets.length; ++i) {
          this.barTotal[index] += this.chart.data.datasets[i].data[index];
        }
      }
      percentage = dataset.data[index] / this.barTotal[index] * 100;
    } else {
      percentage = element._view.circumference / this.chart.config.options.circumference * 100;
    }
    percentage = parseFloat(percentage.toFixed(this.options.precision));
    if (!this.options.showActualPercentages) {
      if (this.chart.config.type === 'bar') {
        this.totalPercentage = this.barTotalPercentage[index] || 0;
      }
      this.totalPercentage += percentage;
      if (this.totalPercentage > 100) {
        percentage -= this.totalPercentage - 100;
        percentage = parseFloat(percentage.toFixed(this.options.precision));
      }
      if (this.chart.config.type === 'bar') {
        this.barTotalPercentage[index] = this.totalPercentage
      }
    }
    this.percentage = percentage;
    return percentage;
  };

  Label.prototype.getRenderInfo = function (element, label) {
    if (this.chart.config.type === 'bar') {
      return this.getBarRenderInfo(element, label);
    } else {
      return this.options.arc ? this.getArcRenderInfo(element, label) : this.getBaseRenderInfo(element, label);
    }
  };

  Label.prototype.getBaseRenderInfo = function (element, label) {
    if (this.options.position === 'outside' || this.options.position === 'border') {
      var renderInfo, rangeFromCentre,
        view = element._view,
        centreAngle = view.startAngle + (view.endAngle - view.startAngle) / 2,
        innerRadius = view.outerRadius / 2;
      if (this.options.position === 'border') {
        rangeFromCentre = (view.outerRadius - innerRadius) / 2 + innerRadius;
      } else if (this.options.position === 'outside') {
        rangeFromCentre = (view.outerRadius - innerRadius) + innerRadius + this.options.textMargin;
      }
      renderInfo = {
        x: view.x + (Math.cos(centreAngle) * rangeFromCentre),
        y: view.y + (Math.sin(centreAngle) * rangeFromCentre)
      };
      if (this.options.position === 'outside') {
        var offset = this.options.textMargin + this.measureLabel(label).width / 2;
        renderInfo.x += renderInfo.x < view.x ? -offset : offset;
      }
      return renderInfo;
    } else {
      return element.tooltipPosition();
    }
  };

  Label.prototype.getArcRenderInfo = function (element, label) {
    var radius, view = element._view;
    if (this.options.position === 'outside') {
      radius = view.outerRadius + this.options.fontSize + this.options.textMargin;
    } else if (this.options.position === 'border') {
      radius = (view.outerRadius / 2 + view.outerRadius) / 2;
    } else {
      radius = (view.innerRadius + view.outerRadius) / 2;
    }
    var startAngle = view.startAngle, endAngle = view.endAngle;
    var totalAngle = endAngle - startAngle;
    startAngle += Math.PI / 2;
    endAngle += Math.PI / 2;
    var mertrics = this.measureLabel(label);
    startAngle += (endAngle - (mertrics.width / radius + startAngle)) / 2;
    return {
      radius: radius,
      startAngle: startAngle,
      endAngle: endAngle,
      totalAngle: totalAngle,
      view: view
    }
  };

  Label.prototype.getBarRenderInfo = function (element, label) {
    var renderInfo = element.tooltipPosition();
    renderInfo.y -= this.measureLabel(label).height / 2 + this.options.textMargin;
    return renderInfo;
  };

  Label.prototype.drawable = function (element, label, renderInfo) {
    if (this.options.overlap) {
      return true;
    } else if (this.options.arc) {
      return renderInfo.endAngle - renderInfo.startAngle <= renderInfo.totalAngle;
    } else {
      var mertrics = this.measureLabel(label),
        left = renderInfo.x - mertrics.width / 2,
        right = renderInfo.x + mertrics.width / 2,
        top = renderInfo.y - mertrics.height / 2,
        bottom = renderInfo.y + mertrics.height / 2;
      if (this.options.renderInfo === 'outside') {
        return this.outsideInRange(left, right, top, bottom);
      } else {
        return element.inRange(left, top) && element.inRange(left, bottom) &&
          element.inRange(right, top) && element.inRange(right, bottom);
      }
    }
  };

  Label.prototype.outsideInRange = function (left, right, top, bottom) {
    var labelBounds = this.labelBounds;
    for (var i = 0;i < labelBounds.length;++i) {
      var bound = labelBounds[i];
      var potins = [
        [left, top],
        [left, bottom],
        [right, top],
        [right, bottom]
      ];
      for (var j = 0;j < potins.length;++j) {
        var x = potins[j][0];
        var y = potins[j][1];
        if (x >= bound.left && x <= bound.right && y >= bound.top && y <= bound.bottom) {
          return false;
        }
      }
      potins = [
        [bound.left, bound.top],
        [bound.left, bound.bottom],
        [bound.right, bound.top],
        [bound.right, bound.bottom]
      ];
      for (var j = 0;j < potins.length;++j) {
        var x = potins[j][0];
        var y = potins[j][1];
        if (x >= left && x <= right && y >= top && y <= bottom) {
          return false;
        }
      }
    }
    labelBounds.push({
      left: left,
      right: right,
      top: top,
      bottom: bottom
    });
    return true;
  };

  Label.prototype.measureLabel = function (label) {
    if (typeof label === 'object') {
      return { width: label.width, height: label.height };
    } else {
      var width = 0;
      var lines = label.split('\n');
      for (var i = 0; i < lines.length; ++i) {
        var result = this.ctx.measureText(lines[i]);
        if (result.width > width) {
          width = result.width;
        }
      }
      return { width: width, height: this.options.fontSize * lines.length };
    }
  };

  Label.prototype.loadImage = function (obj) {
    var image = new Image();
    image.src = obj.src;
    image.width = obj.width;
    image.height = obj.height;
    return image;
  };

  Chart.plugins.register({
    id: 'labels',
    beforeDatasetsUpdate: function (chart, options) {
      if (!SUPPORTED_TYPES[chart.config.type]) {
        return;
      }
      if (!Array.isArray(options)) {
        options = [options];
      }
      var count = options.length;
      if (!chart._labels || count !== chart._labels.length) {
        chart._labels = options.map(function () {
          return new Label();
        });
      }
      var someOutside = false, maxPadding = 0;
      for (var i = 0; i < count; ++i) {
        var label = chart._labels[i];
        label.setup(chart, options[i]);
        if (label.options.position === 'outside') {
          someOutside = true;
          var padding = label.options.fontSize * 1.5 + label.options.outsidePadding;
          if (padding > maxPadding) {
            maxPadding = padding;
          }
        }
      }
      if (someOutside) {
        chart.chartArea.top += maxPadding;
        chart.chartArea.bottom -= maxPadding;
      }
    },
    afterDatasetUpdate: function (chart, args, options) {
      if (!SUPPORTED_TYPES[chart.config.type]) {
        return;
      }
      chart._labels.forEach(function (label) {
        label.args[args.index] = args;
      });
    },
    beforeDraw: function (chart) {
      if (!SUPPORTED_TYPES[chart.config.type]) {
        return;
      }
      chart._labels.forEach(function (label) {
        label.barTotalPercentage = {};
      });
    },
    afterDatasetsDraw: function (chart) {
      if (!SUPPORTED_TYPES[chart.config.type]) {
        return;
      }
      chart._labels.forEach(function (label) {
        label.render();
      });
    }
  });
})();
*/


