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

	<!-- chart.js  -->
  <link href="<%=application.getContextPath()%>/resources/js/Chart.js" rel="stylesheet">  
  <link href="<%=application.getContextPath()%>/resources/js/Chart.min.js" rel="stylesheet">  
  <link href="<%=application.getContextPath()%>/resources/js/Chart.bundle.js" rel="stylesheet">  
  <link href="<%=application.getContextPath()%>/resources/js/Chart.bundle.min.js" rel="stylesheet">  
	
	<!-- 모달 -->
    <script src="<c:url value="/resources/main_page_resource/js/approval.modal.js" />"></script>
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
	height : 360px;
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
    	$("input[type=checkbox]").click(function(event) {

			event.stopPropagation();

		});
    	
    	$("input[type=checkbox]").keyup(function(event) {
            if (event.which  == 13) {
                
                // 엔터키가 눌렸을 때 실행할 내용
           	fn_pmApproval();
           }

		});
	});
	
    var reg_file_nm = "";
    var reg_file_type = "";
    var plan_file_nm = "";
    var plan_file_type = "";
	
	//리스트 선택하면 계획서, 신청서 다운로드 가능한 모달 창 오픈
	function fn_TbClickCall(e){

		
		$(e).find("td").each(function(i, item){ 
		
			//컬럼인덱스로 데이터 확인 
			if(i==14){ 
				reg_file_nm = $(item).html();
			}else if(i==15){ 
				plan_file_nm = $(item).html();
			}else if(i==16){ 
				reg_file_type = $(item).html();
			}else if(i==17){ 
				plan_file_type = $(item).html();
			}
		}); 

		// 모달창 인스턴트 생성
		var myModal = new Example.Modal({

		    id: "modal" // 모달창 아이디 지정
		});	

		if(reg_file_nm != "" && plan_file_nm != ""){
			downloadFile("reg");			
			downloadFile("plan");
	  		myModal.show();
		}else{
			alert("파일 첨부 대상 교육이 아닙니다.");
		}
	}		
	
	function noDataFile(){
		alert("첨부된 파일이 없습니다.");
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
	
	//교육 List 체크박스 전체 선택/해제
	function chekc_All(){
        if( $("#allCheck").is(':checked') ){
            $("input[name=listCheckbox]").prop("checked", true);
          }else{
            $("input[name=listCheckbox]").prop("checked", false);
          }
	}
			
	//버튼 클릭시 결재 Update 및 교육List 갱신
	function fn_pmApproval(){
		if (confirm("정말 결재 하시겠습니까??") == true){    //확인

			checkboxArr();
		}else{   //취소
		}
		location.href="JavaScript:window.location.reload()";
	}
	
	//체크되어 있는 교육들 파라미터 넘기기
	function checkboxArr(){
		
		//체크되어 있는 value들 가져올 배열 선언
		var checkboxValues = [];
	    var chk_obj = document.getElementsByName("listCheckbox");
	    var chk_use = false;
	    
	    for (i=0; i < chk_obj.length; i++) {
	        if (chk_obj[i].checked == true) { 
	        	chk_use = true;
	        	checkboxValues.push(chk_obj[i].value);
	        }
	    }

	    
	    if(chk_use == false){
	    	alert("선택하신 강의가 없습니다.");
	    }else{
	    	jQuery.ajaxSettings.traditional = true;

	    	 $.ajax({
    	        'url':"updateApproval.do",
    	        'type':'GET',
    	        'data': { 'pmlist' : checkboxValues},
    	        'success':function(data){
    	            alert("성공적으로 결재되었습니다.");
    	            window.opener.location.reload();
    	        },
    	        'error':function(jqXHR, textStatus, errorThrown){
    	            alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);

    	        }
    	    });
	    }
	}
			
</script>
	
<body>

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
   			<div class="hanna" align = "center" style="font-size:20px; padding-left:40px; padding-top:30px; width:250px;float:left;">
   				<label for="authority" class="control-label"> 신청서 : </label>
   			    <a id="regFile" href="javascript:noDataFile()">다운로드</a>  	
   			</div>
   			
   			<div class="hanna" align = "center" style="font-size:20px; padding-right:40px; padding-top:30px; width:250px;float:right;">
   				<label for="authority" class="control-label"> 계획서 : </label>
   			    <a id="planFile" href="javascript:noDataFile()">다운로드</a>  	
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
       			<h3 class="page-header hanna"> 결재진행   <br> <img width="80px" height="10px" src="resources/admin_page_resource/img/substract.png" alt=""> </h3>
     			</div>
     		</div>
    </section>
	
	<div style="padding-left:32%">
		<div>
			<img width="420px" src="resources/admin_page_resource/img/flow.PNG" style="" alt="">				
		</div>
	</div>
	
	<div class="hanna" style="padding-right: 130px; padding-bottom: 30px">
		<button name="button_app" class="btn btn-primary2" onclick="fn_pmApproval()" style="float: right;"> <img width="25px" src="resources/admin_page_resource/img/verified.png" style="padding-right:7px;" alt="">결재</button>
	</div>
			
	<div class="container">
		<div class="hanna">
		<table id="approvalTable" class="display" style="width:100%; text-align:center;" >
			<thead>
				<tr>
					<th><input type='checkbox' id="allCheck" value="ALL" onClick="chekc_All()"></th>
					<th style="text-align: center;">직번</th>
					<th style="text-align: center;">이름</th>
					<th style="text-align: center;">직원부서</th>										
					<th style="text-align: center;">기관명</th>
					<th style="text-align: center;">소분류</th>
					<th style="text-align: center;">과정명</th>
					<th style="text-align: center;">교육시간</th>
					<th style="text-align: center;">시작일</th>
					<th style="text-align: center;">종료일</th>
					<th style="text-align: center;">교육비</th>
					<th style="text-align: center;">교육장소</th>
					<th style="text-align: center;">환급</th>
					<th style="text-align: center;">결재상황</th>
					<th style="text-align: center; display:none;">신청서 파일 이름</th>
					<th style="text-align: center; display:none;">신청서 파일 타입</th>					
					<th style="text-align: center; display:none;">계획서 파일 이름</th>
					<th style="text-align: center; display:none;">계획서 파일 타입</th>					
				</tr>
			</thead>
			<tbody>
				<c:forEach var="adminApprovalList" items="${adminApproval_List}" varStatus="status">
					<tr onclick="javascripｔ:fn_TbClickCall(this);" style="cursor: pointer;" >
						<td><input type='checkbox' name="listCheckbox" value="${adminApprovalList.emn};${adminApprovalList.course_cd}"><!--onClick="selectCheckBox(tdis, 'listCheckbox');">--></td>
						<td align="center">${adminApprovalList.emn}</td>
						<td align="center">${adminApprovalList.emm}</td>
						<td align="center">${adminApprovalList.krn_brm}</td>
						<td align="center">${adminApprovalList.org_nm}</td>
						<td align="center">${adminApprovalList.low_cls_nm}</td>
						<td align="center">${adminApprovalList.course_nm}</td>
						<td align="center">${adminApprovalList.edu_hour}</td>
						<td align="center">${adminApprovalList.edu_st_dt}</td>
						<td align="center">${adminApprovalList.edu_ed_dt}</td>
						<td align="center">${adminApprovalList.edu_cost}</td>
						<td align="center">${adminApprovalList.loc}</td>
						<td align="center">${adminApprovalList.refund_yn}</td>
						<td align="center">${adminApprovalList.step_nm}</td>
						<td align="center" style="display:none;">${adminApprovalList.svr_reg_file_nm}</td>
						<td align="center" style="display:none;">${adminApprovalList.svr_plan_file_nm}</td>	
						<td align="center" style="display:none;">${adminApprovalList.reg_file_type}</td>
						<td align="center" style="display:none;">${adminApprovalList.plan_file_type}</td>														
					</tr>
				</c:forEach>
			</tbody>					
		</table>
		</div>
	</div>
</body>

</html>
