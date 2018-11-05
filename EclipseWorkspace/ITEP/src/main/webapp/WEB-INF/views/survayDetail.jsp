<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<script type="text/javascript">
	
	$(function() {
		
		$('#sur_point').val( $('.onto').length );
		 	
		$('.starRev span').click(function(){
			  $(this).parent().children('span').removeClass('onto');
			  $(this).addClass('onto').prevAll('span').addClass('onto');
			  $('#sur_point').val( $('.onto').length );
			  return false;
			});
		
		
		var reg_file_nm = encodeURI('${edu.svr_reg_file_nm}');
		var reg_file_type = encodeURI('${edu.reg_file_type}');
		var plan_file_nm = encodeURI('${edu.svr_plan_file_nm}');
		var plan_file_type = encodeURI('${edu.plan_file_type}');
		
		$('#regDownloadLink').attr("href", "file?svr_img_file_nm="+reg_file_nm+"&img_file_type="+reg_file_type+"&source=reg")
		$('#planDownloadLink').attr("href", "file?svr_img_file_nm="+plan_file_nm+"&img_file_type="+plan_file_type+"&source=plan")
		
	});
	
	function validation() {
		if($('#opinion').val() != ''){
			$('#survayBtn').removeClass('disabled');
		}else{
			$('#survayBtn').addClass('disabled');

		}
		
	}

	
	function submitSurvay()
	{	
		//폼전송 
		var form = $('#survayForm')[0];
		var formData = new FormData(form);
		
		if($('#main_name').text() == 'IBK IT 교육 포탈'){
			$.ajax({
				url:'survay',
				processData : false,
				contentType : false,
				data: formData,
				type: 'POST',
				success : function(data){
					
					$('#btnSurvayModalClose').trigger('click');
					if(data.result == '1'){
						alert("신청이 완료되었습니다.");
						var survayArry = data.survayList;
						var recentArry = data.recentList;
						$('#mySurvayListView').html(' ');
						$('#myRecentListView').html(' ');
						if(data.survayCount>3){
							for (var i=0; i<3; i++) {
								var survayInhtml = '<a onclick="survayDetail('+ survayArry[i].course_cd +');" data-toggle="modal" data-target="#survayModal">' +
								'<div class="infoList" style="float: left; width: 100%; text-align: center; padding: 10px; vertical-align: middle;">' +
								'<div style=" float: left; width: 20%; height: 72px">' +
								'<img class="photo4" src="file?svr_img_file_nm='+ survayArry[i].svr_img_file_nm +'&mfiletype='+ survayArry[i].img_file_type +'" alt="">' +
								'</div>' +
								'<div style=" float: left; width: 60%;height: 72px; display: table;">' +
								'<div style=" vertical-align: middle; display: table-cell;">' +
								'<p style="font-size: 22px; padding: 0 " class="hanna hidden" >'+ survayArry[i].course_nm +' </p>' +
								'<p style="font-size: 13px; padding : 0" class="hanna" >'+ survayArry[i].org_nm +'/ '+ survayArry[i].edu_st_dt +'~'+ survayArry[i].edu_ed_dt +'</p>'+
								'</div>' +
								'</div>' +
								'<div style=" float: left; width: 20%; height: 72px; display: table; ">' +
								'<p style="font-size: 18px; padding : 0 ;vertical-align: middle; display: table-cell;" class="hanna" >'+ survayArry[i].stat_nm +'</p>' +
								'</div>'+
								'</div>'+
								'</a>';
																
								$('#mySurvayListView').append(survayInhtml);
							}
						}else{
							for (var i=0; i<data.survayCount; i++) {
								var survayInhtml = '<a onclick="survayDetail('+ survayArry[i].course_cd +');" data-toggle="modal" data-target="#survayModal">' +
								'<div class="infoList" style="float: left; width: 100%; text-align: center; padding: 10px; vertical-align: middle;">' +
								'<div style=" float: left; width: 20%; height: 72px">' +
								'<img class="photo4" src="file?svr_img_file_nm='+ survayArry[i].svr_img_file_nm +'&mfiletype='+ survayArry[i].img_file_type +'" alt="">' +
								'</div>' +
								'<div style=" float: left; width: 60%;height: 72px; display: table;">' +
								'<div style=" vertical-align: middle; display: table-cell;">' +
								'<p style="font-size: 22px; padding: 0 " class="hanna hidden" >'+ survayArry[i].course_nm +' </p>' +
								'<p style="font-size: 13px; padding : 0" class="hanna" >'+ survayArry[i].org_nm +'/ '+ survayArry[i].edu_st_dt +'~'+ survayArry[i].edu_ed_dt +'</p>'+
								'</div>' +
								'</div>' +
								'<div style=" float: left; width: 20%; height: 72px; display: table; ">' +
								'<p style="font-size: 18px; padding : 0 ;vertical-align: middle; display: table-cell;" class="hanna" >'+ survayArry[i].stat_nm +'</p>' +
								'</div>'+
								'</div>'+
								'</a>';
								
								$('#mySurvayListView').append(survayInhtml);
							}
						}
						
						
						if(data.recentCount>3){
							for (var i=0; i<3; i++) {
								var recentInhtml = '<a onclick="recentDetail('+ recentArry[i].course_cd +');" data-toggle="modal" data-target="#recentModal">' +
								'<div class="infoList" style="float: left; width: 100%; text-align: center; padding: 10px; vertical-align: middle;">' +
								'<div style=" float: left; width: 20%; height: 72px">' +
								'<img class="photo4" src="file?svr_img_file_nm='+ recentArry[i].svr_img_file_nm +'&mfiletype='+ recentArry[i].img_file_type +'" alt="">' +
								'</div>' +
								'<div style=" float: left; width: 60%;height: 72px; display: table;">' +
								'<div style=" vertical-align: middle; display: table-cell;">' +
								'<p style="font-size: 22px; padding: 0 " class="hanna hidden" >'+ recentArry[i].course_nm +' </p>' +
								'<p style="font-size: 13px; padding : 0" class="hanna" >'+ recentArry[i].org_nm +'/ '+ recentArry[i].edu_st_dt +'~'+ recentArry[i].edu_ed_dt +'</p>'+
								'</div>' +
								'</div>' +
								'<div style=" float: left; width: 20%; height: 72px; display: table; ">' +
								'<div class="starRev" style="vertical-align: middle; display: table-cell;">';
								
								for(var j=0; j<recentArry[i].sur_point; j++){
									recentInhtml = recentInhtml + '<span class="starMini on"></span>';
								}
								
								for(var k=0; k<(5-recentArry[i].sur_point); k++){
									recentInhtml = recentInhtml + '<span class="starMini"></span>';
								}
								
								recentInhtml = 	recentInhtml +
								'</div>' +		
								'</div>'+
								'</a>';
								
								$('#myRecentListView').append(recentInhtml);
							}
						}else{
							for (var i=0; i<data.recentCount; i++) {
								var recentInhtml = '<a onclick="recentDetail('+ recentArry[i].course_cd +');" data-toggle="modal" data-target="#recentModal">' +
								'<div class="infoList" style="float: left; width: 100%; text-align: center; padding: 10px; vertical-align: middle;">' +
								'<div style=" float: left; width: 20%; height: 72px">' +
								'<img class="photo4" src="file?svr_img_file_nm='+ recentArry[i].svr_img_file_nm +'&mfiletype='+ recentArry[i].img_file_type +'" alt="">' +
								'</div>' +
								'<div style=" float: left; width: 60%;height: 72px; display: table;">' +
								'<div style=" vertical-align: middle; display: table-cell;">' +
								'<p style="font-size: 22px; padding: 0 " class="hanna hidden" >'+ recentArry[i].course_nm +' </p>' +
								'<p style="font-size: 13px; padding : 0" class="hanna" >'+ recentArry[i].org_nm +'/ '+ recentArry[i].edu_st_dt +'~'+ recentArry[i].edu_ed_dt +'</p>'+
								'</div>' +
								'</div>' +
								'<div style=" float: left; width: 20%; height: 72px; display: table; ">' +
								'<div class="starRev" style="vertical-align: middle; display: table-cell;">';
								
								for(var j=0; j<recentArry[i].sur_point; j++){
									recentInhtml = recentInhtml + '<span class="starMini on"></span>';
								}
								
								for(var k=0; k<(5-recentArry[i].sur_point); k++){
									recentInhtml = recentInhtml + '<span class="starMini"></span>';
								}
								
								recentInhtml = 	recentInhtml +
								'</div>' +		
								'</div>'+
								'</a>';
								
								$('#myRecentListView').append(recentInhtml);
							}
						}
						
						
						
						if(data.survayCount > 3){
				        	$("#moreInfo3").attr('style', 'float: left; width: 100%; text-align: center; padding: 10px; vertical-align: middle;');
				        }else{
				        	$("#moreInfo3").attr('style', 'display:none;');
				        }
						
						if(data.survayCount != 0){
				        	$("#info3").attr('style', 'display:none');
				        }else{
				        	$("#info3").attr('style', 'float: left; width: 100%; text-align: center; padding: 10px; vertical-align: middle');
				        }
					
						if(data.recentCount > 3){
				        	$("#moreInfo4").attr('style', 'float: left; width: 100%; text-align: center; padding: 10px; vertical-align: middle;');
				        }else{
				        	$("#moreInfo4").attr('style', 'display:none;');
				        }
						
						if(data.recentCount != 0){
				        	$("#info4").attr('style', 'display:none');
				        }else{
				        	$("#info4").attr('style', 'float: left; width: 100%; text-align: center; padding: 10px; vertical-align: middle');
				        }
						
						
					}else{
						alert("등록에 실패했습니다. 설문서를 확인해주세요.");
					}

					
				}


			});
		}else{
			$.ajax({
				url:'survay',
				processData : false,
				contentType : false,
				data: formData,
				type: 'POST',
				success : function(data){
					
					$('#btnSurvayModalClose').trigger('click');
					if(data.result == '1'){
						alert("신청이 완료되었습니다.");
						var survayArry = data.survayList;
						var recentArry = data.recentList;
						$('#mySurvayListView').html('');
						$('#myRecentListView').html('');
						
							for (var i=0; i<data.survayCount; i++) {
								var survayInhtml = '<a onclick="survayDetail('+survayArry[i].course_cd+');" data-toggle="modal" data-target="#survayModal">' +
								'<div class="infoList line-content3" style=" width: 100%; padding: 10px">' +
								'<div style=" display:inline-table ;  width: 10% ">' +
								'<img class="photo4" src="file?svr_img_file_nm='+ survayArry[i].svr_img_file_nm +'&mfiletype='+ survayArry[i].img_file_type +'" alt="">' +
								'</div>' +
								'<div style=" display:inline-table;  width: 50%; padding-left: 40px">' +
								'<div style="vertical-align: middle; text-align: left; ">' +
								'<p style="font-size: 22px; padding: 0; " class="hanna hidden-large" >'+survayArry[i].course_nm+'</p>' +
								'<p style="font-size: 15px; padding : 0;" class="hanna" >'+survayArry[i].org_nm+' / '+survayArry[i].edu_st_dt+'~'+survayArry[i].edu_ed_dt+'</p>' +
								'</div>' +
								'</div>' +
								'<div style="vertical-align: middle; display:inline-table;  width: 6%">'+
								'<div style="vertical-align: middle; ">'+
								'<p class="hanna">'+survayArry[i].edu_hour+'h</p>'+
								'</div>'+
								'</div>'+
								'<div style="vertical-align: middle; display:inline-table;  width: 15%">'+
								'<div style="vertical-align: middle; ">'+
								'<p class="hanna">'+survayArry[i].reg_dt+'</p>'+
								'</div>'+
								'</div>'+
								'<div style=" display:inline-table;  width: 15%">'+
								'<div style="vertical-align: middle; ">'+
								'<p class="hanna">'+survayArry[i].stat_nm+'</p>'+
								'</div>'+
								'</div>'+
								'</div>'+
								'</a>';
						
								$('#mySurvayListView').append(survayInhtml);
						}
						
						
							for (var i=0;i<data.recentCount; i++) {
								var recentInhtml = '<a onclick="recentDetail('+ recentArry[i].course_cd +');" data-toggle="modal" data-target="#recentModal">' +
								'<div class="infoList line-content4" style=" width: 100%; padding: 10px">' +
								'<div style=" display:inline-table ;  width: 10% ">' +
								'<img class="photo4" src="file?svr_img_file_nm='+ recentArry[i].svr_img_file_nm +'&mfiletype='+ recentArry[i].img_file_type +'" alt="">'+
								'</div>'+
								'<div style=" display:inline-table;  width: 50%; padding-left: 40px">'+
								'<div style="vertical-align: middle; text-align: left; ">'+
								'<p style="font-size: 22px; padding: 0; " class="hanna hidden-large" >'+ recentArry[i].course_nm +'</p>'+
								'<p style="font-size: 15px; padding : 0;" class="hanna" >'+ recentArry[i].org_nm +' / '+ recentArry[i].edu_st_dt +'~'+ recentArry[i].edu_ed_dt +'</p>'+
								'</div>'+
								'</div>'+
								'<div style="vertical-align: middle; display:inline-table;  width: 6%">'+
								'<div style="vertical-align: middle; ">'+
								'<p class="hanna">'+ recentArry[i].edu_hour +'h</p>'+
								'</div>'+
								'</div>'+
								'<div style="vertical-align: middle; display:inline-table;  width: 15%">'+
								'<div style="vertical-align: middle; ">'+
								'<p class="hanna">'+ recentArry[i].reg_dt +'</p>'+
								'</div>'+
								'</div>'+
								'<div style=" display:inline-table;  width: 15%">'+
								'<div class="starRev" style="vertical-align: middle; display: table-cell;">';
								
								for(var j=0; j<recentArry[i].sur_point; j++){
									recentInhtml = recentInhtml + '<span class="starMini on"></span>';
								}
								
								for(var k=0; k<(5-recentArry[i].sur_point); k++){
									recentInhtml = recentInhtml + '<span class="starMini"></span>';
								}
								
								recentInhtml = 	recentInhtml +
								'</div>' +		
								'</div>'+
								'</div>'+
								'</a>';
								
			
								$('#myRecentListView').append(recentInhtml);
							}
						
						
							
							
							if(data.survayCount != 0){
					        	$("#info3").attr('style', 'display:none');
					        }else{
					        	$("#info3").attr('style', 'float: left; width: 100%; text-align: center; padding: 10px; vertical-align: middle;');
					        	$('#survayButton').attr('style', 'display:none;');
					        }
						
							
							if(data.recentCount != 0){
					        	$("#info4").attr('style', 'display:none');
					        }else{
					        	$("#info4").attr('style', 'float: left; width: 100%; text-align: center; padding: 10px; vertical-align: middle;');
					        }
							

							pageSize3 = 5;

							var pageCount3 =  $(".line-content3").length / pageSize3;
							
							
							 $("#pagin3").html('');
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
							 $("#pagin4").html('');

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
							
							
							$("#totalReg").text(data.totalCount+"개");
							$("#totalTime").text(data.totalHour+"시간");
							$("#totalMoney").text(data.totalAmount+"원");
							
							setTimeout(function(){
							    odometer.innerHTML = data.totalAmount;
							}, 0);

							
					}else{
						alert("등록에 실패했습니다. 설문서를 확인해주세요.");
					}

					
				}


			});
		}
	}

</script>




	<div class="modal-header" style="background-color: #447AF9">
			<div style=" margin: 0 auto;">
						<h1 align="center" class="hanna" style="margin-left : 30px; color: white" id="modal-register-label">설문 등록</h1>
			
			</div>
	
		<button id="btnSurvayModalClose" style="margin: 0" type="button" class="close" data-dismiss="modal">
			<span style="margin: -20px ; color: white" aria-hidden="true" >&times;</span><span class="sr-only">Close</span>
		</button>
	</div>

	<div class="modal-body">
		<form name="survayForm" id="survayForm"  action="survay">
			<div style=" float: left; width: 100%; padding:10px;">	
				<div style=" float: left; width: 45%;">
					<img class="photo2"
						src="<%=application.getContextPath()%>/file?svr_img_file_nm=${edu.svr_img_file_nm}&mfiletype=${edu.img_file_type}"
						 alt="img" />
				</div>
				<div style=" float: left; width: 55%;">
				<p style="font-size: 16px; margin-bottom : 0 ; padding-bottom : 0" class="hanna"  >${edu.high_cls_nm} > ${edu.mid_cls_nm} > ${edu.low_cls_nm}</p>
				<p style="font-size: 28px; padding-top: 0 " class="hanna" >교육명 : ${edu.course_nm }</p>
				<p style="font-size: 28px; padding-bottom : 0" class="hanna" >교육기관 : ${edu.org_nm }</p>
				<p style="font-size: 16px;  padding-top: 0" class="hanna" >위치 : ${edu.loc}</p>
				<p style="font-size: 28px" class="hanna" >교육기간 : ${edu.edu_st_dt} ~ ${edu.edu_ed_dt}</p>
				<p style="font-size: 28px" class="hanna" >신청일 : ${edu.reg_dt}</p>
				<input type="hidden" class="form-control" name="course_cd"
						value="${edu.course_cd}" />
			</div>
			</div>
			<hr>
			
			<div class="col-lg-12" style="margin-bottom: 15px">
				<a href="" id="regDownloadLink" style="display:inline-block; ; text-align:center; background-color: #fff;border: 2px solid ; border-color: #92F5A2"
						class="col-lg-12 btn-reg hanna" >(${edu.origin_reg_file_nm}) 신청서 다운로드</a>
				</div>
				
				<div class=" col-lg-12 "  style="padding-top: 0; margin-top: 0">
					<a href="" id="planDownloadLink" style="display:inline-block; text-align:center; background-color: #fff;border: 2px solid ; border-color: #92F5A2"
						class="col-lg-12 btn-reg hanna">(${edu.origin_plan_file_nm}) 계획서 다운로드</a>
				</div>
			<div style="text-align:left; float: left; width: 100%; padding:10px;">	
				<h1 class="hanna">별점을 선택해 주세요!</h1>
			</div>
			<div style="text-align:center; float: left; width: 100%; padding:10px;">	
				<div class="starRev">
 					 <span class="starR onto"></span>
 					 <span class="starR"></span>
 					 <span class="starR"></span>
 					 <span class="starR"></span>
					 <span class="starR"></span>
				</div>
				<input type="hidden" class="form-control" name="sur_point" id ="sur_point"
						value="" />
			</div>
			
			<div style="text-align:left; float: left; width: 100%; padding:0px; margin-top: 20px">	
				<h1 class="hanna">의견을 남겨주세요!</h1>
			</div>
			
			<div style="text-align:center; float: left; width: 100%; padding:10px;">	
				<div class="control-group">
                <div  class="form-group floating-label-form-group controls mb-0 pb-2">
                  <textarea  onkeyup="validation();" style="background-color:#FFF9D1; padding: 10px"  class="form-control hanna" id="opinion" name="opinion" rows="5" placeholder="의견을 남기면 등록버튼이 나타납니다." required="required" ></textarea>
                  <p class="help-block text-danger"></p>
                  <label class="hanna" style="font-size: 20px; color: black"><a id="survayBtn" onclick="submitSurvay();" style=" width: 100%; height: 70px" class="btn disabled"
					 ><p class="hanna" style="font-size: 20px; color: white">등록하기</p></a></label>
                  
                </div>
              </div>
			</div>

			
		</form>
	</div>
	
	
	
	
	