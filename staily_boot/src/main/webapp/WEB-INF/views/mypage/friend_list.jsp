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
          <!-- 친구찾기 -->
          <h2 class="h3 mb-2 text-gray-800">친구찾기</h2>

			<div id="search" class="tab_content">
				<input type="text" id="searchword" style="width:300px;" value="아이디를 입력하세요" >
			</div>
			<div class="dropdown" id="results">
			<span id="noId"></span>
				<button class="btn btn-primary dropdown-toggle add hidden" data-toggle="dropdown">
			   <!-- add -->
				</button> 
				
				<div class="dropdown-menu" id='searchDropdwon'>
				  	<a class="dropdown-item" href="#" id="addFriend">친구추가</a>
				  	<a class="dropdown-item" href="#" id="searchMessage">쪽지보내기</a>
				</div>
				
			</div>
							 
			<br>
			<br>	          
          <!-- 친구찾기 -->
          <h2 class="h3 mb-2 text-gray-800">친구리스트</h2>
          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th></th>
                      <th>친구</th>
                    </tr>
                  </thead>
                  <tbody class="addFriendDiv">
                  	<c:forEach var="friend" items="${data}">
                  	 <tr>
                  	  <td><input type="checkbox" name="friend_check" value="${friend.fPk}"></td>
                      <td >
                      <div class="dropdown">
							<button class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
							 	${friend.mId}
							 </button>
							 <div class="dropdown-menu" id="friendDropdown">
							  	<a class="dropdown-item" href="#" value="${friend.fNo}">쪽지보내기</a>
							  	<a class="dropdown-item" href="#" value="${friend.mId}">쪽지보관함</a>
							</div>
					  </div>
                    </td>
                    </tr>
                  	</c:forEach>
                  </tbody>
                </table>
                <button type="button" class="btn btn-ghost sort" id="deleteFriendBtn" style="float:right;">삭제</button>
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
