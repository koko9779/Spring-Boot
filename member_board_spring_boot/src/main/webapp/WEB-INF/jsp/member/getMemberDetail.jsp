<%@page import="java.sql.Date"%>
<%@page import="com.example.demo.dto.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%> 
    
<html>
<head>
    <title>회원가입 처리 JSP</title>
    <style>
        #wrap{
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
<body>
    <%-- JoinForm.jsp에서 입력한 정보를 넘겨 받아 처리한다. --%>
    <% 
        // 한글 깨짐을 방지하기 위한 인코딩 처리
        request.setCharacterEncoding("euc-kr"); 
    	Member member = (Member)request.getAttribute("member");
    %>
    
    <div id="wrap">
        <br><br>
        <b><font size="5" color="gray">회원가입 정보를 확인하세요.</font></b>
        <br><br>
        <font color="blue"></font><%=member.getName()%>님 가입을 축하드립니다.
        <br><br>
        
        <%-- 자바빈에서 입력된 값을 추출한다. --%>
        <table>
            <tr>
                <td id="title">아이디</td>
                <td><%=member.getId()%></td>
            </tr>
                        
            <tr>
                <td id="title">비밀번호</td>
                <td><%=member.getPassword()%></td>
            </tr>
                    
            <tr>
                <td id="title">이름</td>
                <td><%=member.getName()%></td>
            </tr>
                    
            <tr>
                <td id="title">성별</td>
                <td><%=member.getGender()%></td>
            </tr>
                    
            <tr>
                <td id="title">생일</td>
                <td>
                   <%=member.getBirthyy() %>년 
                   <%=member.getBirthmm() %>월 
                   <%=member.getBirthdd() %>일
                </td>
            </tr>
                    
            <tr>
                <td id="title">이메일</td>
                <td>
                   <%=member.getMail1() %>@<%=member.getMail2() %>
                </td>
            </tr>
                    
            <tr>
                <td id="title">휴대전화</td>
                <td><%=member.getPhone() %></td>
            </tr>
            <tr>
                <td id="title">주소</td>
                <td>
                    <%=member.getAddress() %>
                </td>
            </tr>
        </table>
        
        <br>
        <input type="button" onClick="location.href='/member/MemberList.jsp'" value="리스트조회">
    </div>
</body>
</html>

