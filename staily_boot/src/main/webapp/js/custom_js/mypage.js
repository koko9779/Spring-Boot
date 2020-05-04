/**
 * 
 */

$(function(){
	/***************************내가쓴글 삭제***************************/
   $('#deleteWriteBtn').click(function(e){
      var noArray = [];
      if(noArray.length ==0){
			return;
		}
      $('input[name="member_write_check"]:checked').each(function(i){
         noArray.push($(this).val());
      })
      
      var params = {
         "pNo" : noArray
      }
      
      $.ajax({
         url : 'member_write_delete',
         data : params,
         dataType : "text",
         success : function(result){
            if(result == 'true'){
            	swal({
					   title: "삭제완료",
					   text: "버튼을 클릭해주세요!",
					   icon: "success" //"info,success,warning,error" 중 택1
					}).then(() => {
						location.reload();
					});
            }else{
               location.href = '404';
            }
         },
         error : function(){
            location.href = '404';
         }
      });
      
      
   });
   
   /***************************북마크삭제***************************/
 //배열로 데이터를 Controller에 전송하기
	$('#deleteBtn').click(function(e){
		//배열선언
		var noArray = [];
		
		//배열에 값 채우기
		$('input[name="book_check"]:checked').each(function(i){
			noArray.push($(this).val());
		});
		if(noArray.length ==0){
			return;
		}
		
		var params = {
				"bmNo" : noArray 
		};
		
		//ajax 호출
		$.ajax({
			url : "bookmark_delete",
			data : params,
			dataType : "text",
			success : function(result){
				if(result == 'true'){
					swal({
						   title: "삭제완료",
						   text: "버튼을 클릭해주세요!",
						   icon: "success" //"info,success,warning,error" 중 택1
						}).then(() => {
							location.reload();
						});
				}else{
					location.href = '404';
				}
			}
		});
	});
	
	/************************친구삭제시작******************************/
	
	$('#deleteFriendBtn').click(function(e){
		//데이터를 받을 배열 선언
		var noArray = [];
		
		
		//배열에 데이터 넣기
		$('input[name="friend_check"]:checked').each(function(i){
			noArray.push($(this).val());
		});
		if(noArray.length ==0){
			return;
		}
		
		var params = {
			"fPk" : noArray
		}
		
		$.ajax({
			url : 'friend_delete',
			data : params,
			dataType : "text",
			success : function(result){
				if(result == 'true'){
					swal({
						   title: "삭제완료",
						   text: "버튼을 클릭해주세요!",
						   icon: "success" //"info,success,warning,error" 중 택1
						}).then(() => {
							location.reload();
						});
				}else{
					swal({
						   title: "삭제실패",
						   text: "버튼을 클릭해주세요!",
						   icon: "error" //"info,success,warning,error" 중 택1
						});
				}
			},
			error : function(){
				location.href = '404';
			}
		});
		
	});
	
	
	//쪽지보내기 [동적이벤트추가]
	$('.addFriendDiv').on("click","a:nth-child(1)",function(e){
		e.preventDefault();
		var no = $(this).attr('value');	
		window.open("message?mNo="+no, "_blank","width=750, height=500, left=900, top=100, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
	});
	
	//메시지보관함 [동적이벤트추가]
	$('.addFriendDiv').on("click","a:nth-child(2)",function(e){
		e.preventDefault();
		window.open("message_list", "_blank", "width=750, height=500, left=900, top=100, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
	});

	/************************쪽지보내기 시작******************************
	$('#friendDropdown a:nth-child(1)').click(function(e){
		e.preventDefault();
		var no = $(this).attr('value');	
		window.open("message?mNo="+no, "_blank","width=800, height=700, left=1000, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
		
	});
	*******************************************************************/
	
	/************************메시지 보관함******************************
	$('#friendDropdown a:nth-child(2)').click(function(e){
		e.preventDefault();
		window.open("message_list", "_blank", "width=800, height=700, left=1000, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
	});
	*******************************************************************/
	
	/************************검색한 친구 추가************************/
	$('#searchDropdwon a:nth-child(1)').click(function(e){
		e.preventDefault();
		var html = "";
		var params = {
				"mNo" : $('#searchMessage').attr('value'),
				"mId" : $('#addFriend').attr('value')
		}
		$.ajax({
			url : "friend_create",
			data : params,
			dataType : "json",
			success : function(result){
				if(result.status == 'success'){
					swal({
						   title: "친구추가완료",
						   text: "버튼을 클릭해주세요!",
						   icon: "success" //"info,success,warning,error" 중 택1
						}).then(() => {
								html += '<tr>'
								html += "<td><input type='checkbox' name='friend_check' value='"+result.fPk+"'>"+"</td>"
			                    html += '<td >'
			                    html += '<div class="dropdown">'
								html += '<button class="btn btn-primary dropdown-toggle" data-toggle="dropdown">'+$('#addFriend').attr('value')
								html += '</button>'
								html += '<div class="dropdown-menu" id="friendDropdown">'
								html += "<a class='dropdown-item' href='#' value='"+$('#searchMessage').attr('value')+"'>쪽지보내기</a>"	 
								html += "<a class='dropdown-item' href='#' value='"+$('#addFriend').attr('value')+"'>쪽지보관함</a>"		  	
								html += '</div> </div></td></tr>'		  	

								$('.addFriendDiv').append(html); 
						});
					
				}else if(result.status == 'D'){
					swal({
						   title: "이미 친구추가된 회원입니다",
						   text: "버튼을 클릭해주세요!",
						   icon: "success" //"info,success,warning,error" 중 택1
						});
				}else if(result.status =='M'){
					swal({
						   title: "본인은 친구추가가 불가능합니다",
						   text: "버튼을 클릭해주세요!",
						   icon: "success" //"info,success,warning,error" 중 택1
						});
				}
				
			},
			error : function(){
				location.href = '404';
			}
			
		});
	});

	
	/************************검색한 친구 쪽지보내기************************/
	$('#searchDropdwon a:nth-child(2)').click(function(e){
		e.preventDefault();
		var noV = $(this).attr('value');
		window.open("message?mNo="+noV, "_blank","width=750, height=500, left=900, top=100, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
	});
	
	/************************친구검색 function 시작******************************/
	
	$('#searchword').focus(function(e){
		this.value="";
		$(".add").toggle();
		$("#noId").text('');
		$('.add').attr('class','btn btn-primary dropdown-toggle add hidden');
		$(".add").text('');
		//$(".add").remove();
	});
	
	$('#searchword').keyup(function(e){
		if(e.keyCode==13){
			var mId = $('#searchword').val();
			var html = ""
		    if(mId !=""){
		    		$.ajax({
			    		url : "friend_find",
			    		data : "mId="+mId,
			    		dataType : "json",
			    		success : function(result){
			    			if(result.status == 'success'){
			    				$('.add').attr('class','btn btn-primary dropdown-toggle add');
			    				$('.add').attr('style','display: inline-block;');
			    				$('.add').text(result.mId);
			    				$('#searchMessage').attr('value',result.mNo);
			    				$('#addFriend').attr('value',result.mId);
			    				$('#searchword').blur();
			    				
			    			}else{
			    				$('#noId').text('회원 아이디를 다시 확인해주세요');
			    				$('#searchword').blur();
			    			}
			    		},
			    		error : function(){
			    			location.href = '404';
			    		}
			    	});
		    	
		    }
		
		}
	});
		
	/************************ sidebar function ******************************/
	
	$('#sideCheck li:nth-child(5)').click(function(e){
		e.preventDefault();
		window.open("message_list", "_blank", "width=750, height=500, left=900, top=100, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
		
	});
		
	/************************ 회원수정 validator ******************************/
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
			},
			mAddress : {
				required : true
			},
			mDaddress : {
				required : true
			},
			phn1 : {
				required : true
			},
			phn2 : {
				required : true
			},
			phn3 : {
				required : true
			},
			mName : {
				required : true
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
			},
			mAddress : {
				required : "주소를 입력해주세요"
			},
			mDaddress : {
				required : "상세주소를 입력해주세요"
			},
			phn1 : {
				required : "전화번호를 입력해주세요"
			},
			phn2 : {
				required : "전화번호를 입력해주세요"
			},
			phn3 : {
				required : "전화번호를 입력해주세요"
			},
			mName : {
				required : "이름을 입력해주세요"
			}
		},
		submitHandler:function(f){
			
			$.ajax({
				url: f.action,
				data: $(f).serialize(),
				dataType: 'text',
				success: function(result) {
					if(result == 'true'){
						 swal({
							   title: "회원정보수정성공",
							   text: "버튼을 클릭해주세요!",
							   icon: "success" //"info,success,warning,error" 중 택1
							}).then(() => {
								location.reload();
							});
						
					}else{
						location.href = '404';
					}
				},
				error : function(){
					location.href = '404';
					
				}
			});
		},
		errorClass:"error_validate",
		validClass:"valid"
	});
	$.validator.addMethod("passwordCk",  function( value, element ) {
		   return this.optional(element) ||  /^.*(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/.test(value);
		});
	
	/***************** 결제하기 ******************************/
	$('.paymentBtn').click(function(e){
		var btn = $(this);
		var tr = btn.parent().parent();
		var td = tr.children();
		var pyName = td.eq(0).attr('value');
		var pyPrice = td.eq(1).attr('value');
		var pyPeriod = td.eq(2).attr('value');
		var pyType = td.eq(3).attr('value');	
		var mId = $('#mId').val();
		var mEmail = $('#mEmail').val();
		var mPhone = $('#mPhone').val();

		
	    IMP.init('imp62215959'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	    var msg;
		
	    IMP.request_pay({
	        pg : 'kakaopay',
	        pay_method : pyType,
	        merchant_uid : 'merchant_' + new Date().getTime(),
	        name : pyName,
	        amount : pyPrice,
	        buyer_email : mEmail,
	        buyer_name : mId,
	        buyer_tel : mPhone,
	        vat : pyPeriod,		//vat의 값을 pyPeriod의 값으로 대체한다
	        buyer_postcode : '123-456',
	    }, function(rsp) {
	        if ( rsp.success ) {
	            //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
	            $.ajax({
	                url: "payment_complete", //cross-domain error가 발생하지 않도록 주의해주세요
	                type: 'POST',
	                dataType: 'text',
	                data: {
	                    imp_uid : rsp.imp_uid,
	                    pyPrice : pyPrice,
						pyName : pyName,
						pyPeriod : pyPeriod,
						pyType : pyType
	                    //기타 필요한 데이터가 있으면 추가 전달
	                },
	                success : function(result){
	                	if(result == 'true'){
	                		swal({
	     					   title: "결제완료",
	     					   text: "버튼을 클릭해주세요!",
	     					   icon: "success" //"info,success,warning,error" 중 택1
	     					}).then(() => {
		                        location.href='payment_list';
	     					});

	                	}else{
	                		location.href = '404';
	                	}
	                }
	            });
	        } else {
	            msg = '결제에 실패하였습니다.';
	            msg += '에러내용 : ' + rsp.error_msg;
	            //실패시 이동할 페이지
	            alert(msg);
	        }
	    });
		
		
	});
   
});
/*****************************멤버탈퇴*****************************/

function ss(){
	$('#memberInfoFrm').trigger('submit');
}


function leave(){
	var param = {
			"mNo" : $('#mNo').val()
	}
	var delConfirm = confirm('회원탈퇴하시겠습니까?');
	if(delConfirm){
		$.ajax({
			url : "member_delete",
			data : param,
			dataType : "text",
			success : function(result){
				if(result == 'true'){
					 swal({
						   title: "회원탈퇴성공",
						   text: "버튼을 클릭해주세요!",
						   icon: "success" //"info,success,warning,error" 중 택1
						}).then(() => {
							location.href = '../main/index'
						});
					
				}else{
					location.href = '404';
				}
			}
		});
	}else{
		return;
	}
}


/*****************************주소검색*****************************/
function execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}
				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				// document.getElementById('new_address_zipcode').value = data.zonecode;
				document.getElementById("mAddress").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("mDaddress").focus();
			}
		}).open();
};



/*******************회원수정 유효성체크*******************

function check() {
	var mPw = $('#mPw').val();
	var repeatPw = $('#repeatPw').val();
	var mEmail = $('#mEmail').val();
	var mAddress = $('#mAddress').val();
	var mDaddress = $('#mDaddress').val();
	var phn1 = $('#phn1').val();
	var phn2 = $('#phn2').val();
	var phn3 = $('#phn3').val();

	//이메일 체크
	var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	
	if (!regExp.test(mEmail)) {
		alert('이메일을 입력하세요');
		return;
	}
	
	if(mPw != repeatPw){
		alert('비밀번호가 일치하지 않습니다');
		return;
	}else if(mPw == "" || repeatPw == ""){
		alert('비밀번호를 입력하세요');
		return;
	}
	
	//비밀번호 체크
	var getCheck = RegExp(/^.*(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/);
	if(!getCheck.test(mPw)){
		alert("비밀번호는 영문, 숫자, 특수문자를 조합해서 8 ~ 15글자 사이입니다");
		return;
	}
	
	//주소 체크
	if(mAddress == ""){
		alert('주소를 입력하세요');
		return;
	}
	
	//상세주소 체크
	if(mDaddress == ""){
		alert('상세주소를 입력하세요');
		return;
	}
	
	//전화번호 체크
	if(phn1 == ""){
		alert("전화번호를 입력하세요");
		return;
	}
	if(phn2 == ""){
		alert("전화번호를 입력하세요");
		return;
	}
	if(phn3 == ""){
		alert("전화번호를 입력하세요");
		return;
	}
	
	alert('회원정보가 수정되었습니다');
	document.getElementById("memberInfoFrm").action = "member_update";
	document.getElementById("memberInfoFrm").method = 'POST';
	document.getElementById("memberInfoFrm").submit();

}
*/	
