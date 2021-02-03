<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.demo.dto.Board"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Board Detail</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
    integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
    crossorigin="anonymous">
 
<!-- Optional theme -->
<link rel="stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
    integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
    crossorigin="anonymous">
 
<!-- Latest compiled and minified JavaScript -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script
    src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
    integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
    crossorigin="anonymous"></script>
<%
	Board board = (Board)request.getAttribute("board");
%>
</head>
<body>
    <br />
 	<h1 class="text-center"><a href="/boardList" style="text-decoration: none;">Board</a></h1>
    <br />
    <br />
    <div class="container">
        <form id="viewForm" method="post" encType="multiplart/form-data">
            <table class="table table-bordered">
                <tbody>
                    <tr>
                        <th scope="row">글번호</th>
                        <td class="col-md-9"><%=board.getBoardnum()%></td>
                    </tr>
                    <tr>
                        <th scope="row">이름</th>
                        <td><%=board.getName() %></td>
                    </tr>
                    <tr>
                        <th scope="row">날짜</th>
                        <td><%=board.getWriteday() %></td>
                    </tr>
                    <tr>
                        <th scope="row">조회수</th>
                        <td><%=board.getReadcount() %></td>
                    </tr>
                    <tr>
                        <th scope="row">제목</th>
                        <td><%=board.getTitle() %></td>
                    </tr>
                    <tr>
                        <th scope="row">내용</th>
                        <td><div style="height: 200px;"><%=board.getContent() %></div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: right;">
                            <button id="btn_previous" type="button" class="btn_previous">이전</button>
                            <button id="btn_modify" type="button" class="btn_register">수정</button>
                            <button id="btn_delete" type="button" class="btn_delete">삭제</button>
                        </td>
                    </tr>
                    <tr class="pw_tr" style="visibility:hidden;">
                    	<th style="color:red;">비밀번호</th>
                    	<td><input type="password" class="form-control" name="password"></td>
                   	</tr>
                </tbody>
            </table>
        </form>
    </div>
</body>
<script type="text/javascript">

	var boardnum = <%=board.getBoardnum()%>;
	//수정 클릭 시
    $(document).on('click', '#btn_modify', function(e) {
        location.href="/boardModify?boardnum="+boardnum;       
    });

	//삭제 클릭 시
    $(document).on('click', '#btn_delete', function(e) { 
    	var pw_tr = $('.pw_tr').css('visibility');
   		var pw = $('input[name="password"]');
		
    	//비밀번호를 입력해주세요.
    	if(pw_tr=='hidden'){
    		alert('비밀번호를 입력해주세요');
    		$('.pw_tr').css('visibility','visible');
    		pw.focus();
    		return false;	
    	}
    	
    	//비밀번호 체크
    	var pass_chk = $('input[name="password"]').val();
     	//비밀버호가 일치하지 않을 때
    	if(pass_chk != <%=board.getPassword()%>){
    		alert("비밀번호를 확인해주세요");
    		pw.focus();
    		return false;
    	}
    	
        if (confirm("정말 삭제하시겠습니까 ?") == true) {
            $("#viewForm").attr("action", "deleteBoard?boardnum="+boardnum);
            $("#viewForm").submit();
        }
    		

    
    });

 
    //이전 클릭 시 boardList로 이동
    $("#btn_previous").click(function previous() {
        $(location).attr('href', 'boardList');
 
    });
</script>
</html>