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

<title>교육코드관리</title>

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
      <script src="<%=application.getContextPath()%>/resources/bootstrap-3.3.7/js/bootstrap.min.js" type="text/javascript"></script>
      <link href="<%=application.getContextPath()%>/resources/DataTables-1.10.18/css/jquery.dataTables.min.css" rel="stylesheet" type="text/css"/>
      <script src="<%=application.getContextPath()%>/resources/DataTables-1.10.18/js/jquery.dataTables.min.js" type="text/javascript"></script>

<!-- tui 그리드 css -->
<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/resources/tui.grid-3.2.0/css/tui-example-style.css" />
<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/resources/tui.grid-3.2.0/dist/tui-grid.css" />

</head>


<!-- 넘어오는거 확인 -->
<body>
	<!-- 교육코드관리 화면 구성 20181030 이기석 -->
	<section id="edu-code">
		<section class="wrapper">
        <!--overview start-->
        <div class="row">
          <div class="col-lg-12">
            <h3 class="page-header hanna">교육코드관리  <br> <img width="120px" height="10px" src="resources/admin_page_resource/img/substract.png" alt=""></h3>
          </div>
        </div>
		</section>
		
		<div style=" float: left; width: 50%; padding-right: 10px; padding-left: 20px">
			<div style="float: left; width:84%">
				<h3 class="hanna" style="font-size: 20px">교육기관코드 </h3>
			</div>
			<div style="float: right; width:7% ;padding-top: 7px">
				<button style="float: right;">신규</button>
			</div>
			<div style="float: right; width:7% ;padding-top: 7px">
				<button style="float: right;">저장</button>
			</div>
			<div id="orgGrid">
			</div>
			<br/>
			<div style="float: left; width:84%">
				<h3 class="hanna" style="font-size: 20px">대분류코드</h3>
			</div>
			<div style="float: right; width:7% ;padding-top: 7px">
				<button style="float: right;">신규</button>
			</div>
			<div style="float: right; width:7% ;padding-top: 7px">
				<button style="float: right;">저장</button>
			</div>
			<div id="highGrid">
			</div>
		</div>
			
		<div style=" float: left; width: 50%; padding-left: 10px; padding-right: 20px">
			<div style="float: left; width:84%">
				<h3 class="hanna" style="font-size: 20px">중분류코드</h3>
			</div>
			<div style="float: right; width:7% ;padding-top: 7px">
				<button style="float: right;">신규</button>
			</div>
			<div style="float: right; width:7% ;padding-top: 7px">
				<button style="float: right;">저장</button>
			</div>
			<div id="midGrid">
			</div>
			<br/>
			<div style="float: left; width:84%">
				<h3 class="hanna" style="font-size: 20px">소분류코드</h3>
			</div>
			<div style="float: right; width:7% ;padding-top: 7px">
				<button style="float: right;">신규</button>
			</div>
			<div style="float: right; width:7% ;padding-top: 7px">
				<button style="float: right;">저장</button>
			</div>
			<div id="lowGrid">
			</div>
		</div>
		
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

  var orgGrid = new tui.Grid({
      el: $('#orgGrid'),
      scrollX: true,
      scrollY: true,
      columns: [
    	  {
              title: '기관코드',
              name: 'org_cd',
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
              minWidth: 150
          },
          {
              title: '기관명',
              name: 'org_nm',
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
              minWidth: 450
          }
      ]
  });
  
  var highGrid = new tui.Grid({
      el: $('#highGrid'),
      scrollX: true,
      scrollY: true,
      columns: [
    	  {
              title: '대분류코드',
              name: 'high_cls_cd',
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
              minWidth: 150
          },
          {
              title: '대분류명',
              name: 'org_nm',
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
              minWidth: 450
          }
      ]
  });
  
  var midGrid = new tui.Grid({
      el: $('#midGrid'),
      scrollX: true,
      scrollY: true,
      columns: [
    	  {
              title: '중분류코드',
              name: 'mid_cls_cd',
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
              minWidth: 150
          },
          {
              title: '중분류명',
              name: 'mid_cls_nm',
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
              minWidth: 450
          }
      ]
  });
  
  var lowGrid = new tui.Grid({
      el: $('#lowGrid'),
      scrollX: true,
      scrollY: true,
      columns: [
    	  {
              title: '소분류코드',
              name: 'low_cls_cd',
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
              minWidth: 150
          },
          {
              title: '소분류명',
              name: 'low_cls_nm',
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
              title: '상위중분류',
              name: 'mid_cls_cd',
              onBeforeChange: function(ev){
                  console.log('Before change:' + ev);
              },
              onAfterChange: function(ev){
                  console.log('After change:' + ev);
              },
              editOptions: {
                  type: 'select',
                  listItems: [],
                  useViewMode: true
              },
              width: 'auto',
              minWidth: 150
          }
      ]
  });
  
	//입력칸 생성
  for(var i=0; i<5; i++) {	
	  orgGrid.appendRow();
	  highGrid.appendRow();
	  midGrid.appendRow();
	  lowGrid.appendRow();
  }
	function addRowClick() {	//행추가 
		orgGrid.appendRow();
	}
	
	function saveOrgGrid() {
		console.log("dddd: ", orgGrid.getRows());
		for(var i=0; i<orgGrid.getRowCount(); i++) {	// 빈값 제거 기능
			if(orgGrid.getRowAt(i).org_cd == ""){
				orgGrid.removeRow(orgGrid.getRowAt(i));
				i--;
			}
		}
		console.log("dddd: ", orgGrid.getRows());
		
		// 정합성 검사
		var ecd002m = JSON.stringify(orgGrid.getRows());
		
		// post 전송
		$.ajax({
			'url' : "saveOrgCode",
			'data' : {
				'ecd002m' : ecd002m
			},
			'type' : "POST",
			'success' : function(data) {
				location.href = "eduCode";
			}
		});
	}
</script>
</html>