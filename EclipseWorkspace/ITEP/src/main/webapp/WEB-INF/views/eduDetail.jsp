<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


	<div class="modal-header" style="background-color: #447AF9">
			<div style=" margin: 0 auto;">
						<h1 align="center" class="hanna" style="margin-left : 30px; color: white" id="modal-register-label">교육 신청서</h1>
			
			</div>
	
		<button style="margin: 0" type="button" class="close" data-dismiss="modal">
			<span style="margin: -20px ; color: white" aria-hidden="true" >&times;</span><span class="sr-only">Close</span>
		</button>
	</div>

	<div class="modal-body">
		<form name="sentMessage" id="contactForm" novalidate="novalidate">
			<div class="control-group">
				<div class="form-group floating-label-form-group controls mb-0 pb-2">
					<label>Name</label> <input class="form-control" id="name"
						type="text" placeholder="Name" required="required"
						data-validation-required-message="Please enter your name.">
					<p class="help-block text-danger"></p>
				</div>
			</div>
			<div class="control-group">
				<div class="form-group floating-label-form-group controls mb-0 pb-2">
					<label>Email Address</label> <input class="form-control" id="email"
						type="email" placeholder="Email Address" required="required"
						data-validation-required-message="Please enter your email address.">
					<p class="help-block text-danger"></p>
				</div>
			</div>
			<div class="control-group">
				<div class="form-group floating-label-form-group controls mb-0 pb-2">
					<label>Phone Number</label> <input class="form-control" id="phone"
						type="tel" placeholder="Phone Number" required="required"
						data-validation-required-message="Please enter your phone number.">
					<p class="help-block text-danger"></p>
				</div>
			</div>
			<div class="control-group">
				<div class="form-group floating-label-form-group controls mb-0 pb-2">
					<label>Message</label>
					<textarea class="form-control" id="message" rows="5"
						placeholder="Message" required="required"
						data-validation-required-message="Please enter a message."></textarea>
					<p class="help-block text-danger"></p>
				</div>
			</div>
			<br>
			<div id="success"></div>
			<div class="form-group">
				<button type="submit" style="background-color:#FF4F60; width: 100%; height: 70px" class="btn "
					id="sendMessageButton" ><p class="hanna" style="font-size: 20px">신청하기</p></button>
			</div>
		</form>
	</div>