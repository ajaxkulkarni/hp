<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<html lang="en">
<head>

<title>About Us | HealthPlease.in</title>
<link rel="icon" type="image/png" sizes="32x32" href="<c:url value="/resources/images/favicon/favicon-32x32.png"/>">
<link rel="icon" type="image/png" sizes="96x96" href="<c:url value="/resources/images/favicon/favicon-96x96.png"/>">
<link rel="icon" type="image/png" sizes="16x16" href="<c:url value="/resources/images/favicon/favicon-16x16.png"/>">
<style>
input.error, textarea.error {
	border-color: #843534 !important;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 6px #ce8483
		!important;
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 6px #ce8483
		!important;
	color: #555 !important;
}

.margin-top-10 {
	margin-top: -10px;
}
</style>
<style>
.width100 {
	width: 100% !important;
}

.select2-container {
	width: 100% !important;
}
</style>




<style type="text/css">
.classWelcomeCloseButton {
	width: 40px;
	z-index: 9999;
	position: absolute;
	right: -26px;
	color: #FFFFFF;
	background-color: #005490;
	opacity: 1;
	box-shadow: none;
	padding: 5px;
}
</style>
</head>
<body>

	<!-- <div id="wrapper"> -->

		<%@include file="user_header.jsp"%>

		<div class="classTopHeading">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<h1 class="classAbout">About Us</h1>
					</div>
				</div>
				<!-- /.col-lg-12-->
			</div>
		</div>
		<div id="page-wrappera" class="container">

			<!-- /.row -->
			<div class="row">
				<div class=" col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
					<div class="classAboutHighLightBox ">

						<p>
							<span style="font-size: 32px;"> <i
								class="fa fa-quote-left classAQuote"></i>
							</span> &nbsp;&nbsp;Not very long ago, a young man, was quite baffled to
							see his grandfather struggle with routine tests for blood sugar,
							maintain his records and carry them to every doctor that he
							visited. Not only were these tasks cumbersome at his age, but
							also created unwanted troubles, in case he ever planned to
							travel.
						</p>
						<p>Tired of seeing this everyday struggle that his grandfather
							was undergoing, the young man, Mr. Yash Bharwani decided that he
							couldn't take this anymore, and thus planned to do something
							that would solve the problem not only for his grandfather but for
							all others who suffered from any given illness and needed to get
							tested.</p>
						<p>And so, was incepted HealthPlease. Today, HealthPlease is
							proud to be a forerunner in the city of Pune, providing the
							facility of collection of various samples for a large number of
							Pathology Tests. As a part of this service, a skilled technician
							from the Pathology Lab visits the patient's home at a
							pre-decided time in order to collect the samples. The same are
							then handed over at the Pathology Lab for testing. On reception
							of the reports, the same are uploaded on the patients
							HealthPlease account, and are also shared via an email. These
							reports, if requested, may also be handed over to the patient in
							person.</p>
						<p>At HealthPlease, we also ensure that the technicians that
							visit your home are not just well-trained, but also compassionate
							and friendly. They are also experienced well, to handle young
							children in particular, as it is the kids who usually shudder at
							the idea of getting tested.</p>
						<span><strong>At www.Healthplease.in Your
								convenience is our priority.
							</strong>
						</span> 
						<br />
					</div>
				</div>
			</div>
		</div>

		
		<%@include file="forms/request_checkup.jsp"%>
		<%@include file="user_footer.jsp"%>
		
<!-- </div> -->
</body>
</html>
