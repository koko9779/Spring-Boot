<%@ page language="java" contentType="text/html; charset=utf-8"    pageEncoding="utf-8"%>
<html>
<head>
    <title>회원가입 화면</title>
    <style>
        #wrap{
            width:530px;
            margin-left:auto; 
            margin-right:auto;
            text-align:center;
        }
        
        table{
            margin-left:auto; 
            margin-right:auto;
            border:3px solid skyblue
        }
        
        td{
            border:1px solid skyblue
        }
        
        #title{
            background-color:skyblue
        }
    </style>
</head>
<script src="/js/jquery-1.12.0.min.js"></script>
<script>
	function check(f){
		//아이디
		if(!f.id.value){
			alert("아이디를 입력하세요");
			return false;
		}
		if(f.idCheckState.value=="unChecked"){
			alert("아이디 중복확인이 필요합니다")
			return false;
		}
		//비밀번호
		if(!f.password.value){
			alert("비밀번호를 입력하세요");
			return false;
		}
		if(f.password.value!=f.passwordcheck.value){
			alert("비밀번호를 확인해주세요");
			return false;
		}
		//생일
		if(isNaN(f.birthyy.value)){
			alert("년도는 숫자만 입력가능합니다");
			return false;
		}
		if(!f.birthyy.value || !f.birthmm.value || !f.birthdd.value){
			alert("생일을 입력하세요");
			return false;
		}
		//이메일
		if(!f.email.value){
			alert("이메일을 입력하세요");
			return false;
		}
		//휴대전화
		if(!f.phone.value){
			alert("휴대전화를 입력하세요");
			return false;
		}
		//이메일
		if(!f.address.value){
			alert("주소를 입력하세요");
			return false;
		}
		
		return true;
	}
  // 중복체크
 fnMemberExistCheck =  function () {
        $.ajax({
            type : 'GET',
            url : '/getMemberCount',
            data : {id : $('#id').val()},
            dataType : 'json',
            error: function(xhr, status, error){
                alert(error);
            },
            success : function(data){
				if(!document.getElementById("id").value){
					alert("아이디를 입력해주세요");
					$("input[name=idCheckState]").val("unChecked");
				}else{
	                if( data > 0 ) {
		                 alert("이미 등록된 아이디입니다.");
		                 $("input[name=idCheckState]").val("unChecked");
		                 $('#id').focus();
		            }else {
		                alert("등록이 가능한 아이디입니다.");
		                $("input[name=idCheckState]").val("Checked");
		                $('#password').focus();
			        }
				}
            }
        });
  }
  	
  	//취소
	function clearInput(){
		//텍스트박스 지우는 부분
		var el = document.getElementsByClassName('input-text');
	
		for(var i=0; i<el.length; i++){
			el[i].value = '';
		}
	}
</script>


<body>
    <!-- div 왼쪽, 오른쪽 바깥여백을 auto로 주면 중앙정렬된다.  -->
    <div id="wrap">
        <br><br>
        <b><font size="6" color="gray">회원가입</font></b>
        <br><br>
        
        <form method="post" id="memberForm" action="/memberJoinProc" onsubmit="return check(this);">
            <table>
                <tr>
                    <td id="title">아이디</td>
                    <td>
                        <input type="text" id="id" name="id" class="input-text"maxlength="20">
                        <input type="button" value="중복확인" onClick="javascript:fnMemberExistCheck();">    
                    	<input type="hidden" name="idCheckState" value="unChecked"> 
                    </td>
                </tr>
                        
                <tr>
                    <td id="title">비밀번호</td>
                    <td>
                        <input type="password" name="password" id="password" class="input-text" maxlength="15">
                    </td>
                </tr>
                
                <tr>
                    <td id="title">비밀번호 확인</td>
                    <td>
                        <input type="password" name="passwordcheck" class="input-text" maxlength="15">
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">이름</td>
                    <td>
                        <input type="text" name="name" class="input-text" maxlength="40">
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">성별</td>
                    <td>
                        <input type="radio" name="gender" value="남" checked>남
                        <input type="radio" name="gender" value="여" checked>여
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">생일</td>
                    <td>
                        <input type="text" name="birthyy" class="input-text" maxlength="4" placeholder="년(4자)" size="6" >
                        <select name="birthmm">
                            <option value="">월</option>
                            <option value="01" >1</option>
                            <option value="02" >2</option>
                            <option value="03" >3</option>
                            <option value="04" >4</option>
                            <option value="05" >5</option>
                            <option value="06" >6</option>
                            <option value="07" >7</option>
                            <option value="08" >8</option>
                            <option value="09" >9</option>
                            <option value="10" >10</option>
                            <option value="11" >11</option>
                            <option value="12" >12</option>
                        </select>
                        <input type="text" name="birthdd" class="input-text" maxlength="2" placeholder="일" size="4" >
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">이메일</td>
                    <td>
                        <input type="text" name="mail1" class="input-text" maxlength="30">@
                        <select name="mail2">
                            <option>naver.com</option>
                            <option>daum.net</option>
                            <option>gmail.com</option>
                            <option>nate.com</option>                        
                        </select>
                    </td>
                </tr>
                    
                <tr>
                    <td id="title" class="input-text">휴대전화</td>
                    <td>
                        <input type="text" name="phone" class="input-text"/>
                    </td>
                </tr>
                <tr>
                    <td id="title">주소</td>
                    <td>
                        <input type="text" size="50" name="address" class="input-text"/>
                    </td>
                </tr>
            </table>
            <br>
            <input type="submit" value="가입"/>  <input type="button" onclick="clearInput();" value="취소">
        </form>
    </div>
</body>
</html>


