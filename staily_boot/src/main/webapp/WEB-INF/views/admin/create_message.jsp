<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/include_css.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<form id="noticeMessage">
				<table>
					<tbody>
						<tr>
							<td><input type="text" class="form-control" placeholder="쪽지 제목" name="msTitle" maxlength="50"/></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="쪽지를 작성해주세요" 
							name="msContent" maxlength="2048" style="height: 375px;width: 700px;"></textarea></td>
						</tr>
					</tbody>
				</table>	
				<button type="button" class="btn btn-primary pull-right" onclick="messageCreate()" >전송</button>
			</form>
		</div>
	</div>
</body>
<%@ include file="/WEB-INF/views/admin/include/include_js.jsp"%>
</html>