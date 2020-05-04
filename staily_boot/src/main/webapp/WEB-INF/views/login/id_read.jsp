<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/tags.jspf" %>
<%@ include file="/WEB-INF/views/login/include/include_top_login.jsp" %>

  <div class="container">

    <!-- Outer Row -->
    <div class="row justify-content-center">

      <div class="col-xl-10 col-lg-12 col-md-9">

        <div class="card o-hidden border-0 shadow-lg my-5">
          <div class="card-body m--20">
            <!-- Nested Row within Card Body -->
            <div class="row">  
              <div class="col-lg-6 d-none d-lg-block bg-id-image"></div>
              <div class="col-lg-6">
                <div class="p-5">
                  <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-2">아이디를 잊어버리셨나요?</h1>
                    <p class="mb-4">회원가입 시 입력하셨던 이름과 전화번호<br>(혹은 핸드폰번호)를 입력하시면<br> 아이디를 찾을 수 있습니다</p>
                  </div>
                  <input type="hidden" value="${msg}" id="msgE">
                  <form name="forgotIdF" class="user">
                    <div class="form-group">
                      <input type="text" class="form-control form-control-user" id="inputName" name="name" placeholder="이름">
                    </div>
                    <div class="form-group">
                      <input type="text" class="form-control form-control-user" id="inputPhone" name="phone" placeholder="'-' 없이 전화번호 or 핸드폰번호">
                    </div>
                    <a href="javascript:find_id();" class="btn btn-primary btn-user btn-block">
                      아이디 찾기
                    </a>
                  </form>
                  <hr>
                  <div class="text-center">
                    <a class="small" href="pw_count_read">비밀번호를 잊어버리셨나요?</a>
                  </div>
                  <div class="text-center">
                    <a class="small" href="member_create">회원가입을 하고 싶으신가요?</a>
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
  
</html> 