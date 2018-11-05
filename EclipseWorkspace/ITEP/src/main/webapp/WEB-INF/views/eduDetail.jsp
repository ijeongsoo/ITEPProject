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
		//$('#eduForm').submit();
		var form = $('#eduForm')[0];
		var formData = new FormData(form);
		
		if($('#main_name').text() == 'IBK IT 교육 포탈'){
			$.ajax({
				url:'regEdu',
				processData : false,
				contentType : false,
				data: formData,
				type: 'POST',
				beforeSend : function(){
					$('#confirmModalHeader').attr('style','background-color:white;');
					$('#confirmModalContent').html("<img style='height:50px;' src='resources/image/loading.gif' />");
				},
				success : function(data){
					
					$('#btnConfirmClose').trigger('click');
					$('#btnModalClose').trigger('click');
					if(data.result == '1'){
						alert("신청이 완료되었습니다.");
						var arry = data.list;
						$('#myRegistListView').html(' ');
						if(data.count>3){
							for (var i=0; i<3; i++) {
								var inhtml = '<a data-toggle="modal" data-target="#infoModal" onclick="infoDetail('+ arry[i].course_cd +');">' +
								'<div class="infoList" style="float: left; width: 100%; text-align: center; padding: 10px; vertical-align: middle;">' +
								'<div style=" float: left; width: 20%; height: 72px">' +
								'<img class="photo4" src="file?svr_img_file_nm='+ arry[i].svr_img_file_nm +'&mfiletype='+ arry[i].img_file_type +'" alt="">' +
								'</div>' +
								'<div style=" float: left; width: 60%;height: 72px; display: table;">' +
								'<div style=" vertical-align: middle; display: table-cell;">' +
								'<p style="font-size: 22px; padding: 0 " class="hanna hidden" >'+ arry[i].course_nm +' </p>' +
								'<p style="font-size: 13px; padding : 0" class="hanna" >'+ arry[i].org_nm +'/ '+ arry[i].edu_st_dt +'~'+ arry[i].edu_ed_dt +'</p>'+
								'</div>' +
								'</div>' +
								'<div style=" float: left; width: 20%; height: 72px; display: table; ">' +
								'<p style="font-size: 18px; padding : 0 ;vertical-align: middle; display: table-cell;" class="hanna" >'+ arry[i].step_nm +'</p>' +
								'</div>'+
								'</div>'+
								'</a>';
								
								$('#myRegistListView').append(inhtml);
							}
						}else{
							for (var i=0; i<data.count; i++) {
								var inhtml = '<a onclick="infoDetail('+ arry[i].course_cd +');" data-toggle="modal" data-target="#infoModal">' +
								'<div class="infoList" style="float: left; width: 100%; text-align: center; padding: 10px; vertical-align: middle;">' +
								'<div style=" float: left; width: 20%; height: 72px">' +
								'<img class="photo4" src="file?svr_img_file_nm='+ arry[i].svr_img_file_nm +'&mfiletype='+ arry[i].img_file_type +'" alt="">' +
								'</div>' +
								'<div style=" float: left; width: 60%;height: 72px; display: table;">' +
								'<div style=" vertical-align: middle; display: table-cell;">' +
								'<p style="font-size: 22px; padding: 0 " class="hanna hidden" >'+ arry[i].course_nm +' </p>' +
								'<p style="font-size: 13px; padding : 0" class="hanna" >'+ arry[i].org_nm +'/ '+ arry[i].edu_st_dt +'~'+ arry[i].edu_ed_dt +'</p>'+
								'</div>' +
								'</div>' +
								'<div style=" float: left; width: 20%; height: 72px; display: table; ">' +
								'<p style="font-size: 18px; padding : 0 ;vertical-align: middle; display: table-cell;" class="hanna" >'+ arry[i].step_nm +'</p>' +
								'</div>'+
								'</div>'+
								'</a>';
								
								$('#myRegistListView').append(inhtml);
							}
						}
						
						
						
						if(data.count > 3){
				        	$("#moreInfo1").attr('style', 'float: left; width: 100%; text-align: center; padding: 10px; vertical-align: middle;');
				        }else{
				        	$("#moreInfo1").attr('style', 'display:none;');
				        }
						
						if(data.count != 0){
				        	$("#info1").attr('style', 'display:none');
				        }else{
				        	$("#info1").attr('style', 'float: left; width: 100%; text-align: center; padding: 10px; vertical-align: middle');
				        }
						
						$('#confirmModalHeader').attr('style','background-color: #F94164');
						$('#confirmModalContent').html("");
						
						
					}else{
						alert("신청이 실패했습니다. 신청서를 확인해주세요.");
					}

					
				}


			});
		}else{
			$.ajax({
				url:'regEdu',
				processData : false,
				contentType : false,
				data: formData,
				type: 'POST',
				beforeSend : function(){
					$('#confirmModalHeader').attr('style','background-color:white;');
					$('#confirmModalContent').html("<img style='height:50px;' src='resources/image/loading.gif' />");
				},
				success : function(data){
					
					$('#btnConfirmClose').trigger('click');
					$('#btnModalClose').trigger('click');
					if(data.result == '1'){
						alert("신청이 완료되었습니다.");

						$('#confirmModalHeader').attr('style','background-color: #F94164');
						$('#confirmModalContent').html("");
						
						
					}else{
						alert("신청이 실패했습니다. 신청서를 확인해주세요.");
					}
				}


			});
		}
		
		
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
	
		<button id="btnModalClose" style="margin: 0" type="button" class="close" data-dismiss="modal">
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
				<p style="font-size: 28px" class="hanna" >신청기간 : ${edu.reg_st_dt} ~ ${edu.reg_ed_dt}</p>
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
	
	
	
	
	