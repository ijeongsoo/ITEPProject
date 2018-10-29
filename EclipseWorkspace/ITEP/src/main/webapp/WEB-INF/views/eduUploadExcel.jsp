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
	
<!-- tui 그리드 css -->
<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/resources/tui.grid-3.2.0/css/tui-example-style.css" />
<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/resources/tui.grid-3.2.0/dist/tui-grid.css" />
<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/resources/tui.grid-3.2.0/css/tui-date-picker.css" />
	

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
			
			<div>
				<button id="addRow" class="btn btn-primary" onclick="addRowClick()">행추가</button>
			</div>
			<!-- 그리드 영역 -->
			<div class="code-html contents">
				<div id="grid"></div>
			</div>
			<!-- 엑셀 업로드 구역 -->
			<div class="uploadContent"
				style="height: 200px; overflow: auto; padding: 20px;">
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

<!-- tui 그리드 스크립트  -->
<script type="text/javascript" src="<%=application.getContextPath()%>/resources/tui.grid-3.2.0/src/js/jquery.js"></script>
<script type="text/javascript" src="<%=application.getContextPath()%>/resources/tui.grid-3.2.0/src/js/underscore.js"></script>
<script type="text/javascript" src="<%=application.getContextPath()%>/resources/tui.grid-3.2.0/src/js/backbone.js"></script>
<script type="text/javascript" src="<%=application.getContextPath()%>/resources/tui.grid-3.2.0/src/js/tui-code-snippet.js"></script>
<script type="text/javascript" src="<%=application.getContextPath()%>/resources/tui.grid-3.2.0/src/js/tui-date-picker.js"></script>
<script type="text/javascript" src="<%=application.getContextPath()%>/resources/tui.grid-3.2.0/dist/tui-grid.js"></script>

<!-- tui 그리드 스크립트 -->
<script type="text/javascript" class="code-js">

  var grid = new tui.Grid({
      el: $('#grid'),
      scrollX: true,
      scrollY: true,
      columns: [
    	  {
              title: '기관명',
              name: 'org_cd',
              onBeforeChange: function(ev){
                  console.log('Before change:' + ev);
              },
              onAfterChange: function(ev){
                  console.log('After change:' + ev);
              },
              editOptions: {
                  type: 'select',
                  listItems: ${ecd002m},
                  useViewMode: true
              },
              width: 'auto',
              minWidth: 130
          },
          {
              title: '대분류',
              name: 'high_cls_cd',
              onBeforeChange: function(ev){
                  console.log('Before change:' + ev);
              },
              onAfterChange: function(ev){
                  console.log('After change:' + ev);
              },
              editOptions: {
                  type: 'select',
                  listItems: ${ecd005m},
                  useViewMode: true
              },
              width: 'auto',
              minWidth: 60
          },
          {
              title: '중분류',
              name: 'mid_cls_cd',
              onBeforeChange: function(ev){
                  console.log('Before change:' + ev);
              },
              onAfterChange: function(ev){
                  console.log('After change:' + ev);
              },
              editOptions: {
                  type: 'select',
                  listItems: ${ecd006m},
                  useViewMode: true
              },
              width: 'auto',
              minWidth: 100
          },
          {
              title: '소분류',
              name: 'low_cls_cd',
              onBeforeChange: function(ev){
                  console.log('Before change:' + ev);
              },
              onAfterChange: function(ev){
                  console.log('After change:' + ev);
              },
              editOptions: {
                  type: 'select',
                  listItems: ${ecd007m},
                  useViewMode: true
              },
              width: 'auto',
              minWidth: 120
          },
          {
              title: '교육명',	// 화면 제목
              name: 'course_nm',		// 키 이름
              onBeforeChange: function(ev){
                  console.log('Before change:' + ev);
              },
              onAfterChange: function(ev){
                  console.log('After change:' + ev);
              },
              editOptions: {	// 타입
                  type: 'text',
                  useViewMode: true
              },
              width: 'auto',
              minWidth: 200
          },
          {
              title: '교육시간',	// 화면 제목
              name: 'edu_hour',		// 키 이름
              onBeforeChange: function(ev){
                  console.log('Before change:' + ev);
              },
              onAfterChange: function(ev){
                  console.log('After change:' + ev);
              },
              editOptions: {	// 타입
                  type: 'text',
                  useViewMode: true
              },
              width: 'auto',
              minWidth: 60
          },
          {
	            title: '신청시작일',
	            name: 'reg_st_dt',
	            editOptions: {
	                type: 'text'
	            },
	            component: {
	                name: 'datePicker',
	                options: {
	                    date: new Date()
	                }
	            },
	              width: 'auto',
	              minWidth: 80
	      },
	      {
	            title: '신청종료일',
	            name: 'reg_ed_dt',
	            editOptions: {
	                type: 'text'
	            },
	            component: {
	                name: 'datePicker',
	                options: {
	                    date: new Date()
	                }
	            },
	              width: 'auto',
	              minWidth: 80
	      },
	      {
	            title: '교육시작일',
	            name: 'edu_st_dt',
	            editOptions: {
	                type: 'text'
	            },
	            component: {
	                name: 'datePicker',
	                options: {
	                    date: new Date()
	                }
	            },
	              width: 'auto',
	              minWidth: 80
	      },
	      {
	            title: '교육종료일',
	            name: 'edu_ed_dt',
	            editOptions: {
	                type: 'text'
	            },
	            component: {
	                name: 'datePicker',
	                options: {
	                    date: new Date()
	                }
	            },
	              width: 'auto',
	              minWidth: 80
	      },
          {
              title: '교육비용',
              name: 'edu_cost',
              onBeforeChange: function(ev){
                  console.log('Before change:' + ev);
                  ev.stop();
              },
              onAfterChange: function(ev){
                  console.log('After change:' + ev);
              },
              editOptions: {
                  type: 'text',
                  useViewMode: true
              },
              width: 'auto',
              minWidth: 70
          },
          {
              title: '교육장소',
              name: 'loc',
              onBeforeChange: function(ev){
                  console.log('Before change:' + ev);
              },
              onAfterChange: function(ev){
                  console.log('After change:' + ev);
              },
              editOptions: {
                  type: 'text',
                  useViewMode: true
              },
              width: 'auto',
              minWidth: 300
          },
          {
              title: '고용보험 환급여부',
              name: 'refund_yn',
              onBeforeChange: function(ev){
                  console.log('Before change:' + ev);
              },
              onAfterChange: function(ev){
                  console.log('After change:' + ev);
              },
              editOptions: {
                  type: 'radio',
                  listItems: [
                      { text: 'Y', value: 'y' },
                      { text: 'N', value: 'n' }
                  ],
                  useViewMode: true
              },
              copyOptions: {
                  useListItemText: true // when this option is used, the copy value is concatenated text
              },
              width: 'auto',
              minWidth: 150
          }
      ]
  });
  for(var i=0; i<5; i++) {	// 입력칸 생성
	  grid.appendRow();
  }
	function addRowClick() {	//행추가 
		grid.appendRow();
	}
</script>
</html>