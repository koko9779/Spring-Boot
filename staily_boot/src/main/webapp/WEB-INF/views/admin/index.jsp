<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/admin/include/include_top.jsp"%>

<!-- Page Heading -->
<div class="col-lg-10">
	<h1 class="h3 mb-2 text-gray-800">관리자페이지</h1>
	<div class="row">
		<!-- 승인대기상품 -->
		<div class="col-xl-3 col-md-6 mb-4">
			<div class="card border-left-primary shadow h-100 py-2">
				<div class="card-body">
					<div class="align-items-center">
						<div class="col mr-2">
							<div
								class="text-xs font-weight-bold text-primary text-uppercase mb-1">승인대기
								상품</div>
							<div class="h5 mb-0 font-weight-bold text-gray-800">${count }건</div>
						</div>
						<div>
							<button class="btn btn-default btn-lg io-data io-fn-nextStep"
								type="button" onclick="location.href='product'">바로가기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 인기작품 Card  -->
		<div class="col-xl-3 col-md-6 mb-4">
			<div class="card border-left-success shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div
								class="text-xs font-weight-bold text-success text-uppercase mb-1">인기작품</div>
							<c:forEach items="${workList }" var="work">
								<div class="h5 mb-0 font-weight-bold text-gray-800">
									<a href='javascript:void(0);'
										onClick='openWork(${work.wNo}); return false'>${work.wName}</a>
								</div>
							</c:forEach>
						</div>
						<div class="col-auto">
							<i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 인기상품 Card  -->
		<div class="col-xl-3 col-md-6 mb-4">
			<div class="card border-left-success shadow h-100 py-2">
				<div class="card-body">
					<div class="align-items-center">
						<div class="col mr-2">
							<div
								class="text-xs font-weight-bold text-success text-uppercase mb-1">인기상품</div>
							<c:forEach items="${productList }" var="product">
								<div class="h5 mb-0 font-weight-bold text-gray-800">
									<a href='javascript:void(0);'
										onClick='openProduct(${product.pNo}); return false'>${product.pName }</a>
								</div>
							</c:forEach>
						</div>
						<div class="col-auto">
							<i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 인기게시글 Card  -->
		<div class="col-xl-3 col-md-6 mb-4">
			<div class="card border-left-success shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div
								class="text-xs font-weight-bold text-success text-uppercase mb-1">인기게시글</div>
							<c:forEach items="${boardList }" var="board">
								<div class="h5 mb-0 font-weight-bold text-gray-800">
									<a href="../style/style_detail_read?bNo=${board.bNo }">${board.bTitle }</a>
								</div>
							</c:forEach>
						</div>
						<div class="col-auto">
							<i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-xl-6 col-lg-6"
			style="float: left; margin-right: 10px;">
			<!-- Area Chart -->
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h3 style="color: rgba(0, 140, 170, 0.5)">일별 접속자</h3>
				</div>
				<div class="card-body">
					<div class="chart-area">
						<canvas id="dayChart"></canvas>
					</div>
				</div>
				<form>
					<p>
						<input type="date" id="currentDate">
					</p>
					<p>
						<button class="btn btn-default btn-lg io-data io-fn-nextStep"
							type="button" onclick="timeChange()">기준날짜설정</button>
					</p>
				</form>
			</div>
		</div>
		<!-- Pie Chart -->
		<div class="col-xl-4 col-lg-4" style="float: left;">
			<div class="card shadow mb-4">
				<!-- Card Header - Dropdown -->
				<div class="card-header py-3">
					<div class="card-header py-3">
						<h3 style="color: rgba(0, 140, 170, 0.5)">브라우저별 접속자</h3>
					</div>
				</div>
				<!-- Card Body -->
				<div class="card-body">
					<div class="chart-pie pt-4">
						<canvas id="browserChart"></canvas>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
</div>
<!-- /.container-fluid -->
</div>
<!-- End of Main Content -->

<%@ include file="/WEB-INF/views/admin/include/include_js.jsp"%>
</body>
<script>
var now = document.getElementById('currentDate').value = new Date().toISOString().substring(0, 10);;
var nowTime = "stTime="+now
var statsData;
var browserData;
$.ajax({
	url: "stats",
	data: nowTime,
	dataType:"json",
	async:false,
	success:function(result){
			statsData = result
		}
});
$.ajax({
	url: "stats_browser",
	async:false,
	dataType:"json",
	success:function(browser){
		browserData = browser
		}
});
function timeChange() {
	var changeTime = $('#currentDate').val();
	var choiceTime = "stTime="+changeTime
	$.ajax({
		url: "stats",
		data: choiceTime,
		dataType:"json",
		async:false,
		success:function(result){
				statsData = result
			}
	});
};
// 우선 컨텍스트를 가져옵니다. 
var ctx = document.getElementById("dayChart").getContext('2d');
var cty = document.getElementById("browserChart").getContext('2d');
/*
 - Chart를 생성하면서, 
 - ctx를 첫번째 argument로 넘겨주고, 
 - 두번째 argument로 그림을 그릴때 필요한 요소들을 모두 넘겨줍니다. 
 */

var date7 = statsData.result[0].stTime
var date6 = statsData.result[1].stTime
var date5 = statsData.result[2].stTime
var date4 = statsData.result[3].stTime
var date3 = statsData.result[4].stTime
var date2 = statsData.result[5].stTime
var date1 = statsData.result[6].stTime
var cnt7  = statsData.result[0].cnt
var cnt6  = statsData.result[1].cnt
var cnt5  = statsData.result[2].cnt
var cnt4  = statsData.result[3].cnt
var cnt3  = statsData.result[4].cnt
var cnt2  = statsData.result[5].cnt
var cnt1  = statsData.result[6].cnt
var dayChart = new Chart(ctx, {
	type : 'line',
	data : {
		labels : [ date1, date2, date3, date4, date5,date6, date7 ],
		datasets : [ {
			label : '일자별 접속자 수',
			data : [ cnt1, cnt2,cnt3 , cnt4, cnt5,cnt6,cnt7 ],
			backgroundColor : [
			//'rgba(255, 99, 132, 0.2)', 빨강
			//'rgba(54, 162, 235, 0.2)', 파랑
			//'rgba(255, 206, 86, 0.2)', 노랑
			//'rgba(75, 192, 192, 0.2)', 초록
			'rgba(54, 162, 235, 0.2)'
			//'rgba(255, 159, 64, 0.2)' 오렌지
			],
			borderColor : [
			//'rgba(255, 99, 132, 0.2)', 빨강
			'rgba(54, 162, 235, 0.2)'
			//'rgba(255, 206, 86, 0.2)', 노랑
			//'rgba(75, 192, 192, 0.2)', 초록
			//'rgba(153, 102, 255, 0.2)' 
			//'rgba(255, 159, 64, 0.2)' 오렌지
			],
			borderWidth : 1
		} ],
	},
	options : {
		maintainAspectRatio : true, // default value. false일 경우 포함된 div의 크기에 맞춰서 그려짐.
		scales : {
			yAxes : [ {
				ticks : {
					beginAtZero : true
				}
			} ]
		}
	}
});

var browser1 = browserData.browser[0].stAgent;
var browser2 = browserData.browser[1].stAgent;
var browser3 = browserData.browser[2].stAgent;
var browser4 = browserData.browser[3].stAgent;
var browser5 = browserData.browser[4].stAgent;
var bCnt1 = browserData.browser[0].cnt;
var bCnt2 = browserData.browser[1].cnt;
var bCnt3 = browserData.browser[2].cnt;
var bCnt4 = browserData.browser[3].cnt;
var bCnt5 = browserData.browser[4].cnt;
var browserData = []; // 받아올 데이터를 저장할  배열 선언
var browserChart = new Chart(cty, {
	type : 'pie',
	data : {
		labels : [ browser1, browser2, browser3, browser4, browser5 ],
		datasets : [ {
			label : '브라우저별 접속자 수',
			data : [ bCnt1, bCnt2, bCnt3, bCnt4, bCnt5 ],
			backgroundColor : [
				"#f79546", "#9bba57", "#4f81bb", "#5f497a", "#a94069"],
			borderColor : [
			//'rgba(255, 99, 132, 0.2)', 빨강
			'rgba(54, 162, 235, 0.2)'
			//'rgba(255, 206, 86, 0.2)', 노랑
			//'rgba(75, 192, 192, 0.2)', 초록
			//'rgba(153, 102, 255, 0.2)' 
			//'rgba(255, 159, 64, 0.2)' 오렌지
			],
			borderWidth : 1
		} ],
	},
	options : {
		maintainAspectRatio : true, // default value. false일 경우 포함된 div의 크기에 맞춰서 그려짐.
		scales : {
			yAxes : [ {
				ticks : {
					beginAtZero : true
				}
			} ]
		}
	}
});


</script>
</html>