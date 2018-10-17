<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
	String contentPage = request.getParameter("contentPage");
	if (contentPage == null)
		contentPage = "dashboard.jsp";
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description"
	content="Creative - Bootstrap 3 Responsive Admin Template">
<meta name="author" content="GeeksLabs">
<meta name="keyword"
	content="Creative, Dashboard, Admin, Template, Theme, Bootstrap, Responsive, Retina, Minimal">
<link rel="shortcut icon" href="img/favicon.png">

<title>Creative - Bootstrap Admin Template</title>

<!-- Bootstrap CSS -->
<link
	href="<%=application.getContextPath()%>/resources/admin_page_resource/css/bootstrap.min.css"
	rel="stylesheet">
<!-- bootstrap theme -->
<link
	href="<%=application.getContextPath()%>/resources/admin_page_resource/css/bootstrap-theme.css"
	rel="stylesheet">
<!--external css-->
<!-- font icon -->
<link
	href="<%=application.getContextPath()%>/resources/admin_page_resource/css/elegant-icons-style.css"
	rel="stylesheet" />
<link
	href="<%=application.getContextPath()%>/resources/admin_page_resource/css/font-awesome.min.css"
	rel="stylesheet" />
<!-- full calendar css-->
<link
	href="<%=application.getContextPath()%>/resources/admin_page_resource/assets/fullcalendar/fullcalendar/bootstrap-fullcalendar.css"
	rel="stylesheet" />
<link
	href="<%=application.getContextPath()%>/resources/admin_page_resource/assets/fullcalendar/fullcalendar/fullcalendar.css"
	rel="stylesheet" />
<!-- easy pie chart-->
<link
	href="<%=application.getContextPath()%>/resources/admin_page_resource/assets/jquery-easy-pie-chart/jquery.easy-pie-chart.css"
	rel="stylesheet" type="text/css" media="screen" />
<!-- owl carousel -->
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/resources/admin_page_resource/css/owl.carousel.css"
	type="text/css">
<link
	href="<%=application.getContextPath()%>/resources/admin_page_resource/css/jquery-jvectormap-1.2.2.css"
	rel="stylesheet">
<!-- Custom styles -->
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/resources/admin_page_resource/css/fullcalendar.css">
<link
	href="<%=application.getContextPath()%>/resources/admin_page_resource/css/widgets.css"
	rel="stylesheet">
<link
	href="<%=application.getContextPath()%>/resources/admin_page_resource/css/style.css"
	rel="stylesheet">
<link
	href="<%=application.getContextPath()%>/resources/admin_page_resource/css/style-responsive.css"
	rel="stylesheet" />
<link
	href="<%=application.getContextPath()%>/resources/admin_page_resource/css/xcharts.min.css"
	rel=" stylesheet">
<link
	href="<%=application.getContextPath()%>/resources/admin_page_resource/css/jquery-ui-1.10.4.min.css"
	rel="stylesheet">
<script
	src="<%=application.getContextPath()%>/resources/jquery/jquery-3.2.1.min.js"></script>
<script>
	function changeIframeUrl(url) {
		document.getElementById("main-container").src = url;
	}
</script>


<!-- =======================================================
    Theme Name: NiceAdmin
    Theme URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
    Author: BootstrapMade
    Author URL: https://bootstrapmade.com
  ======================================================= -->
</head>

<body>
	<!-- container section start -->
	<section id="container" class="">

		<!--header start-->
		<header class="header dark-bg">
			<jsp:include page="top.jsp" flush="false" />
		</header>

		<%--  
    	<!--sidebar start-->
    	<aside>
      		<div id="sidebar" class="nav-collapse ">
      			<jsp:include page="sidemenu.jsp" flush="false"/>
      		</div>
    	</aside>
    	<!--sidebar end-->
	--%>

		<!--sidebar start-->
		<aside>
			<div id="sidebar" class="nav-collapse ">
				<!-- sidebar menu start-->
				<ul class="sidebar-menu">
					<li class="active"><a class="" onclick="changeIframeUrl('dashboard')" style="cursor:pointer"> <i
							class="icon_house_alt"></i> <span>대시보드</span>
					</a></li>
					<li class="sub-menu"><a href="javascript:;" class=""> <i
							class="icon_document_alt"></i> <span>교육관리</span> <span
							class="menu-arrow arrow_carrot-right"></span>
					</a>
						<ul class="sub">
							<li><a class="" onclick="changeIframeUrl('eduUploadExcel')" style="cursor:pointer">교육일괄등록</a></li>
							<li><a class=""<%-- href="<%=application.getContextPath()%>/resources/admin_page_resource/form_validation.html" --%>>교육등록</a></li>
							<li><a class=""<%-- href="<%=application.getContextPath()%>/resources/admin_page_resource/form_validation.html" --%>>교육수정</a></li>
						</ul></li>
					<li><a class="" href="approval">
							<i class="icon_desktop"></i> <span>결재함</span>
					</a></li>
					<li><a class=""<%--href="<%=application.getContextPath()%>/resources/admin_page_resource/widgets.html"--%>>
							<i class="icon_genius"></i> <span>권한관리</span>
					</a></li>
				</ul>

				<!-- sidebar menu end-->
			</div>
		</aside>
		<!--sidebar end-->
		<!--main content start-->
		<section id="main-content">
			<iframe id="main-container" src="dashboard"
				style="display: block; width: 100%; height: 100vh"></iframe>
		</section>
		<!--main content end-->

	</section>

	<!-- container section start -->

	<!-- javascripts -->
	<script
		src="<%=application.getContextPath()%>/resources/admin_page_resource/js/jquery.js"></script>
	<script
		src="<%=application.getContextPath()%>/resources/admin_page_resource/js/jquery-ui-1.10.4.min.js"></script>
	<script
		src="<%=application.getContextPath()%>/resources/admin_page_resource/js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript"
		src="<%=application.getContextPath()%>/resources/admin_page_resource/js/jquery-ui-1.9.2.custom.min.js"></script>
	<!-- bootstrap -->
	<script
		src="<%=application.getContextPath()%>/resources/admin_page_resource/js/bootstrap.min.js"></script>
	<!-- nice scroll -->
	<script
		src="<%=application.getContextPath()%>/resources/admin_page_resource/js/jquery.scrollTo.min.js"></script>
	<script
		src="<%=application.getContextPath()%>/resources/admin_page_resource/js/jquery.nicescroll.js"
		type="text/javascript"></script>
	<!-- charts scripts -->
	<script
		src="<%=application.getContextPath()%>/resources/admin_page_resource/assets/jquery-knob/js/jquery.knob.js"></script>
	<script
		src="<%=application.getContextPath()%>/resources/admin_page_resource/js/jquery.sparkline.js"
		type="text/javascript"></script>
	<script
		src="<%=application.getContextPath()%>/resources/admin_page_resource/assets/jquery-easy-pie-chart/jquery.easy-pie-chart.js"></script>
	<script
		src="<%=application.getContextPath()%>/resources/admin_page_resource/js/owl.carousel.js"></script>
	<!-- jQuery full calendar -->
	<
	<script
		src="<%=application.getContextPath()%>/resources/admin_page_resource/js/fullcalendar.min.js"></script>
	<!-- Full Google Calendar - Calendar -->
	<script
		src="<%=application.getContextPath()%>/resources/admin_page_resource/assets/fullcalendar/fullcalendar/fullcalendar.js"></script>
	<!--script for this page only-->
	<script
		src="<%=application.getContextPath()%>/resources/admin_page_resource/js/calendar-custom.js"></script>
	<script
		src="<%=application.getContextPath()%>/resources/admin_page_resource/js/jquery.rateit.min.js"></script>
	<!-- custom select -->
	<script
		src="<%=application.getContextPath()%>/resources/admin_page_resource/js/jquery.customSelect.min.js"></script>
	<script
		src="<%=application.getContextPath()%>/resources/admin_page_resource/assets/chart-master/Chart.js"></script>

	<!--custome script for all page-->
	<script
		src="<%=application.getContextPath()%>/resources/admin_page_resource/js/scripts.js"></script>
	<!-- custom script for this page-->
	<script
		src="<%=application.getContextPath()%>/resources/admin_page_resource/js/sparkline-chart.js"></script>
	<script
		src="<%=application.getContextPath()%>/resources/admin_page_resource/js/easy-pie-chart.js"></script>
	<script
		src="<%=application.getContextPath()%>/resources/admin_page_resource/js/jquery-jvectormap-1.2.2.min.js"></script>
	<script
		src="<%=application.getContextPath()%>/resources/admin_page_resource/js/jquery-jvectormap-world-mill-en.js"></script>
	<script
		src="<%=application.getContextPath()%>/resources/admin_page_resource/js/xcharts.min.js"></script>
	<script
		src="<%=application.getContextPath()%>/resources/admin_page_resource/js/jquery.autosize.min.js"></script>
	<script
		src="<%=application.getContextPath()%>/resources/admin_page_resource/js/jquery.placeholder.min.js"></script>
	<script
		src="<%=application.getContextPath()%>/resources/admin_page_resource/js/gdp-data.js"></script>
	<script
		src="<%=application.getContextPath()%>/resources/admin_page_resource/js/morris.min.js"></script>
	<script
		src="<%=application.getContextPath()%>/resources/admin_page_resource/js/sparklines.js"></script>
	<script
		src="<%=application.getContextPath()%>/resources/admin_page_resource/js/charts.js"></script>
	<script
		src="<%=application.getContextPath()%>/resources/admin_page_resource/js/jquery.slimscroll.min.js"></script>
	<script>
		//knob
		$(function() {
			$(".knob").knob({
				'draw' : function() {
					$(this.i).val(this.cv + '%')
				}
			})
		});

		//carousel
		$(document).ready(function() {
			$("#owl-slider").owlCarousel({
				navigation : true,
				slideSpeed : 300,
				paginationSpeed : 400,
				singleItem : true

			});
		});

		//custom select box

		$(function() {
			$('select.styled').customSelect();
		});

		/* ---------- Map ---------- */
		$(function() {
			$('#map').vectorMap({
				map : 'world_mill_en',
				series : {
					regions : [ {
						values : gdpData,
						scale : [ '#000', '#000' ],
						normalizeFunction : 'polynomial'
					} ]
				},
				backgroundColor : '#eef3f7',
				onLabelShow : function(e, el, code) {
					el.html(el.html() + ' (GDP - ' + gdpData[code] + ')');
				}
			});
		});
	</script>

</body>

</html>
