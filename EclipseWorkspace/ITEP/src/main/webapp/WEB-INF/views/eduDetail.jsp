<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<script type="text/javascript">
	function regAttachChange(event) {
		if ($("#regAttach")[0].files.length != 0) {
			
			var fileValue = $("#regAttach").val().split("\\");
			var fileName = fileValue[fileValue.length-1]; // 파일명
			
			/* $("#imgFileViewContainer").attr("hidden", false);
			$("#imgFileView")[0].src = URL
					.createObjectURL(event.target.files[0]);*/
			$("#regAttachLabel").attr("style", "background-color: #92F5A2; text-align:center;  color: white"); 
			$("#regAttachLabel").text( fileName);

		}
	}
	
	function planAttachVhange(event) {
		if ($("#planAttach")[0].files.length != 0) {
			
			var fileValue = $("#planAttach").val().split("\\");
			var fileName = fileValue[fileValue.length-1]; // 파일명
			
			/* $("#imgFileViewContainer").attr("hidden", false);
			$("#imgFileView")[0].src = URL
					.createObjectURL(event.target.files[0]);*/
			$("#planAttachLabel").attr("style", "background-color: #92F5A2; text-align:center;  color: white"); 
			$("#planAttachLabel").text( fileName);

		}
	}
	
	function validation() {
		if ($("#planAttach")[0].files.length == 0 || $("#regAttach")[0].files.length == 0 ) {			
			$("#modalLabel").text("신청서와 계획서를 반드시 첨부하셔야 합니다.");
			$("#confirmBtnSet").attr("style","display:none");
			
		}else{
			$("#modalLabel").text("정말 신청하시겠습니까?");
			$("#confirmBtnSet").attr("style","display:");
		}
	}
	
	

	function submitForm()
	{	
		//폼전송 
		$('#eduForm').submit();
	}
	
	
	$(function() {
	
		if(${result} == 0){
			$('#registBtnTxt').text("이미 신청한 교육입니다.");
			$("#registBtn").attr("style", "display:none");

		}else if(${result} == 2){
			$('#registBtnTxt').text("설문하지 않은 교육이 존재합니다.");
			$("#registBtn").attr("style", "display:none");
		}else{
			$("#registBtnTxt").attr("style", "display:none");
		}
	
	});

</script>




	<div class="modal-header" style="background-color: #447AF9">
			<div style=" margin: 0 auto;">
						<h1 align="center" class="hanna" style="margin-left : 30px; color: white" id="modal-register-label">교육 신청서</h1>
			
			</div>
	
		<button style="margin: 0" type="button" class="close" data-dismiss="modal">
			<span style="margin: -20px ; color: white" aria-hidden="true" >&times;</span><span class="sr-only">Close</span>
		</button>
	</div>

	<div class="modal-body">
		<form name="eduForm" id="eduForm" novalidate="novalidate" action="regEdu" method="post" enctype="multipart/form-data">
		
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
				<p style="font-size: 28px" class="hanna" >신청기간 : ${edu.edu_st_dt} ~ ${edu.edu_ed_dt}</p>
				<input type="hidden" class="form-control" name="course_cd"
						value="${edu.course_cd}" />
				<input type="hidden" class="form-control" name="emn"
						value="${login_info.emn}" />
			</div>
			
			
				<div class="col-lg-12" style="margin-bottom: 15px">
					<label id="regAttachLabel" style="text-align:center; background-color: #fff;border: 2px solid ; border-color: #92F5A2  " for="regAttach" id="attachBtn"
						class="col-lg-12 btn-reg hanna">신청서 등록</label><input
						type="file" id="regAttach" style="display: none;"
						onchange="regAttachChange(event)" name="regAttach" />
				</div>
				
				<div class=" col-lg-12 "  style="padding-top: 0; margin-top: 0">
					<label id="planAttachLabel" style="text-align:center; background-color: #fff;border: 2px solid ; border-color: #92F5A2  " for="planAttach" id="attachBtn"
						class="col-lg-12 btn-reg hanna">계획서 등록</label><input
						type="file" id="planAttach" style="visibility: hidden"
						onchange="planAttachVhange(event)" name="planAttach" />
				</div>

			
			<br>
			<div id="success"></div>
			<div class="form-group">
				<p style=" text-align:center; color:white; width: 100%; height: 50px; background-color: gray" id="registBtnTxt" class="hanna" style="font-size: 30px; color: white"></p>
				<a id="registBtn" onclick="validation()" style=" width: 100%; height: 70px" class="btn " data-toggle="modal" data-target="#confirmModal"
					 ><p class="hanna" style="font-size: 20px; color: white">신청하기</p></a>
			</div>
			
			
			
			
		</form>
	</div>
	
	
	
	
	