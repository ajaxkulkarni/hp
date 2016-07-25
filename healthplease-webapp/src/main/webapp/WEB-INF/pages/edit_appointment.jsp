<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
          <title>Book Diagnostic & Pathology Test like Thyroid, Sugar, Urine, Cholesterol, ECG and X-Ray. Pay for them Online. Sample Collected at home or in lab. EMR Storage Available.</title>
    <meta name="keywords" content="Book Online Path Test, Book online diagnostic test, Blood Sugar test">
    <meta name="description" content="Book your online Pathology Lab test and test packages and have sample picked from home. Online Payment option and save reports for future reference.">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>

<%@include file="user_header.jsp" %>

<script type="text/javascript">

function resetSelf() {
    $('#select2-idLocation-container').html("Select Your Location");
}


function getSlots() {
	if($("#idLabs").val() == null || $("#idAppointmentDate").val() == null){
		return;
	}
	$.ajax({
       	type : "POST",
           url : 'getSlots',
           dataType: 'json',
           data: "labId="+ $("#idLabs").val() + "&date="+ $("#idAppointmentDate").val() + "&homeCollection=" + $("#homeCollection").val(),
           success : function(slots) {
        	   var i = 0;
        	   var appendString = "<option value='select'>Please select timing</option>";
        	   var selected = "";
        	   for(i = 0;i<slots.length;i++) {
        		   $('<option>').val(slots[i].id).text("  " + slots[i].startTime +" To " + slots[i].endTime).appendTo('#idSlots');
        	   }
           },
           error: function(e){
           	alert("Error: " + e);
       	}
       }); 
}

function getLabs() {
	if($("#idTest").val() == null || $("#idLocation").val() == null) {
		return;
	}
	var homeCollection = "N";
	if($("#homeCollection").val() == "true") {
		homeCollection = "Y";
	}
	
	$.ajax({
       	type : "POST",
           url : 'getLabs',
           dataType: 'json',
           data: "testIds="+ $("#idTest").val() + "&locationId=" + $("#idLocation").val() + "&homeCollection=" +homeCollection,
           success : function(labs) {
        	   var i = 0;
        	   var appendString = "<option value='select'>Please select lab</option>";
        	   for(i = 0;i<labs.length;i++) {
        		   if($("#labId").val() != labs[i].id) {
        		   		$('<option>').val(labs[i].id).text("  " + labs[i].name +" | Fees Rs. " + labs[i].price).appendTo('#idLabs');
        		   }
        		}
           },
           error: function(e){
           	alert("Error: " + e);
       	}
       }); 
}

function getDates() {
	if($("#idTest").val() == null || $("#idLocation").val() == null || $("#idLabs").val() == null) {
		return;
	}
	 $.ajax({
	       	type : "POST",
	           url : 'getDates',
	           dataType: 'json',
	           data: "labId="+ $("#idLabs").val(),
	           success : function(dates) {
	        	   if(dates == null || dates.length == 0) {
	        		   return;
	        	   }
	        	   var appendString = "";
	        	   for(i = 0;i<dates.length;i++) {
	        		   appendString = appendString + dates[i] + "*";
	        	   }
	        	   $("#dbdate").text(appendString);
	           },
	           error: function(e){
	           	alert("Error: " + e);
	       	}
	       }); 
	 
 }

</script>
<script>
    
    $(function() {
        $( "#idAppointmentDate").datepicker({
        	changeMonth: true,
        	minDate: +1,
        	dateFormat:"yy-mm-dd",
        	beforeShowDay: function(date) {
        		return [checkIfDateAvailable(jQuery.datepicker.formatDate('yy-mm-dd', date))];
        	}});
      });

    function checkIfDateAvailable(date) {
	 	var dates = $("#dbdate").text();
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


             $(document).ready(function(){
            	 $('#wizard').smartWizard({transitionEffect:'slide'});
            	 $("#idDivBookOther").addClass("hidden");   
            	 $("#id_form_name").val('addappointment');
            	 //$('.classwizard').smartWizard({transitionEffect:'slide'});
                 //$("#pLoction").select2({ width: 'resolve' });       
                 //$("#idLabs").select2({ width: 'resolve' });   
                 //$("#pAppTime").select2({ width: 'resolve' });   
            	 getLabs();
            	 getDates();
            	 getSlots();
             
             });
             
             function bookAppointment(){
            	 var appointmentForm = $("#formBookAppYour");
                 var appointment_date = $('#hiddenappdate').val();
                 /*
                  * Validation of form goes here
                  */
                  var form = $("#formBookAppYour");
                  if ( false == form.valid() ) exit;
 				  form.submit();
             }
</script>
<script type="text/javascript">
  $(document).ready(function(){
	$("#id_form_name").val('addappointment');
    $('#idCheckAddress').change(function(){
      if (this.checked) {
        $('#id_pu_add_street').val($('#add_street').val());
        //$('#id_pu_add_area').val($('#add_area').val());
        $('#id_pu_add_landmark').val($('#add_landmark').val());
        $('#id_pu_add_city').val($('#add_city').val());
        $('#id_pu_add_zipcode').val($('#add_zipcode').val());
        //var add_landmark = $("#add_landmark").val();
        
      } else {
		$('#id_pu_add_street').val( ' ' );
        //$('#id_pu_add_area').val( ' ' );
        $('#id_pu_add_landmark').val( ' ' );
        $('#id_pu_add_city').val( ' ' );
        $('#id_pu_add_zipcode').val( ' ' );
	  }
        
    });
	
	
  });

</script>

<div class="classSliderHolder">
  <div class="container">
	<div class="row" id="idDivBookYourself">
		<div class="col-sm-12 col-lg-10 col-md-10 col-xs-12">

			<!-- <table align="center" border="0" cellpadding="0" cellspacing="0" style="width:100%;">
<tr><td>  -->
			<form method='post' id="formBookAppYour" class="classOSCAForm"
				action="<%=Constants.EDIT_APPOINTMENT_POST_URL%>">

				<!-- <input type="hidden" name="form_name" id="id_form_name"  value="addappointment" /> -->
				<div id="wizard" class="swMain classwizard">
					<ul>
						<li class="col-xs-12 col-sm-12 col-md-4 col-lg-4 col-xl-4"><a
							href="#step-1">
								<div class="arrow-right"></div> <span class="stepDesc">
									Appointment<br /> <small>Details</small>
							</span>
								<div class="arrow-right-left"></div>
						</a></li>
						<li class="col-xs-12 col-sm-12 col-md-4 col-lg-4 col-xl-4"><a
							href="#step-2">
								<div class="arrow-right"></div> <span class="stepDesc">
									Address<br /> <small>Details</small>
							</span>
								<div class="arrow-right-left"></div>
						</a></li>

					</ul>

					
					<div id="step-1">
						<div class="row">
							<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
								<input type="hidden" name="homeCollection" id="homeCollection" value="${appointment.homeCollection}">
								<input type="hidden" name="id" id="appid" value="${appointment.id}">
								<table class='table table-bordered'>
									<tr>
										<td>Test</td>
										<td>
										<select id="idTest" name="testIds" class="form-control selectpicker js-tests" multiple="multiple" onchange="resetSelf()" required>
                                          	<c:forEach items="${appointment.tests}" var="appTest">
                                          		<option value="${appTest.id}" selected>&nbsp;&nbsp;${appTest.name}</option>
                                          		<c:set var="testId" value="${appTest.id}"></c:set>
                                          	</c:forEach>
                                          <optgroup label="Test Packages" style="margin-left: 10px">
                                          <c:forEach items="${tests}" var="test">
                                          		<c:if test="${test.testPackage && testId!=test.id}">
                                          			<option value="${test.id}">&nbsp;&nbsp;${test.name}</option>
                                          		</c:if>
                                           </c:forEach>
                                           <optgroup label="Regular Test" style="margin-left: 10px">
                                           <c:forEach items="${tests}" var="test">
                                           	<c:if test="${!test.testPackage && testId!=test.id}">
                                           		<option value="${test.id}">&nbsp;&nbsp;${test.name}</option>
                                           	</c:if>
                                           </c:forEach>
                                           </optgroup>
                                         </select>
										</td>
									</tr>
									<tr id="idErrTest"></tr>

									<tr>
										<td>Location</td>
										<td>
											<select id="idLocation" name="location.id" class="form-control locations" onchange="getLabs('Y')" required>
                                              <option value="">Select your location</option>
                                              <c:forEach items="${locations}" var="loc">
                                              	<c:if test="${appointment.location.id == loc.id}">
                                              		<option value="${loc.id}" selected>&nbsp;&nbsp;${loc.name}</option>
                                              	</c:if>
                                              	<option value="${loc.id}">&nbsp;&nbsp;${loc.name}</option>
                                              </c:forEach>
                                            </select>
										</td>
									</tr>
									<tr>
										<td>Lab</td>
										<td>
										<input type="hidden" id="labId" value="${appointment.lab.id}"/>
										<select id="idLabs" name="lab.id" class="form-control labs" onchange="getDates()"  required>
                                          <option value='select' disabled>Please select lab</option>
                                          <option value="${appointment.lab.id}" selected>  ${appointment.lab.name} | Fees Rs. ${appointment.lab.price}</option>
                                        </select>
										</td>
									</tr>
									<tr id="idErrLocation"></tr>
									<tr>
										<td>Appointment Date :</td>
										<td>
											<input id="idAppointmentDate" value="${appointment.date}" name="appointmentDate" placeholder="yyyy-mm-dd" class="form-control input-md slots datepicker-app" type="text" onchange="getSlots()" required>
                                        	<input type="hidden" name="dbdate" id="dbdate" value="">
										</td>
									</tr>
									<tr>
										<td>Appointment Slot</td>
										<td>
										<input type="hidden" id="slotId" value="${appointment.slot.id}"/>
										<select id="idSlots" name="slot.id" class="form-control js-event-log js-slots" required>
                                              <option value='select' disabled selected>Select time slot</option>
                                              <option value='${appointment.slot.id}' selected>${appointment.slot.startTime} To ${appointment.slot.endTime}</option>
                                        </select>
										<%-- ${appointment.slot.startTime} -
											${appointment.slot.endTime} --%></td>
									</tr>

								</table>
							</div>
							<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
								<table class='table table-bordered'>
									<tr id="idUserName">
										<td>Your Name *</td>
										<td><input type='text' name="user.firstName" id='name'
											class='form-control' value="${appointment.user.firstName}"
											required></td>
									</tr>
									<tr id="idErrName"></tr>
									<tr id="idRelationDiv"></tr>

									<tr>
										<td>Email*</td>
										<td><input type='email' name="user.email" id='idUsername'
											class='form-control' value="${appointment.user.email}"
											required></td>
									</tr>
									<tr id="idErrEmail">
									</tr>
									<tr id="idErrEmailAddress">
									</tr>
									<tr>
										<td>Mobile No*</td>
										<td class="input-group">
											<div class="input-group-addon">+91</div>
											<input type='text' name="user.phone" id='contact'
											class='form-control numeric'
											value="${appointment.user.phone}"
											style="position: relative; z-index: 1;" maxlength="10"
											size="10" required>
										</td>
									</tr>
									<tr id="idErrContact"></tr>
									<tr>
										<td>Gender</td>
										<td>
											<div class="radio">
												<label>
													<c:if test="${appointment.user.gender == 'M'}">
													<input type="radio" name="user.gender" value="M" checked="checked">Male
													</c:if>
													<c:if test="${appointment.user.gender != 'M'}">
													<input type="radio" name="user.gender" value="M">Male
													</c:if>
												</label> 
												<label>
													<c:if test="${appointment.user.gender == 'F'}">
													<input type="radio" name="user.gender" value="F" checked="checked">Female
													</c:if>
													<c:if test="${appointment.user.gender != 'F'}">
													<input type="radio" name="user.gender" value="F">Female
													</c:if>
												</label>
											</div>
									</tr>
									<tr>
										<td>Doctor Name*</td>
										<td><input type='text' name='doctorName' id='idDocName'
											class='form-control' value="${appointment.doctorName}" required></td>
									</tr>
									<tr id="idErrDocName">
										<td></td>
									</tr>

								</table>
							</div>
						</div>
					</div>
					<div id="step-2">
						<div class="row">
							<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
								<table class='table table-bordered'>
									<tr rowspan="2">
										<td>Address*</td>

										<!--<td> <textarea class="form-control classAddress" rows="5" id="address" name="address"></textarea></td>-->
										<td>
											<!-- Textarea -->
											<div class="control-group">
												<!--<label class="control-label" for="add_street">Street</label>-->
												<div class="controls">
													<textarea id="add_street" class="input-medium form-control"
														placeholder="Street" name="pu_add_street" required=""
														readonly="">${appointment.user.address.street}</textarea>
												</div>
											</div>
										</td>
									</tr>
									<tr rowspan="2">
										<td>Area*</td>
										<td>
											<!-- Text input-->
											<div class="control-group">
												<!--<label class="control-label" for="add_area">Area</label>-->
												<div class="controls">
													<input id="add_area" placeholder="Area"
														class="input-medium form-control"
														value="${appointment.user.address.area}" required=""
														type="text" readonly>
												</div>
											</div>
										</td>
									</tr>
									<tr rowspan="2">
										<td>Landmark*</td>
										<td>
											<!-- Text input-->
											<div class="control-group">
												<!--<label class="control-label" for="add_landmark">Landmark</label>-->
												<div class="controls">
													<input id="add_landmark" placeholder="Landmark"
														class="input-medium form-control"
														value="${appointment.user.address.landmark}" required=""
														type="text" readonly>
												</div>
											</div>
										</td>
									</tr>
									<tr rowspan="2">
										<td>City*</td>
										<td>
											<!-- Text input-->
											<div class="control-group">
												<!--<label class="control-label" for="area_city">City</label>-->
												<div class="controls">
													<input id="add_city" placeholder="City"
														class="input-medium form-control" required=""
														value="${appointment.user.address.city}" type="text"
														readonly="">
												</div>
											</div>
										</td>
									</tr>
									<tr rowspan="2">
										<td>Pincode</td>
										<td>
											<!-- Text input-->
											<div class="control-group">
												<!--<label class="control-label" for="area_zipcode">Pincode</label>-->
												<div class="controls">
													<input id="add_zipcode" placeholder="Zipode"
														class="input-medium form-control numeric"
														value="${appointment.user.address.zipCode}" type="text"
														required readonly>
												</div>
											</div>
										</td>
									</tr>

								</table>
							</div>
							<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
								<table class='table table-bordered'>
									<tr id="idErrAddress"></tr>
									<tr rowspan="2">
										<td colspan="2">
											<div class="control-group">

												<div class="controls text-left">
													<input type="checkbox" id="idCheckAddress"
														style="width: 20px; float: left;" name="check_address"
														class="input-medium form-control" name="check_address"
														style="width: 10%;" />
												</div>
												<label class="control-label" for="check_address"
													style="float: left; margin: 10px;">Select To Have
													Same Address</label>
											</div>
										</td>
									</tr>
									<tr rowspan="2">
										<td>Pick Up Address*</td>
										<!--<td> <textarea class="form-control classAddress" rows="5" id="address" name="address"></textarea></td>-->
										<td>
											<!-- Textarea -->
											<div class="control-group">
												<!--<label class="control-label" for="add_street">Street</label>-->
												<div class="controls">
													<textarea id="id_pu_add_street" name="address.street"
														class="input-medium form-control" placeholder="Street"
														required="" value="${appointment.address.street}" maxlength="160">${appointment.address.street}</textarea>
												</div>
											</div>
										</td>
									<tr rowspan="2">
										<td>Area *</td>
										<td>
											<!-- Text input-->
											<div class="control-group">
												<!--<label class="control-label" for="add_area">Area</label>-->
												<div class="controls">
													<%-- <select id="id_pu_add_area" name="address.area" class="form-control classLocationSelect" style="width:100%;" disabled="">                            
                                <option value='8' selected>${appointment.user.address.area}</option>
                                </select> --%>
													<input id="id_pu_add_area" name="address.area"
														placeholder="area" class="input-medium form-control"
														value="${appointment.address.area}" type="text"
														readonly="readonly">
												</div>
											</div>
										</td>
									</tr>
									<tr rowspan="2">
										<td>Landmark </td>
										<td>
											<!-- Text input-->
											<div class="control-group">
												<!--<label class="control-label" for="add_landmark">Landmark</label>-->
												<div class="controls">
													<input id="id_pu_add_landmark" name="address.landmark"
														placeholder="Landmark" class="input-medium form-control"
														value="${appointment.address.landmark}" type="text" >
												</div>
											</div>
										</td>
									</tr>
									<tr rowspan="2">
										<td>City *</td>
										<td>
											<!-- Text input-->
											<div class="control-group">
												<!--<label class="control-label" for="area_city">City</label>-->
												<div class="controls">
													<input id="id_pu_add_city" name="address.city"
														placeholder="City" class="input-medium form-control"
														required="" value="${appointment.address.city}" type="text" readonly="">
												</div>
											</div>
										</td>
									</tr>
									<tr rowspan="2">
										<td>Pincode</td>
										<td>
											<!-- Text input-->
											<div class="control-group">
												<!--<label class="control-label" for="area_zipcode">Pincode</label>-->
												<div class="controls">
													<input id="id_pu_add_zipcode" name="address.zipCode"
														placeholder="Pincode"
														class="input-medium form-control numeric" value="${appointment.address.zipCode}"
														type="text" minlength="6" minlength="6" required="">

												</div>
											</div>
										</td>
									</tr>
									<tr id="idErrAddress"></tr>
									<tr rowspan="2">
										<td colspan="2">
											<div class="row">
												<div class="form-group col-md-12">
													<label class="control-label" for="is_require_print">
													<c:if test="${appointment.printRequired == 'Y'}">
														<input id="id_report_checkbox" name="printRequired"
														class="" style="width: 20px; height: 20px;" value="Y"
														type="checkbox" checked> <span class="classRCBcaption">I
															Want Printed Report</span>
													</c:if>
													<c:if test="${appointment.printRequired != 'Y'}">
														<input id="id_report_checkbox" name="printRequired"
														class="" style="width: 20px; height: 20px;" value="Y"
														type="checkbox"> <span class="classRCBcaption">I
															Want Printed Report</span>
													</c:if>
													</label>
												</div>
											</div>
										</td>
									</tr>
								</table>
							</div>
						</div>
					</div>

				</div>



			</form>

		</div>
	</div>
</div>
</div>
<%@include file="forms/book_appointment_other_form.jsp" %>
<%@include file="user_footer.jsp" %>

</body>
</html>