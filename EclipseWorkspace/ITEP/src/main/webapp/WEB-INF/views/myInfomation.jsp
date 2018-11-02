<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
 -->
<meta name="description" content="">
<meta name="author" content="">

<title>IT그룹 교육 포탈</title>



<script
	src="<%=application.getContextPath()%>/resources/main_page_resource/js/jquery.js"></script>

<link
	href="<%=application.getContextPath()%>/resources/main_page_resource/css/style.css"
	rel="stylesheet">

<!-- Bootstrap core CSS -->
<link
	href="<%=application.getContextPath()%>/resources/main_page_resource/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom fonts for this template -->
<link
	href="<%=application.getContextPath()%>/resources/main_page_resource/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">

<!-- Plugin CSS -->
<link
	href="<%=application.getContextPath()%>/resources/main_page_resource/vendor/magnific-popup/magnific-popup.css"
	rel="stylesheet" type="text/css">

<!-- Custom styles for this template -->
<link
	href="<%=application.getContextPath()%>/resources/main_page_resource/css/freelancer.min.css"
	rel="stylesheet">


<link
	href="<%=application.getContextPath()%>/resources/main_page_resource/sub/css/owl.carousel.css"
	rel="stylesheet" media="screen" />
<link
	href="<%=application.getContextPath()%>/resources/main_page_resource/sub/css/owl.theme.css"
	rel="stylesheet" media="screen" />
<link
	href="<%=application.getContextPath()%>/resources/main_page_resource/sub/css/style.css"
	rel="stylesheet">
<link
	href="<%=application.getContextPath()%>/resources/main_page_resource/sub/color/default.css"
	rel="stylesheet">
<link href="<%=application.getContextPath()%>/resources/css/itep.css"
	rel="stylesheet" type="text/css">
<link href="<%=application.getContextPath()%>/resources/css/odometer-theme-default.css"
	rel="stylesheet" type="text/css">
<script
	src="<%=application.getContextPath()%>/resources/js/odometer.js"></script>



<script>
    		// 관리자만 보이게    
			   		
    		function infoDetail(course_cd) {
    			$.get(
    				    "infoDetail?course_cd="+course_cd ,
    				    function(data) {
    				        $("#infoModalContent").html(data);
    				    }
    				);
			}
    		
    		function survayDetail(course_cd) {
    			$.get(
    				    "survayDetail?course_cd="+course_cd ,
    				    function(data) {
    				        $("#survayModalContent").html(data);
    				    }
    				);
			}
    		
    		function recentDetail(course_cd) {
    			$.get(
    				    "recentDetail?course_cd="+course_cd ,
    				    function(data) {
    				        $("#recentModalContent").html(data);
    				    }
    				);
			}
    		
			$( function() {
					
				

				if(${login_info.auth_cd} !='04'){
					$("#adminButton").attr('style', 'visiblity:show');
				}
				
				if(${mySurveyListCount} != 0){
					$("#survayButton").attr('style', 'visiblity:show');
				}
				
				setTimeout(function(){
				    odometer.innerHTML = ${totalAmount};
				}, 0);
				
				
				pageSize = 5;

				var pageCount =  $(".line-content").length / pageSize;
			    
			     for(var i = 0 ; i<pageCount;i++){
			        
			       $("#pagin").append('<li style="display:inline"><a class="btn hanna" style="border-radius: 50%; width :10px;height :10px; font-size:0px; padding:5px; margin:2px" >'+(i+1)+'</a></li> ');
			     }
			        $("#pagin li").first().find("a").addClass("current")
			    showPage = function(page) {
				    $(".line-content").hide();
				    $(".line-content").each(function(n) {
				        if (n >= pageSize * (page - 1) && n < pageSize * page)
				            $(this).show();
				    });        
				}
			    
				showPage(1);

				$("#pagin li a").click(function() {
				    $("#pagin li a").removeClass("current");
				    $(this).addClass("current");
				    showPage(parseInt($(this).text())) 
				}); 
				
				
				
				
				
				pageSize2 = 5;

				var pageCount2 =  $(".line-content2").length / pageSize2;
			    
			     for(var i = 0 ; i<pageCount2;i++){
			        
			       $("#pagin2").append('<li style="display:inline"><a class="btn hanna" style="border-radius: 50%; width :10px;height :10px; font-size:0px; padding:5px; margin:2px" >'+(i+1)+'</a></li> ');
			     }
			        $("#pagin2 li").first().find("a").addClass("current")
			    showPage2 = function(page) {
				    $(".line-content2").hide();
				    $(".line-content2").each(function(n) {
				        if (n >= pageSize2 * (page - 1) && n < pageSize2 * page)
				            $(this).show();
				    });        
				}
			    
				showPage2(1);

				$("#pagin2 li a").click(function() {
				    $("#pagin2 li a").removeClass("current");
				    $(this).addClass("current");
				    showPage2(parseInt($(this).text())) 
				}); 
				
				
				
				pageSize3 = 5;

				var pageCount3 =  $(".line-content3").length / pageSize3;
			    
			     for(var i = 0 ; i<pageCount3;i++){
			        
			       $("#pagin3").append('<li style="display:inline"><a class="btn hanna" style="border-radius: 50%; width :10px;height :10px; font-size:0px; padding:5px; margin:2px" >'+(i+1)+'</a></li> ');
			     }
			        $("#pagin3 li").first().find("a").addClass("current")
			    showPage3 = function(page) {
				    $(".line-content3").hide();
				    $(".line-content3").each(function(n) {
				        if (n >= pageSize3 * (page - 1) && n < pageSize3 * page)
				            $(this).show();
				    });        
				}
			    
				showPage3(1);

				$("#pagin3 li a").click(function() {
				    $("#pagin3 li a").removeClass("current");
				    $(this).addClass("current");
				    showPage3(parseInt($(this).text())) 
				}); 
				
				
				pageSize4 = 5;

				var pageCount4 =  $(".line-content4").length / pageSize4;
			    
			     for(var i = 0 ; i<pageCount4;i++){
			        
			       $("#pagin4").append('<li style="display:inline"><a class="btn hanna" style="border-radius: 50%; width :10px;height :10px; font-size:0px; padding:5px; margin:2px" >'+(i+1)+'</a></li> ');
			     }
			        $("#pagin4 li").first().find("a").addClass("current")
			    showPage4 = function(page) {
				    $(".line-content4").hide();
				    $(".line-content4").each(function(n) {
				        if (n >= pageSize4 * (page - 1) && n < pageSize4 * page)
				            $(this).show();
				    });        
				}
			    
				showPage4(1);

				$("#pagin4 li a").click(function() {
				    $("#pagin4 li a").removeClass("current");
				    $(this).addClass("current");
				    showPage4(parseInt($(this).text())) 
				}); 
				
				
				
				
				
				
				
				
				
				
				
				
				if(${myRegistListCount} == 0){
		        	$("#info1").attr('style', 'float: left; width: 100%; text-align: center; padding: 10px; vertical-align: middle;')
		        }
				
				if(${myStudyListCount} == 0){
		        	$("#info2").attr('style', 'float: left; width: 100%; text-align: center; padding: 10px; vertical-align: middle;')
		        }
				
				if(${mySurveyListCount} == 0){
		        	$("#info3").attr('style', 'float: left; width: 100%; text-align: center; padding: 10px; vertical-align: middle;')
		        }
				
				if(${myRecentListCount} == 0){
		        	$("#info4").attr('style', 'float: left; width: 100%; text-align: center; padding: 10px; vertical-align: middle;')
		        }
				

				
			});
    		
    	</script>

</head>
<body id="page-top">

	<!-- Navigation -->
	<nav class="navbar navbar-expand bg-secondary fixed-top "
		id="mainNav">
		<div class="container">
			<a class="hanna navbar-brand js-scroll-trigger" href="home">IBK IT
				교육 포탈<span style="font-size: 15px">  &nbsp;-상세 내정보-</span></a>
			<div class=" " id="">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item mx-0 mx-sm-1"><a id='survayButton'
						style="visibility: hidden;"
						class="hanna nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
						href="#survay">설문해주세요!!</a></li>
					<li class="nav-item mx-0 mx-sm-1"><a id='adminButton'
						style="visibility: hidden;"
						class="hanna nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
						href="admin">관리자</a></li>
					<li class="nav-item mx-0 mx-sm-1"><a
						class="hanna nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
						href="home">홈으로</a></li>
					<li class="nav-item mx-0 mx-sm-1"><a
						class="hanna nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
						href="EduList">교육정보</a></li>

				</ul>
			</div>
		</div>
	</nav>


	<!-- Header -->
	<header class="masthead text-white text-center"
		style="background-color: #FFDCE6;">

		<div id="secondHeader" class="container" style="position:relative">

			<div style="z-index: 5; position:relative; ">
				<h1  class="hanna "
					style="color :#444444; font-size: 60px; z-index: 5; padding: 0 ; margin: 0">${login_info.emm}님은 지금까지 총</h1>
			</div>

			<div  style="z-index: 5; position:relative">
				<h1  style="color :#444444; font-size: 120px;  z-index: 5; padding: 0px; margin: 0 " class="hanna"><span id="odometer" class="odometer hanna" style="color :#444444; font-size: 120px;  z-index: 5; padding: 0; margin: 0 " >0</span>원 </h1>
			</div>
			<div  style="z-index: 5; position:relative">

				<h1 class="hanna "
					style="color :#444444; font-size: 60px;  z-index: 5; padding: 0 ">어치 교육을 이수하셨습니다</h1>

			</div>
			<div class="animated fadeInUp" style="margin-bottom: 60px; z-index: 1; position:relative">
				<img
					style="position: absolute; top: -170px; left: 610px; width: 300px; opacity: 0.6; z-index: 1;"
					src="resources/image/money.png" alt="">
			</div>

		</div>
		
	</header>

	<!-- Portfolio Grid Section -->
	<section class="portfolio" id="portfolio"
		style="background-color: #fdfde9; padding-bottom: 50px">
		<div class="container" >
			<div style="text-align: center">
				<h2 style="padding-top: 80px;"
				class="hanna text-center text-uppercase text-secondary mb-0">내가 신청한 모든 교육</h2>
				<h3 class="hanna text-center">내가 신청한 교육의 정보와 관련 내용을 확인하세요!</h3>
				<div style="display: inline-block; width: 70%">
					<div style="margin:20px; float: left ; background-color: #FF9A8A; width: 28%; color:white; padding : 20px" class=" text-center hanna">
						서무담당대기
						<h3 class ="hanna" style="padding: 0px">${countInfo.step10count}개</h3>
					</div>
					<div style="margin:20px;float: left; background-color: #74B147; width: 28%; color:white; padding: 20px" class=" text-center hanna">
						서무차장대기
						<h3 class ="hanna" style="padding: 0px">${countInfo.step20count}개</h3>
					</div>
					<div style="margin:20px;float: left; background-color: #6a9ad0; width: 28%; color:white; padding: 20px" class=" text-center hanna">
						교육담당대기
						<h3 class ="hanna" style="padding: 0px">${countInfo.step30count}개</h3>
					</div>
				</div>
				
				
				
				<hr class="star-dark mb-5">
				
				<div style=" ;width: 100%; padding: 10px">
					<div style=" display:inline-table;  width: 10%">
						<div style="vertical-align: middle; ">
							<p class="hanna">이미지</p>
						</div>
					</div>
					<div style=" display:inline-table;  width: 50%">
						<div style="vertical-align: middle; ">
							<p class="hanna">정보</p>
						</div>
					</div>
					<div style=" display:inline-table;  width: 6%">
						<div style="vertical-align: middle; ">
							<p class="hanna">시간</p>
						</div>
					</div>
					<div style=" display:inline-table;  width: 15%">
						<div style="vertical-align: middle; ">
							<p class="hanna">신청날짜</p>
						</div>
					</div>
					
					<div style=" display:inline-table;  width: 15%">
						<div style="vertical-align: middle; ">
							<p class="hanna">신청상태</p>
						</div>
					</div>
				</div>
				
				<hr>
				
				<c:forEach var="d" items="${myRegistList}"  varStatus="status">
				<a onclick="infoDetail('${d.course_cd}');" data-toggle="modal"
							data-target="#infoModal">
				<div class="infoList line-content" style=" width: 100%; padding: 10px">
					<div style=" display:inline-table ;  width: 10% ">
						<img class="photo4" src="file?svr_img_file_nm=${d.svr_img_file_nm}&mfiletype=${d.img_file_type}" alt="">
					</div>
					<div style=" display:inline-table;  width: 40%; padding-left: 40px">
						<div style="vertical-align: middle; text-align: left; ">
							<p style="font-size: 22px; padding: 0; " class="hanna hidden-large" >${d.course_nm}</p>
							<p style="font-size: 15px; padding : 0;" class="hanna" >${d.org_nm} / ${d.edu_st_dt}~${d.edu_ed_dt}</p>	
						</div>
											
					</div>
					<div style="vertical-align: middle; display:inline-table;  width: 6%">
						<div style="vertical-align: middle; ">
							<p class="hanna">${d.edu_hour}h</p>
						</div>
					</div>
					<div style="vertical-align: middle; display:inline-table;  width: 15%">
						<div style="vertical-align: middle; ">
							<p class="hanna">${d.reg_dt}</p>
						</div>
					</div>
					<div style=" display:inline-table;  width: 15%">
						<div style="vertical-align: middle; ">
							<p class="hanna">${d.step_nm }</p>
						</div>
					</div>
				</div>
				</a>
				</c:forEach>
				
				
				
				<div  id="moreInfo1" class="infoList" style="display:none; width: 100%; padding: 10px">
							<img width="20px" src="resources/main_page_resource/img/more.png" alt="">
				</div>		
				
				<div id="info1" style="display:none; float: left; width: 100%; text-align: center; padding: 10px; vertical-align: middle;">				
					<div style="float: left; width: 100%;height: 72px; display: table;">
						<div style=" vertical-align: middle; display: table-cell;">
							<p style="font-size: 22px; padding: 0 " class="hanna hidden" >해당 내역이 없습니다. </p>
						</div>
					</div>			
				</div>

				<hr>
				
				<ul class="slides" id="pagin">
       
				</ul>
				
			</div>		
		</div>
	</section>
	
	
	
	
	<section id="myInfo" style="margin-bottom: 120px">
		<div class="container" >
			<div style="text-align: center">
				<h2 style="padding-top: 80px;"
				class="hanna text-center text-uppercase text-secondary mb-0">내가 수강중인 모든 교육</h2>
				<h3 class="hanna text-center">내가 수강하고 있는 교육의 정보와 관련 내용을 확인하세요!</h3>
				<div style="display: inline-block; width: 70%">
					<div style="margin:20px;margin-left:40px; float: left ; background-color: #74B147; width: 42%; color:white; padding : 20px" class=" text-center hanna">
						교육대기
						<h3 class ="hanna" style="padding: 0px">${countInfo.stat01count}개</h3>
					</div>
					<div style="margin:20px;float: left; background-color:#6a9ad0; width: 42%; color:white; padding: 20px" class=" text-center hanna">
						교육중
						<h3 class ="hanna" style="padding: 0px">${countInfo.stat02count}개</h3>
					</div>

				</div>
				
				
				
				<hr class="star-dark2 mb-5">
				
				<div style=" ;width: 100%; padding: 10px">
					<div style=" display:inline-table;  width: 10%">
						<div style="vertical-align: middle; ">
							<p class="hanna">이미지</p>
						</div>
					</div>
					<div style=" display:inline-table;  width: 50%">
						<div style="vertical-align: middle; ">
							<p class="hanna">정보</p>
						</div>
					</div>
					<div style=" display:inline-table;  width: 6%">
						<div style="vertical-align: middle; ">
							<p class="hanna">시간</p>
						</div>
					</div>
					<div style=" display:inline-table;  width: 15%">
						<div style="vertical-align: middle; ">
							<p class="hanna">신청날짜</p>
						</div>
					</div>
					<div style=" display:inline-table;  width: 15%">
						<div style="vertical-align: middle; ">
							<p class="hanna">상태</p>
						</div>
					</div>
				</div>
				
				<hr>
				
				
				
				
				<c:forEach var="d" items="${myStudyList}"  varStatus="status">
				<a onclick="infoDetail('${d.course_cd}');" data-toggle="modal"
							data-target="#infoModal">
				<div class="infoList line-content2" style=" width: 100%; padding: 10px">
					<div style=" display:inline-table ;  width: 10% ">
						<img class="photo4" src="file?svr_img_file_nm=${d.svr_img_file_nm}&mfiletype=${d.img_file_type}" alt="">
					</div>
					<div style=" display:inline-table;  width: 50%; padding-left: 40px">
						<div style="vertical-align: middle; text-align: left; ">
							<p style="font-size: 22px; padding: 0; " class="hanna hidden-large" >${d.course_nm}</p>
							<p style="font-size: 15px; padding : 0;" class="hanna" >${d.org_nm} / ${d.edu_st_dt}~${d.edu_ed_dt}</p>	
						</div>
											
					</div>
					<div style="vertical-align: middle; display:inline-table;  width: 6%">
						<div style="vertical-align: middle; ">
							<p class="hanna">${d.edu_hour}h</p>
						</div>
					</div>
					<div style="vertical-align: middle; display:inline-table;  width: 15%">
						<div style="vertical-align: middle; ">
							<p class="hanna">${d.reg_dt}</p>
						</div>
					</div>
					<div style=" display:inline-table;  width: 15%">
						<div style="vertical-align: middle; ">
							<p class="hanna">${d.stat_nm }</p>
						</div>
					</div>
				</div>
				</a>
				</c:forEach>
				
				
				
				
				<div id="info2" style="display:none; float: left; width: 100%; text-align: center; padding: 10px; vertical-align: middle;">				
					<div style="float: left; width: 100%;height: 72px; display: table;">
						<div style=" vertical-align: middle; display: table-cell;">
							<p style="font-size: 22px; padding: 0 " class="hanna hidden" >해당 내역이 없습니다. </p>
						</div>
					</div>			
				</div>

				<hr>
				
				<ul class="slides" id="pagin2">
       
				</ul>
				
			</div>		
		</div>
	</section>


	<section id="survay" style="padding-bottom: 50px; background-color: #FBE4FF">
		<div class="container" >
			<div style="text-align: center">
				<h2 style="padding-top: 80px;"
				class="hanna text-center text-uppercase text-secondary mb-0">설문 대상 교육</h2>
				<h3 class="hanna text-center">수강완료한 교육들을 확인하고 평가해주세요!</h3>
				<div style="display: inline-block; width: 70%">
					
					<div style="margin:20px;float: left; background-color: #FF9A8A; width: 95%; color:white; padding: 20px" class=" text-center hanna">
						! 설문 미참여시 교육신청이 제한됩니다.
					</div>
				</div>
				
				
				
				<hr class="star-dark3 mb-5">
				
				<div style=" ;width: 100%; padding: 10px">
					<div style=" display:inline-table;  width: 10%">
						<div style="vertical-align: middle; ">
							<p class="hanna">이미지</p>
						</div>
					</div>
					<div style=" display:inline-table;  width: 50%">
						<div style="vertical-align: middle; ">
							<p class="hanna">정보</p>
						</div>
					</div>
					<div style=" display:inline-table;  width: 6%">
						<div style="vertical-align: middle; ">
							<p class="hanna">시간</p>
						</div>
					</div>
					<div style=" display:inline-table;  width: 15%">
						<div style="vertical-align: middle; ">
							<p class="hanna">신청날짜</p>
						</div>
					</div>
					<div style=" display:inline-table;  width: 15%">
						<div style="vertical-align: middle; ">
							<p class="hanna">상태</p>
						</div>
					</div>
				</div>
				
				<hr>
				
				
				
				
				<c:forEach var="d" items="${mySurveyList}"  varStatus="status">
				<a onclick="survayDetail('${d.course_cd}');" data-toggle="modal"
							data-target="#survayModal">
				<div class="infoList line-content3" style=" width: 100%; padding: 10px">
					<div style=" display:inline-table ;  width: 10% ">
						<img class="photo4" src="file?svr_img_file_nm=${d.svr_img_file_nm}&mfiletype=${d.img_file_type}" alt="">
					</div>
					<div style=" display:inline-table;  width: 50%; padding-left: 40px">
						<div style="vertical-align: middle; text-align: left; ">
							<p style="font-size: 22px; padding: 0; " class="hanna hidden-large" >${d.course_nm}</p>
							<p style="font-size: 15px; padding : 0;" class="hanna" >${d.org_nm} / ${d.edu_st_dt}~${d.edu_ed_dt}</p>	
						</div>
											
					</div>
					<div style="vertical-align: middle; display:inline-table;  width: 6%">
						<div style="vertical-align: middle; ">
							<p class="hanna">${d.edu_hour}h</p>
						</div>
					</div>
					<div style="vertical-align: middle; display:inline-table;  width: 15%">
						<div style="vertical-align: middle; ">
							<p class="hanna">${d.reg_dt}</p>
						</div>
					</div>
					<div style=" display:inline-table;  width: 15%">
						<div style="vertical-align: middle; ">
							<p class="hanna">${d.stat_nm }</p>
						</div>
					</div>
				</div>
				</a>
				</c:forEach>
				
				
				
				
				<div id="info3" style="display:none; float: left; width: 100%; text-align: center; padding: 10px; vertical-align: middle;">				
					<div style="float: left; width: 100%;height: 72px; display: table;">
						<div style=" vertical-align: middle; display: table-cell;">
							<p style="font-size: 22px; padding: 0 " class="hanna hidden" >해당 내역이 없습니다. </p>
						</div>
					</div>			
				</div>

				<hr>
				
				<ul class="slides" id="pagin3">
       
				</ul>
				
			</div>		
		</div>
	</section>

<section id="myInfo" style="padding-bottom: 50px;">
		<div class="container" >
			<div style="text-align: center">
				<h2 style="padding-top: 80px;"
				class="hanna text-center text-uppercase text-secondary mb-0">내가 수강완료한 모든 교육</h2>
				<h3 class="hanna text-center">지금까지 들어온 교육의 정보와 관련 내용을 확인하세요!</h3>
				<div style="display: inline-block; width: 70%">
					<div style="margin:20px; float: left ; background-color: #6a9ad0; width: 28%; color:white; padding : 20px" class=" text-center hanna">
						신청한 총 갯수
						<h3 class ="hanna" style="padding: 0px">${countInfo.totalCount}개</h3>
					</div>
					<div style="margin:20px;float: left; background-color: #74B147; width: 28%; color:white; padding: 20px" class=" text-center hanna">
						총 이수 시간
						<h3 class ="hanna" style="padding: 0px">${countInfo.totalHour}시간</h3>
					</div>
					<div style="margin:20px;float: left; background-color: #FF9A8A; width: 28%; color:white; padding: 20px" class=" text-center hanna">
						총 이수 금액
						<h3 class ="hanna" style="padding: 0px">${countInfo.totalAmount}원</h3>
					</div>
				</div>
				
				
				
				<hr class="star-dark2 mb-5">
				
				<div style=" ;width: 100%; padding: 10px">
					<div style=" display:inline-table;  width: 10%">
						<div style="vertical-align: middle; ">
							<p class="hanna">이미지</p>
						</div>
					</div>
					<div style=" display:inline-table;  width: 50%">
						<div style="vertical-align: middle; ">
							<p class="hanna">정보</p>
						</div>
					</div>
					<div style=" display:inline-table;  width: 6%">
						<div style="vertical-align: middle; ">
							<p class="hanna">시간</p>
						</div>
					</div>
					<div style=" display:inline-table;  width: 15%">
						<div style="vertical-align: middle; ">
							<p class="hanna">신청날짜</p>
						</div>
					</div>
					<div style=" display:inline-table;  width: 15%">
						<div style="vertical-align: middle; ">
							<p class="hanna">내 평가</p>
						</div>
					</div>
				</div>
				
				<hr>
				
				
				
				
				<c:forEach var="d" items="${myRecentList}"  varStatus="status">
				<a onclick="recentDetail('${d.course_cd}');" data-toggle="modal"
							data-target="#recentModal">
				<div class="infoList line-content4" style=" width: 100%; padding: 10px">
					<div style=" display:inline-table ;  width: 10% ">
						<img class="photo4" src="file?svr_img_file_nm=${d.svr_img_file_nm}&mfiletype=${d.img_file_type}" alt="">
					</div>
					<div style=" display:inline-table;  width: 50%; padding-left: 40px">
						<div style="vertical-align: middle; text-align: left; ">
							<p style="font-size: 22px; padding: 0; " class="hanna hidden-large" >${d.course_nm}</p>
							<p style="font-size: 15px; padding : 0;" class="hanna" >${d.org_nm} / ${d.edu_st_dt}~${d.edu_ed_dt}</p>	
						</div>
											
					</div>
					<div style="vertical-align: middle; display:inline-table;  width: 6%">
						<div style="vertical-align: middle; ">
							<p class="hanna">${d.edu_hour}h</p>
						</div>
					</div>
					<div style="vertical-align: middle; display:inline-table;  width: 15%">
						<div style="vertical-align: middle; ">
							<p class="hanna">${d.reg_dt}</p>
						</div>
					</div>
					<div style=" display:inline-table;  width: 15%">
								<div class="starRev" style="vertical-align: middle; display: table-cell;">
									<c:forEach  begin="0" end="${d.sur_point-1}" step="1" varStatus="status">								
 										<span class="starMini on"></span>
					 				</c:forEach>
					 				<c:forEach begin="0" end="${4-d.sur_point}" step="1" varStatus="status">								
 					 					<span class="starMini"></span>
					 				</c:forEach>
								</div>
					</div>
				</div>
				</a>
				</c:forEach>
				
				
				
				
				<div id="info4" style="display:none; float: left; width: 100%; text-align: center; padding: 10px; vertical-align: middle;">				
					<div style="float: left; width: 100%;height: 72px; display: table;">
						<div style=" vertical-align: middle; display: table-cell;">
							<p style="font-size: 22px; padding: 0 " class="hanna hidden" >해당 내역이 없습니다. </p>
						</div>
					</div>			
				</div>

				<hr>
				
				<ul class="slides" id="pagin4">
       
				</ul>
				
			</div>		
		</div>
	</section>


	<!-- Footer -->
	<footer class="footer text-center">
		<div class="container">
			<div class="row">
				<div class="col-md-4 mb-5 mb-lg-0">
					<h4 class="text-uppercase mb-4 hanna">위치</h4>
					<p class="lead mb-0">
						본점 : 서울 중구 을지로 79 기업은행<br>IT센터 : 경기 용인시 수지구 신수로 799
					</p>
				</div>
				<div class="col-md-4 mb-5 mb-lg-0">
					<h4 class="text-uppercase mb-4 hanna">담당자</h4>
					<ul class="list-inline mb-0">
						<li class="list-inline-item">
							<p class="lead mb-0">
								IT기획부 오세웅 대리(Tel. 2977)<br>
								IT기획부 김광진 계장(Tel. 2828)<br>
							</p>
					</ul>
				</div>
				<div class="col-md-4">
					<h4 class="text-uppercase mb-4 hanna">IBK IT 교육포털에 관하여</h4>
					<p class="lead mb-0">
						IBK IT 교육포털은 다양한 교육을 편리하게 신청할 수 있는 사이트로 
						기업은행 IT신입행원 프로젝트를 통해 제작되었습니다.
					</p>
				</div>
			</div>
		</div>
	</footer>

	<div class="copyright py-4 text-center text-white">
		<div class="container">
			<small>Copyright &copy; IBK기업은행 2018</small>
		</div>
	</div>

	<!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
	<div class="scroll-to-top d-lg-none position-fixed ">
		<a class="js-scroll-trigger d-block text-center text-white rounded"
			href="#page-top"> <i class="fa fa-chevron-up"></i>
		</a>
	</div>






	<!-- 모달 -->

	<div id="eduModal" class="modal fade bs-example-modal-lg" tabindex="-1"
		role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div id="eduModalContent" class="modal-content"></div>
		</div>
	</div>
	
	<div id="infoModal" class="modal fade bs-example-modal-lg" tabindex="-1"
		role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div id="infoModalContent" class="modal-content"></div>
		</div>
	</div>
	
	<div id="survayModal" class="modal fade bs-example-modal-lg" tabindex="-1"
		role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div id="survayModalContent" class="modal-content"></div>
		</div>
	</div>
	
	<div id="recentModal" class="modal fade bs-example-modal-lg" tabindex="-1"
		role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div id="recentModalContent" class="modal-content"></div>
		</div>
	</div>

	<div id="confirmModal" class="modal fade bs-example-modal-lg"
		tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-md">
			<div id="eduModalContent" class="modal-content">


				<div class="modal-header" style="background-color: #F94164">
					<div style="margin: 0 auto;">
						<h1 align="center" class="hanna"
							style="margin-left: 30px; color: white" id="modalLabel">정말
							신청하시겠습니까?</h1>

					</div>

					<button style="margin: 0" type="button" class="close"
						data-dismiss="modal">
						<span style="margin: -20px; color: white" aria-hidden="true">&times;</span><span
							class="sr-only">Close</span>
					</button>
				</div>

				<div class="modal-body">


					<br>
					<div id="success"></div>
					<div class="row" id="confirmBtnSet">
						<button data-dismiss="modal" style="width: 50%; height: 70px"
							class="btn">
							<p class="hanna" style="font-size: 20px; color: white">아니욥</p>
						</button>
						<button onclick="submitForm()" style="width: 50%; height: 70px"
							class="btn-yes">
							<p class="hanna" style="font-size: 20px; color: white">넵</p>
						</button>
					</div>

				</div>

			</div>
		</div>
	</div>





	<!-- Bootstrap core JavaScript -->
	<script
		src="<%=application.getContextPath()%>/resources/main_page_resource/vendor/jquery/jquery.min.js"></script>
	<script
		src="<%=application.getContextPath()%>/resources/main_page_resource/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


	<!-- Plugin JavaScript -->
	<script
		src="<%=application.getContextPath()%>/resources/main_page_resource/vendor/jquery-easing/jquery.easing.min.js"></script>
	<script
		src="<%=application.getContextPath()%>/resources/main_page_resource/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>

	<!-- Contact Form JavaScript -->
	<script
		src="<%=application.getContextPath()%>/resources/main_page_resource/js/jqBootstrapValidation.js"></script>

	<!-- Custom scripts for this template -->
	<script
		src="<%=application.getContextPath()%>/resources/main_page_resource/js/freelancer.min.js"></script>




	<script
		src="<%=application.getContextPath()%>/resources/main_page_resource/js/jquery.js"></script>
	<script
		src="<%=application.getContextPath()%>/resources/main_page_resource/js/jquery.scrollTo.js"></script>
	<script
		src="<%=application.getContextPath()%>/resources/main_page_resource/js/jquery.nav.js"></script>
	<script
		src="<%=application.getContextPath()%>/resources/main_page_resource/js/jquery.localScroll.js"></script>
	<script
		src="<%=application.getContextPath()%>/resources/main_page_resource/js/jquery.prettyPhoto.js"></script>
	<script
		src="<%=application.getContextPath()%>/resources/main_page_resource/js/isotope.js"></script>

	<script
		src="<%=application.getContextPath()%>/resources/main_page_resource/js/jquery.flexslider.js"></script>
	<script
		src="<%=application.getContextPath()%>/resources/main_page_resource/js/inview.js"></script>
	<script
		src="<%=application.getContextPath()%>/resources/main_page_resource/js/animate.js"></script>
	<script
		src="<%=application.getContextPath()%>/resources/main_page_resource/js/custom.js"></script>


	<script
		src="<%=application.getContextPath()%>/resources/main_page_resource/sub/js/jquery.sticky.js"></script>
	<script
		src="<%=application.getContextPath()%>/resources/main_page_resource/sub/js/slippry.min.js"></script>
	<script
		src="<%=application.getContextPath()%>/resources/main_page_resource/sub/js/wow.min.js"></script>
	<script
		src="<%=application.getContextPath()%>/resources/main_page_resource/sub/js/owl.carousel.min.js"></script>
	<script
		src="<%=application.getContextPath()%>/resources/main_page_resource/sub/js/custom.js"></script>





</body>
</html>
