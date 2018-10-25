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
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.js"></script>

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
		<h3>안녕하세요! ${empJoinedDep_info.krn_brm}의 ${empJoinedDep_info.emm} 관리자님♥</h3>
	</div>    
    <div>
    	<h4>올해 교육 신청자 : 무슨 데이터 넣을까 추천 좀</h4>
    	<h4>이번달 교육 신청자 : 무슨 데이터 넣을까 추천 좀</h4>
    	<h3>밑에는 다 가짜 데이터입니당!(막대그래프만 진짜)</h3>
    </div>
    <div  style="padding:30px;float:left;width:50%;height:50%;background-Color:#F2FFFF">
  		<canvas id="myChart_1" width="300" height="300"></canvas>
    </div>
    <div style="padding:30px;clear:right;float:right;width:50%;height:50%;background-Color:#FFF2FF">  
  		<canvas id="myChart_2" width="300" height="300"></canvas>
    </div>
    <div  style="padding:30px;float:left;width:50%;height:50%;background-Color:#FFFFF2">
  		<canvas id="myChart_3" width="300" height="300"></canvas>
    </div>
    <div  style="padding:30px;clear:right;float:right;width:50%;height:50%;background-Color:#EFEFEF">		
  		<canvas id="myChart_4" width="300" height="300"></canvas>
    </div>            
	
<script>

	var ctx_bar = document.getElementById('myChart_1').getContext('2d');
	
	var chart = new Chart(ctx_bar, {
	    // The type of chart we want to create
	    type: 'bar',
	
	    // The data for our dataset
	    data: {
	        labels: ["IT기획부", "IT정보부", "IT수신카드부", "IT여신외환부", "IT채널부", "IT시스템운영팀"],
	        datasets: [{
	            label: "당월 부서별 교육 수강 현황",
	            backgroundColor: ["rgba(255, 99, 132, 0.2)","rgba(255, 159, 64, 0.2)","rgba(255, 205, 86, 0.2)",
	            				"rgba(75, 192, 192, 0.2)","rgba(54, 162, 235, 0.2)","rgba(153, 102, 255, 0.2)"],
	            borderColor: ["rgb(255, 99, 132)","rgb(255, 159, 64)","rgb(255, 205, 86)","rgb(75, 192, 192)",
	            			"rgb(54, 162, 235)","rgb(153, 102, 255)"],
	            data: ["${BrCount[0]}", "${BrCount[1]}", "${BrCount[2]}",
	            	"${BrCount[3]}", "${BrCount[4]}", "${BrCount[5]}"],
	        }]
	    },
	
	    // Configuration options go here
	    options: {
	        scales: {
	            xAxes: [{
	                gridLines: {
	                    offsetGridLines: true
	                }
	            }],
                yAxes: [{
                    display: true,
                    stacked: true,
                    ticks: {
                        min: 0, // minimum value
                        max: 30 // maximum value
                    }
           }]	            
	        }	    	
	    }
	});

	var ctx_line = document.getElementById('myChart_2').getContext('2d');

	var myLineChart = new Chart(ctx_line, {
	    type: 'line',
	    data: {
	    	labels : ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
	        datasets: [{
	            label: "2018년 월별 교육 수강 현황",
	            backgroundColor: "rgba(255, 99, 132, 0.2)",
	            borderColor: "rgb(255, 99, 132)",
	            data: [80, 21, 58, 42, 75, 36, 72, 18, 53, 100, 78, 52],
	            fill : false
	        }]
	    	
	    },
	    options: {
	        scales: {
	            xAxes: [{
	                gridLines: {
	                    offsetGridLines: true
	                }
	            }],
                yAxes: [{
                    display: true,
                    stacked: true,
                    ticks: {
                        min: 0, // minimum value
                        max: 100 // maximum value
                    }
           		}]	            
	        }
	    }
	});
	
	var ctx_pie = document.getElementById('myChart_3').getContext('2d');

    var myPieChart = new Chart(ctx_pie,{
        type: 'pie',
        data : {
        	    datasets: [{
        	        data: [50, 20, 30, 24, 32, 41, 23, 10],
	        	    backgroundColor: ["rgba(255, 99, 132, 0.2)","rgba(255, 159, 64, 0.2)","rgba(255, 205, 86, 0.2)","rgba(155, 105, 86, 0.2)"
	        	    	,"rgba(215, 15, 16, 0.2)","rgba(115, 135, 246, 0.2)","rgba(15, 205, 186, 0.2)","rgba(225, 105, 186, 0.2)"]
        	    }],

        	    // These labels appear in the legend and in the tooltips when hovering different arcs
        	    labels: [
        	    	'프로그래밍',
        	    	'데이터베이스',
        	    	'서버',
        	    	'네트워크',
        	    	'OS',
        	    	'보안',
        	    	'웹',
        	    	'모바일'
        	    ]
        	},
        options: {
            title: {
                display: true,
                text: '분야별 연간 교육 수강 현황'
            }        	
        }
    });
    
	var ctx_doughnut = document.getElementById('myChart_4').getContext('2d');
	
    var myDoughnutChart = new Chart(ctx_doughnut, {
        type: 'doughnut',
        data : {
    	    datasets: [{
    	        data: [50, 20, 30, 24, 32, 41, 23, 10],
        	    backgroundColor: ["rgba(255, 99, 132, 0.2)","rgba(255, 159, 64, 0.2)","rgba(255, 205, 86, 0.2)","rgba(155, 105, 86, 0.2)"
        	    	,"rgba(215, 15, 16, 0.2)","rgba(115, 135, 246, 0.2)","rgba(15, 205, 186, 0.2)","rgba(225, 105, 186, 0.2)"]
    	    }],

    	    // These labels appear in the legend and in the tooltips when hovering different arcs
    	    labels: [
    	    	'프로그래밍',
    	    	'데이터베이스',
    	    	'서버',
    	    	'네트워크',
    	    	'OS',
    	    	'보안',
    	    	'웹',
    	    	'모바일'
    	    ]
    	},
        options: {
            title: {
                display: true,
                text: '분야별 연간 교육 수강 현황'
            }        	
        }
    });

	   
		
</script>

    
</body>

</html>