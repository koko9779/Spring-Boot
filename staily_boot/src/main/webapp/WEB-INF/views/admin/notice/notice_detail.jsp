<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/tags.jspf"%>	
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/include_css.jsp"%>
<style>
.p_content>h1, .p_content>h2, .p_content>h3, .p_content>h4 {
	line-height: inherit;
	position: relative;
	margin: inherit;
	padding: inherit;
	border-bottom: inherit;
	font-size: inherit;
	font-family: inherit;
	font-weight: inherit;
	line-height: inherit;
	color: inherit;
	margin: inherit;
	font-size: inherit;
	font-weight: normal;
	line-height: inherit;
	font-size: inherit;
	margin-block-start: inherit;
	margin-block-end: inherit;
	margin-inline-start: inherit;
	margin-inline-end: inherit;
	font-weight: inherit;
	border-bottom: none;
	background-image: none !important;
	all: unset;
}

.p_content>h2:after, .p_content>h3:after, .p_content>h4:after,
	.p_content>h5:after {
	background-image: none !important;
}
</style>
<link href="${pageContext.request.contextPath}/ckeditor/contents.css"
	rel="stylesheet">
</head>
<body>
<!-- Section -->
<div class="container news section">
	<div class="row">
		<div class="col-sm-12">
			<article id="board" style="border-bottom: none;">
				<div id="board2">
					<input type="hidden" id="updateBNo" value="${board.bNo}">
					<h2 class="board-top p-top-40"><b>${board.bTitle}</b></h2>
					<div class="p_content m-top-50" id="board_content_read" style="font-size: 14px">
						${board.bContent}</div>
				</div>
			</article>
		</div>
	</div>
</div>
</body>
<%@ include file="/WEB-INF/views/include/include_js.jsp"%>
</html>