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
 
  <link href="<%=application.getContextPath()%>/resources/main_page_resource/sub/css/style.css" rel="stylesheet">

	</head>
	
	<script>
		$(document).ready( function () {
	    	$('#edulistTable').DataTable();
		} );
	</script>
  
	<script>
	function openModal(high_cls_nm){
		$('#detailInfoModal').modal({
			keyboard:true,
			backdrop:"static"
		});
	};
	</script>


	<body>
	    <nav class="navbar navbar-expand bg-secondary fixed-top text-uppercase" id="mainNav">
	      <div class="container">
	        <a class="hanna navbar-brand js-scroll-trigger">교육 리스트</a>
	        </div>
	    </nav><br>

		<!-- Table 출력 -->
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
						<tr data-toggle="modal" data-id="edu_list.high_cls_nm" title="Add this item" class="popupModal" href="#detailInfoModal">
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
		
		
		<!-- Modal -->
		<div class="modal fade" id="detailInfoModal" role="dialog">
			<div class="modal-dialog">
		
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Modal Header</h4>
				</div>
				<div class="modal-body">
					<p>Some text in the modal.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
	      	</div>
	      	</div>
		</div>
	</body>
</html>