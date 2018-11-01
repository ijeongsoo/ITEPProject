<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>



	<div class="modal-header" style="background-color: #FFDCE6">
			<div style=" margin: 0 auto;">
						<h1 align="center" class="hanna" style="margin-left : 30px; color: black" id="modal-register-label">교육 상세</h1>
			
			</div>
	
		<button style="margin: 0" type="button" class="close" data-dismiss="modal">
			<span style="margin: -20px ; color: white" aria-hidden="true" >&times;</span><span class="sr-only">Close</span>
		</button>
	</div>

	<div class="modal-body">
		
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

			
			</div>
			
				<div class="col-lg-12" style="margin-bottom: 15px">
				<a href="file?svr_img_file_nm=${edu.svr_reg_file_nm}&img_file_type=${edu.reg_file_type}&source=reg" id="regAttachLabel" style="display:inline-block; ; text-align:center; background-color: #fff;border: 2px solid ; border-color: #92F5A2"
						class="col-lg-12 btn-reg hanna" >(${edu.origin_reg_file_nm}) 신청서 다운로드</a>
				</div>
				
				<div class=" col-lg-12 "  style="padding-top: 0; margin-top: 0">
					<a href="file?svr_img_file_nm=${edu.svr_plan_file_nm}&img_file_type=${edu.plan_file_type}&source=plan" id="planAttachLabel" style="display:inline-block; text-align:center; background-color: #fff;border: 2px solid ; border-color: #92F5A2"
						class="col-lg-12 btn-reg hanna">(${edu.origin_plan_file_nm}) 계획서 다운로드</a>
				</div>
			<br>
				<p id="stepStatus" style=" text-align:center; color:white; width: 100%; height: 50px; background-color: gray" id="registBtnTxt" class="hanna" style="font-size: 30px; color: white">
					${edu.step_nm} 상태입니다.
				</p>

				<p id="statStatus" style=" text-align:center; color:white; width: 100%; height: 50px; background-color: gray" id="registBtnTxt" class="hanna" style="font-size: 30px; color: white">
					${edu.stat_nm} 상태입니다.
				</p>
			
			<br>
			
			
	</div>
	
	<script>
	

	
	$( function() {
		if(${edu.step_cd} =='40'){
			$('#stepStatus').attr('style', 'display:none');
		}else{
			$('#statStatus').attr('style', 'display:none');
		}
	});
	
	</script>
	
	
	
	
	