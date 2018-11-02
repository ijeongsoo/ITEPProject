<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>상세 교육</title>
		<link
	href="<%=application.getContextPath()%>/resources/main_page_resource/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
		
		<script src="<%=application.getContextPath()%>/resources/jquery/jquery-3.2.1.min.js" type="text/javascript"></script>
		<link
			href="<%=application.getContextPath()%>/resources/main_page_resource/vendor/bootstrap/css/bootstrap.min.css"
			rel="stylesheet">
		<link href="<%=application.getContextPath()%>/resources/DataTables-1.10.18/css/jquery.dataTables.min2.css" rel="stylesheet" type="text/css"/>
		<script src="<%=application.getContextPath()%>/resources/DataTables-1.10.18/js/jquery.dataTables.min2.js" type="text/javascript"></script>


		<link
			href="<%=application.getContextPath()%>/resources/main_page_resource/css/style.css"
			rel="stylesheet">
             <!-- Custom styles for this template -->
		<link href="<%=application.getContextPath()%>/resources/main_page_resource/css/freelancer.min.css" rel="stylesheet">

<link
	href="<%=application.getContextPath()%>/resources/main_page_resource/sub/css/style.css"
	rel="stylesheet">
<link
	href="<%=application.getContextPath()%>/resources/main_page_resource/sub/color/default.css"
	rel="stylesheet">

		<link
			href="<%=application.getContextPath()%>/resources/main_page_resource/sub/css/style.css"
			rel="stylesheet">

		<link href="<%=application.getContextPath()%>/resources/css/itep.css"
			rel="stylesheet" type="text/css">
		<script src="<%=application.getContextPath()%>/resources/parallax.js-1.5.0/parallax.js"></script>
	


	</head>
	
	<script>
		$(document).ready( function () {
	    	$('#edulistTable').DataTable();
	    	$('#postedulistTable').DataTable();
		} );
	</script>
  

	
	<script>
	function eduDetail(course_cd) {
		$.get(
			    "eduDetail?course_cd="+course_cd ,
			    function(data) {
			        $("#eduModalContent").html(data);
			    }
			);
	}
	
	function eduPostDetail(course_cd) {
		$.get(
			    "eduPostDetail?course_cd="+course_cd ,
			    function(data) {
			        $("#eduModalContent").html(data);
			    }
			);
	}
	</script>
	<script>
	
	$( function() {
		
		

		if(${login_info.auth_cd} !='04'){
			$("#adminButton").attr('style', 'visiblity:show');
		}
		
		if ( '${recommendEdu.course_nm}0' == '0' ){
			$("#secondHeader").attr('style', 'position:relative');

		}else{
			$("#firstHeader").attr('style', 'position:relative');

		}
		
		
	});
	</script>


	<body id="edupage-top">
		<nav class="navbar navbar-expand bg-secondary fixed-top "
			id="mainNav">
			<div class="container">
				<a class="hanna navbar-brand js-scroll-trigger" href="home">IBK IT
					교육 포탈<span style="font-size: 15px">  &nbsp;-상세 교육정보-</span></a>
				<div class=" " id="">
					<ul class="navbar-nav ml-auto">
						
						<li class="nav-item mx-0 mx-sm-1"><a id='adminButton'
							style="visibility: hidden;"
							class="hanna nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
							href="admin">관리자</a></li>
						<li class="nav-item mx-0 mx-sm-1"><a
							class="hanna nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
							href="home">홈으로</a></li>
						<li class="nav-item mx-0 mx-sm-1"><a
							class="hanna nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
							href="myInfomation">나의 정보</a></li>
	
					</ul>
				</div>
			</div>
		</nav>


		<!-- <section class="section_div_1" style="padding-top:140px; padding-bottom:350px">
			
		</section> -->
			<!-- Header -->
	<header class="masthead text-white text-center"
		style="background-color: #FBE4FF;">

		<div id="firstHeader" class="container animated fadeInUp" style=" display: none; ">

			<div style="z-index: 5; position:relative; ">
				<h1  class="hanna "
					style="color :#444444; font-size: 100px; z-index: 5; padding: 25px ; margin: 0">${login_info.emm}님! 이번에는</h1>
			</div>

			<div  style=" z-index: 5; position:relative">
				<a href="" onclick="eduDetail('${recommendEdu.course_cd}');" data-toggle="modal" class="popupModal" data-target="#detailInfoModal"><h1 class="hanna "
					style="color :#444444;   z-index: 5; padding: 0;"><span class="hidden-recd" style="text-decoration: underline; height: 80px; vertical-align: middle" >${recommendEdu.course_nm }</span></a>교육</h1>			
			</div>
			<div  style="z-index: 5; position:relative">

				<h1 class="hanna "
					style=" color :#444444; font-size: 100px;  z-index: 5; padding: 25px ">어떠신가요??<span  style=" vertical-align:text-bottom; ; ; margin-top: 10px ">😘🙈</span></h1>

			</div>
		</div>
		
		<div id="secondHeader" class="container animated fadeInUp" style=" display: none; ">

			<div  style="z-index: 5; position:relative">
				<h1 class="hanna "
					style=" color :#444444; font-size: 100px;  z-index: 5; ">더욱 좋은 교육으로</h1>

			</div>
			<div  style="z-index: 5; position:relative">
				<h1 class="hanna "
					style=" color :#444444; font-size: 100px;  z-index: 5; padding: 30px ">준비하겠습니다!!<span  style=" vertical-align:text-bottom; ; ; margin-top: 10px ">😘🙈</span></h1>

			</div>
		</div>

	</header>



		<!-- 현재 신청가능한 목록 출력 -->
		<section style="padding-top:40px; padding-bottom:90px">
		<div class="container">
		<div style="text-align: center">
				<h2 class="hanna text-center text-uppercase text-secondary mb-0">신청 가능 교육</h2>
				<h3 class="hanna text-center">지금 신청할수 있는 모든 교육의 정보를 확인하세요!</h3>
				
				<hr class="star-dark2 mb-5"></hr>
		</div>
			<table id="edulistTable" class="display" style="width:100%">
				<thead>
					<tr>
						<th style="text-align: center;">교육구분</th>
						<th style="text-align: center;">분류</th>
						<th style="text-align: center;">교육명</th>
						<th style="text-align: center;">교육시작일</th>
						<th style="text-align: center;">교육종료일</th>
						<th style="text-align: center;">교육기관</th>
						<th style="text-align: center;">신청마감</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="edulist" items="${edu_list}" varStatus="status">
						<tr onclick="eduDetail('${edulist.course_cd}');" data-toggle="modal" class="popupModal" data-target="#detailInfoModal">
							<th style="text-align: center;">${edulist.high_cls_nm}</th>
							<th style="text-align: center;">${edulist.mid_cls_nm}</th>
							<th>${edulist.course_nm}</th>
							<th style="text-align: center;">${edulist.edu_st_dt}</th>
							<th style="text-align: center;">${edulist.edu_ed_dt}</th>
							<th style="text-align: center;">${edulist.org_nm}</th>
							<th style="text-align: center;">${edulist.d_day}</th>
						</tr>
					</c:forEach>
				</tbody>					
				<tfoot>
					<tr>
						<tr>
						<th style="text-align: center;">교육구분</th>
						<th style="text-align: center;">분류</th>
						<th style="text-align: center;">교육명</th>
						<th style="text-align: center;">교육시작일</th>
						<th style="text-align: center;">교육종료일</th>
						<th style="text-align: center;">교육기관</th>
						<th style="text-align: center;">신청마감</th>
					</tr>
				</tfoot>
			</table>
		</div>
		</section>



	<!-- Header -->
	<section class="text-center"
		style="background-color: #FFDCE6;padding-top : 100px; padding-bottom: 100px">

		<div id="secondHeader" class="container" style="position:relative">

			<div style="z-index: 5; position:relative; ">
				<h1  class="hanna flyLeft"
					style="color :#444444; font-size: 60px; z-index: 5; padding: 0 ; margin: 0">이번달에 마음에 드는 교육이 없으신가요?</h1>
			</div>

			<div  style="z-index: 5; position:relative">

				<h1 class="hanna "
					style="color :#444444; font-size: 60px;  z-index: 5; padding: 0 ">신청 예정 교육을 미리 확인하세요!!</h1>

			</div>


		</div>
		
	</section>

		
		<!-- 교육시작월이 2개월 후인 목록 출력 -->
		<section style="background-color:#ffffff; padding-top:40px; padding-bottom:30px">
		<div class="container">
		<div style="text-align: center">
				<h2 class="hanna text-center text-uppercase text-secondary mb-0">신청 접수 예정 강의</h2>
				<h3 class="hanna text-center">곧 신청접수가 시작되는 모든 교육의 정보를 확인하세요!</h3>
				
				<hr class="star-dark2 mb-5"></hr>
		</div>
			<table id="postedulistTable" class="display" style="width:100%">
				<thead>
					<tr>
						<th style="text-align: center;">교육구분</th>
						<th style="text-align: center;">분류</th>
						<th style="text-align: center;">교육명</th>
						<th style="text-align: center;">교육시작일</th>
						<th style="text-align: center;">교육종료일</th>
						<th style="text-align: center;">교육기관</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="postedulist" items="${post_edulist}" varStatus="status">
						<tr onclick="eduPostDetail('${postedulist.course_cd}');" data-toggle="modal" class="popupModal" data-target="#detailInfoModal">
							<th style="text-align: center;">${postedulist.high_cls_nm}</th>
							<th style="text-align: center;">${postedulist.mid_cls_nm}</th>
							<th>${postedulist.course_nm}</th>
							<th style="text-align: center;">${postedulist.edu_st_dt}</th>
							<th style="text-align: center;">${postedulist.edu_ed_dt}</th>
							<th style="text-align: center;">${postedulist.org_nm}</th>
						</tr>
					</c:forEach>
				</tbody>					
				<tfoot>
					<tr>
						<tr>
						<th style="text-align: center;">교육구분</th>
						<th style="text-align: center;">분류</th>
						<th style="text-align: center;">교육명</th>
						<th style="text-align: center;">교육시작일</th>
						<th style="text-align: center;">교육종료일</th>
						<th style="text-align: center;">교육기관</th>
					</tr>
				</tfoot>
			</table>
		</div>
		</section>
		
		
		<!-- Footer -->
	<footer class="footer text-center">
		<div class="container">
			<div class="row">
				<div class="col-md-4 mb-5 mb-lg-0">
					<h4 class="text-uppercase mb-4 hanna">위치</h4>
					<p class="lead mb-0">
						본점 : 서울 중구 을지로 79 기업은행<br>IT센터 : 경기 용인시 수지구 신수로 799
					</p>
				</div>
				<div class="col-md-4 mb-5 mb-lg-0">
					<h4 class="text-uppercase mb-4 hanna">담당자</h4>
					<ul class="list-inline mb-0">
						<li class="list-inline-item">
							<p class="lead mb-0">
								IT기획부 오세웅 대리(Tel. 2977)<br>
								IT기획부 김광진 계장(Tel. 2828)<br>
							</p>
					</ul>
				</div>
				<div class="col-md-4">
					<h4 class="text-uppercase mb-4 hanna">IBK IT 교육포털에 관하여</h4>
					<p class="lead mb-0">
						IBK IT 교육포털은 다양한 교육을 편리하게 신청할 수 있는 사이트로 
						기업은행 IT신입행원 프로젝트를 통해 제작되었습니다.
					</p>
				</div>
			</div>
		</div>
	</footer>

		
		
			<div class="copyright py-4 text-center text-white">
		<div class="container">
			<small>Copyright &copy; IBK기업은행 2018</small>
		</div>
		</div>
		

		<div id="detailInfoModal" class="modal fade bs-example-modal-lg" tabindex="-1"
			role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div id="eduModalContent" class="modal-content"></div>
			</div>
		</div>
		
		
		<div id="confirmModal" class="modal fade bs-example-modal-lg"
		tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-md">
			<div class="modal-content">


				<div id="confirmModalHeader" class="modal-header" style="background-color: #F94164">
					<div  style="margin: 0 auto;">
						<h1 align="center" class="hanna"
							style="margin-left: 30px; color: white" id="modalLabel">정말
							신청하시겠습니까?</h1>

					</div>
					<div id="confirmModalContent">
					</div>
					
					<button id="btnConfirmClose" style="margin: 0" type="button" class="close"
						data-dismiss="modal">
						<span style="margin: -20px; color: white" aria-hidden="true">&times;</span><span
							class="sr-only">Close</span>
					</button>
					
				</div>

				<div class="modal-body">


					<br>
					<div id="success"></div>
					<div class="row" id="confirmBtnSet">
						<button data-dismiss="modal" style="width: 50%; height: 70px"
							class="btn">
							<p class="hanna" style="font-size: 20px; color: white">아니욥</p>
						</button>
						<button onclick="submitForm()" style="width: 50%; height: 70px"
							class="btn-yes">
							<p class="hanna" style="font-size: 20px; color: white">넵</p>
						</button>
					</div>

				</div>

			</div>
		</div>
	</div>
		
		
		    <script src="vendor/jquery/jquery.min.js"></script>
		
		<script
		src="<%=application.getContextPath()%>/resources/main_page_resource/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
		
		    <!-- Bootstrap core JavaScript -->

	<!-- Plugin JavaScript -->
	<script
		src="<%=application.getContextPath()%>/resources/main_page_resource/vendor/jquery-easing/jquery.easing.min.js"></script>
	<script
		src="<%=application.getContextPath()%>/resources/main_page_resource/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>

	<!-- Contact Form JavaScript -->
	<script
		src="<%=application.getContextPath()%>/resources/main_page_resource/js/jqBootstrapValidation.js"></script>

	<!-- Custom scripts for this template -->
	<script
		src="<%=application.getContextPath()%>/resources/main_page_resource/js/freelancer.min.js"></script>


	<!-- Plugin JavaScript -->

		
	</body>
</html>