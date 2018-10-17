<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="kr.co.ibk.itep.service.ExcelManager" %>
<!DOCTYPE html>
<html lang="en">
<%
//여기해야함!!!
	String execute = request.getParameter("execute");
	String filePath = request.getParameter("fileAttach");
	ExcelManager em = new ExcelManager(filePath);
	String course_cd = "1";//em.getEduList().get(0).getCOURSE_CD();
%>
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
<script type="text/javascript">
function registerFile(){
	   $('#fileForm').submit();
	   request.setParameter("execute", "실행완료");
}
</script>
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
        
        <div style="height: 340px;width: 380px; overflow: auto;padding:20px;">
  		<form id="fileForm" name="fileForm" method="post" action="eduUploadExcel" enctype="multipart/form-data">
	   		<table border="1">
	      		<tbody id="fileAttachBody">
		      		<tr>
		        		<td>
		        			<input type="hidden" name="execute" value="전송완료"/>
		            		<input type="file" id="fileAttach" name="fileAttach" />
		            		<button onclick="registerFile();">Excel파일읽기</button>
		        		</td>
		      		</tr>
	      		</tbody>
	   		</table>
  		</form>
		</div>
		
		<!-- 결과 출력 -->
		<%
			if(execute == null)
				execute = "";
		%>
		<%=execute%>
		<%=course_cd%>
        <!-- page end-->
      </section>
    </section>
   
</body>
</html>