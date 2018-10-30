<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
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
  <link href="<%=application.getContextPath()%>/resources/css/hannafont.css" rel="stylesheet" type="text/css">
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

	<!-- chart.js  -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.js"></script>

	<!-- number Animation.js -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/waypoints/2.0.3/waypoints.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="<%=application.getContextPath()%>/resources/admin_page_resource/js/jquery.counterup.min.js"></script>
<script src="<%=application.getContextPath()%>/resources/admin_page_resource/js/jquery.counterup.js"></script>


  <!-- =======================================================
    Theme Name: NiceAdmin
    Theme URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
    Author: BootstrapMade
    Author URL: https://bootstrapmade.com
  ======================================================= -->
  <style>
	.white-box{background:#fff;padding:25px;margin-bottom:30px}
	.box-title{margin:0 0 12px;font-weight:500;text-transform:uppercase;font-size:16px} 
	.list-inline{margin-bottom:0}.analytics-info 
	.list-inline li{vertical-align:middle}.analytics-info 
	.list-inline li span{font-size:24px}.analytics-info 
	.list-inline li i{font-size:20px}	 
	.two-part li{width:48.8%}
	.two-part li i{font-size:50px}
	.two-part li span{font-size:50px;font-weight:100;font-family:Rubik,sans-serif}	
	.text-purple{color:#707cd2}
    
    .title{
    padding-top:50px; 
    padding-left:70px; 
    padding-bottom:50px; 
    width:100%; 
    height:200px;
    color:#fff; 
    background-image:url("resources/admin_page_resource/img/workspace.png");
    }
    </style>


<script>
jQuery(document).ready(function($) {
	$('.counter').counterUp({
		delay: 10, // the delay time in ms
		time: 1000 // the speed time in ms
	});
});
</script>

</head>


<body>

	<!-- number Animation.js 꼭 body 안에 위치 해야 함. 수정 x-->
<script src="http://cdnjs.cloudflare.com/ajax/libs/waypoints/2.0.3/waypoints.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="<%=application.getContextPath()%>/resources/admin_page_resource/js/jquery.counterup.min.js"></script>
<script src="<%=application.getContextPath()%>/resources/admin_page_resource/js/jquery.counterup.js"></script>

 <div class="row">
      <div class="col-lg-12">
        <h3 class="page-header"><i class="fa fa-laptop"></i></h3>
      </div>
    </div>
    <br>
    <div class = "title">
		<h2 class="hanna" align="center" style="background-color:rgba(051, 051, 051, 0.5); width:400px; margin-left:400px;">안녕하세요 <br> ${empJoinedDep_info.krn_brm}  ${empJoinedDep_info.emm} 관리자님♥</h2>	
	</div>
	<br><div align="center"> <h4 class="hanna"> 대시보드에서 교육 신청 데이터를 한눈에 확인하세요! </h4></div><br>
	
	<!-- 대시보드 항목 1: 신청수 및 등록수  -->       
    <div style="margin:auto">
        <div style="float:left; padding-left: 170px; padding-right: 20px;">
            <div class="white-box analytics-info" style="width: 320px; height: 120px; border-bottom: 1px double #A0A0A0;  ">
                <h4 class="hanna">전체 교육 등록 수</h4>
                <ul class="list-inline two-part">
                    <li>
                        <div style="padding-bottom:10px; padding-top:5px; padding-left:10px">
							<img width="100px" height="40px" src="resources/image/greenChart.png" alt="">
                        </div>
                    </li>
                    <li class="text-right"><i class="ti-arrow-up text-success"></i> <span class="counter hanna" style="font-size:30px; font-weight:bold; color:#3c763d;">${selectAllEduCount}</span></li>
                </ul>
            </div>
        </div>
        <div style="float:left; padding-right: 20px;">
            <div class="white-box analytics-info" style="width: 320px; height: 120px;  border-bottom: 1px double #A0A0A0;">
                <h4 class="hanna">올해 교육 신청 수</h4>
                <ul class="list-inline two-part">
                    <li>
                        <div style="padding-bottom:10px; padding-top:5px; padding-left:10px">
							<img width="100px" height="40px" src="resources/image/blueChart.png" alt="">
                        </div>
                    </li>
                    <li class="text-right"><i class="ti-arrow-up text-purple"></i> <span class="counter" style="font-size:30px; font-weight:bold; color:#31708f;">${selectYearAppEduCount}</span></li>
                </ul>
            </div>
        </div>
        <div style="float:left; padding-rignt:20px;"> 
            <div class="white-box analytics-info" style="width: 320px; height: 120px;  border-bottom: 1px double #A0A0A0;">
                <h4 class="hanna">이번달 교육 신청 수</h4>
                <ul class="list-inline two-part">
                    <li>
                        <div style="padding-bottom:10px; padding-top:5px; padding-left:10px">
							<img width="100px" height="40px" src="resources/image/purpleChart.png" alt="">
                        </div>
                    </li>
                    <li class="text-right"><i class="ti-arrow-up text-info"></i> <span class="counter" style="font-size:30px; font-weight:bold; color:#707cd2;">${selectMonthAppEduCount}</span></li>
                </ul>
            </div>
        </div>
    </div>
    
    <!-- 대시보드 항목 2 -->
    <div>
        <div class="col-xs-12" style="padding-top:160px ;padding-bottom:50px;">
            <div class="white-box" style="width:1000px; height:500px; margin:auto;">
                <h3 class="hanna">2018년 월별 교육 수강 현황</h3>
                <div id="ct-visits" style="width:950px; height:500px; padding-top:50px; padding-left:20px; padding-right:20px;">
                 	<canvas id="myChart_2" width="200px" height="800px"></canvas>
                </div>
            </div>
        </div>
    </div>
    
    <!-- 대시보드 항목3 -->
    <div style="float:fixed; padding-bottom:50px;">   
    <div style="padding-left:170px;">
	     <div class="white-box" style="padding-top:20px;width:40%;height:40%;float:left;">  
	                     <h3 class="hanna">당월 부서별 교육 수강 현황</h3>
	  		<canvas id="myChart_1" width="600px" height="600px"></canvas>
	    </div>   
    </div>    
    <div style="padding-right:170px;">
	     <div class="white-box" style="padding-top:20px;width:40%;height:40%;float:right;">
	                     <h3 class="hanna">분야별 연간 교육 수강 현황</h3>  
	  		<canvas id="myChart_3" width="600px" height="600px"></canvas>
	    </div>   
    </div>
    </div>            
	
<script>
/*
	var image_greenChart = new image();
	image_greenChart.src = "resources/image/greenChart.png";

	var ctx_greenChart = document.getElementById('greenChart').getContext('2d');
	
	ctx_greenChart.drawImage(image_greenChart, 50, 50);
	
*/
	var ctx_bar = document.getElementById('myChart_1').getContext('2d');
	
	var chart = new Chart(ctx_bar, {
	    // The type of chart we want to create
	    type: 'bar',
	
	    // The data for our dataset
	    data: {
	        labels: ["IT기획부", "IT정보부", "IT수신카드부", "IT여신외환부", "IT채널부", "IT시스템운영팀"],
	        datasets: [{
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
	        legend: {
	            display: false,
	        },	   	    	
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
	ctx_line.canvas.width = 1200;
	ctx_line.canvas.height = 400;
	var myLineChart = new Chart(ctx_line, {
	    type: 'line',
	    data: {
	    	labels : ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	        datasets: [{
	            label: "2018년 월별 교육 수강 현황",
	            backgroundColor: "rgba(255, 99, 132, 0.2)",
	            borderColor: "rgb(245, 158, 0)",
	            data: ["${YrCount[0]}", "${YrCount[1]}", "${YrCount[2]}", "${YrCount[3]}", "${YrCount[4]}", "${YrCount[5]}",  
	            	"${YrCount[6]}", "${YrCount[7]}", "${YrCount[8]}", "${YrCount[9]}", "${YrCount[10]}", "${YrCount[11]}"],
	            fill : false
	        }]
	    	
	    },
	    options: {
	        legend: {
	            display: false,
	        },	    	
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
                        max: 70 // maximum value
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
        	        data: ["${YrCTCount[0]}", "${YrCTCount[1]}", "${YrCTCount[2]}", "${YrCTCount[3]}", 
        	        	"${YrCTCount[4]}", "${YrCTCount[5]}", "${YrCTCount[6]}", "${YrCTCount[7]}"],
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
                text: ''
            }        	
        }
    });

</script>

    
</body>

</html>