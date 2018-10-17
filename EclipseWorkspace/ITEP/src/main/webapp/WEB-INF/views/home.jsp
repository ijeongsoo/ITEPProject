<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
<!-- 		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
 -->		<meta name="description" content="">
		<meta name="author" content="">
		
	    <title >IT그룹 교육 포탈</title>
	    
  		<script src="<%=application.getContextPath()%>/resources/main_page_resource/js/jquery.js"></script>
	
		<link href="<%=application.getContextPath()%>/resources/main_page_resource/css/style.css" rel="stylesheet">

		    <!-- Bootstrap core CSS -->
     	<link href="<%=application.getContextPath()%>/resources/main_page_resource/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
		
	    <!-- Custom fonts for this template -->
	    <link href="<%=application.getContextPath()%>/resources/main_page_resource/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

	    <!-- Plugin CSS -->
	    <link href="<%=application.getContextPath()%>/resources/main_page_resource/vendor/magnific-popup/magnific-popup.css" rel="stylesheet" type="text/css">
	
	    <!-- Custom styles for this template -->
	    <link href="<%=application.getContextPath()%>/resources/main_page_resource/css/freelancer.min.css" rel="stylesheet">
    

		  <link href="<%=application.getContextPath()%>/resources/main_page_resource/sub/css/owl.carousel.css" rel="stylesheet" media="screen" />
		  <link href="<%=application.getContextPath()%>/resources/main_page_resource/sub/css/owl.theme.css" rel="stylesheet" media="screen" />
		  <link href="<%=application.getContextPath()%>/resources/main_page_resource/sub/css/style.css" rel="stylesheet">
		  <link href="<%=application.getContextPath()%>/resources/main_page_resource/sub/color/default.css" rel="stylesheet">
		 <link href="<%=application.getContextPath()%>/resources/css/itep.css" rel="stylesheet" type="text/css">
		    	

    	
    	<script>
    		// 관리자만 보이게    		
			$( function() {
				if(${login_info.auth_cd} !='04'){
					$("#adminButton").attr('style', 'visiblity:show');
				}
				
				if($('.ddayCount').length == 0){
		        	$("#ddayExist").attr('style', 'display:inline; text-align:center');
		        }else{
		        	$("#ddayExist").attr('style', 'display:none');
		        }
				
				if($('.top8List1ContentCount').length == 0){
					$("#top8List1").remove();
					$("#top8Exist").attr('style', 'display:inline; text-align:center');
		        }else{
		        	$("#top8Exist").attr('style','display:none');

		        }
				
				if($('.top8List2ContentCount').length == 0){
										
					$("#top8List2").remove();
		        }
	       
				
			});
    		
			$(document).ready(function(){
				
				if($('.filter').length == 0){
		        	$("#categoryExist").attr('style', 'display:inline; text-align:center')
		        }else{
		        	$("#categoryExist").attr('style', 'display:none')
		        }

			    $(".filter-button").click(function(){
			        var value = $(this).attr('data-filter');
			        
			        if(value == "all")
			        {
			        	if($('.filter').length == 0){
				        	$("#categoryExist").attr('style', 'display:inline; text-align:center')
				        }else{
				        	$("#categoryExist").attr('style', 'display:none')
				        }
			            //$('.filter').removeClass('hidden');
			            $('.filter').show('1000');
			        }
			        else
			        {
			        	
			        	if($('.'+value).length == 0){
				        	$("#categoryExist").attr('style', 'display:inline; text-align:center')
				        }else{
				        	$("#categoryExist").attr('style', 'display:none')
				        }
//			            $('.filter[filter-item="'+value+'"]').removeClass('hidden');
//			            $(".filter").not('.filter[filter-item="'+value+'"]').addClass('hidden');
			            $(".filter").not('.'+value).hide('3000');
			            $('.filter').filter('.'+value).show('3000');
			            
			        }
			    });
			    
			    if ($(".filter-button").removeClass("active")) {
						$(this).removeClass("active");
				}
				$(this).addClass("active");

			});

    		
    	</script>
    	
	</head>
<body id="page-top">

	<!-- Navigation -->
	<nav class="navbar navbar-expand bg-secondary fixed-top text-uppercase"
		id="mainNav">
		<div class="container">
			<a class="hanna navbar-brand js-scroll-trigger" href="#page-top">IBK
				교육 포탈</a>

			<div class=" " id="">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item mx-0 mx-sm-1"><a id='adminButton'
						style="visibility: hidden;"
						class="hanna nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
						href="#contact">관리자</a></li>
					<li class="nav-item mx-0 mx-sm-1"><a
						class="hanna nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
						href="#portfolio">교육 정보</a></li>
					<li class="nav-item mx-0 mx-sm-1"><a
						class="hanna nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
						href="#about">${login_info.emm}님의 정보</a></li>

				</ul>
			</div>
		</div>
	</nav>

	<!-- Header -->
	<header class="masthead text-white text-center"
		style="background-color: #5098ba; margin-top: 50px;">
		<div class="container">

			<div>

				<h1 class="hanna animated fadeInLeftBig"
					style="font-size: 180px; margin-bottom: 90px; z-index: 5">공부
					의지가</h1>
			</div>
			<div>

				<h1 class="hanna animated fadeInRightBig"
					style="font-size: 180px; margin-bottom: 60px; z-index: 5">불타
					오른다</h1>

			</div>
			<div class="animated fadeInUp">
				<h2 class="hanna" style="display: inline;">- 불타서 사라짐 -</h2>
				<img
					style="position: absolute; top: -250px; width: 300px; opacity: 0.3; z-index: 1"
					src="resources/main_page_resource/img/book.png" alt="">

			</div>

		</div>
	</header>

	<!-- Portfolio Grid Section -->
	<section class="portfolio" id="portfolio"
		style="background-color: #fdfde9">
		<div class="container">
			<h2 class="hanna text-center text-uppercase text-secondary mb-0">교육
				정보</h2>
			<hr class="star-dark mb-5">

			<h3 class="hanna text-uppercase text-secondary mb-0">인기 교육 Top 8</h3>

			<div class="row flyIn">
				<div class="col-lg-12">
					<div class="testimonialslide  ">
						<ul class="slides" id="top8List1">
							<li style="text-align: center;"><c:forEach var="d"
									items="${top8List1}" varStatus="status">
									<div class="top8List1ContentCount" style="display: inline-table; width: 20%; padding: 30px">
										<a href="img/works/1.jpg" title="This is an image title"
											data-lightbox-gallery="gallery1"
											data-lightbox-hidpi="resources/main_page_resource/sub/img/works/1@2x.jpg">
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
													style="padding-top: 0px">${d.edu_st_dt}~ ${d.edu_ed_dt }</p>
											</div>
										</a>
									</div>
								</c:forEach></li>
								<li id="top8List2" style="text-align: center; "><c:forEach var="d"
									items="${top8List2}" varStatus="status">
									<div class="top8List2ContentCount" style="display: inline-table; width: 23%; padding: 20px">
										<a href="img/works/1.jpg" title="This is an image title"
											data-lightbox-gallery="gallery1"
											data-lightbox-hidpi="resources/main_page_resource/sub/img/works/1@2x.jpg">
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
													style="padding-top: 0px">${d.edu_st_dt}~ ${d.edu_ed_dt }</p>
											</div>
										</a>
									</div>
								</c:forEach></li>
								
								
						</ul>
						
						<div id='top8Exist' style="text-align:center ; display: none">
									<div  style="width: 1100px; height: 150px; margin-left:  20px; margin-right :  20px ; margin-bottom: 20px ">
									<h1 class='hanna'>현재 신청가능한 교육이 없습니다.</h1>
									</div>
						</div>

					</div>
				</div>
			</div>


			<h3 class="hanna text-uppercase text-secondary mb-0">신청 마감 임박!!</h3>


			<div class="row flyIn">
				<div class="col-xl-12">
					<div class="">
						<div id="owl-works" class="">
							<c:forEach var="d" items="${ddayList }" varStatus="status">
								<div class="ddayCount">
									<a href="img/works/1.jpg" title="This is an image title"
										data-lightbox-gallery="gallery1"
										data-lightbox-hidpi="resources/main_page_resource/sub/img/works/1@2x.jpg">
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
												style="padding-top: 0px">${d.edu_st_dt}~ ${d.edu_ed_dt }</p>
										</div>
									</a>
								</div>
							</c:forEach>
							
						</div>
						<div id='ddayExist' style="text-align:center ; display: none">
								<div  style="width: 1100px; height: 150px; margin-left:  20px; margin-right :  20px ; margin-bottom: 20px ">
								<h1 class='hanna'>1주일 이내로 마감되는 교육이 없습니다.</h1>
								</div>
							</div>
					</div>
				</div>
			</div>
			
			<h3 class="hanna text-uppercase text-secondary mb-0">카테고리별 교육</h3>
			<div class="">
			

			<div style="text-align: center; margin-bottom: 0px">
        		<div >
            	<button class="btn btn-default filter-button" data-filter="all">모든교육</button>
            	<button class="btn btn-default filter-button" data-filter="3">신입</button>
            	<button class="btn btn-default filter-button" data-filter="2">내부</button>
            	<button class="btn btn-default filter-button" data-filter="1">외부</button>
        		</div>
        	</div>
        	<br/>


		<div class="row flyIn" id="services">
			<c:forEach var="d" items="${categoryList}" varStatus="status">
				<div class="span3 animated-fast  filter ${d.high_cls_cd}" style="width: 240px; height: 320px; margin-left:  20px; margin-right :  20px ; margin-bottom: 20px ">
					<div class="service-box" style="width: 240px; height: 320px; ">
						<img class="photo3" style="width: 150px; height: 150px" src="<%=application.getContextPath()%>/file?svr_img_file_nm=${d.svr_img_file_nm}&mfiletype=${d.img_file_type}" alt="" />
						<h2 class="hanna hidden">${d.course_nm}</h2>
						<p class="hanna hidden" style="padding-top: 0px">
							${d.org_nm} <br> ${d.edu_st_dt}~ ${d.edu_ed_dt }
						</p>
					</div>
				</div>
			</c:forEach>
				<div id='categoryExist' style="text-align:center ; display: none">
					<div  style="width: 1100px; height: 150px; margin-left:  20px; margin-right :  20px ; margin-bottom: 20px ">
					<h1 class='hanna'>   해당 카테고리 신청가능한 교육이 없습니다.</h1>
					</div>
				</div>
				
            </div>
        </div>

		</div>
	</section>





	<!-- About Section -->
	<section class="bg-primary text-white mb-0" id="about">
		<div class="container">
			<h2 class="text-center text-uppercase text-white">About</h2>
			<hr class="star-light mb-5">
			<div class="row">

				<div class="col-lg-4 ml-auto">

					<p class="lead">Freelancer is a free bootstrap theme created by
						Start Bootstrap. The download includes the complete source files
						including HTML, CSS, and JavaScript as well as optional LESS
						stylesheets for easy customization.</p>
				</div>
				<div class="col-lg-4 mr-auto">
					<p class="lead">Whether you're a student looking to showcase
						your work, a professional looking to attract clients, or a graphic
						artist looking to share your projects, this template is the
						perfect starting point!</p>
				</div>
			</div>
			<div class="text-center mt-4">
				<a class="btn btn-xl btn-outline-light" href="#"> <i
					class="fas fa-download mr-2"></i> Download Now!
				</a>
			</div>


		</div>
	</section>

	<!-- Contact Section -->
	<section id="contact">
		<div class="container">
			<h2 class="text-center text-uppercase text-secondary mb-0">Contact
				Me</h2>
			<hr class="star-dark mb-5">
			<div class="row">
				<div class="col-lg-8 mx-auto">
					<!-- To configure the contact form email address, go to mail/contact_me.php and update the email address in the PHP file on line 19. -->
					<!-- The form should work on most web servers, but if the form is not working you may need to configure your web server differently. -->
					<form name="sentMessage" id="contactForm" novalidate="novalidate">
						<div class="control-group">
							<div
								class="form-group floating-label-form-group controls mb-0 pb-2">
								<label>Name</label> <input class="form-control" id="name"
									type="text" placeholder="Name" required="required"
									data-validation-required-message="Please enter your name.">
								<p class="help-block text-danger"></p>
							</div>
						</div>
						<div class="control-group">
							<div
								class="form-group floating-label-form-group controls mb-0 pb-2">
								<label>Email Address</label> <input class="form-control"
									id="email" type="email" placeholder="Email Address"
									required="required"
									data-validation-required-message="Please enter your email address.">
								<p class="help-block text-danger"></p>
							</div>
						</div>
						<div class="control-group">
							<div
								class="form-group floating-label-form-group controls mb-0 pb-2">
								<label>Phone Number</label> <input class="form-control"
									id="phone" type="tel" placeholder="Phone Number"
									required="required"
									data-validation-required-message="Please enter your phone number.">
								<p class="help-block text-danger"></p>
							</div>
						</div>
						<div class="control-group">
							<div
								class="form-group floating-label-form-group controls mb-0 pb-2">
								<label>Message</label>
								<textarea class="form-control" id="message" rows="5"
									placeholder="Message" required="required"
									data-validation-required-message="Please enter a message."></textarea>
								<p class="help-block text-danger"></p>
							</div>
						</div>
						<br>
						<div id="success"></div>
						<div class="form-group">
							<button type="submit" class="btn btn-primary btn-xl"
								id="sendMessageButton">Send</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>

	<!-- Footer -->
	<footer class="footer text-center">
		<div class="container">
			<div class="row">
				<div class="col-md-4 mb-5 mb-lg-0">
					<h4 class="text-uppercase mb-4">Location</h4>
					<p class="lead mb-0">
						2215 John Daniel Drive <br>Clark, MO 65243
					</p>
				</div>
				<div class="col-md-4 mb-5 mb-lg-0">
					<h4 class="text-uppercase mb-4">Around the Web</h4>
					<ul class="list-inline mb-0">
						<li class="list-inline-item"><a
							class="btn btn-outline-light btn-social text-center rounded-circle"
							href="#"> <i class="fab fa-fw fa-facebook-f"></i>
						</a></li>
						<li class="list-inline-item"><a
							class="btn btn-outline-light btn-social text-center rounded-circle"
							href="#"> <i class="fab fa-fw fa-google-plus-g"></i>
						</a></li>
						<li class="list-inline-item"><a
							class="btn btn-outline-light btn-social text-center rounded-circle"
							href="#"> <i class="fab fa-fw fa-twitter"></i>
						</a></li>
						<li class="list-inline-item"><a
							class="btn btn-outline-light btn-social text-center rounded-circle"
							href="#"> <i class="fab fa-fw fa-linkedin-in"></i>
						</a></li>
						<li class="list-inline-item"><a
							class="btn btn-outline-light btn-social text-center rounded-circle"
							href="#"> <i class="fab fa-fw fa-dribbble"></i>
						</a></li>
					</ul>
				</div>
				<div class="col-md-4">
					<h4 class="text-uppercase mb-4">About Freelancer</h4>
					<p class="lead mb-0">
						Freelance is a free to use, open source Bootstrap theme created by
						<a href="http://startbootstrap.com">Start Bootstrap</a>.
					</p>
				</div>
			</div>
		</div>
	</footer>

	<div class="copyright py-4 text-center text-white">
		<div class="container">
			<small>Copyright &copy; Your Website 2018</small>
		</div>
	</div>

	<!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
	<div class="scroll-to-top d-lg-none position-fixed ">
		<a class="js-scroll-trigger d-block text-center text-white rounded"
			href="#page-top"> <i class="fa fa-chevron-up"></i>
		</a>
	</div>

	<!-- Portfolio Modals -->

	<!-- Portfolio Modal 1 -->
	<div class="portfolio-modal mfp-hide" id="portfolio-modal-1">
		<div class="portfolio-modal-dialog bg-white">
			<a class="close-button d-none d-md-block portfolio-modal-dismiss"
				href="#"> <i class="fa fa-3x fa-times"></i>
			</a>
			<div class="container text-center">
				<div class="row">
					<div class="col-lg-8 mx-auto">
						<h2 class="text-secondary text-uppercase mb-0">Project Name</h2>
						<hr class="star-dark mb-5">
						<img class="img-fluid mb-5" src="img/portfolio/cabin.png" alt="">
						<p class="mb-5">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit. Mollitia neque assumenda ipsam nihil, molestias
							magnam, recusandae quos quis inventore quisquam velit asperiores,
							vitae? Reprehenderit soluta, eos quod consequuntur itaque. Nam.</p>
						<a
							class="btn btn-primary btn-lg rounded-pill portfolio-modal-dismiss"
							href="#"> <i class="fa fa-close"></i> Close Project
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Portfolio Modal 2 -->
	<div class="portfolio-modal mfp-hide" id="portfolio-modal-2">
		<div class="portfolio-modal-dialog bg-white">
			<a class="close-button d-none d-md-block portfolio-modal-dismiss"
				href="#"> <i class="fa fa-3x fa-times"></i>
			</a>
			<div class="container text-center">
				<div class="row">
					<div class="col-lg-8 mx-auto">
						<h2 class="text-secondary text-uppercase mb-0">Project Name</h2>
						<hr class="star-dark mb-5">
						<img class="img-fluid mb-5" src="img/portfolio/cake.png" alt="">
						<p class="mb-5">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit. Mollitia neque assumenda ipsam nihil, molestias
							magnam, recusandae quos quis inventore quisquam velit asperiores,
							vitae? Reprehenderit soluta, eos quod consequuntur itaque. Nam.</p>
						<a
							class="btn btn-primary btn-lg rounded-pill portfolio-modal-dismiss"
							href="#"> <i class="fa fa-close"></i> Close Project
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Portfolio Modal 3 -->
	<div class="portfolio-modal mfp-hide" id="portfolio-modal-3">
		<div class="portfolio-modal-dialog bg-white">
			<a class="close-button d-none d-md-block portfolio-modal-dismiss"
				href="#"> <i class="fa fa-3x fa-times"></i>
			</a>
			<div class="container text-center">
				<div class="row">
					<div class="col-lg-8 mx-auto">
						<h2 class="text-secondary text-uppercase mb-0">Project Name</h2>
						<hr class="star-dark mb-5">
						<img class="img-fluid mb-5" src="img/portfolio/circus.png" alt="">
						<p class="mb-5">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit. Mollitia neque assumenda ipsam nihil, molestias
							magnam, recusandae quos quis inventore quisquam velit asperiores,
							vitae? Reprehenderit soluta, eos quod consequuntur itaque. Nam.</p>
						<a
							class="btn btn-primary btn-lg rounded-pill portfolio-modal-dismiss"
							href="#"> <i class="fa fa-close"></i> Close Project
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Portfolio Modal 4 -->
	<div class="portfolio-modal mfp-hide" id="portfolio-modal-4">
		<div class="portfolio-modal-dialog bg-white">
			<a class="close-button d-none d-md-block portfolio-modal-dismiss"
				href="#"> <i class="fa fa-3x fa-times"></i>
			</a>
			<div class="container text-center">
				<div class="row">
					<div class="col-lg-8 mx-auto">
						<h2 class="text-secondary text-uppercase mb-0">Project Name</h2>
						<hr class="star-dark mb-5">
						<img class="img-fluid mb-5" src="img/portfolio/game.png" alt="">
						<p class="mb-5">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit. Mollitia neque assumenda ipsam nihil, molestias
							magnam, recusandae quos quis inventore quisquam velit asperiores,
							vitae? Reprehenderit soluta, eos quod consequuntur itaque. Nam.</p>
						<a
							class="btn btn-primary btn-lg rounded-pill portfolio-modal-dismiss"
							href="#"> <i class="fa fa-close"></i> Close Project
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Portfolio Modal 5 -->
	<div class="portfolio-modal mfp-hide" id="portfolio-modal-5">
		<div class="portfolio-modal-dialog bg-white">
			<a class="close-button d-none d-md-block portfolio-modal-dismiss"
				href="#"> <i class="fa fa-3x fa-times"></i>
			</a>
			<div class="container text-center">
				<div class="row">
					<div class="col-lg-8 mx-auto">
						<h2 class="text-secondary text-uppercase mb-0">Project Name</h2>
						<hr class="star-dark mb-5">
						<img class="img-fluid mb-5" src="img/portfolio/safe.png" alt="">
						<p class="mb-5">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit. Mollitia neque assumenda ipsam nihil, molestias
							magnam, recusandae quos quis inventore quisquam velit asperiores,
							vitae? Reprehenderit soluta, eos quod consequuntur itaque. Nam.</p>
						<a
							class="btn btn-primary btn-lg rounded-pill portfolio-modal-dismiss"
							href="#"> <i class="fa fa-close"></i> Close Project
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Portfolio Modal 6 -->
	<div class="portfolio-modal mfp-hide" id="portfolio-modal-6">
		<div class="portfolio-modal-dialog bg-white">
			<a class="close-button d-none d-md-block portfolio-modal-dismiss"
				href="#"> <i class="fa fa-3x fa-times"></i>
			</a>
			<div class="container text-center">
				<div class="row">
					<div class="col-lg-8 mx-auto">
						<h2 class="text-secondary text-uppercase mb-0">Project Name</h2>
						<hr class="star-dark mb-5">
						<img class="img-fluid mb-5" src="img/portfolio/submarine.png"
							alt="">
						<p class="mb-5">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit. Mollitia neque assumenda ipsam nihil, molestias
							magnam, recusandae quos quis inventore quisquam velit asperiores,
							vitae? Reprehenderit soluta, eos quod consequuntur itaque. Nam.</p>
						<a
							class="btn btn-primary btn-lg rounded-pill portfolio-modal-dismiss"
							href="#"> <i class="fa fa-close"></i> Close Project
						</a>
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
	<%--  	<script src="<%=application.getContextPath()%>/resources/main_page_resource/js/isotope.js"></script>
 --%>
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
