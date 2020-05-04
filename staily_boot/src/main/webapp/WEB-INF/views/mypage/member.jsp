<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/mypage/include/include_navbar.jsp"%>

<!-- Hero -->
<div id="content_hero" >
	<iframe class="ww"
			src="https://www.youtube-nocookie.com/embed/a6rBGQMXc90?autoplay=1&amp;loop=1;playlist=a6rBGQMXc90&controls=0&vq=hd720"
			frameborder="0"	allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
			allowfullscreen></iframe>
	<a href="#afterHeader" class="anchor">
		<img src="${pageContext.request.contextPath}/images/scroll-arrow.svg" alt="Scroll down" class="scroll" />
	</a>
</div>

<!-- Section -->
<div class="container section news totop">
	  
	<div class="row" id="afterHeader">

		<%@ include file="/WEB-INF/views/mypage/include/include_sidebar.jsp" %>

		<div class="col-sm-9 col-sm-push-1" style="width: 70%">
	
			<!-- Page Heading -->
					<h2 class="h3 mb-2 text-gray-800">회원정보</h2>
					<!-- DataTales Example -->
					<div class="join-step2">
						<div class="border border-secondary">
							<form id="memberInfoFrm" name="memberInfoFrm" autocomplete="off" action='member_update'>
								<input type="hidden" name="mNo" id="mNo" value="${member.mNo}">
								<input type="hidden" name="mId" id="mId" value="${member.mId}">
								<input type="hidden"
									name="mType" id="mType" value="${member.mType}"> <input
									type="hidden" name="mPhone" id="mPhone"
									value="${member.mPhone}">
								<table class="table table-hover" id="tableCss">
									<colgroup>
										<col class="col_wp25">
										<col class="col_auto">
									</colgroup>
									<tbody>
										<tr>
											<th scope="row" class="bg-light essentia"><label
												for="mName">※ 아이디</label></th>
											<td class="text-left">
												<div class="form-row">
													<div class="col-xs-5">
														${member.mId}
													</div>
												</div>
											</td>
										</tr>

										<tr>
											<th scope="row" class="bg-light essentia"><label
												for="mName">※ 이름</label></th>
											<td class="text-left">
												<div class="form-row">
													<div class="col-xs-5">
														<input type="text" name="mName" id="mName"
															class="form-control" value="${member.mName}"
															maxlength="20">
													</div>
													
												</div>
											</td>
										</tr>
										
										<c:if test="${member.mType =='C'}">
											<tr>
												<th scope="row" class="bg-light essentia"><label
													for="mName">※ 사업자등록번호</label></th>
												<td class="text-left">
													<div class="form-row">
														<div class="col-xs-5">
															${member.mCompany.coNo}
														</div>
													</div>
												</td>
											</tr>
									
											<tr>
												<th scope="row" class="bg-light essentia"><label>※ 결제여부</label></th>
												<td class="text-left">
												<div class="form-row">
														<div class="col-xs-5">
															${member.mCompany.coCheck}
														</div>
													</div>
												</td>
											</tr>
										</c:if>
										<tr>
											<th scope="row" class="bg-light essentia"><label
												for="joinPwd">※ 비밀번호</label></th>
											<td class="text-left">
												<div class="form-row">
													<div class="col-xs-5">
														<input type="password" name="mPw" id="mPw"
															class="form-control" autocomplete="new-password" value=""
															maxlength="15">
													</div>
												</div>
												<!-- <div>*특수문자를 제외하고, 8 ~ 15글자 사이입니다</div>-->
											</td>
										</tr>
										<tr>
											<th scope="row" class="bg-light essentia"><label
												for="joinNewPwdCheck">※ 비밀번호 확인</label></th>
											<td class="text-left">
												<div class="form-row">
													<div class="col-xs-5">
														<input type="password" name="repeatPw" id="repeatPw"
															class="form-control" autocomplete="new-password" value=""
															maxlength="15">
													</div>
												</div>
											</td>
										</tr>
										
										<tr>
											<th scope="row" class="bg-light essentia"><label
												for="phnno1N1">※ 휴대폰</label></th>
											<td class="text-left">
												<div class="form-row">
													<div class="col-xs-4">
														<select class="hphead hp form-control" id="phn1"
															name="phn1">
															<option selected="selected" value="010">${phn1}</option>
															<option value="011">011</option>
															<option value="016">016</option>
															<option value="018">018</option>
															<option value="019">019</option>
														</select>
													</div>
													<div class="col-xs-4">
														<input type="text" name="phn2" id="phn2"
															class="hphead form-control" value="${phn2}" maxlength="4"
															onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">

													</div>
													<div class="col-xs-4">
														<input type="text" name="phn3" id="phn3"
															class="hphead form-control" value="${phn3}" maxlength="4"
															onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
													</div>
												</div>

											</td>
										</tr>
										<tr>
											<th scope="row" class="bg-light essentia"><label
												for="email1">※ 이메일</label></th>
											<td class="text-left">
												<div class="form-row">
													<div class="col-xs-7">
														<input type="text" name="mEmail" id="mEmail"
															class="form-control" value="${member.mEmail}"
															maxlength="20">
													</div>

												</div>

											</td>
										</tr>
										<tr>
											<th scope="row" class="bg-light essentia"><label
												for="mAddress">※ 주소</label></th>
											<td class="text-left">
												<div class="form-row">
													<div class="col-xs-7">
														<input type="text" name="mAddress" id="mAddress"
															onclick="execDaumPostcode()" value="${member.mAddress}"
															class="form-control" maxlength="20" readonly="readonly">
													</div>

												</div>

											</td>
										</tr>
										<tr>
											<th scope="row" class="bg-light essentia"><label
												for="daddress">※ 기타주소</label></th>
											<td class="text-left">
												<div class="form-row">
													<div class="col-xs-7">
														<input type="text" name="mDaddress" id="mDaddress"
															class="form-control" value="${member.mDaddress}"
															maxlength="20">
													</div>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
								<div class="text-right">
									<button type="button" class="btn btn-ghost sort" data-step="2" onclick="ss()">수정</button>
									<button type="button" class="btn btn-ghost sort" data-step="2" onclick="leave()">탈퇴</button>
								</div>
							</form>
						</div>

						<br>
						<!--  
						  <div id> 
						 		<button type="button" class="btn btn-outline btn-primary pull-right" data-step="2" onclick="check()">수정</button>
						 </div> 
						 -->
						 <!-- 
						<div class="text-center">
							<button type="button" class="btn btn-outline btn-primary pull-right" data-step="2" onclick="leave()">탈퇴</button>
							<input type="submit" value="수정"
								class="btn btn-default btn-lg io-data io-fn-nextStep" data-step="2"></input>
						</div>
						-->
					</div>

					<!-- DataTales Example -->
				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->
</div>
			<!-- Footer -->
</body>
</html>
