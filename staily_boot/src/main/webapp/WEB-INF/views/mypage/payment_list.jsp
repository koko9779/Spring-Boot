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
		
		<h2 class="h3 mb-2 text-gray-800">결제종료일</h2>
		<div>${endDate}</div>
		<br>
		<br>
			<!-- Page Heading -->
          <h2 class="h3 mb-2 text-gray-800">결제내역</h2>
          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-body">
              <div class="table-responsive">
              <div id= "myPaymentList">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>결제 이용권</th>
                      <th>결제가격</th>
                      <th>이용권기간</th>
                      <th>결제방법</th>
                      <th>결제일</th>
                    </tr>
                  </thead>
                  <tbody>
                  	<c:forEach var="payment" items="${data}">
                  	 <tr>
	                      <td>${payment.pyName}</td>
	                      <td>${payment.pyPrice}원</td>
	                      <td>${payment.pyPeriod}일</td>
	                      <td>카카오페이</td>
	                      <td>${payment.pyDate}</td>
                    </tr>
                  	</c:forEach>
                  </tbody>
                </table>
                </div>
              </div>
            </div>
          </div>

        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->
</div>
      <!-- Footer -->
</body>
</html>

