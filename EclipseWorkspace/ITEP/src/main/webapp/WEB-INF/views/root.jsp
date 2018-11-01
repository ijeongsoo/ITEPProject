<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Home</title>
		<link href="<%=application.getContextPath()%>/resources/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
		<link href="<%=application.getContextPath()%>/resources/css/hannafont.css" rel="stylesheet" type="text/css">
		<script src="<%=application.getContextPath()%>/resources/jquery/jquery-3.2.1.min.js" type="text/javascript"></script>
		<script src="<%=application.getContextPath()%>/resources/bootstrap-3.3.7/js/bootstrap.min.js" type="text/javascript"></script>
	
		<style>
		body,html {
		height: 100%;
		}
	
		.loading{
			text-align: center;
			padding-top: 20%;
		}
		
		
		</style>
		
	</head>
	
	<body>

	<div class="loading hanna">
		WELCOME TO IBK IT교육 포탈
		<img width="100px" src="resources/image/Disqus-1s-200px.gif" alt="">
	</div>
		
		<script type="text/javascript">
		
		$(document).ready(function(){

				$.ajax({
					'url' : "ssoLogin",
					'data' : {
						'emn' : "42737"
					},
					'type' : "POST",
					'success' : function(data) {

						if (data.result == 0) {
							
							location.href = "login";
						}else if(data.result == 1){
							location.href = "error"

						}else{
							location.href = "home";
						}

					}
				});
			});

		</script>
	</body>
</html>






