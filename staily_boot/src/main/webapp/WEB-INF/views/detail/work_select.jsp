<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/tags.jspf" %>
<%@ include file="/WEB-INF/views/include/include_navbar.jsp"%>

<!-- Hero -->
<div id="content_hero" >
	<iframe class="ww"
			src="https://www.youtube-nocookie.com/embed/J-2AjrypRgw?autoplay=1&amp;loop=1;playlist=J-2AjrypRgw&controls=0&vq=hd720"
			frameborder="0"	allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
			allowfullscreen></iframe>
	<a href="#afterHeader" class="anchor">
		<img src="${pageContext.request.contextPath}/images/scroll-arrow.svg" alt="Scroll down" class="scroll" />
	</a>
</div>


<div class="container-fluid totop">
	<div class="row" id="afterHeader">
		<div class="col-md-12">
			<div class="modal fade" id="work_confirm" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document" style="width: 450px">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title" id="myModalLabel">
								작품 확인
							</h4>
						</div>
						<div class="modal-body" id="body">
							
						</div>
						<div class="modal-footer">
							<div style="float: right;">
								<form name="wNo_request" method="POST" style="float: left;">
									<input type="hidden" id="wNo" name="wNo">
									<button type="button" class="btn btn-primary" onClick="modal_click()">확인</button> 
								</form>			 
								<button type="button" class="btn btn-secondary" data-dismiss="modal">
									취소
								</button>
							</div>
						</div>
					</div>					
				</div>				
			</div>			
		</div>
	</div>
</div>



  <!-- Page Wrapper -->
  <div id="wrapper">
    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">
        <!-- Begin Page Content -->
        <div class="container-fluid">
          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">작품 검색</h1>
          <!-- DataTales Example -->
          <div class="card shadow mb-4">            
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>번호</th>
                      <th>작품명</th>
                      <th>카테고리</th>
                      <th>처음 방영(개봉)일</th>
                      <th>전체 회차</th>
                      <th hidden="bb"></th>
                      <th></th>
                    </tr>
                  </thead>
                  <tbody>
                  	<c:forEach var="work" items="${data }">
                  	 <tr>
                  	  <td>${work.wNo}</td>
                  	  <td>${work.wName}</td>
                     	<c:choose>
							<c:when test="${work.wCategory eq 'D'}">
								<td>드라마</td>
							</c:when>
							<c:otherwise>
								<td>영화</td>
							</c:otherwise>
						</c:choose>
                      <fmt:parseDate value="${work.wDate}" var="dateFormat" pattern="yyyy-MM-dd"/>
					  <td><fmt:formatDate value="${dateFormat}" pattern="yyyy-MM-dd(E)" type="both"/></td>
                      <td>${work.wTepisode}부작</td>
                      <td hidden="aa">${work.wPoster}</td>
                      <td><a id="modal-424823" href="#work_confirm" role="button" class="btnnn" data-toggle="modal" data-target="#work_confirm">선택</a></td>
                    </tr>
                  	</c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
        <!-- /.container-fluid -->
      </div>
      <!-- End of Main Content -->
    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->



  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>
  
		

<style>
.table-responsive {
    min-height: .01%;
    overflow-x: hidden;
}

.container-fluid {
    padding-right: 15px;
    padding-left: 15px;
    margin-right: auto;
    margin-left: auto;
    margin-top: -77px;
}

</style>
<script type="text/javascript">
//버튼 클릭시 Row에 있는 작품 번호 값 전달
$(".btnnn").click(function() { 	
    var confirm = $(this);
    
    var tr = confirm.parent().parent();
    var td = tr.children();    
    
    var no = td.eq(0).text();
    var name = td.eq(1).text();
    var category = td.eq(2).text();
    var date = td.eq(3).text();
    var tepisode = td.eq(4).text();
    var poster = td.eq(5).text();	
	
	$('#work_confirm').on('show.bs.modal', function(e) {		
		var main = document.getElementById("body");
		
		main.innerHTML = "이 작품이 맞습니까?<br><br>작품명 : " + name + "<br>카테고리 : " + category + "<br>처음 방영(개봉)일 : " + date +
		"<br>전체 회차 : " + tepisode + "<br>작품 포스터<br>" + "<div id='workimage' style='text-align: center;'>" + 
		"<img src='https://image.tmdb.org/t/p/w600_and_h900_bestv2/" + poster + "' style='height: 500px'>" + "</div>";
		
		$('#wNo').val(no);
	});
});

function modal_click() {
	document.wNo_request.action = "product_create";
	document.wNo_request.submit();
};


</script>
<%@ include file="/WEB-INF/views/include/detail/include_detail_js.jsp"%>
<%@ include file="/WEB-INF/views/detail/include/include_work_select_js.jsp" %>

</body>

</html>