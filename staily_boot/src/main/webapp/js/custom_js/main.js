var page = 1;
var isVisible = false;

//페이지가 로드되면 데이터를 가져오고 page를 증가시킨다.
$(document).load(function(){ 
	 page = 1;  
}); 

//page가 mwListEnd를 비추면 getList를 호출한다.
$(window).on('scroll',function () {
	//현재 페이지에 .mwList가 있는 경우
	if($('.mwList').length && $('.mwListEnd').length){
		//showLoadingDialog(false);
	    if (checkVisible($('.mwListEnd'))&& !isVisible ) {
	        //alert("다음 게시물 나오세요");
	        isVisible=true;
	        getList(page);

	    }
	}

});

//다음 게시물을 보이게 하는 함수
function checkVisible( elm, eval ) {
    eval = eval || "object visible";
    var viewportHeight = $(window).height(); // Viewport Height
    var scrolltop = $(window).scrollTop(); // Scroll Top
    var y = $(elm).offset().top;
    var elementHeight = $(elm).height();   
    if (eval == "object visible") return ((y < (viewportHeight + scrolltop)) && (y > (scrolltop - elementHeight)));
    if (eval == "above") return ((y < (viewportHeight + scrolltop)));
}

//다음 리스트 가져오기
function getList(curPage){
	var wNo = $('.mwList .wNoo').val();
	var url_string = window.location.href;
	var url = new URL(url_string);
	var wdEpisode = url.searchParams.get("wdEpisode");
	if(wdEpisode==null){
		var params = 'wNo='+wNo+'&nextPage='+(curPage+1);
		var moveUrl = 'worklist_select/detail';
		var temp = 0;
	}else{
		var params = 'wNo='+wNo+'&wdEpisode='+wdEpisode+'&nextPage='+(curPage+1);
		var moveUrl = 'episode/detail';
		var temp = 1;
	}
    $.ajax({
        type : 'POST',  
        dataType : 'json', 
        data : params,
        url : moveUrl,
        success : function(jsonData) {
            var html = "";
			var userNo = jsonData.userNo;	
			var bmList = jsonData.bmList;
			var mwArray = jsonData.list;
			var endPage = jsonData.endPage;
			if (curPage<=endPage){ 
				/**for문 시작*********************************/
				for (var i = 0; i < mwArray.length; i++) {
					
					var mwProduct = mwArray[i].product;
					var wdEpisode = mwArray[i].wdEpisode;
					var pMno = mwProduct[0].mNo;
					var pPno = mwProduct[0].pNo;
					var pScene = mwProduct[0].pScene;
					var pName = mwProduct[0].pName;
					var pView = mwProduct[0].pView;
					var pMid = mwProduct[0].mId;
					
					html += "<form id='product_"+pPno+"' style='margin:7% 0;'>";
					html += "<h2 value='상품이름' >"+pName+"</h2>";
					html += "<input type='hidden' value='"+userNo+"' name='userNo'>";
					html += "<input type='hidden' value='"+wNo+"' name='wNo'>";
					html += "<input type='hidden' value='"+pPno+"' name='pNo'>";
					html += "<div class='movie-poster2'>";
					html += "<img onclick='productpage("+pPno+")'";
					if(temp==0){
						html += " src='../images/product/scene/"+pScene+".jpg'";
					}else{
						html += " src='../../images/product/scene/"+pScene+".jpg'";						
					}
					html += " alt='"+pName+"' style='width:850px; height:450px; margin: 0;cursor: pointer;'/>";
					html += "</div>";
					html += "<div style='height:35px;'>";
					
					if(userNo!=null){
						if(bmList=="" || bmList==undefined){
							html += "<input class='material-icons' type='image'";
							html += " style='border: none; width: 4%; float:left; padding: 0px;' alt='즐겨찾기 등록'";
							if(temp==0){
								html += " src='../images/emptystar.png'";
							}else{
								html += " src='../../images/emptystar.png'";
							}
							
							html += " onclick='create_bookmark("+userNo+","+pPno+");return false;'>"; 
						}
						
						else{
								var cnt = 0;
								for (var j = 0; j < bmList.length; j++) {
									if(pPno==bmList[j].product.pNo){
										cnt = 1;
										break;
									}
								}
								
								if(cnt==1){
									html += "<input class='material-icons' type='image'"; 
									html += " style='border: none; width: 4%; float:left; padding: 0px;' alt='즐겨찾기 제거'";
									if(temp==0){
										html += " src='../images/star.png'";
									}else{
										html += " src='../../images/star.png'";										
									}
									html += " onclick='select_bookmark("+userNo+","+pPno+");return false;'>";
								}else{
									html += "<input class='material-icons' type='image'";
									html += " style='border: none; width: 4%; float:left; padding: 0px;' alt='즐겨찾기 등록'";
									if(temp==0){
										html += " src='../images/emptystar.png'";
									}else{
										html += " src='../../images/emptystar.png'";										
									}
									html += " onclick='create_bookmark("+userNo+","+pPno+");return false;'>";  
								}
							
						}
							
					}else{
						html += "<input class='material-icons' type='image'";
						html += " style='border: none; width: 4%; float:left; padding: 0px;' alt='즐겨찾기 등록'";
						if(temp==0){
							html += " src='../images/emptystar.png'";
						}else{
							html += " src='../../images/emptystar.png'";										
						}
						html += " onclick='login_advice(); return false;'>";                                     
					}
					html += "<div style='float:right;'>";
					html += "<span value='작성자'>작성자: "+pMid+"</span>";
					html += "<span class='categories tag' value='조회수'>조회수: "+pView+"</span>";
					html += "<span class='categories tag' value='에피소드'>"+wdEpisode+"회</span>";
					html += "</div>";
					html += "</div>";
					html += "</form>";
				};
				/**for문 끝*********************/
				showLoadingDialog(true);
				setTimeout(function(){
					if(html.length){
						$('.mwList').append(html); 
						showLoadingDialog(false);
						isVisible=false;
						page++;
					}else{ 
						console.log(pPno);
						var lastContent = $('#mwList form:last-child').offset().top;
						$('html').animate({scrollTop: lastContent-150}, 1000);
						showLoadingDialog(false);
						isVisible=true;
					}
				},1000);
            }else{
				$(".mwList").append(html); 
				isVisible=true;
            }

       }
    }); 
};

//다음 게시물이 보기전에 생기는 로딩이미지
function showLoadingDialog(loadingCheck) {
	if (loadingCheck) {
		var url_string = window.location.href;
		var url = new URL(url_string);
		var wdEpisode = url.searchParams.get("wdEpisode");
		var dialogDivE = "<img class='loading' style='margin: 0 45%; width: 10%;'";
		if(wdEpisode==null){
			dialogDivE += " src='../images/main/Spin-1s-200px.gif'>";
		}else{
			dialogDivE += " src='../../images/main/Spin-1s-200px.gif'>";			
		}
		if(!$('.loading').length){
			$(".mwListEnd").append(dialogDivE); 			
		}
	} else {
		$(".loading").remove(); 
	}
};


$(document).ready(function(){
	
	if($('#sidebar').length){
		// 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
		var floatPosition = parseInt($("#sidebar").css('top'));
		// 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );

		$(window).scroll(function() {
			// 현재 스크롤 위치를 가져온다.
			var scrollTop = $(window).scrollTop();
			if(scrollTop<407){
				var newPosition = floatPosition + "px";				
			}else{
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
	
	$('.slick-carousel.newIn').not('.slick-initialized').slick({
		autoplay: false,
		autoplaySpeed: 3000,
		slidesToShow: 4,
		centerPadding: '60px',
		prevArrow: '<i class="material-icons left">keyboard_arrow_left</i>',
		nextArrow: '<i class="material-icons right">keyboard_arrow_right</i>',
		responsive: [
		    {
		      breakpoint: 768,
		      settings: {
		        slidesToShow: 2
		      }
		    },
		    {
		      breakpoint: 480,
		      settings: {
		        slidesToShow: 1
		      }
		    }
		  ]
	});
	$('#workEpisode').change(function(e){
		console.log('#workEpisode change!!!!!!!!!!');
		var contextPath = $("option:selected").attr("contextPath");
		var wNo = $("option:selected").attr("wNo");
		var wdEpisode = $("option:selected").val();
		var url_string = window.location.href;
		var url = new URL(url_string);
		var urlcheck = url.searchParams.get("wdEpisode");
		if(urlcheck!=null){
			var params = 'wNo='+wNo+'&wdEpisode='+wdEpisode;
			location.href="episode?"+params;
		}else{
			var params = 'wNo='+wNo+'&wdEpisode='+wdEpisode;
			location.href="worklist_select/episode?"+params;
		}
	});
	//ajax
	//worklist 회차 출력
	/*
	$('#workEpisode').change(function(e){
		console.log('#workEpisode change!!!!!!!!!!');
		var contextPath = $("option:selected").attr("contextPath");
		var curPage = 1;
		var wNo = $("option:selected").attr("wNo");
		var wdEpisode = $("option:selected").val();
		var params = 'wNo='+wNo+'&wdEpisode='+wdEpisode+'&nextPage='+(curPage);
		
		$.ajax({
			url:'worklist_select/detail/episode',
			method:'POST',
			data:params,
			dataType:'json',
			success:function(jsonData){
				var html = "";
				var userNo = jsonData.userNo;
				//var episode = jsonData.mwe[0].wdEpisode;
				var bmList = jsonData.bmList;
				var mweArray = jsonData.mwe;
				var endPage = jsonData.endPage;
				console.log("현재 페이지"+curPage+",마지막페이지"+endPage);
				
				if (curPage<=endPage){ 
					
					for (var i = 0; i < mweArray.length; i++) {
						console.log("html length:"+html.length);
						var mweProduct = mweArray[i].product;
						var pMno = mweProduct[0].mNo;
						var pPno = mweProduct[0].pNo;
						var pScene = mweProduct[0].pScene;
						var pName = mweProduct[0].pName;
						var pView = mweProduct[0].pView;
						var pMid = mweProduct[0].mId;
						
						html += "<form id='product_"+pPno+"' style='margin:7% 0;'>";
						html += "<h2 value='상품이름' >"+pName+"</h2>";
						html += "<input type='hidden' value='"+userNo+"' name='userNo'>";
						html += "<input type='hidden' value='"+wNo+"' name='wNo'>";
						html += "<input type='hidden' value='"+pPno+"' name='pNo'>";
						html += "<div class='movie-poster2'>";
						html += "<img onclick='productpage("+wNo+","+pPno+")'";
						html += " src='../images/product/scene/"+pScene+".jpg'";
						html += " alt='"+pName+"' style='width:850px; height:450px; margin: 0;cursor: pointer;'/>";
						html += "</div>";
						html += "<div style='height:35px;'>";
						
						if(userNo!=null){
							/////////////////////////
							if(bmList=="" || bmList==undefined){
								
								html += "<input class='material-icons' type='image'";
								html += " style='border: none; width: 4%; float:left; padding: 0px;' alt='즐겨찾기 등록'";
								html += " src='../images/emptystar.png'";
								html += " onclick='create_bookmark("+userNo+","+pPno+");return false;'>"; 
							}else{
								
									console.log("login-->>>>>>>>>>>>>")
									var cnt = 0;
									for (var j = 0; j < bmList.length; j++) {
										if(pPno==bmList[j].product.pNo){
											console.log("cnt1-->>>>>>>>>>>>>")
											cnt = 1;
											break;
										}
									}
									
									if(cnt==1){
										html += "<input class='material-icons' type='image'"; 
										html += " style='border: none; width: 4%; float:left; padding: 0px;' alt='즐겨찾기 제거'";
										html += " src='../images/star.png'";
										html += " onclick='select_bookmark("+userNo+","+pPno+");return false;'>";
										console.log("cnt=====1-->>>>>>>>>>>>>")
									}else{
										html += "<input class='material-icons' type='image'";
										html += " style='border: none; width: 4%; float:left; padding: 0px;' alt='즐겨찾기 등록'";
										html += " src='../images/emptystar.png'";
										html += " onclick='create_bookmark("+userNo+","+pPno+");return false;'>";  
									}
								
							}	
							 
						}else{
							html += "<input class='material-icons' type='image'";
							html += " style='border: none; width: 4%; float:left; padding: 0px;' alt='즐겨찾기 등록'";
							html += " src='../images/emptystar.png'";
							html += " onclick='login_advice(); return false;'>";                                     
						}
						
						///////episode가 널일때 ~~ 수정
						
						html += "<div style='float:right;'>";
						html += "<span value='작성자'>작성자: "+pMid+"</span>";
						html += "<span class='categories tag' value='조회수'>조회수: "+pView+"</span>";
						html += "<span class='categories tag' value='에피소드'>"+wdEpisode+"회</span>";
						html += "</div>";
						html += "</div>";
						html += "</form>";
						console.log("end-->>>>>>>>>>>>>")
					}
					
					var html2 = "<div class='.mwListEnd'></div>";
					$('#work_list_main .mwListEnd').remove();
					
					$('#work_list_main .mwList').empty();
					
					//for문 끝
					showLoadingDialog(true);
					setTimeout(function(){
						if(html.length){
							$('.mwList').append(html); 
							$('#work_list_main').append(html2);
							showLoadingDialog(false);
							isVisible=false;
							page++;
						}else{
							showLoadingDialog(false);
							isVisible=true;
						}
					},2000);
					
				}else{
					$("#work_list_main .mwList").append(html); 
					isVisible=true;
				}
				
				//
				$('.slick-carousel.newIn').not('.slick-initialized').slick({
					autoplay: false,
					autoplaySpeed: 3000,
					slidesToShow: 4,
					centerPadding: '60px',
					prevArrow: '<i class="material-icons left">keyboard_arrow_left</i>',
					nextArrow: '<i class="material-icons right">keyboard_arrow_right</i>',
					responsive: [
					    {
					      breakpoint: 768,
					      settings: {
					        slidesToShow: 2
					      }
					    },
					    {
					      breakpoint: 480,
					      settings: {
					        slidesToShow: 1
					      }
					    }
					  ]
				});
			}
		});
		
		e.preventDefault();
	});	
	*/
});

function bm_productpage(bmNo,pNo){
	var product_form = document.getElementById('bookmark_'+bmNo);
	product_form.action = "../detail/product_detail";
	product_form.submit();
};
/************Controller productpage*******************/
function productpage(pNo){
	var url_string = window.location.href;
	var url = new URL(url_string);
	var wdEpisode = url.searchParams.get("wdEpisode");
	var product_form = document.getElementById('product_'+pNo);
	if(wdEpisode==null){
		product_form.action = "../detail/product_detail";	
	}else{
		product_form.action = "../../detail/product_detail";	
	}
	product_form.submit();
};
/************Controller workpage*******************/

function workpage(wNo){
	var url_string = window.location.href;
	var url = new URL(url_string);
	var wdEpisode = url.searchParams.get("wdEpisode");
	var work_form = document.getElementById('work_'+wNo);
	if(wdEpisode==null){
		work_form.action = "worklist_select";		
	}else{
		work_form.action = "../worklist_select";	
	}
	work_form.submit();
};

/************Controller create_bookmark*******************/
/*
function create_bookmark(userNo,pNo){
	var product_form = document.getElementById('product_'+pNo);
	alert('즐겨찾기에 상품이 추가되었습니다');
	product_form.action = "create_bookmark";
	product_form.submit();
};
*/
/************Controller delete_bookmark*******************/
/*
function delete_bookmark(bmNo){
	  var bookmark_form = document.getElementById('bookmark_'+bmNo);
//	  alert("즐겨찾기에서 상품이 제거됐습니다");
	  bookmark_form.action = "delete_bookmark";
	  bookmark_form.submit();
	  window.location.reload();
};
*/

/************Controller select_bookmark*******************/
/*
function select_bookmark(mNo,pNo){
	var product_form = document.getElementById('product_'+pNo);
	product_form.action = "select_bookmark";
	product_form.submit();
}
*/
/*************RestController create_bookmark********************/
function create_bookmark(userNo,pNo){
	//alert('즐겨찾기에 상품이 추가되었습니다.'+event.target);
	var params= "userNo="+userNo+"&pNo="+pNo;
	var product = "#product_"+pNo;
	var url_string = window.location.href;
	var url = new URL(url_string);
	var wdEpisode = url.searchParams.get("wdEpisode");
	if(wdEpisode==null){
		var moveUrl="create_bookmark";
		var temp=0;
	}else{
		var moveUrl="../create_bookmark";
		var temp=1;
	}
	$.ajax({
		url: moveUrl,
		method:"POST",
		data: params,
		success:function(result){
			console.log('라ㅏ?');
			if(result=='true'){
				//console.log($(product).find('.material-icons').attr('src')+"------------->");
				if(temp==0){
					$(product).find('.material-icons').attr('src','../images/star.png');
				}else{
					$(product).find('.material-icons').attr('src','../../images/star.png');					
				}
				$(product).find('.material-icons').attr('alt','즐겨찾기 제거');				
				$(product).find('.material-icons').attr('onclick','select_bookmark('+userNo+','+pNo+');return false;');
			}
		}			
	});
};
/************RestController select_bookmark*******************/
function select_bookmark(userNo,pNo){
	//alert("즐겨찾기에서 상품이 제거됐습니다");
	var params= "userNo="+userNo+"&pNo="+pNo;
	var url_string = window.location.href;
	var url = new URL(url_string);
	var wdEpisode = url.searchParams.get("wdEpisode");
	if(wdEpisode==null){
		var moveUrl="select_bookmark";
	}else{
		var moveUrl="../select_bookmark";
	}
	$.ajax({
		url: moveUrl,
		method: "POST",
		data: params,
		success:function(bookset){
			delete_bookmark(bookset);
		}
	});
}
/***********RestController delete_bookmark*******************/
function delete_bookmark(bookset){
	//alert("즐겨찾기에서 상품이 제거됐습니다");
	var bmNo = ""+bookset;
	var userNo = 0;
	var pNo = 0;
	var product;
	var url_string = window.location.href;
	var url = new URL(url_string);
	var wdEpisode = url.searchParams.get("wdEpisode");
	if(wdEpisode==null){
		var moveUrl= "delete_bookmark";
		var temp=0;
	}else{
		var moveUrl= "../delete_bookmark";
		var temp=1;
	}
	
	if(bmNo.indexOf(",")!=-1){
		var bookset = bookset.split(',');
		bmNo = bookset[0];
		userNo = bookset[1];
		pNo = bookset[2];
	}
	if(pNo==0){
		product = "#bookmark_"+bmNo;
	}else{
		product = "#product_"+pNo;
	}
	var params= "bmNo="+bmNo+"&userNo="+userNo+"&pNo="+pNo;
		$.ajax({
			url: moveUrl,
			method:"POST",
			data: params,
			success:function(result){
				if(result=='true'){
					//console.log($(product).find('.material-icons').attr('src')+"------------->");
					if(temp=0){
						$(product).find('.material-icons').attr('src','images/emptystar.png');
					}else{
						$(product).find('.material-icons').attr('src','../images/emptystar.png');						
					}
					$(product).find('.material-icons').attr('alt','즐겨찾기 등록');				
					$(product).find('.material-icons').attr('onclick','create_bookmark('+userNo+','+pNo+');return false;');
				}
			}
		});
};

/**********************************************************/
function login_advice(){
	var url_string = window.location.href;
	var url = new URL(url_string);
	var wdEpisode = url.searchParams.get("wdEpisode");
	if(wdEpisode==null){
		alert("로그인이 필요한 작업입니다");
		location.href="../login/login";
	}else{
		alert("로그인이 필요한 작업입니다");
		location.href="../../login/login";
	}
}