<%@page import="com.rns.healthplease.web.util.Constants"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


	<div class="row" id="labApp">
		<button type="button" class="close" id="collap_close_btn1">
			<span aria-hidden="true">Close</span>
		</button>
		<div
			class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xl-6 hidden-sm hidden-xs classNoLPadding">
			<div class="classHAbtTextWrapper">
				<div class="classOSCFont classFrontText">
					<!-- Your Convenience, Our Priority...<br/> -->
					<div class="text-left">
						<img src="<c:url value="/resources/images/steps/3-steps.png"/>"
							width="95%" class="classStepImg" />

					</div>
					<div class="classBColor">
						Request Sample Collection Now&nbsp;&nbsp;&nbsp;<span
							class="hvr-buzz-out"><i class="fa fa-hand-o-right "></i></span>
					</div>
				</div>

			</div>
		</div>
		<div
			class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xl-6 classNoPadding">
			<!-- Form Div Start-->
			<div class="auth">
				<div id="big-form" class="well auth-box">

					<fieldset>

						<!-- Form Name -->
						<legend>
							<i class="fa fa-calendar"></i> In Lab Appointment
						</legend>
						<!-- Select Basic -->
						<div class="form-group">
							<!-- <label class=" control-label" for="selectbasic">Test</label> -->
							<div class="ui-widget">
								<input type="hidden" value="<%=Constants.APP_TYPE_HOME%>" name="type"> 
								<select id="idLbTest" name="test" style="width:100%" class="form-control selectpicker js-tests" multiple="multiple" onchange="getLbLabs('N')">
									<optgroup label="Test Packages" style="margin-left: 10px">
										<c:forEach items="${tests}" var="test">
											<c:if test="${test.testPackage}">
												<option value="${test.id}">&nbsp;&nbsp;${test.name}</option>
											</c:if>
										</c:forEach>
										<optgroup label="Regular Test" style="margin-left: 10px">
											<c:forEach items="${tests}" var="test">
												<c:if test="${!test.testPackage}">
													<option value="${test.id}">&nbsp;&nbsp;${test.name}</option>
												</c:if>
											</c:forEach>
										</optgroup>
								</select>
							</div>
							<div class="" id="idLbTestErr"></div>
						</div>

						<%-- <div class="form-group">
							<!-- <label class=" control-label" for="selectbasic">Your Location</label> -->
							<div class="ui-widget">
								<select id="idLocation" name="location"
									class="form-control locations" onchange="getLabs('Y')">
									<option value="">Select your location</option>
									<c:forEach items="${locations}" var="loc">
										<option value="${loc.id}">&nbsp;&nbsp;${loc.name}</option>
									</c:forEach>
								</select>
							</div>
							<div class="" id="idLocationErr"></div>
						</div> --%>

						<div class="form-group">
							<!-- <label class=" control-label" for="selectbasic">Your Location</label> -->
							<div class="ui-widget">
								<select id="idLbLabs" name="labs" class="form-control labs"
									onchange="getLbDates()">
									<option value='select' disabled>Please select lab</option>
								</select>
							</div>
							<div class="" id="idLbLocationErr"></div>
						</div>
						<form method='post' id="on_form_appointment" action="login"
							autocomplete="off">
							<div class="row">
								<div class="form-group col-md-6">
									<label class=" control-label" for="appointmentDate">Appointment
										Date</label>
									<div class="">
										<input id="idLbAppointmentDate" name="appointmentDate"
											placeholder="yyyy-mm-dd"
											class="form-control input-md slots datepicker-app"
											type="text" onchange="getLbSlots()"> <input
											type="hidden" name="dbdate" id="lbdbdate" value="">
									</div>
									<div class="" id="idAppDateErr"></div>
								</div>
								<div class="form-group col-md-6">
									<label class=" control-label" for="appointmentTime">Appointment
										Time</label>
									<div id="slots" class="ui-widget">
										<select id="idLbAppTime" name="slot.id" style="width:100%"
											class="form-control js-event-log js-slots"
											onchange="setLbData()">
											<option value='select' disabled selected>Select time
												slot</option>
										</select>
										<!--<input id="idAppTime" name="appointmentTime" placeholder="" class="form-control input-md" type="text" value="Between 7:00 am to 12:00pm" readonly/>-->
									</div>
								</div>

							</div>


							<div class="form-group">
								<div class="">
									<c:if test="${user.firstName == null }">
										<a href="#idLoginModal" data-toggle="modal"
											data-keyboard="false" data-target="#idLoginModal"> <input
											type="submit" id="idLbBookAppointment" name="bookAppointment"
											value="Book Appointment" class="classAptBtn btn btn-success" />
										</a>
									</c:if>
									<c:if test="${user.firstName != null }">
										<a href=""> <input type="submit" id="idLbBookAppointment"
											name="bookAppointment" value="Book Appointment"
											class="classAptBtn btn btn-success" />
										</a>
									</c:if>
								</div>
							</div>
						</form>
					</fieldset>
				</div>
				<div class="clearfix"></div>
				<input type="hidden" value="${user.group.id}" id="user_group">
			</div>
			<!-- Form Div End-->
		</div>
	</div>


<!--  Package Slider script start-->
<script type="text/javascript">

	function setLbData() {
		$("#idSlot").val($("#idLbAppTime").val());
		$("#register_link").attr("href", "signup.htm?slotId=" + $("#idLbAppTime").val());
	}
	
	function getLbSlots() {
		//$('#select2-idAppTime-container').html("Please select timing");
		if($("#idLbLabs").val() == null || $("#idLbAppointmentDate").val() == null){
			return;
		}
		$.ajax({
	       	type : "POST",
	           url : 'getSlots',
	           dataType: 'json',
	           data: "labId="+ $("#idLbLabs").val() + "&date="+ $("#idLbAppointmentDate").val() + "&homeCollection=false",
	           success : function(slots) {
	        	   var i = 0;
	        	   var appendString = "<option value='select'>Please select timing</option>";
	        	   for(i = 0;i<slots.length;i++) {
	        		   appendString = appendString + "<option value='" + slots[i].id +"'>&nbsp;&nbsp;" + slots[i].startTime + " - " + slots[i].endTime + "</option>"
	        	   }
	        	   $("#idLbAppTime").html(appendString);
	           },
	           error: function(e){
	           	alert("Error: " + e);
	       	}
	       }); 
	}
	
	function getLbLabs(homeCollection) {
		$('#select2-idLabs-container').html("Please select lab");
		if($("#idLbTest").val() == null) {
			return;
		}
		//alert(homeCollection);
		$.ajax({
	       	type : "POST",
	           url : 'getLabs',
	           dataType: 'json',
	           data: "testIds="+ $("#idLbTest").val() + "&type=Lab",
	           success : function(labs) {
	        	   var i = 0;
	        	   var appendString = "<option value='select'>Please select lab</option>";
	        	   for(i = 0;i<labs.length;i++) {
	        		   appendString = appendString + "<option value='" + labs[i].id +"'>&nbsp;&nbsp;" + labs[i].name +" | Fees Rs. " + labs[i].price +"</option>"
	        	   }
	        	   $("#idLbLabs").html(appendString);
	           },
	           error: function(e){
	           	alert("Error: " + e);
	       	}
	       });  
	}
	
	function getLbDates() {
		if($("#idLbTest").val() == null || $("#idLbLabs").val() == null) {
			return;
		}
		 $.ajax({
		       	type : "POST",
		           url : 'getDates',
		           dataType: 'json',
		           data: "labId="+ $("#idLbLabs").val(),
		           success : function(dates) {
		        	   if(dates == null || dates.length == 0) {
		        		   return;
		        	   }
		        	   var appendString = "";
		        	   for(i = 0;i<dates.length;i++) {
		        		   appendString = appendString + dates[i] + "*";
		        	   }
		        	   $("#lbdbdate").val(appendString);
		           },
		           error: function(e){
		           	alert("Error: " + e);
		       	}
		       }); 
		 
	 }
	
	function reset() {
		//$('#idLocation').removeAttr("selected");
        $('#select2-idLocation-container').html("Select Your Location");
	}
	
	 $('#idLbTest').change(function(){
        reset();
      });
	 
	 $(document).ready(function() {
	   $(".js-tests").select2();
	 });
	 
	 $(function() {
	    	var minDay = '0';
	    	if($("#user_group").val() != '2') {
	    		minDay = '+1';
	    	}
	        $( "#idLbAppointmentDate").datepicker({
	        	changeMonth: true,
	        	minDate: minDay,
	        	maxDate:"+2M",
	        	dateFormat:"yy-mm-dd",
	        	beforeShowDay: function(date) {
	        		return [checkIfLbDateAvailable(jQuery.datepicker.formatDate('yy-mm-dd', date))];
	        	}});
	      });
	 
	 
	 function checkIfLbDateAvailable(date) {
		 	var dates = $("#lbdbdate").val();
		 	var res = dates.split('*');
		 	var i = 0;
		 	for(i=0;i<res.length;i++) {
		 		if(res[i] == null || res[i] == '') {
		 			continue;
		 		}
		 		if(res[i] == date) {
		 			return false;
		 		}
		 	}
			return true;	 
		 }

</script>


</body>
</html>