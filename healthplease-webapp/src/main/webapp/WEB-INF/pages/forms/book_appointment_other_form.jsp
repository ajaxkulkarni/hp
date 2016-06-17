<%@page import="com.rns.healthplease.web.util.Constants"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<script type="text/javascript">
function reset() {
	//$('#idLocation').removeAttr("selected");
    $('#select2-idLocation-container').html("Select Your Location");
}

$(document).ready(function(){

  /*
  Reset Location on update in test
  */
  $('#pidTest').change(function(){
    reset();
  });

function getSlotsOther() {
	if($("#pidLabs").val() == null || $("#pAppDate").val() == null){
		return;
	}
	
	$.ajax({
       	type : "POST",
           url : 'getSlots',
           dataType: 'json',
           data: "labId="+ $("#pidLabs").val() + "&date="+ $("#pidAppointmentDate").val(),
           success : function(slots) {
        	   var i = 0;
        	   var appendString = "<option value='select'>Please select timing</option>";
        	   for(i = 0;i<slots.length;i++) {
        		   appendString = appendString + "<option value='" + slots[i].id +"'>&nbsp;&nbsp;" + slots[i].startTime + " to " + slots[i].endTime + "</option>"
        	   }
        	   $("#pAppTime").html(appendString);
           },
           error: function(e){
           	alert("Error: " + e);
       	}
       }); 
}

function getLabsOther() {
	if($("#pidTest").val() == null || $("#pidLocation").val() == null) {
		return;
	}
	$.ajax({
       	type : "POST",
           url : 'getLabs',
           dataType: 'json',
           data: "testIds="+ $("#pidTest").val() + "&locationId=" + $("#idLocation").val(),
           success : function(labs) {
        	   var i = 0;
        	   var appendString = "<option value='select'>Please select lab</option>";
        	   for(i = 0;i<labs.length;i++) {
        		   appendString = appendString + "<option value='" + labs[i].id +"'>&nbsp;&nbsp;" + labs[i].name +" | Fees Rs. " + labs[i].price +"</option>"
        	   }
        	   $("#idLabs").html(appendString);
           },
           error: function(e){
           	alert("Error: " + e);
       	}
       }); 
}

function getDatesOther() {
	if($("#idTest").val() == null || $("#pLocation").val() == null || $("#pidLabs").val() == null) {
		return;
	}
	 $.ajax({
	       	type : "POST",
	           url : 'getDates',
	           dataType: 'json',
	           data: "labId="+ $("#pidLabs").val(),
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
        $( "#pidAppointmentDate").datepicker({
        	changeMonth: true,
        	minDate: +1,
        	dateFormat:"yy-mm-dd",
        	beforeShowDay: function(date) {
        		return [checkIfDateAvailable(jQuery.datepicker.formatDate('yy-mm-dd', date))];
        	}}); 
      });


</script>
<script type="text/javascript">
  $(document).ready(function(){
	
	$('#idCheckAddressForOther').change(function(){
      if (this.checked) {
        $('#id_pick_add_street').val($('#p_add_street').val());
        //$('#id_pick_add_area').val($('#p_add_area').val());
        $('#id_pick_add_landmark').val($('#p_add_landmark').val());
        $('#id_pick_add_city').val($('#p_add_city').val());
        $('#id_pick_add_zipcode').val($('#p_add_zipcode').val());
        //var add_landmark = $("#add_landmark").val();
        
      } else {
	    $('#id_pick_add_street').val( ' ' );
        //$('#id_pick_add_area').val( ' ' );
        $('#id_pick_add_landmark').val( ' ' );
        $('#id_pick_add_city').val( ' ' );
        $('#id_pick_add_zipcode').val( ' ' );
	  }
        
    });
  });

</script>


<div class="row" id="idDivBookOther">
                    <div class="col-sm-12 col-lg-10 col-md-10 col-xs-12">
                                  

<form method='post' id="formBookAppOther" action="<%=Constants.BOOK_APPOINTMENT_OTHER_POST %>" class="classOCAForm">
    <input type="hidden" name="form_name" id="id_form_name" value="addotherappointment" />
    <div id="wizard" class="swMain classwizard">
 <ul>
          <li class="col-xs-12 col-sm-12 col-md-4 col-lg-4 col-xl-4">            
            <a href="#step-1">                
              <div class="arrow-right"></div>
                <span class="stepDesc">
                   Appointment<br />
                   <small>Details</small>
                </span>
                <div class="arrow-right-left"></div>                
            </a></li>
          <li class="col-xs-12 col-sm-12 col-md-4 col-lg-4 col-xl-4">
            <a href="#step-2">                
              <div class="arrow-right"></div>
                <span class="stepDesc">
                   Address<br />
                   <small>Details</small>
                </span>
              <div class="arrow-right-left"></div>                
            </a></li>
                      
        </ul>
        <div id="step-1"> 
          <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
                <%@include file="appointment_details.jsp" %>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
                  <table class='table table-bordered'>
                     <tr id="idUserName">
                        <td>Patient Name*</td>
                        <td><input type='text' name="user.firstName" id='pName' class='form-control' value="" required></td>
                            
                    </tr>
                    <tr id="idErrName"></tr>
                    <tr id="idUserRelation">
                        <td>Patient Relation*</td>
                        <td><input type='text' id='pRelation' class='form-control' value="" required></td>
                            
                    </tr>                            
                    <tr id="idRelationDiv" ></tr>
                   <tr>
                        <td>Patient Email*</td>
                        <td><input type='email' name="user.email" id='pEmail' class='form-control' value="" required ></td>
                    </tr>

                    <tr id="idErrEmail">
                    </tr>  
                    <tr  id="idErrEmailAddress">
                    </tr>  
                    <tr>
                        <td>Patient Mobile No*</td>
                        <td class="input-group"> <div class="input-group-addon">+91</div>
                        <input type='text' name="user.phone" id='pContact' class='form-control numeric' value="" style="position: relative;  z-index: 1;" maxlength="10" size="10" required></td>
                    </tr>
                    <tr id="idErrContact"></tr>
                    <tr>
                        <td>Patient Gender*</td>
                        <td>
                         <div class="radio">
                             <label><input type="radio" name="user.gender" value="M" checked="checked">Male</label>
                            <label><input type="radio" name="user.gender" value="F">Female</label>
                         </div>
                    </tr>
                    <tr>
                        <td>Doctor Name*</td>
                        <td><input type='text' name='doctorName' id='pDocName' class='form-control' value="" required></td>
                    </tr>
                    <tr id="idErrDocName"></tr>
                    
                    
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
                        
                      <td>                        
                        <div class="control-group">
                          <div class="controls">                     
                              <textarea id="p_add_street"  class="input-medium form-control" placeholder="Street"  required="" readonly="">${user.address.street}</textarea>
                          </div>
                        </div>
                      </td>
                    </tr>
                    <tr id="idErrAddress"></tr>
                    <tr rowspan="2">
                      <td>Area*</td>
                      <td>
                        <!-- Text input-->
                        <div class="control-group">
                          <!--<label class="control-label" for="add_area">Area</label>-->
                          <div class="controls">
                              <input id="p_add_area"  placeholder="Area" class="input-medium form-control" value="${user.address.area}" required="" type="text" readonly="">
                          </div>
                        </div>
                      </td>
                    </tr>
                    <tr rowspan="2">
                      <td>Landmark* </td>
                      <td>
                        <div class="control-group">
                          <div class="controls">
                              <input id="p_add_landmark" placeholder="Landmark" class="input-medium form-control" readonly="" value="${user.address.landmark}" type="text">
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
                              <input id="p_add_city"  placeholder="City" class="input-medium form-control" readonly required=""  value="Pune" type="text" readonly="">
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
                            <input id="p_add_zipcode"  placeholder="Zipcode" readonly class="input-medium form-control numeric" value="${user.address.zipCode}" type="text" required>
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
                              <input type="checkbox" id="idCheckAddressForOther" style="  width: 20px;float: left;" name="check_address" class="input-medium form-control"  name="check_address" style="width: 10%;"/>                            
                          </div>
                          <label class="control-label" for="check_address" style="float:left;margin:10px;">Select To Have Same Address</label>
                        </div>
                      </td>
                    </tr>
                     <tr rowspan="2">
                      <td>Pick Up Address*                      
                      </td>
                      <!--<td> <textarea class="form-control classAddress" rows="5" id="address" name="address"></textarea></td>-->
                      <td>
                              <!-- Textarea -->
                          <div class="control-group">
                            <!--<label class="control-label" for="add_street">Street</label>-->
                            <div class="controls">                     
                                <textarea id="id_pick_add_street" maxlength="160" name="address.street" class="input-medium form-control" placeholder="Street" required=""></textarea>
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
                              <input type="text" id="id_pick_add_area" name="address.area" class="form-control classLocationSelect" style="width:100%;" readonly="readonly" value="${appointment.location.name}" >                            
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
                              <input id="id_pick_add_landmark" name="address.landmark" placeholder="Landmark" class="input-medium form-control" value="" type="text" >
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
                                <input id="id_pick_add_city" name="address.city" placeholder="City" class="input-medium form-control" required=""  value="Pune" type="text" readonly="">
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
                                <input id="id_pick_add_zipcode" name="address.zipCode" placeholder="Pincode" class="input-medium form-control numeric" minlenth="6" maxlength="6" value="" type="text" required="">

                            </div>
                          </div>
                    </td>
                    </tr>
                    <tr id="idErrAddress"></tr>        
                  <tr rowspan="2">
                    <td colspan="2">  
                        <div class="row">                                        
                            <div class="form-group col-md-12">
                                <label class="control-label" for="r_is_require_print">
                                  <input id="id_report_checkbox" name="printRequired" class="" style="width:20px;height:20px;" value="Y" type="checkbox">
                                  <span class="classRCBcaption">I Want Printed Report</span>
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

</body>
</html>