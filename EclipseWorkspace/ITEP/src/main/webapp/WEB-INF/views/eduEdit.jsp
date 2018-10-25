<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<title>교육수정</title>

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
<!-- Custom styles -->
<link
	href="<%=application.getContextPath()%>/resources/admin_page_resource/css/style.css"
	rel="stylesheet">
<link
	href="<%=application.getContextPath()%>/resources/main_page_resource/css/freelancer.min.css"
	rel="stylesheet">

      <script src="<%=application.getContextPath()%>/resources/jquery/jquery-3.2.1.min.js" type="text/javascript"></script>
      <script src="<%=application.getContextPath()%>/resources/bootstrap-3.3.7/js/bootstrap.min.js" type="text/javascript"></script>
      <link href="<%=application.getContextPath()%>/resources/DataTables-1.10.18/css/jquery.dataTables.min.css" rel="stylesheet" type="text/css"/>
      <script src="<%=application.getContextPath()%>/resources/DataTables-1.10.18/js/jquery.dataTables.min.js" type="text/javascript"></script>

</head>

<script>
	$(document).ready(function() {
		$('#edulistTable').DataTable();
	});
</script>

<body>
	<!-- 교육 수정 화면 구성 20181023 이기석 -->
	<section id="edit-main">
		<section class="wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h3 class="page-header" style="color: #333333">
						<i class="fa fa fa-bars"></i> 교육수정
					</h3>
					<br />
				</div>
			</div>
			<!-- Table 출력 -->
		<div class="container">
			<table id="edulistTable" class="display" style="width:100%">
				<thead>
					<tr>
						<th style="text-align: center;">번호</th>
						<th style="text-align: center;">교육구분</th>
						<th style="text-align: center;">분류</th>
						<th style="text-align: center;">교육명</th>
						<th style="text-align: center;">교육시작일</th>
						<th style="text-align: center;">교육종료일</th>
						<th style="text-align: center;">교육기관</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="edu" items="${edulist}" varStatus="status">
						<tr>
							<th style="text-align: center;">${edu.rownum}</th>
							<th style="text-align: center;">${edu.high_cls_nm}</th>
							<th style="text-align: center;">${edu.mid_cls_nm}</th>
							<th>${edu.course_nm}</th>
							<th style="text-align: center;">${edu.edu_st_dt}</th>
							<th style="text-align: center;">${edu.edu_ed_dt}</th>
							<th style="text-align: center;">${edu.org_nm}</th>
						</tr>
					</c:forEach>
				</tbody>					
			</table>
		</div>
		
		</section>
	</section>

</body>
</html>