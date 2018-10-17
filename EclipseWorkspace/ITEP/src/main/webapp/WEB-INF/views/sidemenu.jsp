<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

  <!-- Bootstrap CSS -->
  <link href="<%=application.getContextPath()%>/resources/admin_page_resource/css/bootstrap.min.css" rel="stylesheet">
  <!-- bootstrap theme -->
  <link href="<%=application.getContextPath()%>/resources/admin_page_resource/css/bootstrap-theme.css" rel="stylesheet">
  <!--external css-->
  <!-- font icon -->
  <link href="<%=application.getContextPath()%>/resources/admin_page_resource/css/elegant-icons-style.css" rel="stylesheet" />
  <link href="<%=application.getContextPath()%>/resources/admin_page_resource/css/font-awesome.min.css" rel="stylesheet" />
  <!-- Custom styles -->
  <link href="<%=application.getContextPath()%>/resources/admin_page_resource/css/style.css" rel="stylesheet">
  <!-- =======================================================
    Theme Name: NiceAdmin
    Theme URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
    Author: BootstrapMade
    Author URL: https://bootstrapmade.com
  ======================================================= -->
</head>
<body>
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
              <li><a class="" href="admin?contentPage=dashboard.jsp">교육일괄등록</a></li>
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
            <a class="" <%--href="<%=application.getContextPath()%>/resources/admin_page_resource/widgets.html"--%>>
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
</body>
</html>