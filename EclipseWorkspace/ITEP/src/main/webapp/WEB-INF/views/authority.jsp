<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
		<title>Education List</title>
		<link href="<%=application.getContextPath()%>/resources/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
		<script src="<%=application.getContextPath()%>/resources/jquery/jquery-3.2.1.min.js" type="text/javascript"></script>
		<script src="<%=application.getContextPath()%>/resources/bootstrap-3.3.7/js/bootstrap.min.js" type="text/javascript"></script>
		<link href="<%=application.getContextPath()%>/resources/DataTables-1.10.18/css/jquery.dataTables.min.css" rel="stylesheet" type="text/css"/>
		<script src="<%=application.getContextPath()%>/resources/DataTables-1.10.18/js/jquery.dataTables.min.js" type="text/javascript"></script>
		<link href="<%=application.getContextPath()%>/resources/css/hannafont.css" rel="stylesheet" type="text/css">
		<link href="<%=application.getContextPath()%>/resources/css/nanumbarungothic.css" rel="stylesheet" type="text/css">
	   
	    <!-- Custom styles for this template -->
	    		<!-- 테이블 자동 검색을 위한 css css파일 line 75 수정  -->
	    <link href="<%=application.getContextPath()%>/resources/main_page_resource/css/freelancer.min.css" rel="stylesheet"> 
				<!-- 테이블 자동 검색을 위한 css end -->
		<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/admin_page_resource/css/fullcalendar.css">
  		<link href="<%=application.getContextPath()%>/resources/admin_page_resource/css/widgets.css" rel="stylesheet">
  		<link href="<%=application.getContextPath()%>/resources/admin_page_resource/css/style.css" rel="stylesheet">
  		<link href="<%=application.getContextPath()%>/resources/admin_page_resource/css/style-responsive.css" rel="stylesheet" />
  		<link href="<%=application.getContextPath()%>/resources/admin_page_resource/css/xcharts.min.css" rel=" stylesheet">
  		<link href="<%=application.getContextPath()%>/resources/admin_page_resource/css/jquery-ui-1.10.4.min.css" rel="stylesheet">
  		<link href="<%=application.getContextPath()%>/resources/DataTables-1.10.18/css/jquery.dataTables.min.css" rel="stylesheet" type="text/css"/>
  		<script src="<%=application.getContextPath()%>/resources/DataTables-1.10.18/js/jquery.dataTables.min.js" type="text/javascript"></script>   	
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
	</head>
	
	<script>
		$(document).ready( function () {
	    	$('#authorityTable').DataTable();
		} );
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
      <% String ssoid = request.getParameter("ssoid"); %>
      <a href="admin?ssoid=<%=ssoid%>" class="logo">IT교육포털 <span class="lite">관리자 페이지</span></a>
      <!--logo end-->
	  
	  <!-- 검색바 삭제 20181015 이기석 -->
      
	  <!-- 우측 상단 아이콘 활용 주석처리 20181015 이기석 -->
    </header>
    <!--header end-->

    <!--sidebar start-->
    <aside>
      <div id="sidebar" class="nav-collapse ">
        <!-- sidebar menu start-->
        <ul class="sidebar-menu">
          <li class="active">
            <a class="" href="admin?ssoid=<%=ssoid%>">
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
            <a class="" <%-- href="<%=application.getContextPath()%>/resources/admin_page_resource/widgets.html"--%>>
                          <i class="icon_desktop"></i>
                          <span>결재함</span>
                      </a>
          </li>
          <li>
            <a class="" href="/ITEP/authority">
                          <i class="icon_genius"></i>
                          <span>권한관리</span>
                      </a>
          </li>
          <!-- 하단에 추가 메뉴 구성 가능 20181015 이기석 -->
          <%-- 
          <li>
            <a class="" href="<%=application.getContextPath()%>/resources/admin_page_resource/chart-chartjs.html">
                          <i class="icon_piechart"></i>
                          <span>Charts</span>

                      </a>

          </li>

          <li class="sub-menu">
            <a href="javascript:;" class="">
                          <i class="icon_table"></i>
                          <span>Tabls</span>
                          <span class="menu-arrow arrow_carrot-right"></span>
                      </a>
            <ul class="sub">
              <li><a class="" href="<%=application.getContextPath()%>/resources/admin_page_resource/basic_table.html">Basic Table</a></li>
            </ul>
          </li>

          <li class="sub-menu">
            <a href="javascript:;" class="">
                          <i class="icon_documents_alt"></i>
                          <span>Pages</span>
                          <span class="menu-arrow arrow_carrot-right"></span>
                      </a>
            <ul class="sub">
              <li><a class="" href="<%=application.getContextPath()%>/resources/admin_page_resource/profile.html">Profile</a></li>
              <li><a class="" href="<%=application.getContextPath()%>/resources/admin_page_resource/login.html"><span>Login Page</span></a></li>
              <li><a class="" href="<%=application.getContextPath()%>/resources/admin_page_resource/contact.html"><span>Contact Page</span></a></li>
              <li><a class="" href="<%=application.getContextPath()%>/resources/admin_page_resource/blank.html">Blank Page</a></li>
              <li><a class="" href="<%=application.getContextPath()%>/resources/admin_page_resource/404.html">404 Errr</a></li>
            </ul>
          </li>
		--%>
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
            <h3 class="page-header"><i class="fa fa-laptop"></i> 권한관리 </h3>
          </div>
        </div>



		
		<div class="container">
	<table id = "authorityTable" style="border:1px solid #ccc; width:1000px; text-align:center;"  >
    	<thead>
        <tr>
            <th style="text-align: center;">선택</th>
            <th style="text-align: center;">사번</th>
            <th style="text-align: center;">이름</th>
            <th style="text-align: center;">부서명</th>
            <th style="text-align: center;">권한코드</th>
            <th style="text-align: center;">권한명</th>
            <th style="text-align: center;">등록일자</th>            
        </tr>
    	</thead>
    	<tbody>
        <c:choose>
            <c:when test="${fn:length(auth_list) > 0}">
                <c:forEach items="${auth_list}" var="row">
                    <tr style="border-top : 1px solid #ccc;">
						<td><input type='checkbox' name="listCheckbox"  value="${adminApprovalList.course_nm}" onClick="selectCheckBox(this, 'listCheckbox');"> </td>              
                        <td>${row.emn}</td>
                        <td>${row.emm}</td>
                        <td>${row.krn_brm}</td>
                        <td>${row.auth_cd}</td>
                        <td>${row.auth_nm}</td>
                        <td>${row.reg_dt}</td>
                        
                    </tr>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <tr>
                    <td colspan="4">조회된 결과가 없습니다.</td>
                </tr>
            </c:otherwise>
        </c:choose>
    	</tbody>
	</table>
		</div>
	</body>
	
</html>