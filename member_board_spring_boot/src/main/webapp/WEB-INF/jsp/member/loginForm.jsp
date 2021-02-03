<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/login.css" rel="stylesheet" type="text/css">
<script src="/js/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		// 로그인 실패시 
		var errMsg = '<%=(String)session.getAttribute("errMsg")%>';
		if(errMsg != 'null'){
			alert(errMsg);
		}
		
	    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다 (없으면 공백으로 들어감)
	    var key = getCookie("key");
	    $("#loginId").val(key); 
	    
	 	// 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면
	    if($("#loginId").val() != ""){ 
	        $("#keepLogin").attr("checked", true); // ID 저장하기를 체크 상태로 두기
	    }
	    
	 	// 체크박스에 변화가 있다면 
	    $("#keepLogin").change(function(){ 
	    	// ID 저장하기 체크했을 때
	        if($("#keepLogin").is(":checked")){ 
	            setCookie("key", $("#loginId").val(), 7); // 7일 동안 쿠키 보관
	        }
	    	// ID 저장하기 체크 해제 시
	        else{ 
	            deleteCookie("key");
	        }
	    });
	     
	    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
	    $("#loginId").keyup(function(){ // ID 입력 칸에 ID를 입력할 때
	    	// ID 저장하기를 체크한 상태라면
	        if($("#keepLogin").is(":checked")){ 
	            setCookie("key", $("#loginId").val(), 7); // 7일 동안 쿠키 보관
	        }
	    });
	});
	 
	function setCookie(cookieName, value, exdays){
	    var exdate = new Date();
	    exdate.setDate(exdate.getDate() + exdays);
	    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString()); 		//toGMTString() : GMT를 사용하여 문자열로 변환된 날짜를 가져옵니다.
	    document.cookie = cookieName + "=" + cookieValue;
	}
	 
	function deleteCookie(cookieName){
	    var expireDate = new Date();
	    expireDate.setDate(expireDate.getDate() - 1);
	    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
	}
	 
	function getCookie(cookieName) {
	    cookieName = cookieName + '=';
	    var cookieData = document.cookie;
	    var start = cookieData.indexOf(cookieName);
	    var cookieValue = '';
	    if(start != -1){
	        start += cookieName.length;
	        var end = cookieData.indexOf(';', start);
	        if(end == -1)end = cookieData.length;
	        cookieValue = cookieData.substring(start, end);
	    }
	    return unescape(cookieValue);	// unescape로 디코딩 후 값 리턴
	}

</script>
</head>
<body>
<div class="inner_login">
	<div class="login_tistory">

		<form method="post" id="authForm" action="/loginPost">
			<input type="hidden" name="redirectUrl"
				value="https://blogpack.tistory.com/manage">
			<fieldset>
				<legend class="screen_out">로그인 정보 입력폼</legend>
				<div class="box_login">
					<div class="inp_text">
						<label for="loginId" class="screen_out">아이디</label> 
						<input type="text" id="loginId" name="id" placeholder="ID">
					</div>
					<div class="inp_text">
						<label for="loginPw" class="screen_out">비밀번호</label> 
						<input type="password" id="loginPw" name="password" placeholder="Password">
					</div>
				</div>
				<button type="submit" class="btn_login">로그인</button>
				<div class="login_append">
					<div class="inp_chk">
						<!-- 체크시 checked 추가 -->
						<input type="checkbox" id="keepLogin" class="inp_radio" name="keepLogin">
						<label for="keepLogin" class="lab_g">
							<span class="img_top ico_check"></span> <span class="txt_lab">로그인 상태 유지</span>
						</label>
					</div>
					<span class="txt_find"> 
					<!-- 
						<a href="/member/find/loginId" class="link_find">아이디</a> / 
						<a href="/member/find/password" class="link_find">비밀번호 찾기</a>
					-->
						<a href="/MemberForm" class="link_find">회원가입</a>
					</span>
				</div>

			</fieldset>
		</form>

	</div>
</div>
</body>
</html>