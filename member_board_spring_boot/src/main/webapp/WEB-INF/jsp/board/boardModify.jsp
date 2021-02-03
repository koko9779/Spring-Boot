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
<script
    src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
    integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
    crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
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
        <form action="updateBoard" id="modifyForm" method="post"
            encType="multiplart/form-data">
            <table class="table table-bordered">
                <tbody>
                    <tr>
                        <th>글번호</th>
                        <td><input type="text" class="form-control" 
                        name="boardnum"  value="<%=board.getBoardnum() %>" readonly /></td>
                    </tr>
                    <tr>
                        <th>이름</th>
                        <td><input type="text" class="form-control"
                        name="name" value="<%=board.getName() %>" readonly/></td>
                    </tr>
                    <tr>
                        <th>날짜</th>
                        <td><input type="text" class="form-control"
                        name="writeday" value="<%=board.getWriteday() %>" readonly/></td>
                    </tr>
                    <tr>
                        <th>조회수</th>
                        <td><input type="text" class="form-control"
                        name="readcount" value="<%=board.getReadcount() %>" readonly /></td>
                    </tr>
                    <tr>
                        <th>제목</th>
                        <td><input type="text" class="form-control"
                        name="title" value="<%=board.getTitle() %>" /></td>
                    </tr>
                    <tr>
                        <th>내용</th>
                        <td><textarea name="content" class="form-control"
                                style="height: 200px;"><%=board.getContent() %></textarea>
                        </td>
                    </tr>
                    <tr>
                    	<th>비밀번호</th>
                    	<td><input type="password" class="form-control" name="password"></td>
                   	</tr>
                    <tr>
                        <td colspan="2" style="text-align: right;">
                            <button id="btn_previous" type="button" class="btn_previous">이전</button>
                            <button id="btn_modify" type="button" class="btn_register">수정</button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
    </div>
</body>
<script type="text/javascript">

	//수정 클릭 시
    $(document).on('click', '#btn_modify', function(e) {
    	
    	var pass_chk = $('input[name="password"]').val();
    	
    	if(pass_chk != <%=board.getPassword()%>){
    		alert("비밀번호를 확인해주세요");
    		$('input[name="password"]').focus();
    		return false;
    	}
    	
        if (confirm("정말 수정하시겠습니까 ?") == true) {
            $("#modifyForm").submit();
        } else {
            return;
        }
    });
    //이전 클릭 시 Detail로 이동
    $("#btn_previous").click(function previous() {
        $(location).attr('href', 'boardDetail?boardnum='+<%=board.getBoardnum()%>);
 
    });
</script>
</html>