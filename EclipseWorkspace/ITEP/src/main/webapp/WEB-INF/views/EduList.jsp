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
	    <link href="<%=application.getContextPath()%>/resources/main_page_resource/css/freelancer.min.css" rel="stylesheet">
    
<!--  <link href="<%=application.getContextPath()%>/resources/main_page_resource/sub/css/style.css" rel="stylesheet">-->
		
	</head>
	
	<script>
		$(document).ready( function () {
	    	$('#edulistTable').DataTable();
		} );
	</script>
	
	<body>
	    <nav class="navbar navbar-expand bg-secondary fixed-top text-uppercase" id="mainNav">
	      <div class="container">
	        <a class="hanna navbar-brand js-scroll-trigger" href="#page-top">교육 리스트</a>
	        </div>
	    </nav>
	</body>
	<body>
		<div class="container">
			<table id="edulistTable" class="display" style="width:100%">
				<thead>
					<tr>
						<th>교육구분</th>
						<th>대분류</th>
						<th>소분류</th>
						<th>교육명</th>
						<th>교육시간</th>
						<th>신청시작일</th>
						<th>신청마감일</th>
						<th>교육시작일</th>
						<th>교육종료일</th>
						<th>교육비</th>
						<th>교육기관</th>
						<th>교육장소</th>
						<th>환급여부</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="edulist" items="${edu_list}" varStatus="status">
						<tr>
							<th>${edulist.high_cls}</th>
							<th>${edulist.mid_cls}</th>
							<th>${edulist.low_cls}</th>
							<th>${edulist.course_nm}</th>
							<th>${edulist.edu_hour}</th>
							<th>${edulist.reg_st_dt}</th>
							<th>${edulist.reg_ed_dt}</th>
							<th>${edulist.edu_st_dt}</th>
							<th>${edulist.edu_ed_dt}</th>
							<th>${edulist.edu_cost}</th>
							<th>${edulist.org_nm}</th>
							<th>${edulist.loc}</th>
							<th>${edulist.refund_yn}</th>
						</tr>
					</c:forEach>
				</tbody>					
				<tfoot>
					<tr>
						<th>교육구분</th>
						<th>대분류</th>
						<th>소분류</th>
						<th>교육명</th>
						<th>교육시간</th>
						<th>신청시작일</th>
						<th>신청마감일</th>
						<th>교육시작일</th>
						<th>교육종료일</th>
						<th>교육비</th>
						<th>교육기관</th>
						<th>교육장소</th>
						<th>환급여부</th>
					</tr>
				</tfoot>
			</table>
		</div>
	</body>
</html>