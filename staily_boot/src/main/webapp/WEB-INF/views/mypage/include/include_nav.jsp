<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/staily">
        <div class="sidebar-brand-icon rotate-n-15">
          <i class="fas fa-laugh-wink"></i>
        </div>
        <div class="sidebar-brand-text mx-3">Mypage</div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
          <i class="fas fa-fw fa-folder"></i>
          <span>회원정보</span>
        </a>
        <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded" id="gogogo">
            <a class="collapse-item" href="member_select">정보수정</a>
            <a class="collapse-item" href="friend_list">친구리스트</a>
            <a class="collapse-item" href="#">메시지보관</a>
            <div class="collapse-divider"></div>
            <a class="collapse-item" href="payment_list">결제내역</a>
          </div>
        </div>
      </li>
      <!-- Nav Item - Tables -->
      <li class="nav-item">
        <a class="nav-link" href="bookmark_list">
          <i class="fas fa-fw fa-table"></i>
          <span>즐겨찾기</span></a>
      </li>
      <!-- Nav Item - Tables -->
      <li class="nav-item">
        <a class="nav-link" href="member_write">
          <i class="fas fa-fw fa-table"></i>
          <span>내가쓴글목록</span></a>
      </li>
      <!-- Nav Item - Tables -->
      <li class="nav-item">
        <a class="nav-link" href="payment">
          <i class="fas fa-fw fa-table"></i>
          <span>결제하기</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block">

      <!-- Sidebar Toggler (Sidebar) -->
      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>

    </ul>
    <!-- End of Sidebar -->
<script type="text/javascript">
$(function(){
	$('#gogogo a:nth-child(3)').click(function(e){
		e.preventDefault();
		window.open("message_list", "_blank", "width=800, height=700, left=1000, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
		
	});
})

</script>