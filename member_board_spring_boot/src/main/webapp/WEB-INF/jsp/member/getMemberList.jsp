<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.example.demo.dto.Member"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 리스트</title>

  <style>
        #wrap{
            margin-left:auto; 
            margin-right:auto;
            text-align:center;         
        }
        
        table{
            margin-left:auto; 
            margin-right:auto;
            border:3px solid skyblue;            
        }
        
        td{
            border:1px solid skyblue
        }
        
        #title{
            background-color:skyblue
        }
    </style>
</head>



<%
	List<Member> list = (List<Member>)request.getAttribute("memberList");
%>
<body>
     <div id="wrap">
        <br><br>
        <b><font size="5" color="gray">회원정보 리스트</font></b>
     	<br><br>
        <table>
            <tr>
                <th id="title">아이디</th>
                <th id="title">이름</th>
                <th id="title">성별</th>
                <th id="title">전화번호</th>
                <th id="title">주소</th>                
            </tr>
<%
	for(Member m: list) {
%>                        
            <tr>
                <td><%=m.getId() %></td>
                <td><%=m.getName() %></td>
                <td><%=m.getGender() %></td>
                <td><%=m.getPhone() %></td>
                <td><%=m.getAddress() %></td>
            </tr>
<%
	}
%>        
        </table>
        
        <br>
        <input type="button" value="확인">
    </div>
</body>
</html>