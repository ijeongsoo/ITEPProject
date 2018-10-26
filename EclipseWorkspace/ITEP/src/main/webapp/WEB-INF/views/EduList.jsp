<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Education List</title>
		<script src="<%=application.getContextPath()%>/resources/jquery/jquery-3.2.1.min.js" type="text/javascript"></script>
		<link
			href="<%=application.getContextPath()%>/resources/main_page_resource/vendor/bootstrap/css/bootstrap.min.css"
			rel="stylesheet">
		<link href="<%=application.getContextPath()%>/resources/DataTables-1.10.18/css/jquery.dataTables.min.css" rel="stylesheet" type="text/css"/>
		<script src="<%=application.getContextPath()%>/resources/DataTables-1.10.18/js/jquery.dataTables.min.js" type="text/javascript"></script>


		<link
			href="<%=application.getContextPath()%>/resources/main_page_resource/css/style.css"
			rel="stylesheet">
             <!-- Custom styles for this template -->
		<link href="<%=application.getContextPath()%>/resources/main_page_resource/css/freelancer.min.css" rel="stylesheet">



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
	</script>


	<body id="edupage-top">
	    <nav class="navbar navbar-expand bg-secondary fixed-top text-uppercase" id="mainNav">
	      <div class="container">
	        <a class="hanna navbar-brand js-scroll-trigger" href="#edupage-top">교육 리스트</a>
	        </div>
	    </nav>

		<!-- <section class="section_div_1" style="padding-top:140px; padding-bottom:350px">
			
		</section> -->
		<section class="parallax-window" data-parallax="scroll" data-image-src="resources/image/books-2596809_1920_2.jpg" data-positionY="top" style="padding-top:100px; padding-bottom:100px; color:#ffffff; text-align: center">
		</section>



		<!-- 현재 신청가능한 목록 출력 -->
		<section style="padding-top:40px; padding-bottom:90px">
		<div class="container">
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



		<section class="parallax-window" data-parallax="scroll" data-image-src="resources/image/books-2596809_1920_2.jpg" data-positionY="top" style="padding-top:100px; padding-bottom:100px; color:#ffffff; text-align: center">

				<h1>Education is the best provision for old age.</h1>

                <h4>Aristoteles <span>&#8213; ancient Greece</span></h4>
		</section>

		
		<!-- 교육시작월이 2개월 후인 목록 출력 -->
		<section style="background-color:#f9f9f9; padding-top:40px; padding-bottom:30px">
		<div class="container">
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
						<tr onclick="eduDetail('${postedulist.course_cd}');" data-toggle="modal" class="popupModal" data-target="#detailInfoModal">
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
		
				<section class="parallax-window" data-parallax="scroll" data-image-src="resources/image/books-2596809_1920_2.jpg" data-positionY="bottom" style="padding-top:100px; padding-bottom:100px; color:#ffffff; text-align: center">

				<h1>Education is the best provision for old age.</h1>

                <h4>Aristoteles <span>&#8213; ancient Greece</span></h4>
		</section>
		
		

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
			<div id="eduModalContent" class="modal-content">


				<div class="modal-header" style="background-color: #F94164">
					<div style="margin: 0 auto;">
						<h1 align="center" class="hanna"
							style="margin-left: 30px; color: white" id="modalLabel">정말
							신청하시겠습니까?</h1>

					</div>

					<button style="margin: 0" type="button" class="close"
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
		
		
		
		<script
		src="<%=application.getContextPath()%>/resources/main_page_resource/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
		
		
		
		
		
	</body>
</html>