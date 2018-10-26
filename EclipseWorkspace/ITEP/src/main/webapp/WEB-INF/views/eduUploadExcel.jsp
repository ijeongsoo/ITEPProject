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

<title>교육등록</title>


<link rel="stylesheet"
	href="<%=application.getContextPath()%>/resources/slickgrid/slick.grid.css"
	type="text/css" />
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/resources/slickgrid/css/smoothness/jquery-ui-1.8.16.custom.css"
	type="text/css" />
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/resources/slickgrid/examples/examples.css"
	type="text/css" />

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
	
<!-- 슬릭 그리드 스타일 추가 -->

<style>
.cell-title {
	font-weight: bold;
}

.cell-effort-driven {
	text-align: center;
}
</style>

<!-- 슬릭 그리드 스타일 끝 -->

<script src="<%=application.getContextPath()%>/resources/jquery/jquery-3.2.1.min.js" type="text/javascript"></script>

<!-- =======================================================
    Theme Name: NiceAdmin
    Theme URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
    Author: BootstrapMade
    Author URL: https://bootstrapmade.com
  ======================================================= -->
</head>

<!-- 슬릭 그리드 스크립트 추가 -->

	<script
		src="<%=application.getContextPath()%>/resources/slickgrid/lib/firebugx.js"></script>

	<script
		src="<%=application.getContextPath()%>/resources/slickgrid/lib/jquery-1.7.min.js"></script>
	<script
		src="<%=application.getContextPath()%>/resources/slickgrid/lib/jquery-ui-1.8.16.custom.min.js"></script>
	<script
		src="<%=application.getContextPath()%>/resources/slickgrid/lib/jquery.event.drag-2.2.js"></script>

	<script
		src="<%=application.getContextPath()%>/resources/slickgrid/slick.core.js"></script>
	<script
		src="<%=application.getContextPath()%>/resources/slickgrid/plugins/slick.cellrangedecorator.js"></script>
	<script
		src="<%=application.getContextPath()%>/resources/slickgrid/plugins/slick.cellrangeselector.js"></script>
	<script
		src="<%=application.getContextPath()%>/resources/slickgrid/plugins/slick.cellselectionmodel.js"></script>
	<script
		src="<%=application.getContextPath()%>/resources/slickgrid/slick.formatters.js"></script>
	<script
		src="<%=application.getContextPath()%>/resources/slickgrid/slick.editors.js"></script>
	<script
		src="<%=application.getContextPath()%>/resources/slickgrid/slick.grid.js"></script>

<!-- 슬릭 그리드 스크립트 끝 -->

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

<script>
	function requiredFieldValidator(value) {
		if (value == null || value == undefined || !value.length) {
			return {
				valid : false,
				msg : "This is a required field"
			};
		} else {
			return {
				valid : true,
				msg : null
			};
		}
	}

	var grid;
	var data = [];
	var columns = [ {
		id : "title",
		name : "Title",
		field : "title",
		width : 120,
		cssClass : "cell-title",
		editor : Slick.Editors.Text,
		validator : requiredFieldValidator
	}, {
		id : "desc",
		name : "Description",
		field : "description",
		width : 100,
		editor : Slick.Editors.LongText
	}, {
		id : "duration",
		name : "Duration",
		field : "duration",
		editor : Slick.Editors.Text
	}, {
		id : "%",
		name : "% Complete",
		field : "percentComplete",
		width : 80,
		resizable : false,
		formatter : Slick.Formatters.PercentCompleteBar,
		editor : Slick.Editors.PercentComplete
	}, {
		id : "start",
		name : "Start",
		field : "start",
		minWidth : 60,
		editor : Slick.Editors.Date
	}, {
		id : "finish",
		name : "Finish",
		field : "finish",
		minWidth : 60,
		editor : Slick.Editors.Date
	}, {
		id : "effort-driven",
		name : "Effort Driven",
		width : 80,
		minWidth : 20,
		maxWidth : 80,
		cssClass : "cell-effort-driven",
		field : "effortDriven",
		formatter : Slick.Formatters.Checkmark,
		editor : Slick.Editors.Checkbox
	} ];
	var options = {
		editable : true,
		enableAddRow : true,
		enableCellNavigation : true,
		asyncEditorLoading : false,
		autoEdit : false
	};

	$(function() {
		for (var i = 0; i < 10; i++) {
			var d = (data[i] = {});

			d["title"] = "Task " + i;
			d["description"] = "This is a sample task description.\n  It can be multiline";
			d["duration"] = "5 days";
			d["percentComplete"] = Math.round(Math.random() * 100);
			d["start"] = "01/01/2009";
			d["finish"] = "01/05/2009";
			d["effortDriven"] = (i % 5 == 0);
		}

		grid = new Slick.Grid("#myGrid", data, columns, options);

		grid.setSelectionModel(new Slick.CellSelectionModel());

		grid.onAddNewRow.subscribe(function(e, args) {
			var item = args.item;
			grid.invalidateRow(data.length);
			data.push(item);
			grid.updateRowCount();
			grid.render();
		});
	})
</script>

<body>
	<!-- 엑셀 업로드 화면 구성 20181015 이기석 -->
	
	<!--main content start-->
	<section id="excel-main">
		<section class="wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h3 class="page-header" style="color: #333333">
						<i class="fa fa fa-bars"></i> 교육등록
					</h3>
				</div>
			</div>
			<!-- page start-->
			
			<!-- 슬릭 그리드 영역 -->
			
			<div style="position: relative">
				<div style="width: 1200px;">
					<div id="myGrid" style="width: 100%; height: 500px;"></div>
				</div>
			</div>
			
			<!-- 엑셀 업로드 구역 -->
			<div
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
	</section>

</body>
</html>