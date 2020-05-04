<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/mypage/include/include_message_top.jsp" %>

<body class="bPopup">

<div id="noteWrap">
<div id="noteLeft">
<dl class="menu">
	<dt>쪽지함</dt>
	<dd>
		<ul>
			<li class=""><span class="orange"><a href="message" onfocus="this.blur();">쪽지 보내기</a></span></li>
			<li class="selected oldstart"><span class="orange"><a href="message_list" onfocus="this.blur();">받은 쪽지함</a></span></li>
		</ul>
	</dd>
</dl>
</div>
<div id="noteMain">

<h1 class="note"><strong class="page">쪽지보기</strong></h1>

<div id="noteView">
	<dl class="topInfo">
		<dt>보낸날짜:</dt>
		<dd class="date">${message.msDate}</dd>
	</dl>
	<table class="content" border="0" cellpadding="0" cellspacing="0">
		<tbody>
		<tr>
			<td class="label">보낸 사람</td>
			<td class="value">${message.mId}</td>
		</tr>
		<tr>
			<td class="label">제목</td>
			<td class="value">${message.msTitle}</td>
		</tr>
		<tr class="content">
			<td class="label">내용</td>
			<td class="value">${message.msContent}</td>
		</tr>
	</tbody>
	</table>
	<div class="command">
		<a id="aNoteList" href="message_list" onfocus="this.blur();" class="bttn76l">리스트</a>
		<a id="aNoteReply" href="message?mNo=${message.mNo}" onfocus="this.blur();" class="bttn65">답장쓰기</a>
		<a id="aNoteDelete" href="#" onfocus="this.blur();" class="bttn46" value="${message.msNo}">삭제</a>
	</div>
</div>

</div>

</div>

</body>
</html>