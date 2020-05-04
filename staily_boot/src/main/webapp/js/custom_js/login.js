

/*********** login.jsp ************/
function login_action() {
	var params = $("form[name=f]").serialize();
	$.ajax({
		url: "login_action",
		type: 'POST',
		data: params,
		async : false,
		dataType: "json",
		success: function(resultObject) {
					if(resultObject.success === "success") {
						//기업회원
						if(resultObject.mType === "C") {
							if(resultObject.result === 1) {
								swal({
									title: '결제만료 공지',
									icon: 'info',
									text: '결제기한이 만료되었습니다 추가 결제를 진행하시겠습니까?',
									closeOnClickOutside: false,
									buttons : {
										cancle: {
											text: "메인으로 이동",
											value: false
										},
										confirm : {
											text: "결제하기",
											value: true
										}
									}
								}).then((result) => {
									if(result) {
										location.href = '../mypage/payment'
									}else {
										location.href = '../main/index'; 
									}
								});
							}else {
								location.href = '../main/index';
							}
						//기업이 아닌 일반회원이나 관리자
						}else {
							location.href='../main/index';
						}
					//로그인 실패 시
					}else {
						var errorMsg = resultObject.msg;
						swal({
							title: '로그인 실패',
							icon: 'error',
							text: errorMsg,
						}).then((willDelete) => {
							location.reload();
						});
					}
				}
	
		
	});
}

function loginKeyup(){
	if(event.keyCode == 13) {
		login_action();
	}	
}

/********** id_read.jsp ************/
function find_id() {
	var name = $("#inputName").val();
	var phone = $("#inputPhone").val();
	
	if(name == "" || phone == "" ){
		swal({
			   title: "아이디 찾기",
			   text: "이름과 번호를 입력해주세요",
			   icon: "warning" //"info,success,warning,error" 중 택1
			});
		return;
	}
	
	$.ajax({
		url: "id_read_action",
		type: 'POST',
		data: {name: name,
			   phone: phone},
		async : false,
		dataType: "json",
		success: function(findId) {
			if(findId.success === "success") {
				swal({
					  title: '아이디 찾기 성공',
					  icon: 'info',
					  text: '고객님의 아이디는 '+ findId.id + '입니다',
					}).then(() => {
						location.href='login';
					});
			}else {
				if(findId.customError === true) {
					swal({
						  title: '에러 메세지',
						  icon: 'error',
						  text: findId.msg,
						}).then(() => {
							location.href = "id_read";
						});
				}
				
			}
		}
		
	});
}

/***************** member_create.jsp ******************/


$(window)
.on(
		"load",
		function() {
			$('#registerF').validate({
				rules:{
					mId: {
						required: true,
						idCk: true,
						isIdExisted: true,
						rangelength: [8, 15],
					},
					mPw:{
						required: true,
						passwordCk : true,
						minlength: 8,
						maxlength: 15
					},
					repeatPw:{
						required: true,
						equalTo : '#inputPw'
					},
					mEmail:{
						required: true,
						isEmailExisted: true,
						email : true
					},
					mPhone: {
						required: true,
						phoneCk: true,
						rangelength: [10, 11]
					}
				},
				messages:{
					mId: {
						required: "아이디를 입력해주세요",
						idCk: "아이디는 영문 대소문자, 숫자로 이루어져야 합니다",
						isIdExisted: "중복된 아이디가 있습니다",
						rangelength: "아이디는 8자리 이상, 15이하로 구성되어야 합니다"
					},
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
						isEmailExisted: "중복된 이메일입니다",
						email : "이메일 형식으로 입력하셔야합니다."
					},
					mPhone: {
						required: "휴대폰번호를 입력해주세요",
						phoneCk: "핸드폰 번호는 숫자로만 이루어져야 합니다",
						rangelength: "핸드폰 번호는 10~11 숫자로 이루어져야 합니다"
					}
				}, 
				submitHandler:function(){
					member_create();
				},
				errorClass:"error_msg",
				validClass:"valid"
			});
			$.validator.addMethod("idCk",  function( value, element ) {
				return /^.*[a-zA-Z0-9]$/.test(value);
			});
			$.validator.addMethod("isIdExisted",  function( value, element ) {
				var check = -1;
				$.ajax({
					url: "Id_check",
					type: 'POST',
					data: "mId=" + value,
					async : false,
					dataType: "json",
					success: function(resultCount) {
									check = resultCount;
							}
				});
				if(check === 1) {
					return false;
				}else {
					return true;
				}
			});
			$.validator.addMethod("passwordCk",  function( value, element ) {
				return /^.*(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/.test(value);
			});
			$.validator.addMethod("phoneCk",  function( value, element ) {
				return /^.*[0-9]$/.test(value);
			});
			$.validator.addMethod("isEmailExisted",  function( value, element ) {
				var result = -1;
				$.ajax({
					url: "email_check",
					method: 'POST',
					data: {mEmail : value},
					dataType: "json",
					async : false,
					success: function(resultCount) {
							result = resultCount;
							}
				});
				if(result === 1) {
					return false;
				}else {
					return true;
				}
			});
			function member_create() {
				
				var params = $("#registerF").serialize();
				
				$.ajax({
					url: "member_create_action",
					method: 'POST',
					data: params,
					dataType: "json",
					async : false,
					success: function(resultCount) {
								if(resultCount === 1) {
									swal({
										  title: '가입 성공',
										  icon: 'success',
										  text: "회원가입에 성공하였습니다",
										}).then(() => {
											location.href = "login";
										});
								}else {
									swal({
										  title: '가입 실패',
										  icon: 'error',
										  text: "회원가입에 실패하였습니다",
										});
								}
							}
				});
			}
		});

	
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
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
            document.getElementById("inputAddress").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("inputDaddress").focus();
        }
    }).open();
}

function mType_company() {
	var phoneGroupE = document.getElementById("phoneGroupE");
	
	if(document.getElementById("inputCono")==null) {
		$("#inputType").attr("value", "C");
		$("<div class='form-group'>" +
                "<input type='text' class='form-control form-control-user' id='inputCono' name='coNo' placeholder=\"'-'  없이 사업자등록번호 입력해주세요\" maxlength='10'>" +
          "</div>").insertAfter(phoneGroupE);
		return;
	}
}

function mType_member() {
	var phoneGroupE = document.getElementById("phoneGroupE");
	var coNoE = document.getElementById("inputCono");
	
	if(coNoE!=null) {
		$("#inputType").attr("value", "M");
		coNoE.remove();
	}
}
/*************** pw_count_read.jsp *******************/
function find_pw() {
	var id = $("#inputId").val();
	var phone = $("#inputPhone").val();
	
	
	if(id == "" || phone == ""){
		swal({
			  title: '비밀번호 변경',
			  icon: 'warning',
			  text: "아이디와 번호를 입력해주세요",
			}).then(() => {
				location.reload();
			});
		return;
	}
	
	document.forgotIdF.action = "pw_count_read_action";
	document.forgotIdF.method= "POST";
	document.forgotIdF.submit();
}

/******************* pw_update.jsp ********************/
function update_pw_action() {
		
//		if($("#inputPw").val() != $("#inputRepeatPw").val()) {
//			//alert("비밀번호가 일치하지 않습니다");
//			swal({
//				   title: "비밀번호 찾기",
//				   text: "비밀번호가 일치하지 않습니다",
//				   icon: "warning" //"info,success,warning,error" 중 택1
//				})
//			return;
//		}
		document.f.action="pw_update";
		document.f.method="POST";
		document.f.submit();
}

$(window)
.on(
		"load",
		function() {
			$('#pwUpdateF').validate({
				rules:{
					pw:{
						required: true,
						passwordCk : true,
						minlength: 8,
						maxlength: 15
					},
					repeatPw:{
						required: true,
						equalTo : '#inputPw'
					}
				},
				messages:{
					pw:{
						required: "비밀번호를 입력해주세요",
						passwordCk: "영문, 숫자, 특수문자를 조합해서 입력해야 합니다.",
						minlength:"비밀번호는 8자리 이상으로 구성해야 합니다." ,
						maxlength:"비밀번호는 16자리 미만으로 구성해야 합니다"
					},
					repeatPw:{
						required: "비밀번호를 확인해주세요",
						equalTo : '비밀번호가 다릅니다.'
						
					}
				}, 
				submitHandler:function(){
					member_pw_update();
				},
				errorClass:"error_msg",
				validClass:"valid"
			});
			$.validator.addMethod("passwordCk",  function( value, element ) {
				return /^.*(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/.test(value);
			});
			function member_pw_update() {
				document.getElementById("pwUpdateF").action = "pw_update";
				document.getElementById("pwUpdateF").submit();
				
				swal({
					   title: "비밀번호 수정",
					   text: "비밀번호 수정 성공",
					   icon: "success" //"info,success,warning,error" 중 택1
					}).then(() => {
						location.href= "login";
					});
			}
		});
