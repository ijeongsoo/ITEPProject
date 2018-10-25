<%@page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>eduEditDetail Body</title>
</head>
<script>
$('#editForm').submit(function() {
	$('#load').show();
	$('#excelFileBtn').attr('disable', true);
	$('#submitBtn').attr('disable', true);
	return true;
});
</script>
<body>
	<form id="editForm" name="editFrom" method="post" action="eduSave">
		<div style="padding:3px">	
			<span style="font-size: 17px; margin-bottom : 0.3 ; padding-bottom : 0" class="hanna"> 강의코드: </span>
			<span style="font-size: 17px; margin-bottom : 0.1 ; padding-bottom : 0" class="hanna"> ${edu.course_cd} </span>
		</div>
		
		<div style="padding:3px">	
			<span style="font-size: 17px; margin-bottom : 0.3 ; padding-bottom : 0" class="hanna"> 대분류: </span>
			<input type="text" style="font-size: 17px; border: 0px" value="${edu.high_cls_cd}" class="hanna"/>

		</div>
		
		<div style="padding:3px">	
			<span style="font-size: 17px; margin-bottom : 0.3 ; padding-bottom : 0" class="hanna"> 중분류: </span>
			<input type="text" style="font-size: 17px; border: 0px" value="${edu.mid_cls_cd}" class="hanna"/>
		</div>
		
		<div style="padding:3px">	
			<span style="font-size: 17px; margin-bottom : 0.3 ; padding-bottom : 0" class="hanna"> 소분류: </span>
			<input type="text" style="font-size: 17px; border: 0px" value="${edu.low_cls_cd}" class="hanna"/>
		</div>

		<div style="padding:3px">	
			<span style="font-size: 17px; margin-bottom : 0.3 ; padding-bottom : 0" class="hanna"> 기관명: </span>
			<input type="text" style="font-size: 17px; border: 0px" value="${edu.org_cd}" class="hanna"/>
		</div>
		
		<div style="padding:3px">	
			<span style="font-size: 17px; margin-bottom : 0.3 ; padding-bottom : 0" class="hanna"> 교육명: </span>
			<input type="text" style="font-size: 17px; border: 0px" value="${edu.course_nm}" class="hanna"/>
		</div>
		
		<div style="padding:3px">	
			<span style="font-size: 17px; margin-bottom : 0.3 ; padding-bottom : 0" class="hanna"> 교육시간: </span>
			<input type="text" style="font-size: 17px; border: 0px" value="${edu.edu_hour}" class="hanna"/>
		</div>
		
		<div style="padding:3px">	
			<span style="font-size: 17px; margin-bottom : 0.3 ; padding-bottom : 0" class="hanna"> 신청시작일: </span>
			<input type="text" style="font-size: 17px; border: 0px" value="${edu.reg_st_dt}" class="hanna"/>
		</div>
		
		<div style="padding:3px">	
			<span style="font-size: 17px; margin-bottom : 0.3 ; padding-bottom : 0" class="hanna"> 신청종료일: </span>
			<input type="text" style="font-size: 17px; border: 0px" value="${edu.reg_ed_dt}" class="hanna"/>
		</div>
		
		<div style="padding:3px">	
			<span style="font-size: 17px; margin-bottom : 0.3 ; padding-bottom : 0" class="hanna"> 교육시작일: </span>
			<input type="text" style="font-size: 17px; border: 0px" value="${edu.edu_st_dt}" class="hanna"/>
		</div>
		
		<div style="padding:3px">	
			<span style="font-size: 17px; margin-bottom : 0.3 ; padding-bottom : 0" class="hanna"> 교육종료일: </span>
			<input type="text" style="font-size: 17px; border: 0px" value="${edu.edu_ed_dt}" class="hanna"/>
		</div>
		
		<div style="padding:3px">	
			<span style="font-size: 17px; margin-bottom : 0.3 ; padding-bottom : 0" class="hanna"> 교육비용: </span>
			<input type="text" style="font-size: 17px; border: 0px" value="${edu.edu_cost}" class="hanna"/>
		</div>
		
		<div style="padding:3px">	
			<span style="font-size: 17px; margin-bottom : 0.3 ; padding-bottom : 0" class="hanna"> 교육장소: </span>
			<input type="text" style="font-size: 17px; border: 0px" value="${edu.loc}" class="hanna"/>
		</div>
		
		<div style="padding:3px">	
			<span style="font-size: 17px; margin-bottom : 0.3 ; padding-bottom : 0" class="hanna"> 고용보험 환급여부: </span>
			<input type="text" style="font-size: 17px; border: 0px" value="${edu.refund_yn}" class="hanna"/>
		</div>

		<div class="wrap" style="overflow: hidden">
			<input type="reset" value="취소" class="btn btn-default" 	data-dismiss="modal" style="float: right;" />
			<input type="submit" value="저장" class="btn btn-default" data-dismiss="modal" style="float: right;" />
		</div>
	</form>

</body>
</html>