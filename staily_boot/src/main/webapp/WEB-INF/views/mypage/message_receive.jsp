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
						<li class=""><span class="orange"><a href="message"
								onfocus="this.blur();">쪽지 보내기</a></span></li>
						<li class="selected oldstart"><span class="orange"><a
								href=message_list onfocus="this.blur();">받은 쪽지함 <!--  <img class="new" src="http://static.inven.co.kr/image/member/note/icon_new_orange.gif" alt="">--></a></span></li>
					</ul>
				</dd>
			</dl>
		</div>
		<div id="noteMain">

			<h1 class="note">
				<strong class="page">받은 쪽지함</strong>입니다</h1>
				<div id="noteList">
					<div class="cmdWrap">
						<a id="cmdDelete" class="bttn46" href="#" onfocus="this.blur();">삭제</a>
						<a id="cmdWrite" class="bttn92w" href="message"
							onfocus="this.blur();">쪽지보내기</a>
					</div>

					<div class="list">
						<form id="fmNoteData" name="fmNoteData" action="" method="POST">
							<input type="hidden" name="rurl"
								value="Qi80RXlXSVdHcnE3NTVSSVVkdXJUdkVkTVFXQ210MHlaOWNrTUZXVE5BT0JwSXQ5azIzakNQSmRBcFg1Q2ZNSjlhbTFxSURjMmd4K0R0MXFyUmxsbXo0b0NGdHZsV1hFVzc2WU5zVEtvWTg9">
							<input type="hidden" name="set" value=""> <input
								type="hidden" name="folder" value="inbox">
							<table border="0" cellpadding="0" cellspacing="0">
								<thead>
									<tr>
										<th class="chk"><input type="hidden" id="idx_"
											name="idx_"></th>
										<th class="title">제목</th>
										<th class="nickname">보낸사람</th>
										<th class="date">날짜</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="message" items="${messageList}">
										<tr class="unread">
											<td class="chk"><input type="checkbox"
												name="message_check" value="${message.msNo}"
												onfocus="this.blur();"></td>
											<td class="title" style="cursor: pointer;"><a
												href="message_view?msNo=${message.msNo}"
												onfocus="this.blur();">${message.msTitle}&nbsp;</a></td>
											<td class="nickname">${message.mId}</td>
											<td class="date">${message.msDate}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<div class="IEFix">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
						</form>
					</div>

				</div>
		</div>

	</div>

</body>
</html>