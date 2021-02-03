<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.example.demo.dto.Member"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
   table {
    width: 100%;
    border: 1px solid #444444;
    border-collapse: collapse;
    width: 400px;
    
    margin-left: auto;
    margin-right: auto;
  }
  th, td {
    border: 1px solid #444444;
    padding: 10px;
  }
</style>
</head>

<%
Member member = (Member)request.getAttribute("member");
%>
<body>
<h2><center>회원 정보</center></h2>
 <table border="1">
 			<tr>
				<th>ID</th>
				<th>이름</th>
				<th>닉네임</th>
				<th>나이</th>
				<th>취미</th>
			</tr>
	<%
	if(member != null ) {
		
	%>
			
		<tr>
		    <td><%=member.getId()%></td>
		    <td><%=member.getName()%></td>
		</tr>
		
	
	<%
	}
	%>
	</table>
</body>
</html>