<%@page import="homework.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	response.setCharacterEncoding("euc-kr"); 

	String id = request.getParameter("id");
	
	MemberDao memberDao = MemberDao.getInstance();
	boolean result = memberDao.duplicateId(id);

	if(result){
		response.getWriter().write("true");		
	}else{
		response.getWriter().write("false");				
	}
%>