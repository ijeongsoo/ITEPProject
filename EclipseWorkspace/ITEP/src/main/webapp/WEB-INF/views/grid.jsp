<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>SlickGrid example 3: Editing</title>
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/resources/slickgrid/slick.grid.css"
	type="text/css" />
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/resources/slickgrid/css/smoothness/jquery-ui-1.8.16.custom.css"
	type="text/css" />
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/resources/slickgrid/examples/examples.css"
	type="text/css" />
<style>
.cell-title {
	font-weight: bold;
}

.cell-effort-driven {
	text-align: center;
}
</style>
</head>
<body>
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
			for (var i = 0; i < 500; i++) {
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

	<div style="position: relative">
		<div style="width: 600px;">
			<div id="myGrid" style="width: 100%; height: 500px;"></div>
		</div>
	</div>

</body>
</html>