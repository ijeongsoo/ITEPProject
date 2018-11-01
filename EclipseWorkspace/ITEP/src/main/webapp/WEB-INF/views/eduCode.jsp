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
          <div class="col-lg-12" style=" float: left; width: 91%;">
            <h3 class="page-header hanna">교육코드관리  <br> <img width="120px" height="10px" src="resources/admin_page_resource/img/substract.png" alt=""></h3>
          </div>
          <div class="hanna" style=" float: right; width: 9%; padding-top: 30px; padding-right: 20px" >
			<button class="btn btn-primary2" onclick="saveCode()"><img width="25px" src="resources/admin_page_resource/img/verified.png" style="padding-right:7px;" alt="">저장</button>
		  </div>
          
        </div>
		</section>
		
		<div style=" float: left; width: 45%; padding-right: 10px; padding-left: 20px">
			<div style="float: left; width:82%">
				<h3 class="hanna" style="font-size: 20px">교육기관코드 </h3>
			</div>
			<div class="hanna" style="float: right; width:18% ;padding-top: 7px">
				<input id="orgNew" type="button" value="+신규" style="float: right;" onclick="addRowClick(this)"/>
			</div>
			<div id="orgGrid">
			</div>
			<br/>
			<div style="float: left; width:82%">
				<h3 class="hanna" style="font-size: 20px">대분류코드</h3>
			</div>
			<div class="hanna" style="float: right; width:18% ;padding-top: 7px">
				<input id="highNew" type="button" value="+신규" style="float: right;" onclick="addRowClick(this)"/>
			</div>
			<div id="highGrid">
			</div>
			<br/>
			<div style="float: left; width:82%">
				<h3 class="hanna" style="font-size: 20px">중분류코드</h3>
			</div>
			<div class="hanna" style="float: right; width:18% ;padding-top: 7px">
				<input id="midNew" type="button" value="+신규" style="float: right;" onclick="addRowClick(this)"/>
			</div>
			<div id="midGrid">
			</div>
		</div>
			
		<div style=" float: left; width: 55%; padding-left: 10px; padding-right: 20px">
			<div style="float: left; width:86%">
				<h3 class="hanna" style="font-size: 20px">소분류코드</h3>
			</div>
			<div class="hanna" style="float: right; width:14% ;padding-top: 7px">
				<input id="lowNew" type="button" value="+신규" style="float: right;" onclick="addRowClick(this)"/>
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
		el : $('#orgGrid'),
		scrollX : true,
		scrollY : true,
		columns : [ {
			title : '기관코드',
			name : 'org_cd',
			onBeforeChange : function(ev) {
				console.log('Before change:' + ev);
			},
			onAfterChange : function(ev) {
				console.log('After change:' + ev);
			},
			width : 'auto',
			minWidth : 150
		}, {
			title : '기관명',
			name : 'org_nm',
			onBeforeChange : function(ev) {
				console.log('Before change:' + ev);
			},
			onAfterChange : function(ev) {
				console.log('After change:' + ev);
			},
			editOptions : {
				type : 'text',
				useViewMode : true
			},
			width : 'auto',
			minWidth : 400
		} ]
	});

	var highGrid = new tui.Grid({
		el : $('#highGrid'),
		scrollX : true,
		scrollY : true,
		columns : [ {
			title : '대분류코드',
			name : 'high_cls_cd',
			onBeforeChange : function(ev) {
				console.log('Before change:' + ev);
			},
			onAfterChange : function(ev) {
				console.log('After change:' + ev);
			},
			width : 'auto',
			minWidth : 150
		}, {
			title : '대분류명',
			name : 'high_cls_nm',
			onBeforeChange : function(ev) {
				console.log('Before change:' + ev);
			},
			onAfterChange : function(ev) {
				console.log('After change:' + ev);
			},
			editOptions : {
				type : 'text',
				useViewMode : true
			},
			width : 'auto',
			minWidth : 400
		} ]
	});

	var midGrid = new tui.Grid({
		el : $('#midGrid'),
		scrollX : true,
		scrollY : true,
		columns : [ {
			title : '중분류코드',
			name : 'mid_cls_cd',
			onBeforeChange : function(ev) {
				console.log('Before change:' + ev);
			},
			onAfterChange : function(ev) {
				console.log('After change:' + ev);
			},
			width : 'auto',
			minWidth : 150
		}, {
			title : '중분류명',
			name : 'mid_cls_nm',
			onBeforeChange : function(ev) {
				console.log('Before change:' + ev);
			},
			onAfterChange : function(ev) {
				console.log('After change:' + ev);
			},
			editOptions : {
				type : 'text',
				useViewMode : true
			},
			width : 'auto',
			minWidth : 400
		} ]
	});

	var lowGrid = new tui.Grid({
		el : $('#lowGrid'),
		scrollX : true,
		scrollY : true,
		columns : [ {
			title : '소분류코드',
			name : 'low_cls_cd',
			onBeforeChange : function(ev) {
				console.log('Before change:' + ev);
			},
			onAfterChange : function(ev) {
				console.log('After change:' + ev);
			},
			width : 'auto',
			minWidth : 150
		}, {
			title : '소분류명',
			name : 'low_cls_nm',
			onBeforeChange : function(ev) {
				console.log('Before change:' + ev);
			},
			onAfterChange : function(ev) {
				console.log('After change:' + ev.data);
			},
			editOptions : {
				type : 'text',
				useViewMode : true
			},
			width : 'auto',
			minWidth : 300
		}, {
			title : '상위중분류',
			name : 'mid_cls_cd',
			onBeforeChange : function(ev) {
				console.log('Before change:' + ev);
			},
			onAfterChange : function(ev) {
				console.log('After change:' + ev);
			},
			editOptions : {
				type : 'select',
				listItems : ${midCombo},
				useViewMode : true
			},
			width : 'auto',
			minWidth : 150
		} ]
	});
	
	// DB 데이터 세팅
	orgGrid.setData(${orgList});
	highGrid.setData(${highList});
	midGrid.setData(${midList});
	lowGrid.setData(${lowList});
	
	// 신규 행 버튼
	function addRowClick(btn) { 
		console.log("btn name: ", btn.id);
		switch(btn.id) {
		case 'orgNew':
			orgGrid.appendRow();
			var maxIndex = orgGrid.getRowCount()-1;
			var maxValue = Number(orgGrid.getRowAt(maxIndex-1).org_cd) + 1;
			if(maxValue < 10)
				orgGrid.setValue(maxIndex, "org_cd", "0" + maxValue);
			else
				orgGrid.setValue(maxIndex, "org_cd", maxValue);			
			break;
		case 'highNew':
			var maxIndex = highGrid.getRowCount();
			var maxValue = Number(highGrid.getRowAt(maxIndex-1).high_cls_cd) + 1;
			if(maxValue < 10) {
				highGrid.appendRow();
				highGrid.setValue(maxIndex, "high_cls_cd", maxValue);
			}
			else {
				alert("대분류는 10보다 클 수 없습니다.");
			}
			break;
		case 'midNew':
			midGrid.appendRow();
			var maxIndex = midGrid.getRowCount()-1;
			var maxValue = Number(midGrid.getRowAt(maxIndex-1).mid_cls_cd) + 1;
			if(maxValue < 10)
				midGrid.setValue(maxIndex, "mid_cls_cd", "0" + maxValue);
			else
				midGrid.setValue(maxIndex, "mid_cls_cd", maxValue);
			break;
		case 'lowNew':
			lowGrid.appendRow();
			var maxIndex = lowGrid.getRowCount()-1;
			var maxValue = Number(lowGrid.getRowAt(maxIndex-1).low_cls_cd) + 1;
			if(maxValue < 10)
				lowGrid.setValue(maxIndex, "low_cls_cd", "0" + maxValue);
			else
				lowGrid.setValue(maxIndex, "low_cls_cd", maxValue);
			break;
		default:
			break;
		}
	}
	
	// 저장 버튼
	function saveCode() {
		for (var i = 0; i < orgGrid.getRowCount(); i++) { // 빈값 제거 기능
			if (orgGrid.getRowAt(i).org_nm == "") {
				orgGrid.removeRow(orgGrid.getRowAt(i--));
			}
		}
		for (var i = 0; i < highGrid.getRowCount(); i++) { // 빈값 제거 기능
			if (highGrid.getRowAt(i).high_cls_nm == "") {
				highGrid.removeRow(highGrid.getRowAt(i--));
			}
		}
		for (var i = 0; i < midGrid.getRowCount(); i++) { // 빈값 제거 기능
			if (midGrid.getRowAt(i).mid_cls_nm == "") {
				midGrid.removeRow(midGrid.getRowAt(i--));
			}
		}
		for (var i = 0; i < lowGrid.getRowCount(); i++) { // 빈값 제거 기능
			if (lowGrid.getRowAt(i).low_cls_nm == "") {
				lowGrid.removeRow(lowGrid.getRowAt(i--));
			}
		}

		// json 변환
		var ecd002m = JSON.stringify(orgGrid.getRows());
		var ecd005m = JSON.stringify(highGrid.getRows());
		var ecd006m = JSON.stringify(midGrid.getRows());
		var ecd007m = JSON.stringify(lowGrid.getRows());

		// post 전송
		$.ajax({
			'url' : "saveCode",
			'data' : {
				'ecd002m' : ecd002m,
				'ecd005m' : ecd005m,
				'ecd006m' : ecd006m,
				'ecd007m' : ecd007m
			},
			'type' : "POST",
			'success' : function(data) {
				location.href = "eduCode";
			}
		});
	}
</script>
</html>