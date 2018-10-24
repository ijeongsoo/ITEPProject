<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
		<title>Education List</title>
		<link href="<%=application.getContextPath()%>/resources/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
		<script src="<%=application.getContextPath()%>/resources/jquery/jquery-3.2.1.min.js" type="text/javascript"></script>
		<script src="<%=application.getContextPath()%>/resources/bootstrap-3.3.7/js/bootstrap.min.js" type="text/javascript"></script>
		<link href="<%=application.getContextPath()%>/resources/DataTables-1.10.18/css/jquery.dataTables.min.css" rel="stylesheet" type="text/css"/>
		<script src="<%=application.getContextPath()%>/resources/DataTables-1.10.18/js/jquery.dataTables.min.js" type="text/javascript"></script>
		<link href="<%=application.getContextPath()%>/resources/css/hannafont.css" rel="stylesheet" type="text/css">
		<link href="<%=application.getContextPath()%>/resources/css/nanumbarungothic.css" rel="stylesheet" type="text/css">
	   
	    <!-- Custom styles for this template -->
	    <!-- css 추가 정재희  -->
	    		<!-- 테이블 자동 검색을 위한 css css파일 line 75 수정  -->
	    <link href="<%=application.getContextPath()%>/resources/main_page_resource/css/freelancer.min.css" rel="stylesheet"> 
	    <script src="<c:url value="/resources/main_page_resource/js/authority.modal.js" />"></script>
	    <script src="<%=application.getContextPath()%>/resources/DataTables-1.10.18/js/jquery.dataTables.min.js" type="text/javascript"></script>
	    <script src="//code.jquery.com/jquery.min.js"></script>
				<!-- 테이블 자동 검색을 위한 css end -->
		<!-- css 추가 정재희  end -->
		
		<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/admin_page_resource/css/fullcalendar.css">
  		<link href="<%=application.getContextPath()%>/resources/admin_page_resource/css/widgets.css" rel="stylesheet">
  		<link href="<%=application.getContextPath()%>/resources/admin_page_resource/css/style.css" rel="stylesheet">
  		<link href="<%=application.getContextPath()%>/resources/admin_page_resource/css/style-responsive.css" rel="stylesheet" />
  		<link href="<%=application.getContextPath()%>/resources/admin_page_resource/css/xcharts.min.css" rel=" stylesheet">
  		<link href="<%=application.getContextPath()%>/resources/admin_page_resource/css/jquery-ui-1.10.4.min.css" rel="stylesheet">
  		<link href="<%=application.getContextPath()%>/resources/DataTables-1.10.18/css/jquery.dataTables.min.css" rel="stylesheet" type="text/css"/>
  		<script src="<%=application.getContextPath()%>/resources/DataTables-1.10.18/js/jquery.dataTables.min.js" type="text/javascript"></script>   	
    	<!-- Bootstrap CSS -->
  		<link href="<%=application.getContextPath()%>/resources/admin_page_resource/css/bootstrap.min.css" rel="stylesheet">
  		<!-- bootstrap theme -->
  		<link href="<%=application.getContextPath()%>/resources/admin_page_resource/css/bootstrap-theme.css" rel="stylesheet">
  		<!--external css-->
  		  <!-- font icon -->
  		<link href="<%=application.getContextPath()%>/resources/admin_page_resource/css/elegant-icons-style.css" rel="stylesheet" />
  		<link href="<%=application.getContextPath()%>/resources/admin_page_resource/css/font-awesome.min.css" rel="stylesheet" />
  		<!-- full calendar css-->
  		<link href="<%=application.getContextPath()%>/resources/admin_page_resource/assets/fullcalendar/fullcalendar/bootstrap-fullcalendar.css" rel="stylesheet" />
  		<link href="<%=application.getContextPath()%>/resources/admin_page_resource/assets/fullcalendar/fullcalendar/fullcalendar.css" rel="stylesheet" />
  		<!-- easy pie chart-->
  		<link href="<%=application.getContextPath()%>/resources/admin_page_resource/assets/jquery-easy-pie-chart/jquery.easy-pie-chart.css" rel="stylesheet" type="text/css" media="screen" />
  		<!-- owl carousel -->
  		<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/admin_page_resource/css/owl.carousel.css" type="text/css">
  		<link href="<%=application.getContextPath()%>/resources/admin_page_resource/css/jquery-jvectormap-1.2.2.css" rel="stylesheet">	
	<style>
	
		#modal {
		display:none;
		background-color:#FFFFFF;
		position:absolute;
		width : 500px;
		height : 500px;
		top:300px;
		left:200px;
		z-Index:9999}
		

/*DARK BLUE BUTTON STYLES*/     
.confirm_button{background-color: #237fbc; color : #fff; border-color: #237fbc; -webkit-box-shadow: 0 3px 0 #1a5c87; box-shadow: 0 3px 0 #1a5c87; width: 150px; height: 30px;}
.confirm_button:hover{background-color:#166ea8;}
.confirm_button:active{ top: 3px; outline: none; -webkit-box-shadow: none; box-shadow: none;}

/*RED/ROUGE BUTTON STYLES*/     
.js_close{background-color: #c0392b; color : #fff; border-color: #c0392b; -webkit-box-shadow: 0 3px 0 #8f2a1f; box-shadow: 0 3px 0 #8f2a1f; width: 150px; height: 30px;}
.js_close:hover{background-color:#ac3420;}
.js_close:active{top: 3px; outline: none; -webkit-box-shadow: none; box-shadow: none;}
	
	.modal_content{
	padding:40px;
	}

	/*yellow/ROUGE BUTTON STYLES*/     
#changebutton{background-color: #f59e00; color : #fff; border-color: #f59e00;  -webkit-box-shadow: 0 3px 0 #8f2a1f; box-shadow: 0 3px 0 #b37401; width: 150px; height: 30px;}
#changebutton:hover{background-color:#dd9003;}
#changebutton:active{top: 3px; outline: none; -webkit-box-shadow: none; box-shadow: none;}
	</style>
	
	</head>
		<script type="text/javascript">
		
		//테이블 자동 검색
		$(document).ready( function () {
	    	$('#authorityTable').DataTable();
		} );
		  
		// 모달 창 여는 버튼에 이벤트 걸기
		$(document).ready(function(){
			$("#button").click(function() {
				myModal.show(); // 모달창 보여주기
			});
		});
	
		// 모달 창 안에 있는 확인 버튼에 이벤트 걸기
		$(document).ready(function(){
			$(".confirm_button").click(function() {
			    //alert("권한 변경이 완료되었습니다.");
			    myModal.hide(); // 모달창 감추기
			});
		});
		
		 //모달 창 안에 있는 닫기 버튼에 이벤트 걸기
		$(document).ready(function(){
	        $(".js_close").click(function() {
	            // 모달창 감추기(여기서 obj는 Example.Modal 인스턴트 자체를 의미)
	            myModal.hide();
	        });
		});
		
		 
		 //체크되어 있는 관리자 정보 파라미터 넘기기 
		 function checkAuthArr(){
			 			
			 checkArrInfo();
			 
			 var checkboxValues = [];
			 var chk_obj = document.getElementsByName("listCheckBox");
			 var chk_use = 0; 
			 
			 for(i=0; i<chk_obj.length; i++) {
				 if (chk_obj[i].checked == true){
					 chk_use++;
					 checkboxValues.push(chk_obj[i].value);
				 }
			 }
			 
			 if(chk_use != 1){
				 alert("하나만 선택해주세요.");
			 }else{
				 
					// 모달창 인스턴트 생성
					var myModal = new Example.Modal({
					    id: "modal" // 모달창 아이디 지정
					});
					
				 jQuery.ajaxSettings.traditional = true;
				 myModal.show();
				 window.opener.location.reload();
				 self.close();
			 }
		 }
		 
		 function checkArrInfo(){
				var rowData = new Array();
				var tdArr = new Array();
				var checkbox = $("input[name=listCheckBox]:checked");
				
				checkbox.each(function(i){
					var tr = checkbox.parent().parent().eq(i);
					var td = tr.children();
					
					// 체크된 row의 모든 값을 배열에 담는다.
					rowData.push(tr.text());
					
					// td.eq(0)은 체크박스 이므로  td.eq(1)의 값부터 가져온다.
					var empno = td.eq(1).text();
					var name = td.eq(2).text();
					var branch = td.eq(3).text();
					var authority = td.eq(5).text();
					// 가져온 값을 배열에 담는다.
					tdArr.push(empno);
					tdArr.push(name);
					tdArr.push(branch);
					tdArr.push(authority);
						});
					$("#labelid1").html("사번 :" + tdArr[0]);			
					$("#labelid2").html("이름 :" + tdArr[1]);					
					$("#labelid3").html("부서 :" + tdArr[2]);	
					$("#labelid4").html("권한 :" + tdArr[3]);		 
					
		 }
	
		 function selectValue(){
			 
				var rowData = new Array();
				var tdArr = new Array();
				var checkbox = $("input[name=listCheckBox]:checked");
				
				checkbox.each(function(i){
					var tr = checkbox.parent().parent().eq(i);
					var td = tr.children();
					
					// 체크된 row의 모든 값을 배열에 담는다.
					rowData.push(tr.text());
					var empno = td.eq(1).text();
					// 가져온 값을 배열에 담는다.
					tdArr.push(empno);
						});
					

				 var data = tdArr[0] + ";" + $('select[name="authority_select"]').val();
				 
		    	jQuery.ajaxSettings.traditional = true;

		    	 $.ajax({
		    	        'url':"updateAuthority.do",
		    	        'type':'GET',
		    	        'data': { 'updateData' : data},
		    	        'success':function(data){
		    	            alert("성공적으로 변경되었습니다.");
		    	            self.close();
		    	            location.reload(); 
		    	        },
		    	        'error':function(jqXHR, textStatus, errorThrown){
		    	            alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
		    	            myModal.hide();
		    	        }
		    	    });
		 }
		 
		 
	</script>	
	
	<body>
  <!-- container section start -->
  <section id="container" class="">
    <header class="header dark-bg">
      <div class="toggle-nav">
        <div class="icon-reorder tooltips" data-original-title="Toggle Navigation" data-placement="bottom"><i class="icon_menu"></i></div>
      </div>
	
	  <!-- 관리자 페이지 로고 부분 20181015 이기석 -->
      <!--logo start-->
      <% String ssoid = request.getParameter("ssoid"); %>
      <a href="admin?ssoid=<%=ssoid%>" class="logo">IT교육포털 <span class="lite">관리자 페이지</span></a>
      <!--logo end-->
	  
	  <!-- 검색바 삭제 20181015 이기석 -->
      
	  <!-- 우측 상단 아이콘 활용 주석처리 20181015 이기석 -->
    </header>
    <!--header end-->


      </div>
    </aside>
    <!--sidebar end-->

    <!--main content start-->
    <!-- 대시보드 메인 구성 20181015 이기석 -->
    <section id="main-content">
      <section class="wrapper">
        <!--overview start-->
        <div class="row">
          <div class="col-lg-12">
            <h3 class="page-header"><i class="fa fa-laptop"></i> 권한관리 </h3>
          </div>
        </div>

		<!-- 모달 창을 여는 버튼 -->
		<input id="changebutton" type="button" value="권한변경" onclick="checkAuthArr();">
			
		<!-- 모달창 -->
		<div id="modal">
			<div class="modal-header" style="background-color: #237fbc">
				   <h1 align="center" class="hanna" style="color:#fff">권한 수정 </h1>	
			</div>
			
			<div class="modal_content">
    		<form role="form">
    			<div class = "form-group" align = "center" >
    				<label for="name" id ="labelid1" class="control-label">  </label><br>
    				<label for="name" id ="labelid2" class="control-label">  </label><br>
    				<label for="name" id ="labelid3" class="control-label">  </label><br>
    				<label for="name" id ="labelid4" class="control-label">  </label>
    				
    			</div>
    			<div class = "form-group" align = "center">
    				<label for="authority" class="control-label"> 변경 후 권한: </label>
    				<select name="authority_select" style="width:200px">
    					<option value="교육관리자"> 교육관리자 </option>    				
    					<option value="서무차장"> 서무차장 </option>
    					<option value="서무담당"> 서무담당 </option>
    					<option value="일반사용자"> 일반사용자 </option>
    				</select>
    			</div>
    			<div class="button" align="center">	
    			    <input class="confirm_button" type="button" value="확인" onclick="selectValue();">  		
    				<button class="js_close">닫기</button>
    			</div>
    		</form>
    		

    	
    		</div>
		</div>
		<!-- 모달창 end -->
		
		<!-- 내용 -->
		<div class="container">
	<table id = "authorityTable" style="border:1px solid #ccc; width:1000px; text-align:center;"  >
    	<thead>
        <tr>
            <th style="text-align: center;">선택</th>
            <th style="text-align: center;">사번</th>
            <th style="text-align: center;">이름</th>
            <th style="text-align: center;">부서명</th>
            <th style="text-align: center;">권한코드</th>
            <th style="text-align: center;">권한명</th>
            <th style="text-align: center;">등록일자</th>            
        </tr>
    	</thead>
    	<tbody>
        <c:choose>
            <c:when test="${fn:length(auth_list) > 0}">
                <c:forEach items="${auth_list}" var="row">
                    <tr style="border-top : 1px solid #ccc;">
						<td><input type='checkbox' name="listCheckBox"  value="${row.emm}"> </td>              
                        <td>${row.emn}</td>
                        <td>${row.emm}</td>
                        <td>${row.krn_brm}</td>
                        <td>${row.auth_cd}</td>
                        <td>${row.auth_nm}</td>
                        <td>${row.reg_dt}</td>
                        
                    </tr>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <tr>
                    <td colspan="4">조회된 결과가 없습니다.</td>
                </tr>
            </c:otherwise>
        </c:choose>
    	</tbody>
	</table>
		</div>
	</body>
	
</html>