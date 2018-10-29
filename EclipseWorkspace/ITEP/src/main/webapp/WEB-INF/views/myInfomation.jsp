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
			   		
    		function eduDetail(course_cd) {
    			$.get(
    				    "eduDetail?course_cd="+course_cd ,
    				    function(data) {
    				        $("#eduModalContent").html(data);
    				    }
    				);
			}
    		
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
					if('${result}a' == '0a'){
						alert("이미 신청한 교육입니다.");
					}else if('${result}a' == '2a'){
						alert("설문을 미등록한 교육이 존재합니다.");
					}else if('${result}a' == '1a'){
						alert("신청이 완료되었습니다.");
					}
				
				

				if(${login_info.auth_cd} !='04'){
					$("#adminButton").attr('style', 'visiblity:show');
				}
				
				setTimeout(function(){
				    odometer.innerHTML = 10000;
				}, 0);
				
			});
    		
    	</script>

</head>
<body id="page-top">

	<!-- Navigation -->
	<nav class="navbar navbar-expand bg-secondary fixed-top text-uppercase"
		id="mainNav">
		<div class="container">
			<a class="hanna navbar-brand js-scroll-trigger" href="home">IBK IT
				교육 포탈</a>
			<div class=" " id="">
				<ul class="navbar-nav ml-auto">
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

			<div style="z-index: 5; position:relative">
				<h1  class="hanna "
					style="color :#444444; font-size: 60px; z-index: 5; padding: 0 ; margin: 0">${login_info.emm}님은 지금까지 총</h1>
			</div>

			<div  style="z-index: 5; position:relative">
				<h1  style="color :#444444; font-size: 120px;  z-index: 5; padding: 0; margin: 0 " class="hanna"><span id="odometer" class="odometer hanna" style="color :#444444; font-size: 120px;  z-index: 5; padding: 0; margin: 0 " >0</span>원 </h1>
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
		style="background-color: #fdfde9;">
		<div class="container" >
			<div style="text-align: center">
				<h2 style="padding-top: 80px;"
				class="hanna text-center text-uppercase text-secondary mb-0">내가 신청한 모든 교육</h2>
				<h3 class="hanna text-center">신청할 수 있는 다양한 교육 정보를 확인하세요!</h3>
				<a href="EduList" class="btn text-center hanna" style="color:white; padding: 15px">더 많은 "교육정보" 보기 <img style="width: 20px" alt="" src="resources/image/plus.png"></a>
				<hr class="star-dark mb-5">
			</div>
			

			<h3 class="hanna text-uppercase text-secondary mb-0">인기 교육 Top 8</h3>

			<div class="row flyIn"  id="services2">
				<div class="col-lg-12">
					<div class="testimonialslide  ">
						<ul class="slides" id="top8List1">
							<li style="text-align: center;"><c:forEach var="d"
									items="${top8List1}" varStatus="status">
									<a onclick="eduDetail('${d.course_cd}');" data-toggle="modal"
										data-target="#eduModal">

										<div class="top8List1ContentCount animated-fast service-box"
											style="display: inline-table; width: 20%; padding: 30px">

											<p style="font-size: 20pt" class="hanna text-center mb-0">${d.rownum }위</p>
											<div style="text-align: center;">
												<img
													src="<%=application.getContextPath()%>/file?svr_img_file_nm=${d.svr_img_file_nm}&mfiletype=${d.img_file_type}"
													class="photo3" alt="img">
											</div>
											<div style="text-align: center;">
												<h4 class="hanna  text-secondary hidden text-center"
													style="padding-bottom: 0px">${d.course_nm}</h4>
											</div>
											<div style="text-align: center;">
												<p class="hanna  text-secondary hidden text-center"
													style="padding: 0px">${d.org_nm}</p>
											</div>
											<div style="text-align: center;">
												<p class="hanna  text-secondary hidden text-center"
													style="padding-top: 0px">${d.edu_st_dt}~${d.edu_ed_dt }</p>
											</div>
										</div>
									</a>
								</c:forEach></li>
							<li id="top8List2" style="text-align: center;"><c:forEach
									var="d" items="${top8List2}" varStatus="status">
									<a onclick="eduDetail('${d.course_cd}');" data-toggle="modal"
										data-target="#eduModal">

										<div class="top8List2ContentCount"
											style="display: inline-table; width: 23%; padding: 20px">

											<p style="font-size: 20pt" class="hanna text-center mb-0">${d.rownum }위</p>
											<div style="text-align: center;">
												<img
													src="<%=application.getContextPath()%>/file?svr_img_file_nm=${d.svr_img_file_nm}&mfiletype=${d.img_file_type}"
													class="photo3" alt="img">
											</div>
											<div style="text-align: center;">
												<h4 class="hanna  text-secondary hidden text-center"
													style="padding-bottom: 0px">${d.course_nm}</h4>
											</div>
											<div style="text-align: center;">
												<p class="hanna  text-secondary hidden text-center"
													style="padding: 0px">${d.org_nm}</p>
											</div>
											<div style="text-align: center;">
												<p class="hanna  text-secondary hidden text-center"
													style="padding-top: 0px">${d.edu_st_dt}~${d.edu_ed_dt }</p>
											</div>
										</div>
									</a>
								</c:forEach></li>


						</ul>

						<div id='top8Exist' style="text-align: center; display: none">
							<div
								style="width: 1100px; height: 150px; margin-left: 20px; margin-right: 20px; margin-bottom: 20px">
								<h1 class='hanna'>현재 신청가능한 교육이 없습니다.</h1>
							</div>
						</div>

					</div>
				</div>
			</div>

			<h3 class="hanna text-uppercase text-secondary mb-0">신청 마감 임박!!</h3>


			<div class="row flyIn" id="services2">
				<div class="col-xl-12">
					<div class="">
						<div id="owl-works" class="">
							<c:forEach var="d" items="${ddayList }" varStatus="status">
								<a onclick="eduDetail('${d.course_cd}');" data-toggle="modal"
									data-target="#eduModal">

									<div class=" animated-fast ddayCount service-box" >

										<h4 class="hanna text-center mb-0">D-${d.dday }</h4>
										<div style="text-align: center;">
											<img
												src="<%=application.getContextPath()%>/file?svr_img_file_nm=${d.svr_img_file_nm}&mfiletype=${d.img_file_type}"
												class="photo3" alt="img">
										</div>
										<div style="text-align: center;">
											<h4 class="hanna  text-secondary hidden text-center"
												style="padding-bottom: 0px">${d.course_nm}</h4>
										</div>
										<div style="text-align: center;">
											<p class="hanna  text-secondary hidden text-center"
												style="padding: 0px">${d.org_nm}</p>
										</div>
										<div style="text-align: center;">
											<p class="hanna  text-secondary hidden text-center"
												style="padding-top: 0px">${d.edu_st_dt}~${d.edu_ed_dt }</p>
										</div>
									</div>
								</a>

							</c:forEach>

						</div>
						<div id='ddayExist' style="text-align: center; display: none">
							<div
								style="width: 1100px; height: 150px; margin-left: 20px; margin-right: 20px; margin-bottom: 20px">
								<h1 class='hanna'>1주일 이내로 마감되는 교육이 없습니다.</h1>
							</div>
						</div>
					</div>
				</div>
			</div>

			<h3 class="hanna text-uppercase text-secondary mb-0">카테고리별 교육</h3>
			<div class="">


				<div style="text-align: center; margin-bottom: 0px">
					<div>
						<button class="btn hanna filter-button" data-filter="all">모든교육</button>
						<button class="btn hanna filter-button" data-filter="3">신입</button>
						<button class="btn hanna filter-button" data-filter="2">내부</button>
						<button class="btn hanna filter-button" data-filter="1">외부</button>
					</div>
				</div>
				<br />


				<div class="row flyIn" id="services"
					style="padding-bottom: 30px; margin-bottom: 0px">
					<c:forEach var="d" items="${categoryList}" varStatus="status">
						<a onclick="eduDetail('${d.course_cd}');" data-toggle="modal"
							data-target="#eduModal">
							<div class="span3 animated-fast  filter ${d.high_cls_cd}"
								style="width: 240px; height: 320px; margin-left: 20px; margin-right: 20px; margin-bottom: 40px">
								<div class="service-box" style="width: 240px; height: 320px;">
									<img class="photo3" style="width: 150px; height: 150px"
										src="<%=application.getContextPath()%>/file?svr_img_file_nm=${d.svr_img_file_nm}&mfiletype=${d.img_file_type}"
										alt="" />
									<h2 class="hanna hidden">${d.course_nm}</h2>
									<p class="hanna hidden" style="padding-top: 0px">
										${d.org_nm} <br> ${d.edu_st_dt}~ ${d.edu_ed_dt }
									</p>
								</div>
							</div>
						</a>
					</c:forEach>
					
					<div id='categoryExist' style="text-align: center; display: none">
						<div
							style="width: 1100px; height: 150px; margin-left: 20px; margin-right: 20px; padding-bottom: 20px">
							<h1 class='hanna'>해당 카테고리 신청가능한 교육이 없습니다.</h1>
						</div>
					</div>

				</div>
			</div>
			
			<hr>
			
			<div style="text-align: center; padding-bottom: 70px;margin-top: 70px">
				<h3 class="hanna text-center">더욱 많은 교육정보를 알고싶으세요?</h3>
				<a href="EduList" class="btn text-center hanna" style="color:white; padding: 15px">더 많은 "교육정보" 보기 <img style="width: 20px" alt="" src="resources/image/plus.png"></a>
			</div>
			
		</div>
	</section>



	<!-- Contact Section -->
	<section id="myInfo" style="margin-bottom: 120px">
		<div class="container">
		
			<div style="text-align: center">
				<h2 style="padding-top: 80px;"
				class="hanna text-center text-uppercase text-secondary mb-0">${login_info.emm }님의
				정보</h2>
				<h3 class="hanna text-center">${login_info.emm }님이 신청하고 들었던 교육정보를 확인하세요!</h3>
				<a href="myInfomation" class="btn text-center hanna" style="color:white; padding: 15px">더 많은 "나의 정보" 보기 <img style="width: 20px" alt="" src="resources/image/plus.png"></a>
			</div>
			
			
			<hr class="star-dark2 mb-5">
			<div class="row">
				<div style="float: left; width: 100%; margin-bottom: 50px">
					<div style="float: left; width: 47%; ">
						<h3 class="hanna">신청 정보</h3>
						<hr>
						<c:forEach var="d" items="${myRegistList}"  begin="0" end="2" step="1" varStatus="status">
						<a onclick="infoDetail('${d.course_cd}');" data-toggle="modal"
							data-target="#infoModal">
						<div class="infoList" style="float: left; width: 100%; text-align: center; padding: 10px; vertical-align: middle;">
							<div style=" float: left; width: 20%; height: 72px">
								<img class="photo4" src="file?svr_img_file_nm=${d.svr_img_file_nm}&mfiletype=${d.img_file_type}" alt="">
							</div>
							<div style=" float: left; width: 60%;height: 72px; display: table;">
								<div style=" vertical-align: middle; display: table-cell;">
									<p style="font-size: 22px; padding: 0 " class="hanna hidden" >${d.course_nm} </p>
									<p style="font-size: 13px; padding : 0" class="hanna" >${d.org_nm} / ${d.edu_st_dt}~${d.edu_ed_dt}</p>
								</div>

							</div>
							<div style=" float: left; width: 20%; height: 72px; display: table; ">
								<p style="font-size: 18px; padding : 0 ;vertical-align: middle; display: table-cell;" class="hanna" >${d.step_nm }</p>
							</div>
						</div>
						</a>
						</c:forEach>
						
						<div id="info1" style="display:none; float: left; width: 100%; text-align: center; padding: 10px; vertical-align: middle;">
							
							<div style="float: left; width: 100%;height: 72px; display: table;">
								<div style=" vertical-align: middle; display: table-cell;">
									<p style="font-size: 22px; padding: 0 " class="hanna hidden" >해당 내역이 없습니다. </p>
								</div>
							</div>
							
						</div>
						<div class="infoList" id="moreInfo1" style="display:none; float: left; width: 100%; text-align: center; padding: 10px; vertical-align: middle;">	
							<a href="myInfomation">
							<div style="float: left; width: 100%;height: 30px; display: table;">
								<div style=" vertical-align: middle; display: table-cell;">
									<img width="20px" src="resources/main_page_resource/img/more.png" alt="">
								</div>
							</div>
							</a>
							
						</div>
					</div>
					<div style="float: left; width: 6%;">
					&nbsp;
					</div>
					<div style="float: left; width: 47%; ">
						<h3 class="hanna">수강중인 교육</h3>
						<hr>
						<c:forEach var="d" items="${myStudyList}"  begin="0" end="2" step="1" varStatus="status">
						<a onclick="infoDetail('${d.course_cd}');" data-toggle="modal"
							data-target="#infoModal">
						<div class="infoList" style="float: left; width: 100%; text-align: center; padding: 10px; vertical-align: middle;">
							<div style=" float: left; width: 20%; height: 72px">
								<img class="photo4" src="file?svr_img_file_nm=${d.svr_img_file_nm}&mfiletype=${d.img_file_type}" alt="">
							</div>
							<div style=" float: left; width: 60%;height: 72px; display: table;">
								<div style=" vertical-align: middle; display: table-cell;">
									<p style="font-size: 22px; padding: 0 " class="hanna hidden" >${d.course_nm} </p>
									<p style="font-size: 13px; padding : 0" class="hanna" >${d.org_nm} / ${d.edu_st_dt}~${d.edu_ed_dt}</p>
								</div>

							</div>
							<div style=" float: left; width: 20%; height: 72px; display: table; ">
								<p style="font-size: 18px; padding : 0 ;vertical-align: middle; display: table-cell;" class="hanna" >${d.stat_nm }</p>
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
						<div class="infoList" id="moreInfo2" style="display:none; float: left; width: 100%; text-align: center; padding: 10px; vertical-align: middle;">	
							<a href="myInfomation">
							<div style="float: left; width: 100%;height: 30px; display: table;">
								<div style=" vertical-align: middle; display: table-cell;">
									<img width="20px" src="resources/main_page_resource/img/more.png" alt="">
								</div>
							</div>
							</a>
						</div>
						
					</div>
					
				</div>
				
				
				<div style=" float: left; width: 100%;  ">
					<div style=" float: left; width: 47%; ">
						<h3 class="hanna">설문해주세요!!</h3>
						<hr>
						<c:forEach var="d" items="${mySurveyList}"  begin="0" end="2" step="1" varStatus="status">
						<a onclick="survayDetail('${d.course_cd}');" data-toggle="modal"
							data-target="#survayModal">
						<div class="infoList" style="float: left; width: 100%; text-align: center; padding: 10px; vertical-align: middle;">
							<div style=" float: left; width: 20%; height: 72px">
								<img class="photo4" src="file?svr_img_file_nm=${d.svr_img_file_nm}&mfiletype=${d.img_file_type}" alt="">
							</div>
							<div style=" float: left; width: 60%;height: 72px; display: table;">
								<div style=" vertical-align: middle; display: table-cell;">
									<p style="font-size: 22px; padding: 0 " class="hanna hidden" >${d.course_nm} </p>
									<p style="font-size: 13px; padding : 0" class="hanna" >${d.org_nm} / ${d.edu_st_dt}~${d.edu_ed_dt}</p>
								</div>

							</div>
							<div style=" float: left; width: 20%; height: 72px; display: table; ">
								<p style="font-size: 18px; padding : 0 ;vertical-align: middle; display: table-cell;" class="hanna" >${d.stat_nm }</p>
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
						<div class="infoList" id="moreInfo3" style="display:none; float: left; width: 100%; text-align: center; padding: 10px; vertical-align: middle;">	
							<a href="myInfomation">
							<div style="float: left; width: 100%;height: 30px; display: table;">
								<div style=" vertical-align: middle; display: table-cell;">
									<img width="20px" src="resources/main_page_resource/img/more.png" alt="">
								</div>
							</div>
							</a>
						</div>
					</div>
					<div style="float: left; width: 6%;">
					&nbsp;
					</div>
					<div style=" float: left; width: 47%;">
						<h3 class="hanna">최근 수강 내역</h3>
						<hr>
						<c:forEach var="d" items="${myRecentList}"  begin="0" end="2" step="1" varStatus="status">
						<a onclick="recentDetail('${d.course_cd}');" data-toggle="modal"
							data-target="#recentModal">
						<div class="infoList" style="float: left; width: 100%; text-align: center; padding: 10px; vertical-align: middle;">
							<div style=" float: left; width: 20%; height: 72px">
								<img class="photo4" src="file?svr_img_file_nm=${d.svr_img_file_nm}&mfiletype=${d.img_file_type}" alt="">
							</div>
							<div style=" float: left; width: 60%;height: 72px; display: table;">
								<div style=" vertical-align: middle; display: table-cell;">
									<p style="font-size: 22px; padding: 0 " class="hanna hidden" >${d.course_nm} </p>
									<p style="font-size: 13px; padding : 0" class="hanna" >${d.org_nm} / ${d.edu_st_dt}~${d.edu_ed_dt}</p>
								</div>

							</div>
							<div style=" float: left; width: 20%; height: 72px; display: table; ">
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
						<div class="infoList" id="moreInfo4" style="display:none; float: left; width: 100%; text-align: center; padding: 10px; vertical-align: middle;">	
							<a href="myInfomation">	
							<div style="float: left; width: 100%;height: 30px; display: table;">
								<div style=" vertical-align: middle; display: table-cell;">
									<img width="20px" src="resources/main_page_resource/img/more.png" alt="">
								</div>
							</div>
							</a>
						</div>
					</div>
				</div>


			</div>
			<hr>
			
			<div style="text-align: center; margin-top: 70px">
				<h3 class="hanna text-center">${login_info.emm }님의 더욱 자세한 정보를 알고 싶으세요?</h3>
				<a href="myInfomation" class="btn text-center hanna" style="color:white; padding: 15px">더 많은 "나의 정보" 보기 <img style="width: 20px" alt="" src="resources/image/plus.png"></a>
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