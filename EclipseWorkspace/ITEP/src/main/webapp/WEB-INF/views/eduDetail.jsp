<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


	<div class="modal-header">
			<h3 class="modal-title" id="modal-register-label">Sign up now</h3>
	
		<button type="button" class="close" data-dismiss="modal">
			<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
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
				<button type="submit" class="btn btn-primary btn-xl"
					id="sendMessageButton">Send</button>
			</div>
		</form>
	</div>