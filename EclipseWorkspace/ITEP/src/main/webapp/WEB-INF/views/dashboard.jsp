<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
  <script	src="<%=application.getContextPath()%>/resources/main_page_resource/js/jquery.js"></script>
  <!-- Bootstrap CSS -->
  <link href="<%=application.getContextPath()%>/resources/admin_page_resource/css/bootstrap.min.css" rel="stylesheet">
  <!-- bootstrap theme -->
  <link href="<%=application.getContextPath()%>/resources/admin_page_resource/css/bootstrap-theme.css" rel="stylesheet">
  <!--external css-->
  <link href="<%=application.getContextPath()%>/resources/DataTables-1.10.18/css/jquery.dataTables.min.css" rel="stylesheet" type="text/css"/>
  <script src="<%=application.getContextPath()%>/resources/DataTables-1.10.18/js/jquery.dataTables.min.js" type="text/javascript"></script>  
  <!-- font icon -->
  <link href="<%=application.getContextPath()%>/resources/admin_page_resource/css/elegant-icons-style.css" rel="stylesheet" />
  <link href="<%=application.getContextPath()%>/resources/admin_page_resource/css/font-awesome.min.css" rel="stylesheet" />
  <!-- full calendar css-->
  <link href="<%=application.getContextPath()%>/resources/admin_page_resource/assets/fullcalendar/fullcalendar/bootstrap-fullcalendar.css" rel="stylesheet" />
  <link href="<%=application.getContextPath()%>/resources/admin_page_resource/assets/fullcalendar/fullcalendar/fullcalendar.css" rel="stylesheet" />
  <!-- easy pie chart-->
  <link href="<%=application.getContextPath()%>/resources/admin_page_resource/assets/jquery-easy-pie-chart/jquery.easy-pie-chart.css" rel="stylesheet" type="text/css" media="screen" />
  <!-- owl carousel -->
  <link rel="stylesheet" href="<%=application.getContextPath()%>/resources/admin_page_resource/css/owl.carousel.css" type="text/css">
  <link href="<%=application.getContextPath()%>/resources/admin_page_resource/css/jquery-jvectormap-1.2.2.css" rel="stylesheet">
  <!-- Custom styles -->
  <link rel="stylesheet" href="<%=application.getContextPath()%>/resources/admin_page_resource/css/fullcalendar.css">
  <link href="<%=application.getContextPath()%>/resources/admin_page_resource/css/widgets.css" rel="stylesheet">
  <link href="<%=application.getContextPath()%>/resources/admin_page_resource/css/style.css" rel="stylesheet">
  <link href="<%=application.getContextPath()%>/resources/admin_page_resource/css/style-responsive.css" rel="stylesheet" />
  <link href="<%=application.getContextPath()%>/resources/admin_page_resource/css/xcharts.min.css" rel=" stylesheet">
  <link href="<%=application.getContextPath()%>/resources/admin_page_resource/css/jquery-ui-1.10.4.min.css" rel="stylesheet">
	<!-- 테이블 자동 검색을 위한 css css파일 line 75 수정  -->
  <link href="<%=application.getContextPath()%>/resources/main_page_resource/css/freelancer.min.css" rel="stylesheet">  

	<!-- chart.js  -->
  <script src="<%=application.getContextPath()%>/resources/js/Chart.min.js"></script>  
  <script src="//cdnjs.cloudflare.com/ajax/libs/Chart.js/0.2.0/Chart.min.js"></script>

  <!-- =======================================================
    Theme Name: NiceAdmin
    Theme URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
    Author: BootstrapMade
    Author URL: https://bootstrapmade.com
  ======================================================= -->
</head>

	
<body>
 <div class="row">
      <div class="col-lg-12">
        <h3 class="page-header"><i class="fa fa-laptop"></i>대시보드</h3>
        <ol class="breadcrumb">
          <li><i class="fa fa-home"></i><a href="home">Home</a></li>
          <li><i class="fa fa-laptop"></i>대시보드</li>
        </ol>
      </div>
    </div>
    <div>
		<h3>안녕하세요 ! ${empJoinedDep_info.krn_brm} ${empJoinedDep_info.emm} 관리자님♥</h3>
	</div>    
    <div>
    	<h3>올해 교육 신청자 : </h3>
    	<h3>이번달 교육 신청자 : </h3>
    </div>
    <div  style="float:left;width:50%;height:50%;background-Color:#F2FFFF">
  		<canvas id="myChart_1" width="600" height="400"></canvas>
    </div>
    <div style="clear:right;float:right;width:50%;height:50%;background-Color:#FFF2FF">  
  		<canvas id="myChart_2" width="600" height="400"></canvas>
    </div>
    <div  style="float:left;width:50%;height:50%;background-Color:#FFFFF2">
  		<canvas id="myChart_3" width="600" height="400"></canvas>
    </div>
    <div  style="clear:right;float:right;width:50%;height:50%;background-Color:#EFEFEF">		
  		<canvas id="myChart_4" width="600" height="400"></canvas>
    </div>            
	
<script>
	var data_1 = {
		labels: ["IT기획부", "IT정보부", "IT수신카드부", "IT여신외환부", "IT채널부", "IT시스템운영팀"],
		datasets: [
			{
				label : "당월 부서별 교육 수강 현황",
				borderColor:"rgb(255, 99, 132)",//["rgb(255, 99, 132)","rgb(255, 159, 64)","rgb(255, 205, 86)","rgb(75, 192, 192)","rgb(54, 162, 235)","rgb(153, 102, 255)"],		
				fillColor:"rgba(255, 99, 132, 0.2)",//["rgba(255, 99, 132, 0.2)","rgba(255, 159, 64, 0.2)","rgba(255, 205, 86, 0.2)","rgba(75, 192, 192, 0.2)","rgba(54, 162, 235, 0.2)","rgba(153, 102, 255, 0.2)"],				
				data: [12, 21, 8, 12, 15, 6],
				fill:false,
			}
		]
	};
	var options = {
		responsive: true,
		title: {
			display: true,
			text: '당월 부서별 교육 수강 현황'
		},
		scales: {
	        xAxes: [{
	            gridLines: {
	                offsetGridLines: true
	            }
	        }]
	    } 
	};
	var ctx_1 = $('#myChart_1').get(0).getContext('2d');
	var myBarChart = new Chart(ctx_1).Bar(data_1, options);
	
	var data_2 = {
	        labels: ["월","화","수","목","금","토","일"],
	        datasets: [
	            {
	                label: "",
	                fillColor: "rgba(220,220,220,0.2)",
	                strokeColor: "rgba(220,220,220,1)",
	                pointColor: "rgba(220,220,220,1)",
	                pointStrokeColor: "#fff",
	                pointHighlightFill: "#fff",
	                pointHighlightStroke: "rgba(220,220,220,1)",
	                data: [2, 3, 5, 7, 11, 13, 17]
	            },
	            {
	                label: "",
	                fillColor: "rgba(151,187,205,0.2)",
	                strokeColor: "rgba(151,187,205,1)",
	                pointColor: "rgba(151,187,205,1)",
	                pointStrokeColor: "#fff",
	                pointHighlightFill: "#fff",
	                pointHighlightStroke: "rgba(151,187,205,1)",
	                data: [0, 1, 1, 2, 3, 5, 8]
	            }
	        ]
	    };

	    var ctx = document.getElementById("myChart_2").getContext("2d");
	    var options_2 = { };
	    var lineChart = new Chart(ctx).Line(data_2, options_2);

	    var data_3 = [
	    	{
	    		value: 300,
	    		color: 'rgba(255, 159, 64, 0.2)',
	    		highlight: "#FF5A5E",
	    		label: "Red"
	    	},
	    	{
	    		value: 50,
	    		color: 'rgba(255, 205, 86, 0.2)',
	    		highlight: "#5AD3D1",
	    		label: "Green"
	    	},
	    	{
	    		value: 100,
	    		color: 'rgba(75, 192, 192, 0.2)',
	    		highlight: "#FFC870",
	    		label: "Yellow"
	    	}
	    ]

	    var ctx_3 = document.getElementById("myChart_3").getContext("2d");
	    var options_3 = { responsive: true };
	    var myPieChart = new Chart(ctx_3).Pie(data_3, options_3);

	    
	    var ctx_4 = document.getElementById("myChart_4").getContext("2d");
	    var options_4 = { responsive: true };
	    var myPieChart = new Chart(ctx_4).Doughnut(data_3, options_4);
		
</script>

    
</body>

</html>