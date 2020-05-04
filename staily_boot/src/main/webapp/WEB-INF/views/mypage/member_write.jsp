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

        <!-- End of Topbar -->

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h2 class="h3 mb-2 text-gray-800">내상품목록</h2>
          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th></th>
                      <th>상품화면</th>
                      <th>상품이름</th>
                      <th>승인여부</th>
                      <th>작성일</th>
                    </tr>
                  </thead>
                  <tbody>
                  	<c:forEach var="product" items="${data}">
                  	 <tr>
                  	  <td><input type="checkbox" name="member_write_check" value="${product.pNo}"></td>
                      <td style = "cursor:pointer;" 
                      	  onClick = "location.href='../detail/product_detail?pNo=${product.pNo}&wNo=${product.wNo}'">
                      <img src="${pageContext.request.contextPath}/images/product/scene/${product.pScene}.jpg" width="100px" height="100px" alt="이미지없음"></td>
                      <td style = "cursor:pointer;" 
                      	  onClick = "location.href='../detail/product_detail?pNo=${product.pNo}&wNo=${product.wNo}'">${product.pName}</td>
                      <td style = "cursor:pointer;" 
                      	  onClick = "location.href='../detail/product_detail?pNo=${product.pNo}&wNo=${product.wNo}'">${product.pCheck}</td>
                      <td style = "cursor:pointer;" 
                      	  onClick = "location.href='../detail/product_detail?pNo=${product.pNo}&wNo=${product.wNo}'">${product.pDate}</td>
                    </tr>
                  	</c:forEach>
                  </tbody>
                </table>
                <button type="button" class="btn btn-ghost sort" id="deleteWriteBtn" style="float:right;">삭제</button>
              </div>
            </div>
          </div>

        </div>
        <!-- /.container-fluid -->

      </div>
	</div>
</div>
	  
</body>
</html>
