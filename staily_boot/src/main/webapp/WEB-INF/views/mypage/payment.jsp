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
          <h2 class="h3 mb-2 text-gray-800">결제</h2>
          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>결제 이용권</th>
                      <th>결제가격</th>
                      <th>이용권기간</th>
                      <th>결제방법</th>
                      <th></th>
                    </tr>
                  </thead>
                  <tbody>
                   <tr id="payment1">
                      <td value="10일 이용권">10일 이용권</td>
                      <td value="1000">1000원</td>
                      <td value="10">10일</td>
                      <td value="A">카카오페이</td>
                      <td><button type="button" class="btn btn-ghost sort paymentBtn">결제하기</button></td>
                      
                    </tr>
                     <tr id="payment2">
                      <td value="20일 이용권">20일 이용권</td>
                      <td value="2000">2000원</td>
                      <td value="20">20일</td>
                      <td value="A">카카오페이</td>
                      <td><button type="button" class="btn btn-ghost sort paymentBtn">결제하기</button></td>
                    </tr>
                     <tr id="payment3">
                      <td value="30일 이용권">30일 이용권</td>
                      <td value="3000">3000원</td>
                      <td value="30">30일</td>
                      <td value="A">카카오페이</td>
                      <td><button type="button" class="btn btn-ghost sort paymentBtn">결제하기</button></td>
                    </tr>
                    <!--  
                  	<c:forEach var="payment" items="${data }">
                  	
                  	</c:forEach>
                  	-->
                  </tbody>
                </table>
              </div>
            </div>
          </div>
		 
		<input type="hidden" name="mId" id="mId" value="${member.mId}">
		<input type="hidden" name="mPhone" id="mPhone" value="${member.mPhone}">
		<input type="hidden" name="mEmail" id="mEmail" value="${member.mEmail}">
	
		
        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->
</div>
      <!-- Footer -->
</body>
</html>

