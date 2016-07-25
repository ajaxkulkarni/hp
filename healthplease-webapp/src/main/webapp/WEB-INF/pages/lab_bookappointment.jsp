<%@page import="com.rns.healthplease.web.util.Constants"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>HealthPlease - Lab Dashboard</title>



</head>
<!-- <style>
    .classLogoImg {
        margin-top: -13px;
        margin-left: 0px;
        width: 190px;
        padding: 3px 10px;
        box-shadow: 1px -2px 0px #F80, -1px -2px 0px #F80;
        background-color: #FFF;
    }
</style> -->
<body>

    <div id="wrapper">

        <!-- Navigation -->
        <%@include file="lab_header.jsp" %>
		<link href="<c:url value="/resources/css/tab.css" />" rel="stylesheet" ></link>
		<link href="<c:url value="/resources/css/slots-style.css"/>" rel="stylesheet" type="text/css">
<!-- Right Side Panel Starts From HERE -->
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Book Appointment</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row"style="">
                <c:if test="${result != null }">
                <c:if test="${result == 'OK' }">
                	<div class="alert alert-success">
                		Your Appointment is booked successfully! <a href="<%=Constants.LAB_HOME_PENDING_APPS_URL_GET%>">Click here to view. </a>
  					</div>
                </c:if>
                <c:if test="${result != 'OK' }">
                	<div class="alert alert-danger">
                		${result}
                	</div>
                </c:if>
  				</c:if>
               
            </div>   
            <!-- /.row -->
            <div class="row" style="border:">                
                <!-- /.col-lg-6 -->
                <div class="col-sm-12 col-xl-12 col-md-6 col-lg-6 col-xl-6">
                    <div class="panel panel-default">
                        <!-- <div class="panel-heading">
                            <i class="fa fa-calendar"></i> Request Collection
                        </div> -->
                        <ul class="tab">
                       		<li><a href="#" class="tablinks" onclick="showAddress()"><i class="fa fa-calendar"></i> Request Collection</a></li>
                         	<li><a href="#" class="tablinks" onclick="hideAddress()">Lab Appointment</a></li>
 
               			</ul>
                        <!-- /.panel-heading -->
                        <div class="panel-body" id="slots">
  <style type="text/css">
  .classControlWrapper{
    margin-bottom:15px; 
  }
  .classControlWrapper .form-control{
    border-radius: 0px;
    border-color: #aaa;
  }
  .classControlWrapper label{
    font-weight: normal;
  }
  .classControlWrapper .classSubmit{
    background: #2FAEC9;
    border-color:#2FAEC9; 
    color: #fff;
  }
  .classControlWrapper .classSubmit:hover{
    background: #62c8f8;
  }
  .classFormDividerWrapper{
    background:#F9F6F6;
    padding: 10px 0;
    float: left;
  }
</style>
<form id="labAppform" action="<%=Constants.BOOK_APPOINTMENT_LAB_POST_URL%>" method="post" onsubmit="return onSubmit()">
        <div class="row" style="border:">
            <div class="col-sm-12 col-xs-12 col-md-12 col-lg-12 col-xl-12 classControlWrapper" style="border:">
             <input type="hidden" name="lab.id" id="idLabs" value="${user.lab.id}"> 
             <input type="hidden" name="homeCollection" id="homeCollection" value="true"> 
             <select id="idTest" name="testIds" class="form-control selectpicker js-tests" multiple="multiple" required="required"> 
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
              <div class="" id="idTestErr"></div>
          </div>

          <div class="col-sm-12 col-xs-12 col-md-12 col-lg-12 col-xl-12 classControlWrapper">
            <select id="idLocation" name="location.id" class="form-control locations" required="required">
              	<option value="">Select Patient Location</option>
              	<c:forEach items="${locations}" var="loc">
              	<option value="${loc.id}">&nbsp;&nbsp;${loc.name}</option>
                </c:forEach>
             </select>
             <div class="">
                	<h6>Pick Up Charge :<span id="idpickCharge"></span></h6>
             	</div>
          </div>

          <div class="col-sm-12 col-xs-12 col-md-6 col-lg-6 col-xl-6 classControlWrapper">
            <label class=" control-label" for="appointmentDate">Appointment Date</label>  
            <div class="">
              <input id="idAppointmentDate" name="appDate" placeholder="dd/mm/yyyy" class="form-control input-md slots datepicker-app" type="text" onchange="getSlots()" required="required">
              <input type="hidden" id="dbdate" value="${dates}">
            </div>
            <div class="" id="idAppDateErr"></div>
          </div>

          <div class="col-sm-12 col-xs-12 col-md-6 col-lg-6 col-xl-6 classControlWrapper">
            <label class=" control-label" for="appointmentTime">Appointment Time</label>
            <div id="slots" class="ui-widget">
                <select id="idAppTime" name="slot.id" class="form-control js-event-log js-slots" required="required">
                    <option value='select' disabled selected>Select Time</option>
                </select>
            </div>
            <div class="" id="idAppTime"></div>
          </div>

          <div class="classFormDividerWrapper classControlWrapper" style="border-top:1px solid #ddd;border-bottom:1px solid #ddd;">
            <div class="col-sm-12 col-xs-12 col-md-12 col-lg-12 col-xl-12 classControlWrapper">
              <label class=" control-label" for="appointmentPName">Patient's Name</label>  
              <div class="">
                <input id="idAppointmentPName" pattern="[A-Za-z]+" name="user.firstName" placeholder="Name" title="Enter a valid Name" class="form-control input-md" type="text" required="required">      
              </div>
              <div class="" id="idAppPNameErr"></div>
            </div>

            <div class="col-sm-12 col-xs-12 col-md-12 col-lg-12 col-xl-12 classControlWrapper">
              <label class=" control-label" for="appointmentPEmail">Patient's Email</label>  
              <div class="">
                <input id="idAppointmentPEmail" name="user.email" placeholder="Email" class="form-control input-md" type="email" required="required">      
              </div>
              <div class="" id="idAppPEmailErr"></div>
            </div>

            <div class="col-sm-12 col-xs-12 col-md-6 col-lg-6 col-xl-6 classControlWrapper">
              <label class=" control-label" for="appointmentPContact">Patient's Contact</label>  
              <div class="">
                <input id="idAppointmentPContact" name="user.phone" placeholder="Mobile No" class="form-control input-md" type="text" required="required">      
              </div>
              <div class="" id="idAppPContactErr"></div>
            </div>

            <div class="col-sm-12 col-xs-12 col-md-6 col-lg-6 col-xl-6 classControlWrapper">
              <label class=" control-label" for="appointmentPGender">Patient's Gender</label>  
              <div class="radio">
                  <label><input type="radio" name="user.gender" value="M" checked="checked">Male</label>
                 <label><input type="radio" name="user.gender" value="F">Female</label>  
             </div>   
              <div class="" id="idAppPGenderErr"></div>
            </div>
            
            <div class="col-sm-12 col-xs-12 col-md-12 col-lg-12 col-xl-12 classControlWrapper">
              <label class=" control-label" for="appointmentPAge">Patient's Age</label>  
              <div class="">
                <input id="idAppointmentPAge" align="left" name="user.age" placeholder="Age" class="form-control input-md" type="number" required="required">      
              </div>
              <div class="" id="idAppAgeErr"></div>
            </div>


            <div class="col-sm-12 col-xs-12 col-md-12 col-lg-12 col-xl-12 classControlWrapper">
              <label class=" control-label" for="appointmentPDoctor">Patient's Doctor</label>  
              <div class="">
                <input id="idAppointmentPDoctor" align="left" name="doctorName" placeholder="Doctor Name" class="form-control input-md" type="text" required="required">      
              </div>
              <div class="" id="idAppDoctorNameErr"></div>
            </div>
            <div id ="addressFields">
            <div class="col-sm-12 col-xs-12 col-md-12 col-lg-12 col-xl-12 classControlWrapper">
              <label class=" control-label" for="appointmentPAdd">Patient's Address</label>  
              <div class="">
                <textarea id="idAppointmentPAdd" name="address.street" placeholder="Address" class="form-control input-md"  required="required"></textarea>      
              </div>
              <div class="" id="idAppPAddErr"></div>
            </div>

            <div class="col-sm-12 col-xs-12 col-md-6 col-lg-6 col-xl-6 classControlWrapper">
              <label class=" control-label" for="appointmentPArea">Patient's Area</label>  
              <div class="">
                <input readonly id="idAppointmentPArea" name="address.area" placeholder="Area" class="form-control input-md"  type="text" required="required"/>      
              </div>
              <div class="" id="idAppPAreaErr"></div>
            </div>

            <div class="col-sm-12 col-xs-12 col-md-6 col-lg-6 col-xl-6 classControlWrapper">
              <label class=" control-label" for="appointmentPLandmark">Patient's Landmark</label>  
              <div class="">
                <input id="idAppointmentPLandmark" name="address.landmark" placeholder="Landmark" class="form-control input-md"  type="text"/>      
              </div>
              <div class="" id="idAppPLandmarkErr"></div>
            </div>

            <div class="col-sm-12 col-xs-12 col-md-6 col-lg-6 col-xl-6 classControlWrapper">
              <label class=" control-label" for="appointmentPCity">Patient's City</label>  
              <div class="">
                <input id="idAppointmentPCity" name="address.city" placeholder="City" class="form-control input-md"  type="text" value="Pune" readonly/>      
              </div>
              <div class="" id="idAppPCityErr"></div>
            </div>

            <div class="col-sm-12 col-xs-12 col-md-6 col-lg-6 col-xl-6 classControlWrapper">
              <label class=" control-label" for="appointmentPincode">Patient's Pincode</label>  
              <div class="">
                <input id="idappointmentPincode" type="number" pattern="[0-9]{6}" name="address.zipCode" placeholder="Pincode" class="form-control input-md"  type="text" required="required" />      
              </div>
              <div class="" id="idAppPPincodeErr"></div>
            </div>
			</div>
			<div class="col-sm-12 col-xs-12 col-md-6 col-lg-6 col-xl-6 classControlWrapper">
				<input id="id_report_checkbox" name="printRequired" class="" style="width: 20px; height: 20px;" value="Y" type="checkbox"> 
				Need printed report
			</div>
          </div>
		
          <div class="col-sm-12 col-xs-12 col-md-6 col-lg-6 col-xl-6 classControlWrapper pull-right" style="width:100%">
              <button id="idAppointmentBook" name="appointmentPBook" class="form-control input-md classSubmit" type="submit">SUBMIT</button>      
          </div>  
        </div>
</form>    
                        </div>
                        <!-- /.panel-body -->
                    </div>
                </div>
                <!-- /.col-lg-6 -->

                <div class="col-sm-12 col-xl-12 col-md-6 col-lg-6 col-xl-6" style="border:">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Calendar
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body" id="calendar">
                            
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                    <div class="row">
                    	 <div class="col-sm-12 col-xs-12 col-md-6 col-lg-6 col-xl-6 classControlWrapper" style="border:">
			              <label class=" control-label" for="">Discount</label>  
			              <div class="">
			                <input id="dicount" type="number" pattern="[0-9]{3}" name="discount" placeholder="Discount" class="form-control input-md" required="required" />      
			              </div>
			              <div class="" id="idAppPPincodeErr"></div>
            			</div>
            			
            			<div class="col-sm-12 col-xs-12 col-md-6 col-lg-6 col-xl-6 classControlWrapper" style="border:">
			              <label class=" control-label" for="">Total</label>  
			              <div class="">
			                <input id="total" type="number" pattern="[0-9]{7}" name="Total" placeholder="Discount" class="form-control input-md" required="required" />      
			              </div>
			              <div class="" id="idAppPPincodeErr"></div>
            			</div>
                      </div>
                </div>


            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->
 <!-- Modal -->
 <!-- To Block Slots -->
      
        
 <!-- Message Midal to diaplay -->       
<div class="modal fade" id="message-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" data-backdrop="static">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                 <!--<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>-->
                <h4 class="modal-title" id="myModalLabel">Confirm</h4>
            </div>
            <div class="modal-body" id="msg_modal_body">

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default input-md classControlWrapper" data-dismiss="modal" id="checkMe">Check Appointment</button>
                <button type="button" class="btn btn-default" data-dismiss="modal" id="clickMe">No</button>
            </div>
        </div>
    </div>
</div>
 
<!-- Modal -->
<div class="modal fade" id="message-slots" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" data-backdrop="static">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <!--<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>-->
        <h4 class="modal-title" id="myModalLabel">Confirm</h4>
      </div>
      <div class="modal-body" id="msg_body_slots">
         
      </div>
      <div class="modal-footer">
      	<input type="text" id="activateDay">
        <button type="button" class="btn btn-default classControlWrapper"  id="clickYesSlots">Yes</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
      </div>
    </div>
  </div>
</div> 
	<%@include file="lab_footer.jsp" %>
   <%@include file="forms/calendar.jsp" %>

<!-- Close LHS DIV -->
            <!-- Code Added by vikas on 23-May-2015 -->
<!-- Used to display combobox values runtime -->
<link href="<c:url value="/resources/css/external/select2/select2.min.css"/>" rel="stylesheet" ></link>
<script src="<c:url value="/resources/js/external/select2/select2.min.js"/>"></script>

<script type="text/javascript">

var check_array = [];


function onSubmit() {
	var form=$("#labAppform");
   	return form.valid();
}


$(document).ready(function(){
	
    $("select").select2();

    $( document ).on ( "click", ".fields", function(){
            dataval = $(this).data( 'val' );
            
            // Show the Selected Slots box if someone selects a slot
            if($("#outer_basket").css("display") == 'none') { 
                    $("#outer_basket").css("display", "block");
            }

            if(jQuery.inArray(dataval, check_array) == -1) {
                    check_array.push(dataval);
            } else {
                    // Remove clicked value from the array
                    check_array.splice($.inArray(dataval, check_array) ,1);	
            }

            slots=''; hidden=''; basket = 0;

            cost_per_slot = $("#cost_per_slot").val();
            //cost_per_slot = parseFloat(cost_per_slot).toFixed(2)

            for (i=0; i< check_array.length; i++) {
                    slots += check_array[i] + '\r\n';
                    hidden += check_array[i].substring(0, 8) + '|';
                    basket = (basket + parseFloat(cost_per_slot));
            }
            // Populate the Selected Slots section
            $("#selected_slots").html(slots);

            // Update hidden slots_booked form element with booked slots
            $("#slots_booked").val(hidden);		

            // Update basket total box
            basket = basket.toFixed(2);
            $("#total").html(basket);	

            // Hide the basket section if a user un-checks all the slots
            if(check_array.length == 0)
            $("#outer_basket").css("display", "none");

    });


    $( document ).on ( "click", ".classname", function(){

                    msg = '';

                    if($("#name").val() == '')
                    msg += 'Please enter a Name\r\n';

                    if($("#email").val() == '')
                    msg += 'Please enter an Email address\r\n';

                    if($("#phone").val() == '')
                    msg += 'Please enter a Phone number\r\n';	

                    if(msg != '') {
                            alert(msg);
                            return false;
                    }
    });
    
    $( document ).on ( "click", ".js-active_day_slot", function(){
            msg = '';

            if($("#name").val() == '')
            msg += 'Please enter a Name\r\n';

            if($("#email").val() == '')
            msg += 'Please enter an Email address\r\n';

            if($("#phone").val() == '')
            msg += 'Please enter a Phone number\r\n';	

            if(msg != '') {
                    alert(msg);
                    return false;
            }
    });
            // Firefox caches the checkbox state.  This resets all checkboxes on each page load 
            $('input:checkbox').removeAttr('checked');
});

// My settings for calendar starts from here
    $('#calendar').append($('#lhs').html());
    $('#lhs').remove();
    
    $('#slots').append($('#outer_booking').html());
    $('#outer_booking').remove();
    
    $('#slot_form').append($('#temp_slot_from').html());
    $('#temp_slot_from').remove();
   
    $( document ).ready( function(){
        $(".js-slots").select2("val", "");
        $.ajax({
            type:"POST",
            url:'appoinController.php?',
            data:'lab='+1+'&action=getLabBlockedDate',//only input
            success: function(response){
                bookedDays =  [];
                var obj = $.parseJSON( response );
                $.each( obj, function( key, value ) {
                    bookedDays[key] = value.date;
                });
            }
        });
        $(function() {
            $( "#idAppointmentDate").datepicker({
            	changeMonth: true,
            	minDate: 0,
            	maxDate:"+2M",
            	dateFormat:"yy-mm-dd",
            	beforeShowDay: function(date) {
            		return [checkIfDateAvailable(jQuery.datepicker.formatDate('yy-mm-dd', date))];
            	}});
          });
        
        /*
        * Load slots on date change
        */

        /* $( '.slots' ).change(function(){
           var date = $(this).val();
           //var lab_id = $(".labs").select2("val");
           $.ajax({
               type:"POST",
               url:'appoinController.php?',
               data:'curr_date='+date+'&action=getslots&labid='+1,//only input
               success: function(response){
                   $("#idAppTime").html( response );
                   $("#idAppTime").select2("val", "");
               }
            });
        });*/
        
        $( '.locations' ).change(function(){
            $("#idAppointmentPArea").val( $("#idLocation option:selected").text() );
            var location = $(this).val();
            if($("#addressFields").is(':hidden')) {
            	$("#idpickCharge").html("");
            	return;
            }
            
            $.ajax({
                    type:"POST",
                    url:'getLocationCharge?locId=' + location + "&testIds=" + $("#idTest").val(),
                    success: function(response){
                      $("#idpickCharge").html("Rs. "+response);
                    }
                });
        }); 
        
        
             /*
            * CAncel appointment
            */
           $( document ).on ( "click", "#checkMe",  function( e ){
                window.location.href = 'labHome.htm'
            });

});// end of document ready

$("#idAppointmentPName").keypress(function (e) {
    var regex = new RegExp("^[a-zA-Z]+$");
    var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
    if (regex.test(str)) {
        return true;
    }
    else
    {
    e.preventDefault();
    alert('Please Enter Alphabate');
    return false;
    }
});
$("#idAppointmentPDoctor").keypress(function (e) {
    var regex = new RegExp("^[a-zA-Z]+$");
    var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
    if (regex.test(str)) {
        return true;
    }
    else
    {
    e.preventDefault();
    alert('Please Enter Alphabate');
    return false;
    }
});
$("#idappointmentPincode").focusout(function(){
	var pin =  document.getElementById("idappointmentPincode").value;
	var x = pin.length;
	console.log(x);
	if(pin.length != 6 )
	{
		alert('Pincode must be 6 digits long');
		return false;
	}
	else{
		return true;
	}
});
function checkIfDateAvailable(date) {
 	var dates = $("#dbdate").val();
 	if(dates.length == 0) {
 		return true;
 	}
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

function getSlots() {
	$('#select2-idAppTime-container').html("<option value='select'>Please select timing</option>");
	if($("#idLabs").val() == null || $("#idAppointmentDate").val() == null){
		return;
	}
	
	$.ajax({
       	type : "POST",
           url : 'getSlots',
           dataType: 'json',
           data: "labId="+ $("#idLabs").val() + "&date="+ $("#idAppointmentDate").val() + "&homeCollection=" + $("#homeCollection").val() ,
           success : function(slots) {
        	   var i = 0;
        	   var appendString = "<option value='select'>Please select timing</option>";
        	   for(i = 0;i<slots.length;i++) {
        		   appendString = appendString + "<option value='" + slots[i].id +"'>&nbsp;&nbsp;" + slots[i].startTime + " to " + slots[i].endTime + "</option>"
        	   }
        	   $("#idAppTime").html(appendString);
           },
           error: function(e){
           	alert("Error: " + e);
       	}
       }); 
}    

function confirmBlock(day) {
	$("#blockDay").val(day);
	$("#message-popup").modal('show');
	
}

function confirmActivate(day) {
	$("#blockDay").val(day);
}

function hideAddress() {
	$("#addressFields").hide();
	$("#homeCollection").val('false');
	$("#idAppointmentDate").val("");
	$("#idLocation option:selected").removeAttr("selected");
	$('#select2-idLocation-container').html("Select Your Location")
	$("#idpickCharge").html("");
}

function showAddress() {
	$("#addressFields").show();
	$("#homeCollection").val('true');
	$("#idAppointmentDate").val("");
	$("#idLocation option:selected").removeAttr("selected");
	$('#select2-idLocation-container').html("Select Your Location")
	$("#idpickCharge").html("");
}
    
</script>