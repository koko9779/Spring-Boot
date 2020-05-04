<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페이지를 찾을수 없습니다.</title>
<script type="text/javascript">

</script>
<link href="${pageContext.request.contextPath}/css/cutom.css" rel="stylesheet">
</head>
<body>
<nav class="shelf">
  <a class="book home-page" href="main/index">메인으로가기</a>
  <a class="book about-us" href="#" onclick="history.back(); return false;">이전페이지로</a>
  <a class="book contact" href=#>Contact</a>
  <a class="book faq" href=#>F.A.Q.</a>
  
  <span class="book not-found"></span>
 
  <span class="door left"></span>
  <span class="door right"></span>
</nav>
<h1>Error 404</h1>
<p>페이지를 찾을수 없습니다.....</p>

</body>
</html>