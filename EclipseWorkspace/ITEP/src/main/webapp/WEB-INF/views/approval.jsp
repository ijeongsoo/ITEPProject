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

  <title>Creative - Bootstrap Admin Template</title>
<script
	src="<%=application.getContextPath()%>/resources/main_page_resource/js/jquery.js"></script>
  <!-- Bootstrap CSS -->
  <link href="<%=application.getContextPath()%>/resources/admin_page_resource/css/bootstrap.min.css" rel="stylesheet">
  <!-- bootstrap theme -->
  <link href="<%=application.getContextPath()%>/resources/admin_page_resource/css/bootstrap-theme.css" rel="stylesheet">
  <!--external css-->
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
  <!-- =======================================================
    Theme Name: NiceAdmin
    Theme URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
    Author: BootstrapMade
    Author URL: https://bootstrapmade.com
  ======================================================= -->
</head>
	<script>
		$(document).ready( function () {
	    	$('#approvalTable').DataTable();
	    	
	        $("#adminPM").on("click", function(e){ //결재하기 버튼
	            e.preventDefault();
	            fn_pmApproval();
	        });
		} );
		
		function fn_pmApproval(){
		    var comSubmit = new ComSubmit("approvalTable");
		    //comSubmit.setUrl("<c:url value='/updateApproval' />");
		    comSubmit.submit();
		}
		
	</script>
	
<body>
  <!-- container section start -->
  <section id="container" class="">


    <header class="header dark-bg">
      <div class="toggle-nav">
        <div class="icon-reorder tooltips" data-original-title="Toggle Navigation" data-placement="bottom"><i class="icon_menu"></i></div>
      </div>
	
	  <!-- 관리자 페이지 로고 부분 20181015 이기석 -->
      <!--logo start-->
      <a href="approval" class="logo">IT교육포털 <span class="lite">관리자 페이지</span></a>
      <!--logo end-->
	  
    </header>
    <!--header end-->

    <!--sidebar start-->
    <aside>
      <div id="sidebar" class="nav-collapse ">
        <!-- sidebar menu start-->
        <ul class="sidebar-menu">
          <li class="active">
            <a class="" href="admin">
                          <i class="icon_house_alt"></i>
                          <span>대시보드</span>
                      </a>
          </li>
          <li class="sub-menu">
            <a href="javascript:;" class="">
                          <i class="icon_document_alt"></i>
                          <span>교육관리</span>
                          <span class="menu-arrow arrow_carrot-right"></span>
                      </a>
            <ul class="sub">
              <li><a class="" <%-- href="<%=application.getContextPath()%>/resources/admin_page_resource/form_component.html" --%>>교육일괄등록</a></li>
              <li><a class="" <%-- href="<%=application.getContextPath()%>/resources/admin_page_resource/form_validation.html" --%>>교육등록</a></li>
              <li><a class="" <%-- href="<%=application.getContextPath()%>/resources/admin_page_resource/form_validation.html" --%>>교육수정</a></li>
            </ul>
          </li>
          <li>
            <a class="" href="approval"> 
                          <i class="icon_desktop"></i>
                          <span>결재함</span>
                      </a>
          </li>
          <li>
            <a class="" <%--href="<%=application.getContextPath()%>/resources/admin_page_resource/widgets.html"--%>>
                          <i class="icon_genius"></i>
                          <span>권한관리</span>
                      </a>
          </li>
        </ul>
        <!-- sidebar menu end-->
      </div>
    </aside>
    <!--sidebar end-->

    <!--main content start-->
    <!-- 대시보드 메인 구성 20181015 이기석 -->
    <section id="main-content">
      <section class="wrapper">
        <!--overview start-->
        <div class="row">
          <div class="col-lg-12">
            <h3 class="page-header"><i class="fa fa-laptop"></i>결재</h3>
            <ol class="breadcrumb">
              <li><i class="fa fa-home"></i><a href="<%=application.getContextPath()%>/resources/admin_page_resource/index.html">Home</a></li>
              <li><i class="fa fa-laptop"></i>결재</li>
            </ol>
          </div>
        </div>
 		<div class="container" align="right" style="height:40px;">
 			<input id="adminPM" type="button" value="결재">
 		</div>
 		<div class="container">
			<table id="approvalTable" class="display" style="width:100%; text-align:center;" >
				<thead>
					<tr>
						<th><input type='checkbox' name="listCheckbox" value="ALL" onClick="selectCheckBox(this, 'listCheckbox');"></th>
						<th style="text-align: center;">직원번호</th>
						<th style="text-align: center;">기관명</th>
						<th style="text-align: center;">소분류</th>
						<th style="text-align: center;">과정명</th>
						<th style="text-align: center;">교육시간</th>
						<th style="text-align: center;">신청시작일</th>
						<th style="text-align: center;">신청마감일</th>
						<th style="text-align: center;">교육시작일</th>
						<th style="text-align: center;">교육종료일</th>
						<th style="text-align: center;">교육비</th>
						<th style="text-align: center;">교육장소</th>
						<th style="text-align: center;">환급여부</th>
						<th style="text-align: center;">결재 상황</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="adminApprovalList" items="${adminApproval_List}" varStatus="status">
						<tr>
							<td><input type='checkbox' name="listCheckbox" onClick="selectCheckBox(tdis, 'listCheckbox');"></td>
							<td align="center">${adminApprovalList.emn}</td>
							<td align="center">${adminApprovalList.org_nm}</td>
							<td align="center">${adminApprovalList.low_cls_nm}</td>
							<td align="center">${adminApprovalList.course_nm}</td>
							<td align="center">${adminApprovalList.edu_hour}</td>
							<td align="center">${adminApprovalList.reg_st_dt}</td>
							<td align="center">${adminApprovalList.reg_ed_dt}</td>
							<td align="center">${adminApprovalList.edu_st_dt}</td>
							<td align="center">${adminApprovalList.edu_ed_dt}</td>
							<td align="center">${adminApprovalList.edu_cost}</td>
							<td align="center">${adminApprovalList.loc}</td>
							<td align="center">${adminApprovalList.refund_yn}</td>
							<td align="center">${adminApprovalList.step_nm}</td>							
						</tr>
					</c:forEach>
				</tbody>					
			</table>
		</div>
		<div>
			<h3>${login_info.emn}</h3>
		</div>
</body>

</html>
