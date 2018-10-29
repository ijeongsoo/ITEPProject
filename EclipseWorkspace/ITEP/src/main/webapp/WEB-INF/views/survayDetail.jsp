<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<script type="text/javascript">
	
	$(function() {
		
		 $(this).parent().children('span').removeClass('on');
		 $(this).addClass('on').prevAll('span').addClass('on');
		 $('#sur_point').val( $('.on').length );
	
		$('.starRev span').click(function(){
			  $(this).parent().children('span').removeClass('on');
			  $(this).addClass('on').prevAll('span').addClass('on');
			  $('#sur_point').val( $('.on').length );
			  return false;
			});
	});

</script>




	<div class="modal-header" style="background-color: #447AF9">
			<div style=" margin: 0 auto;">
						<h1 align="center" class="hanna" style="margin-left : 30px; color: white" id="modal-register-label">설문 등록</h1>
			
			</div>
	
		<button style="margin: 0" type="button" class="close" data-dismiss="modal">
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
			<div style="text-align:left; float: left; width: 100%; padding:10px;">	
				<h1 class="hanna">별점을 선택해 주세요!</h1>
			</div>
			<div style="text-align:center; float: left; width: 100%; padding:10px;">	
				<div class="starRev">
 					 <span class="starR on"></span>
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
                  <textarea style="background-color:#FFF9D1; padding: 10px"  class="form-control hanna" id="opinion" name="opinion" rows="5" placeholder="여기에 남겨주세요!" required="required" data-validation-required-message="Please enter a message."></textarea>
                  <p class="help-block text-danger"></p>
                  <label class="hanna" style="font-size: 20px; color: black">감사합니다!!</label>
                  
                </div>
              </div>
			</div>

				
			
			<br>
			<div class="form-group">
				<button type="submit" id="registBtn" style=" width: 100%; height: 70px" class="btn "
					 ><p class="hanna" style="font-size: 20px; color: white">등록하기</p></button>
			</div>
			
		</form>
	</div>
	
	
	
	
	