<%@page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>eduEditDetail Body</title>
</head>
<script>
$(document).ready(function() {
	$('#load').hide();
	$('#cancel_btn').attr('disable', false);
	$('#save_btn').attr('disable', false);
	$('#editForm').submit(function() {
		$('#load').show();
		$('#cancel_btn').attr('disable', true);
		$('#save_btn').attr('disable', true);
		return true;
	});
});
</script>
<body>
	<form id="editForm" name="editFrom" method="post" action="eduSave">
		<div style="padding:3px">	
			<span style="font-size: 17px; margin-bottom : 0.3 ; padding-bottom : 0" class="hanna"> 강의코드: </span>
			<span style="font-size: 17px; margin-bottom : 0.1 ; padding-bottom : 0" class="hanna"> ${edu.course_cd} </span>
			<input name="course_cd" type="text" style="visibility: hidden" value="${edu.course_cd}"/>
		</div>
		
		<div style="padding:3px">	
			<span style="font-size: 17px; margin-bottom : 0.3 ; padding-bottom : 0" class="hanna"> 대분류: </span>
			<input name="high_cls_cd" type="text" style="font-size: 17px; border: 0px" value="${edu.high_cls_cd}" class="hanna"/>

		</div>
		
		<div style="padding:3px">	
			<span style="font-size: 17px; margin-bottom : 0.3 ; padding-bottom : 0" class="hanna"> 중분류: </span>
			<input name="mid_cls_cd" type="text" style="font-size: 17px; border: 0px" value="${edu.mid_cls_cd}" class="hanna"/>
		</div>
		
		<div style="padding:3px">	
			<span style="font-size: 17px; margin-bottom : 0.3 ; padding-bottom : 0" class="hanna"> 소분류: </span>
			<input name="low_cls_cd" type="text" style="font-size: 17px; border: 0px" value="${edu.low_cls_cd}" class="hanna"/>
		</div>

		<div style="padding:3px">	
			<span style="font-size: 17px; margin-bottom : 0.3 ; padding-bottom : 0" class="hanna"> 기관명: </span>
			<input name="org_cd" type="text" style="font-size: 17px; border: 0px" value="${edu.org_cd}" class="hanna"/>
		</div>
		
		<div style="padding:3px">	
			<span style="font-size: 17px; margin-bottom : 0.3 ; padding-bottom : 0" class="hanna"> 교육명: </span>
			<input name="course_nm" type="text" style="font-size: 17px; border: 0px" value="${edu.course_nm}" class="hanna"/>
		</div>
		
		<div style="padding:3px">	
			<span style="font-size: 17px; margin-bottom : 0.3 ; padding-bottom : 0" class="hanna"> 교육시간: </span>
			<input name="edu_hour" type="text" style="font-size: 17px; border: 0px" value="${edu.edu_hour}" class="hanna"/>
		</div>
		
		<div style="padding:3px">	
			<span style="font-size: 17px; margin-bottom : 0.3 ; padding-bottom : 0" class="hanna"> 신청시작일: </span>
			<input name="reg_st_dt" type="text" style="font-size: 17px; border: 0px" value="${edu.reg_st_dt}" class="hanna"/>
		</div>
		
		<div style="padding:3px">	
			<span style="font-size: 17px; margin-bottom : 0.3 ; padding-bottom : 0" class="hanna"> 신청종료일: </span>
			<input name="reg_ed_dt" type="text" style="font-size: 17px; border: 0px" value="${edu.reg_ed_dt}" class="hanna"/>
		</div>
		
		<div style="padding:3px">	
			<span style="font-size: 17px; margin-bottom : 0.3 ; padding-bottom : 0" class="hanna"> 교육시작일: </span>
			<input name="edu_st_dt" type="text" style="font-size: 17px; border: 0px" value="${edu.edu_st_dt}" class="hanna"/>
		</div>
		
		<div style="padding:3px">	
			<span style="font-size: 17px; margin-bottom : 0.3 ; padding-bottom : 0" class="hanna"> 교육종료일: </span>
			<input name="edu_ed_dt" type="text" style="font-size: 17px; border: 0px" value="${edu.edu_ed_dt}" class="hanna"/>
		</div>
		
		<div style="padding:3px">	
			<span style="font-size: 17px; margin-bottom : 0.3 ; padding-bottom : 0" class="hanna"> 교육비용: </span>
			<input name="edu_cost" type="text" style="font-size: 17px; border: 0px" value="${edu.edu_cost}" class="hanna"/>
		</div>
		
		<div style="padding:3px">	
			<span style="font-size: 17px; margin-bottom : 0.3 ; padding-bottom : 0" class="hanna"> 교육장소: </span>
			<input name="loc" type="text" style="font-size: 17px; border: 0px" value="${edu.loc}" class="hanna"/>
		</div>
		
		<div style="padding:3px">	
			<span style="font-size: 17px; margin-bottom : 0.3 ; padding-bottom : 0" class="hanna"> 고용보험 환급여부: </span>
			<input name="refund_yn" type="text" style="font-size: 17px; border: 0px" value="${edu.refund_yn}" class="hanna"/>
		</div>

		<div class="wrap" style="overflow: hidden">
			<input id="cancel_btn" type="reset" value="취소" class="btn btn-default" 	style="float: right;" data-dismiss="modal"/>
			<input id="save_btn" type="submit" value="저장" class="btn btn-primary" style="float: right;"/>
		</div>
	</form>
<!-- 로딩 이미지, 업데이트 쿼리, 콤보박스 등 작성 -->
</body>
</html>