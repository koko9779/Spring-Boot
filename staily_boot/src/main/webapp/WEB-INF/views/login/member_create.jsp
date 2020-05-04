<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/tags.jspf"%>
<%@ include file="/WEB-INF/views/login/include/include_top_login.jsp"%>

<div class="container">

	<div class="card o-hidden border-0 shadow-lg my-5">
		<div class="card-body p-0">
			<!-- Nested Row within Card Body -->
			<div class="row">
				<div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
				<div class="col-lg-7">
					<div class="p-5">
						<div class="btn-group" role="group">
							<button class="btn btn-primary" type="button"
								onclick="mType_member();">일반 회원</button>
							<button class="btn btn-primary" type="button"
								onclick="mType_company();">기업 회원</button>
						</div>
						<div class="text-center">
							<h1 class="h4 text-gray-900 mb-4 gaip-top">회원 가입</h1>
						</div>
						<form name="registerF" id="registerF" class="user"
							action="return false;">
							<input type="hidden" id="inputType" name="mType" value="M">
							<div class="form-group">
								<input type="text" class="form-control form-control-user"
									id="inputId" name="mId" placeholder="아이디" maxlength="15">
							</div>
							<div class="form-group row">
								<div class="col-sm-6 mb-3 mb-sm-0">
									<input type="password" class="form-control form-control-user"
										id="inputPw" name="mPw" placeholder="패스워드" maxlength="15">
								</div>
								<div class="col-sm-6">
									<input type="password" class="form-control form-control-user"
										id="repeatPw" name="repeatPw" placeholder="패스워드 확인" maxlength="15">
								</div>
							</div>
							<div class="form-group">
								<input type="text" class="form-control form-control-user"
									id="inputName" name="mName" placeholder="이름" maxlength="10">
							</div>
							<div class="form-group">
								<input type="email" class="form-control form-control-user"
									id="inputEmail" name="mEmail" placeholder="이메일">
							</div>
							<div class="form-group">
								<input type="text" class="form-control form-control-user"
									id="inputAddress" name="mAddress" placeholder="주소" readonly
									onclick="sample6_execDaumPostcode();">
							</div>
							<div class="form-group">
								<input type="text" class="form-control form-control-user"
									id="inputDaddress" name="mDaddress" placeholder="상세주소">
							</div>
							<div class="form-group" id="phoneGroupE">
								<input type="text" class="form-control form-control-user"
									id="inputPhone" name="mPhone"
									placeholder="'-'  없이 핸드폰번호 입력해주세요" maxlength="11">
							</div>
							<div class="check_register" id="check_register">오류기입란</div>
							<input type="submit" class="btn btn-primary btn-user btn-block"
								value="회원가입">
						</form>
						<hr>
						<div class="text-center">
							<a class="small" href="id_read">아이디를 잊어버리셨나요?</a>
						</div>
						<div class="text-center">
							<a class="small" href="pw_count_read">비밀번호를 잊어버리셨나요?</a>
						</div>
						<div class="text-center">
							<a class="small" href="login">계정이 있으신가요? 로그인하러 갑시다!</a>
						</div>
						<div class="text-center">
							<a class="small" href="../main/index">메인화면으로 이동</a>
						</div>
					</div>
				</div>
			</div>

            </div>
          </div>
        </div>
    </div>
  </div>
 
 <%@ include file="/WEB-INF/views/login/include/include_bottom_login.jsp" %>
   </body>

<%@ include file="/WEB-INF/views/login/include/include_bottom_login.jsp"%>
</body>

</html>
