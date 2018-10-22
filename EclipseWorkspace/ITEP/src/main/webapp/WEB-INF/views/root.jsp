<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Home</title>
		<link href="<%=application.getContextPath()%>/resources/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
		<script src="<%=application.getContextPath()%>/resources/jquery/jquery-3.2.1.min.js" type="text/javascript"></script>
		<script src="<%=application.getContextPath()%>/resources/bootstrap-3.3.7/js/bootstrap.min.js" type="text/javascript"></script>
	
		
	</head>
	
	<body>
		<h4>Loading...</h4>
		<hr/>
		
		<script type="text/javascript">
		
		$(document).ready(function(){

				$.ajax({
					'url' : "ssoLogin",
					'data' : {
						'emn' : "42755"
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






