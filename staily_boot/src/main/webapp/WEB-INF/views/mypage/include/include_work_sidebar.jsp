<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/tags.jspf" %>
<script type="text/javascript">
function work_select() {
	location.href="work_select";
	//window.open('work_select');
}
</script>
<aside class="col-sm-3 col-sm-pull-1 sidebar">
	<div class="widget">
		<form id="work_${w.wNo}" method="post">
			<input type="hidden" value="${w.wNo}" name="wNo" />
			<img src="${pageContext.request.contextPath}${w.wPoster}" alt="${w.wName}" onclick="workpage(${w.wNo}); return false;" style="cursor: pointer;width:100%;"/>
			<h3 style="margin:50px auto;">${w.wName}</h3>
		</form>
	</div>
	<div class="widget">
		<select class="form-control" id="workEpisode">
			<c:forEach begin="1" end="${tepisode}" step="1" varStatus="status">
	 			<option value="${status.current}" wNo="${w.wNo}" contextPath = "${pageContext.request.contextPath}">${status.current}회</option>
			</c:forEach>
		</select>
	</div>	
	<div class="widget">
		<form>
			<input type="text" placeholder="Search..." class="search" />
			<i class="material-icons">search</i>
		</form>
	</div>
	<input type="button" value="상품 등록" onClick="work_select()"/>
</aside>
