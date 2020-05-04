<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/include_css.jsp"%>
<%@ include file="/WEB-INF/views/include/include_js.jsp"%>
<%@ include file="/WEB-INF/views/include/tags.jspf"%>
<html>
<head>

</head>

			<!-- Hero -->
			<div id="content_hero" style="background-image: url(http://via.placeholder.com/1440x435)">
				
				<!-- Content -->
				<div class="container">
					<div class="row blurb scrollme animateme" data-when="exit" data-from="0" data-to="1" data-opacity="0" data-translatey="100">
						<div class="col-md-9">
							<span class="title">Have any questions?</span>
							<h1>Please contact us</h1>
						</div>
					</div>
				</div>

			</div>

			<!-- Section -->
			<div class="container section negative-margin">
				<div class="row">
					<div class="col-sm-12">
						<div id="map"></div>
					</div>
				</div>
			</div>

			<!-- Section -->
			<div class="container section negative-margin contact">
				<div class="row">
					<div class="col-sm-12">
						<h2>Send a message</h2>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-6">
						<form>
							<div class="form-group">
								<label>Name *</label>
								<input type="text" />
							</div>
							<div class="form-group">
								<label>Email *</label>
								<input type="email" />
							</div>
							<div class="form-group">
								<label>Where did you hear about us?</label>
								<input type="text" />
							</div>
							<div class="form-group">
								<label>Message *</label>
								<textarea rows="5"></textarea>
							</div>
							<div class="form-group right-align">
								<button class="btn btn-ghost">Send message</button>
							</div>
						</form>
					</div>
					<div class="col-sm-5 col-sm-push-1">
						<div class="icon-row">
							<div class="col">
								<span class="circle">
									<i class="material-icons">place</i>
								</span>
							</div>
							<div class="col">
								<h4 class="no-underline">Address</h4>
								<p>342 Sloane St, London, W1D 3NE</p>
							</div>
						</div>
						<div class="icon-row">
							<div class="col">
								<span class="circle">
									<i class="material-icons">email</i>
								</span>
							</div>
							<div class="col">
								<h4 class="no-underline">Email</h4>
								<p>info@moviestar.co.uk</p>
							</div>
						</div>
						<div class="icon-row">
							<div class="col">
								<span class="circle">
									<i class="material-icons">phone in talk</i>
								</span>
							</div>
							<div class="col">
								<h4 class="no-underline">Telephone</h4>
								<p>+44 0330 123 4567</p>
							</div>
						</div>
					</div>
				</div>
			</div>
	</body>
	<%@ include file="/WEB-INF/views/include/include_footer.jsp"%>
</html>