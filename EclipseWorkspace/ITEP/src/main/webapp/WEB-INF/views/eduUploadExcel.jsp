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
  
  <script
		src="<%=application.getContextPath()%>/resources/admin_page_resource/js/jquery.js"></script>
  
  <!-- =======================================================
    Theme Name: NiceAdmin
    Theme URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
    Author: BootstrapMade
    Author URL: https://bootstrapmade.com
  ======================================================= -->
</head>
<body>
<!-- 엑셀 업로드 화면 구성 20181015 이기석 -->

	<!--main content start-->
    <section id="excel-main">
      <section class="wrapper">
        <div class="row">
          <div class="col-lg-12">
            <h3 class="page-header" style="color:#333333"><i class="fa fa fa-bars"></i> 교육등록 - 일괄Upload</h3>
            <br/>
          </div>
        </div>
        <!-- page start-->
        Page content goes here
        ${login_info.emn}
        <br/>
        
        <div style="height: 340px;width: 500px; overflow: auto;padding:20px;">
  		<form action="uploadFile" method="post" enctype="multipart/form-data">
			<div class="input-group col-lg-12 ">
				<label for="excelFile" id="excelFileBtn" class="col-lg-12 btn btn-default">
					<span class="glyphicon glyphicon-camera"></span> 엑셀 추가
				</label>
				<input type="file" id=excelFile style="visibility: hidden" name="excelFile"/>
			</div>
			<div class="modal-footer">
				<button type="submit" class="btn btn-primary">글쓰기</button>
			</div>
  		</form>
		</div>
		
		<!-- 결과 출력 -->
        <!-- page end-->
      </section>
    </section>
   
</body>
</html>