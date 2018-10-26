<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

<title>교육등록</title>

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
	<link href="<%=application.getContextPath()%>/resources/css/hannafont.css" rel="stylesheet" type="text/css">
	
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

<!-- =======================================================
    Theme Name: NiceAdmin
    Theme URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
    Author: BootstrapMade
    Author URL: https://bootstrapmade.com
  ======================================================= -->
<style>
.uploadContent{
width:700px;
background:#fff;
margin: auto;
}

</style>
</head>

<script>
	$(document).ready(function() {
		$('#load').hide();
		$('#excelFileBtn').attr('disable', false);
		$('#submitBtn').attr('disable', false);
		$('#excelFile').change(function() {
			var fn = document.getElementById('excelFile').value;
			$('#filePath').html(fn);
		});
		$('#excel').submit(function() {
			$('#load').show();
			$('#excelFileBtn').attr('disable', true);
			$('#submitBtn').attr('disable', true);
			return true;
		});
	});
</script>
<body>
	<!-- 엑셀 업로드 화면 구성 20181015 이기석 -->

	<!--main content start-->
	<section id="excel-main">
    <section class="wrapper">
        <!--overview start-->
        <div class="row">
          <div class="col-lg-12">
            <h3 class="page-header hanna">교육등록 </h3>
          </div>
        </div>
		</section>
			<!-- page start-->
			<div class="uploadContent"
				style="height: 340px; width: 500px; overflow: auto; padding: 20px;">
				<a href="<%=application.getContextPath()%>/resources/admin_page_resource/download/sample.xlsx">양식 다운</a>
				<form id="excel" action="uploadFile" method="post" enctype="multipart/form-data">
					<div class="input-group col-lg-12 ">
						<label> 
							<span>파일경로: </span> 
							<span id="filePath"> 파일 미선택</span>
						</label> 
						<label for="excelFile" id="excelFileBtn"  class="col-lg-12 btn btn-default" onclick=>
							엑셀 추가
						</label>
						<input type="file" id=excelFile style="visibility: hidden" name="excelFile" />
					</div>

					<button id="submitBtn" type="submit" class="btn btn-primary">등록</button>

					<div id="load" style="text-align: center;">
						<img src="<%=application.getContextPath()%>/resources/admin_page_resource/img/loading.gif" alt="loading"/>
					</div>
				</form>

			</div>



			<!-- 결과 출력 -->
			<!-- page end-->
	</section>

</body>
</html>