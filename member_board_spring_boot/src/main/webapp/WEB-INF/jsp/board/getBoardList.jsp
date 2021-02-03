<%@page import="com.example.demo.dto.Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Board List</title>
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<style type="text/css">
a{
 text-decoration: auto;
}
</style>
<%
	String userId = (String)session.getAttribute("userId");
	String name = (String)session.getAttribute("name");
%>
</head>
<body>
    <br/>
    <h1 class="text-center"><a href="/boardList" style="text-decoration: none;">Board</a></h1>
    <br/>
    <br/>
    <div class="container">
    	<a href="/getMemberList">회원목록</a>
		<div class="login-area" style="float: right; margin:20px 0;">
		<%
			if(userId==null || userId==""){
		%>
			<a class="btn btn-outline-info" href="login">로그인</a>
			<a class="btn btn-outline-info" href="MemberForm">회원가입</a>
		<%}else{
		%>
			<span><b style="color:blue;"><%=name%></b>님 환영합니다.</span>
			<a class="btn btn-outline-info" onClick="logout();">로그아웃</a>
		<%} %>
		
		</div>
        <table class="table table-hover table-striped text-center" style="border:1px solid;">
            <colgroup>
                <col width="10%" />
                <col width="40%" />
                <col width="20%" />
                <col width="20%" />
                <col width="10%" />
            </colgroup>
            <thead>
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>등록일자</th>
                    <th>조회수</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${list }" var="result">
                <tr>
                    <td>${result.boardnum}</td>
                    <td><a href="boardDetail?boardnum=${result.boardnum}">${result.title}</a></td>
                    <td>${result.name}</td>
                    <td>${result.writeday}</td>
                    <td>${result.readcount }</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <!-- pagination start -->
        <div id="paginationBox" class="pagination1">
            <ul class="pagination" style="justify-content: center;">
 
                <c:if test="${pagination.prev}">
                    <li class="page-item"><a class="page-link" href="#"
                        onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">이전</a></li>
                </c:if>
 
                <c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
                    <li class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> ">
                    <a class="page-link" href="#"
                        onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')">
                            ${idx} </a></li>
                </c:forEach>
 
                <c:if test="${pagination.next}">
                    <li class="page-item"><a class="page-link" href="#"
                        onClick="fn_next('${pagination.range}', '${pagination.range}', '${pagination.rangeSize}')">다음</a></li>
                </c:if>
            </ul>
        </div>
        <!-- pagination end -->
        <hr/>
        <%if(userId!=null){ %>
       	 <a class="btn btn-outline-info" style="float:right" href="boardForm">글쓰기</a>
        <%} %>
    </div>
    <br>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
    
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>
	
    <script type="text/javascript">

	  //이전 버튼 이벤트
	  function fn_prev(page, range, rangeSize) {

	  		var page = ((range - 2) * rangeSize) + 1;
	  		var range = range - 1;

	  		var url = "${pageContext.request.contextPath}/boardList";
		  		url = url + "?page=" + page;
		  		url = url + "&range=" + range;

	  		location.href = url;
	  }

	    //페이지 번호 클릭
	  	function fn_pagination(page, range, rangeSize) {
	
	  		var url = "${pageContext.request.contextPath}/boardList";
		  		url = url + "?page=" + page;
		  		url = url + "&range=" + range;
	  		
	  		location.href = url;	
	  	}

	  	//다음 버튼 이벤트
	  	function fn_next(page, range, rangeSize) {

	  		var page = parseInt((range * rangeSize)) + 1;
	  		var range = parseInt(range) + 1;

	  		var url = "${pageContext.request.contextPath}/boardList";
		  		url = url + "?page=" + page;
		  		url = url + "&range=" + range;
		
	  		location.href = url;
	  	}
	  	
	  	function logout(){
	  		var answer = confirm('로그아웃 하시겠습니까?');
	  		if(answer){
	  			location.href = "logout";
	  		}else{
	  			return false;
	  		}
	  	}
    </script>
</body>
</html>
