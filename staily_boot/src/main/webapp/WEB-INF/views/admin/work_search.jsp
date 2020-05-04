<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/include_css.jsp"%>
</head>
<body>
	<h2 align="center">작품검색</h2><br>
	<div align="center">
	<input id="queryM" type="text" value=""
		onkeyup="searchItemM(queryM.value)" width="auto" >
	<button onclick="searchItemM(queryM.value)">확인</button>
	<form id="resultF" name="resultF"></form>
	</div>
</body>
<%@ include file="/WEB-INF/views/admin/include/include_js.jsp"%>
</html>