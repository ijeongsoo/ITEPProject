<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="Creative - Bootstrap 3 Responsive Admin Template">
  <meta name="author" content="GeeksLabs">
  <meta name="keyword" content="Creative, Dashboard, Admin, Template, Theme, Bootstrap, Responsive, Retina, Minimal">
  <link rel="shortcut icon" href="img/favicon.png">
  <link href="<%=application.getContextPath()%>/resources/css/hannafont.css" rel="stylesheet" type="text/css">
  
  <title>Creative - Bootstrap Admin Template</title>
<script
	src="<%=application.getContextPath()%>/resources/main_page_resource/js/jquery.js"></script>
  <!-- Bootstrap CSS -->
  <link href="<%=application.getContextPath()%>/resources/admin_page_resource/css/bootstrap.min.css" rel="stylesheet">
  <!-- bootstrap theme -->
  <link href="<%=application.getContextPath()%>/resources/admin_page_resource/css/bootstrap-theme.css" rel="stylesheet">
  <!--external css-->
  <link href="<%=application.getContextPath()%>/resources/DataTables-1.10.18/css/jquery.dataTables.min2.css" rel="stylesheet" type="text/css"/>
  <script src="<%=application.getContextPath()%>/resources/DataTables-1.10.18/js/jquery.dataTables.min2.js" type="text/javascript"></script>  
  <!-- font icon -->
  <link href="<%=application.getContextPath()%>/resources/admin_page_resource/css/elegant-icons-style.css" rel="stylesheet" />
  <link href="<%=application.getContextPath()%>/resources/admin_page_resource/css/font-awesome.min.css" rel="stylesheet" />
  <!-- full calendar css-->
  <link href="<%=application.getContextPath()%>/resources/admin_page_resource/assets/fullcalendar/fullcalendar/bootstrap-fullcalendar.css" rel="stylesheet" />
  <link href="<%=application.getContextPath()%>/resources/admin_page_resource/assets/fullcalendar/fullcalendar/fullcalendar.css" rel="stylesheet" />
  <!-- easy pie chart-->
  <link href="<%=application.getContextPath()%>/resources/admin_page_resource/assets/jquery-easy-pie-chart/jquery.easy-pie-chart.css" rel="stylesheet" type="text/css" media="screen" />
  <!-- owl carousel -->
  <link rel="stylesheet" href="<%=application.getContextPath()%>/resources/admin_page_resource/css/owl.carousel.css" type="text/css">
  <link href="<%=application.getContextPath()%>/resources/admin_page_resource/css/jquery-jvectormap-1.2.2.css" rel="stylesheet">
  <!-- Custom styles -->
  <link rel="stylesheet" href="<%=application.getContextPath()%>/resources/admin_page_resource/css/fullcalendar.css">
  <link href="<%=application.getContextPath()%>/resources/admin_page_resource/css/widgets.css" rel="stylesheet">
  <link href="<%=application.getContextPath()%>/resources/admin_page_resource/css/style.css" rel="stylesheet">
  <link href="<%=application.getContextPath()%>/resources/admin_page_resource/css/style-responsive.css" rel="stylesheet" />
  <link href="<%=application.getContextPath()%>/resources/admin_page_resource/css/xcharts.min.css" rel=" stylesheet">
  <link href="<%=application.getContextPath()%>/resources/admin_page_resource/css/jquery-ui-1.10.4.min.css" rel="stylesheet">
	<!-- 테이블 자동 검색을 위한 css css파일 line 75 수정  -->
  <link href="<%=application.getContextPath()%>/resources/main_page_resource/css/freelancer.min.css" rel="stylesheet">  
	
	<!-- 모달 -->
    <script src="<c:url value="/resources/main_page_resource/js/authority.modal.js" />"></script>

  <!-- =======================================================
    Theme Name: NiceAdmin
    Theme URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
    Author: BootstrapMade
    Author URL: https://bootstrapmade.com
  ======================================================= -->

<style>

	#modal {
	display:none;
	background-color:#FFFFFF;
	position:absolute;
	width : 500px;
	height : 600px;
	top:300px;
	left:200px;
	z-Index:9999}

	/*yellow/ROUGE BUTTON STYLES*/     
	#adminPM{background-color: #f59e00; color : #fff; border-color: #f59e00;  -webkit-box-shadow: 0 3px 0 #8f2a1f; box-shadow: 0 3px 0 #b37401; font-size: 20px; width: 150px; height: 40px;}
	#adminPM:hover{background-color:#dd9003;}
	#adminPM:active{top: 3px; outline: none; -webkit-box-shadow: none; box-shadow: none;}
</style>
</head>
	<script type="text/javascript">
	$( function () {
    	$('#approvalTable').DataTable();
    	
	});

    var point = "";
    var opinion = "";
    var reg_file_nm = "";
    var reg_file_type = "";
    var plan_file_nm = "";
    var plan_file_type = "";
    
	function fn_TbClickCall(e){

		
		$(e).find("td").each(function(i, item){ 
		
			//컬럼인덱스로 데이터 확인 
			if(i==13){ 
				point = $(item).html(); 
			}else if(i==14){ 
				opinion = $(item).html();
			}else if(i==15){ 
				reg_file_nm = $(item).html();
			}else if(i==16){ 
				plan_file_nm = $(item).html();
			}else if(i==17){ 
				reg_file_type = $(item).html();
			}else if(i==18){ 
				plan_file_type = $(item).html();
			}
		}); 

		$("#labelid1").html(point);			
		$("#labelid2").html(opinion);
		// 모달창 인스턴트 생성
		var myModal = new Example.Modal({

		    id: "modal" // 모달창 아이디 지정
		});    		
		downloadFile("reg");
		downloadFile("plan");
  		myModal.show();
	}
	
	function downloadFile(source){
		if(source=="reg"){
			$(document).ready(function(){

				$.ajax({
					'url' : "downloadFile",
					'data' : {
						'svr_img_file_nm' : encodeURI(reg_file_nm),
						'img_file_type' : encodeURI(reg_file_type)
					},
					'type' : "POST",
					'success' : function(data) {
						alert(reg_file_nm);
						$("#regFile").attr("href", "file?svr_img_file_nm="+data.file_nm+"&img_file_type="+data.file_type+"&source="+source)
					}
				});
			});

		}else if(source=="plan"){
			$(document).ready(function(){

				$.ajax({
					'url' : "downloadFile",
					'data' : {
						'svr_img_file_nm' : encodeURI(plan_file_nm),
						'img_file_type' : encodeURI(plan_file_type)
					},
					'type' : "POST",
					'success' : function(data) {
						$("#planFile").attr("href", "file?svr_img_file_nm="+data.file_nm+"&img_file_type="+data.file_type+"&source="+source)
					}
				});
			});
		}

	}

	
	</script>
	
	<body >
	
		<!-- 모달창 -->
		<div id="modal">
			<div class="modal-header" style="background-color: #237fbc">
				   <h1 align="center" class="hanna" style="color:#fff">교육 신청 상세 정보 </h1>	
			</div>
			
			<div class="modal_content">
			
			<div class="img" align="center" style="margin_bottom:50px; padding-top:20px">
			<img src= "<%=application.getContextPath()%>/resources/image/cloud-computing.png" width="80px" height="80px">
			</div>
    		
    		<form role="form">
    			<div class = "hanna" align = "left" style="font-size:25px; padding-left:20px; padding-top:40px">
    				<label for="level" class="control-label"> 별점 : </label>
    				<label for="name" id ="labelid1" class="control-label">  </label><br>
    				<label for="content" class="control-label"> 코멘트 : </label><br>
    				<label for="name" id ="labelid2" class="control-label" style="border:2px solid #237fbc; width:460px; height:120px;
    						padding-left:10px; padding-top:5px">  </label><br>
    			</div>
    			<div class="hanna" align = "center" style="font-size:20px; padding-left:40px; padding-top:30px; width:250px;float:left;">
    				<label for="authority" class="control-label"> 신청서 : </label>
    			    <a id="regFile" href="">다운로드</a>  	
    			</div>
    			
    			<div class="hanna" align = "center" style="font-size:20px; padding-right:40px; padding-top:30px; width:250px;float:right;">
    				<label for="authority" class="control-label"> 계획서 : </label>
    			    <a id="planFile" href="">다운로드</a>  	
    			</div>    			
    			<br>
    			<br>
    			
    			<div id="button" class="hanna" align="center" style="padding-top:70px">	
    				<button class="js_close" style="width:100px; height:30px;">확인</button> 		
    			</div>
    		</form>
    		</div>
		</div>

		<!-- 모달창 end -->	
	
		<section class="wrapper">
      		<!--overview start-->
    		<div class="row">
      			<div class="col-lg-12">
        			<h3 class="page-header hanna"> 결재  완료 <br> <img width="80px" height="10px" src="resources/admin_page_resource/img/substract.png" alt=""> </h3>
      			</div>
      		</div>

    </section>

	<div class="hanna" align="center" style="height:40px;">
	</div>
	<div class="container">
		<span class="hanna" style="padding-left: 30px; color:red;"> ※ 리스트를 클릭하시면, 첨부파일 및 설문내용 확인이 가능합니다.</span>
		<div class="hanna">
		<table id="approvalTable" class="display" style="width:100%; text-align:center;" >
			<thead>
				<tr>
					<th style="text-align: center;">직번</th>
					<th style="text-align: center;">이름</th>
					<th style="text-align: center;">직원부서</th>										
					<th style="text-align: center;">기관명</th>
					<th style="text-align: center;">소분류</th>
					<th style="text-align: center;">과정명</th>
					<th style="text-align: center;">시작일</th>
					<th style="text-align: center;">종료일</th>
					<th style="text-align: center;">교육비</th>
					<th style="text-align: center;">교육장소</th>
					<th style="text-align: center;">환급</th>
					<th style="text-align: center;">결재상황</th>
					<th style="text-align: center;">수강상태</th>
					<th style="text-align: center; display:none;">평점</th>
					<th style="text-align: center; display:none;">평가 의견</th>	
					<th style="text-align: center; display:none;">신청서 파일 이름</th>
					<th style="text-align: center; display:none;">신청서 파일 타입</th>					
					<th style="text-align: center; display:none;">계획서 파일 이름</th>
					<th style="text-align: center; display:none;">계획서 파일 타입</th>																			
				</tr>
			</thead>
			<tbody>
				<c:forEach var="adminApprovalDetailList" items="${adminDetailApproval_List}" varStatus="status">
   					 <tr onclick="javascripｔ:fn_TbClickCall(this);" style="cursor: pointer;" >
						<td align="center">${adminApprovalDetailList.emn}</td>
						<td align="center">${adminApprovalDetailList.emm}</td>
						<td align="center">${adminApprovalDetailList.krn_brm}</td>
						<td align="center">${adminApprovalDetailList.org_nm}</td>
						<td align="center">${adminApprovalDetailList.low_cls_nm}</td>
						<td align="center">${adminApprovalDetailList.course_nm}</td>
						<td align="center">${adminApprovalDetailList.edu_st_dt}</td>
						<td align="center">${adminApprovalDetailList.edu_ed_dt}</td>
						<td align="center">${adminApprovalDetailList.edu_cost}</td>
						<td align="center">${adminApprovalDetailList.loc}</td>
						<td align="center">${adminApprovalDetailList.refund_yn}</td>
						<td align="center">${adminApprovalDetailList.step_nm}</td>
						<td align="center">${adminApprovalDetailList.stat_nm}</td>
						<td align="center" style="display:none;">${adminApprovalDetailList.sur_point_star}</td>
						<td align="center" style="display:none;">${adminApprovalDetailList.opinion}</td>													
						<td align="center" style="display:none;">${adminApprovalDetailList.svr_reg_file_nm}</td>
						<td align="center" style="display:none;">${adminApprovalDetailList.svr_plan_file_nm}</td>	
						<td align="center" style="display:none;">${adminApprovalDetailList.reg_file_type}</td>
						<td align="center" style="display:none;">${adminApprovalDetailList.plan_file_type}</td>	
					</tr>
				</c:forEach>
			</tbody>					
		</table>
		</div>
	</div>
	
</body>

</html>
