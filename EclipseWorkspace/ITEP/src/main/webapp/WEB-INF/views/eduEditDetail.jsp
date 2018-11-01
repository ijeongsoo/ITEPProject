<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	// 코드값 DB 세팅
	$('#high_cls_sel').val(${edu.high_cls_cd});
	
	var mid = ${edu.mid_cls_cd};
	if(mid < 10) { mid = "0" + mid; }
	$('#mid_cls_sel').val(mid);
	
	var low = ${edu.low_cls_cd};
	if(low < 10) { low = "0" + low; }
	$('#low_cls_sel').val(low);
	
	var org = ${edu.org_cd};
	if(org < 10) { org = "0" + org; }
	$('#org_sel').val(org);
	
	var refund = "${edu.refund_yn}";
	$('#refund_sel').val(refund);	

});

// 셀렉트 박스 값 변경 조절 함수
function chageHighSelect() {
	var select = document.getElementById("high_cls_sel");
	var selectValue = select.options[select.selectedIndex].value;
	document.getElementById("high_cls_cd").value = selectValue;
}

function chageMidSelect() {
	var select = document.getElementById("mid_cls_sel");
	var selectValue = select.options[select.selectedIndex].value;
	document.getElementById("mid_cls_cd").value = selectValue;
	console.log("mid: ", selectValue);
}

function chageLowSelect() {
	var select = document.getElementById("low_cls_sel");
	var selectValue = select.options[select.selectedIndex].value;
	document.getElementById("low_cls_cd").value = selectValue;
	console.log("low: ", selectValue);
}

function chageOrgSelect() {
	var select = document.getElementById("org_sel");
	var selectValue = select.options[select.selectedIndex].value;
	document.getElementById("org_cd").value = selectValue;
	console.log("org: ", selectValue);
}

function chageRefundSelect() {
	var select = document.getElementById("refund_sel");
	var selectValue = select.options[select.selectedIndex].value;
	document.getElementById("refund_yn").value = selectValue;
	console.log("refund: ", selectValue);
}
</script>

<body>
	<form id="editForm" name="editFrom" method="post" action="eduSave">
		<div style="padding:3px">	
			<span style="font-size: 15px; margin-bottom : 0.3 ; padding-bottom : 0" class="hanna"> 강의코드:  </span>
			<span style="font-size: 15px; margin-bottom : 0.1 ; padding-bottom : 0" class="hanna"> ${edu.course_cd} </span>
			<input name="course_cd" type="text" style="visibility: hidden" value="${edu.course_cd}"/>
		</div>
		
		<div style="padding:3px">	
			<span style="font-size: 15px; margin-bottom : 0.3 ; padding-bottom : 0" class="hanna"> 대분류:   </span>
			<select id="high_cls_sel" onchange="chageHighSelect()" style="font-size: 15px; border: 0px" class="hanna">
				<c:forEach var="high" items="${high}" varStatus="status">
					<option value="${high.high_cls_cd}">${high.high_cls_nm}</option>
				</c:forEach>
			</select>
			<input id="high_cls_cd" name="high_cls_cd" type="text" style="visibility: hidden" value="${edu.high_cls_cd}"/>
		</div>
		
		<div style="padding:3px">	
			<span style="font-size: 15px; margin-bottom : 0.3 ; padding-bottom : 0" class="hanna"> 중분류:   </span>
			<select id="mid_cls_sel" onchange="chageMidSelect()" style="font-size: 15px; border: 0px" class="hanna">
				<c:forEach var="mid" items="${mid}" varStatus="status">
					<option value="${mid.mid_cls_cd}">${mid.mid_cls_nm}</option>
				</c:forEach>
			</select>
			<input id="mid_cls_cd" name="mid_cls_cd" type="text" style="visibility: hidden" value="${edu.mid_cls_cd}"/>
		</div>
		
		<div style="padding:3px">	
			<span style="font-size: 15px; margin-bottom : 0.3 ; padding-bottom : 0" class="hanna"> 소분류:   </span>
			<select id="low_cls_sel" onchange="chageLowSelect()" style="font-size: 15px; border: 0px" class="hanna">
				<c:forEach var="low" items="${low}" varStatus="status">
					<option value="${low.low_cls_cd}">${low.low_cls_nm}</option>
				</c:forEach>
			</select>
			<input id="low_cls_cd" name="low_cls_cd" type="text" style="visibility: hidden" value="${edu.low_cls_cd}"/>
		</div>

		<div style="padding:3px">	
			<span style="font-size: 15px; margin-bottom : 0.3 ; padding-bottom : 0" class="hanna"> 기관명:   </span>
			<select id="org_sel" onchange="chageOrgSelect()" style="font-size: 15px; border: 0px" class="hanna">
				<c:forEach var="org" items="${org}" varStatus="status">
					<option value="${org.org_cd}">${org.org_nm}</option>
				</c:forEach>
			</select>
			<input id="org_cd" name="org_cd" type="text" style="visibility: hidden" value="${edu.org_cd}"/>
		</div>
		
		<div style="padding:3px">	
			<span style="font-size: 15px; margin-bottom : 0.3 ; padding-bottom : 0" class="hanna"> 교육명:   </span>
			<input name="course_nm" type="text" style="font-size: 15px; border: 0px; width: 250px" value="${edu.course_nm}" class="hanna"/>
		</div>
		
		<div style="padding:3px">	
			<span style="font-size: 15px; margin-bottom : 0.3 ; padding-bottom : 0" class="hanna"> 교육시간:  </span>
			<input name="edu_hour" type="text" style="font-size: 15px; border: 0px; width: 45px" value="${edu.edu_hour}" class="hanna"/>
			<span style="font-size: 15px; margin-bottom : 0.3 ; padding-bottom : 0" class="hanna"> 교육비용:  </span>
			<input name="edu_cost" type="text" style="font-size: 15px; border: 0px; width: 100px" value="${edu.edu_cost}" class="hanna"/>
		</div>
		
		<div style="padding:3px">	
			<span style="font-size: 15px; margin-bottom : 0.3 ; padding-bottom : 0" class="hanna"> 신청시작일: </span>
			<input name="reg_st_dt" type="text" style="font-size: 15px; border: 0px; width: 100px" value="${edu.reg_st_dt}" class="hanna"/>
			<span style="font-size: 15px; margin-bottom : 0.3 ; padding-bottom : 0" class="hanna"> 신청종료일: </span>
			<input name="reg_ed_dt" type="text" style="font-size: 15px; border: 0px; width: 100px" value="${edu.reg_ed_dt}" class="hanna"/>
		</div>
		
		<div style="padding:3px">	
			<span style="font-size: 15px; margin-bottom : 0.3 ; padding-bottom : 0" class="hanna"> 교육시작일: </span>
			<input name="edu_st_dt" type="text" style="font-size: 15px; border: 0px; width: 100px" value="${edu.edu_st_dt}" class="hanna"/>
			<span style="font-size: 15px; margin-bottom : 0.3 ; padding-bottom : 0" class="hanna"> 교육종료일: </span>
			<input name="edu_ed_dt" type="text" style="font-size: 15px; border: 0px; width: 100px" value="${edu.edu_ed_dt}" class="hanna"/>
		</div>
		
		<div style="padding:3px">	
			
		</div>
		
		<div style="padding:3px">	
			<span style="font-size: 15px; margin-bottom : 0.3 ; padding-bottom : 0" class="hanna"> 교육장소:  </span>
			<input name="loc" type="text" style="font-size: 15px; border: 0px; width: 450px" value="${edu.loc}" class="hanna"/>
		</div>
		
		<div style="padding:3px">	
			<span style="font-size: 15px; margin-bottom : 0.3 ; padding-bottom : 0" class="hanna"> 고용보험 환급여부: </span>
			<select id="refund_sel" onchange="chageRefundSelect()" style="font-size: 15px; border: 0px" class="hanna">
				<option value='Y'>Y</option> 
				<option value='N'>N</option>
			</select>
			<input id="refund_yn" name="refund_yn" type="text" style="visibility: hidden" value="${edu.refund_yn}"/>
		</div>

		<div class="wrap" style="overflow: hidden">
			<div class="hanna">
				<button class="btn btn-default" id="cancel_btn" type="reset" style="float: right; margin-left: 10px" data-dismiss="modal">취소</button>
				<button class="btn btn-primary2" id="save_btn" type="submit" style="float: right;"><img width="25px" src="resources/admin_page_resource/img/verified.png" style="padding-right:7px;" alt="">저장</button>
			</div>
		</div>
	</form>
<!-- 로딩 이미지, 업데이트 쿼리, 콤보박스 등 작성 -->
</body>


</html>