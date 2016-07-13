<%@page import="com.rns.healthplease.web.util.Constants"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
          <title>Book online Pathology & Diagnostic Tests in Pune | HealthPlease.in</title>
    <meta name="keywords" content="Book Online Path Test, Book online diagnostic test, Blood Sugar test">
    <meta name="description" content="Book your online Pathology Lab test and test packages and have sample picked from home. Online Payment option and save reports for future reference.">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>

<body>
  
<%@include file="user_header.jsp" %>
  
<div>
    <div id="myModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="modal_head"></h4>
                </div>
                <div class="modal-body" id="modal_body">
                                   </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <!--<button type="button" class="btn btn-primary">Save changes</button>-->
                </div>
            </div>
        </div>
    </div>
</div>
 
<script type="text/javascript">

	function reset() {
		//$('#idLocation').removeAttr("selected");
        $('#select2-idLocation-container').html("Select Your Location");
	}

    $(document).ready(function(){


      /*
      Reset Location on update in test
      */
      $('#idTest').change(function(){
        reset();
      });


        
    /**
* to set appointment from user scrren
 */        
    /* function onDateChage(){
    	alert("Here!");
               $( "#idAppointmentDate" ).datepicker( "option", "dateFormat", "mm/dd/yy" );
               var tempval = generateDate( $("#idAppointmentDate").val() );
               $('#dbdate').val( tempval );
               $( "#idAppointmentDate" ).datepicker( "option", "dateFormat", "dd/mm/yy" );

    };     */

    $("#idBookAppointmentOnLogin").on( "click", function(){

          var sTestName = $("#idTest").val();
          var sLocationName = $("#idLocation").val();
          if(sTestName == "select"){
              $("#idTestErr").fadeIn(1500);
              $("#idTestErr").html("<label style='color:red;'>Please select your test</label>")
              $("#idTestErr").fadeOut(1500);
              return false;
          }
           if(sLocationName == "select"){
              $("#idLocationErr").fadeIn(1500);
              $("#idLocationErr").html("<label style='color:red;'>Please select location of test</label>")
              $("#idLocationErr").fadeOut(1500);
              return false;
          }

          appointmentDate = $("#idAppointmentDate").val();
          if(appointmentDate == ""){
            $("#idAppDateErr").fadeIn(1500);
              $("#idAppDateErr").html("<label style='color:red;'>Please select time slot</label>")
              $("#idAppDateErr").fadeOut(1500);
             return false; 
          }

          var appTime  = $("#idAppTime").val();
          var appDetails = "";
          //window.location.href="confirmAppointment.php?testName="+sTestName+"&locName="+sLocationName+"&appDate="+appointmentDate+"&appTime="+appTime+"&dbdate="+$('#dbdate').val()+"&lab="+$('#idLabs').val();

    
    });
    
    $(function() {
    	var minDay = '0';
    	if($("#user_group").val() != '2') {
    		minDay = '+1';
    	}
        $( "#idAppointmentDate").datepicker({
        	changeMonth: true,
        	minDate: minDay,
        	maxDate:"+2M",
        	dateFormat:"yy-mm-dd",
        	beforeShowDay: function(date) {
        		return [checkIfDateAvailable(jQuery.datepicker.formatDate('yy-mm-dd', date))];
        	}});
      });

         /* On key press remove error alert */
    $("#username").keypress(function(){
      $("#idUsernameErr").html("");
    });
    $("#password").keypress(function(){
      $("#idPasswordErr").html("");
    });
    }); 

 function generateDate( date ) {
            var tempDate = date.split( '/' );
            return tempDate[2] + '-' + tempDate[0] + '-' + tempDate[1];
 }

 function checkIfDateAvailable(date) {
	 	var dates = $("#dbdate").val();
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
	 
 function submitForm() {
	 $("#login_form").submit();
 }
	 
       
</script>


<!--  Package Slider script start-->
<script type="text/javascript">

	function setData() {
		$("#idSlot").val($("#idAppTime").val());
		$("#register_link").attr("href", "signUp.htm?slotId=" + $("#idAppTime").val());
	}
	
	function getSlots() {
		$('#select2-idAppTime-container').html("Please select timing");
		if($("#idLabs").val() == null || $("#idAppointmentDate").val() == null){
			return;
		}
		$.ajax({
	       	type : "POST",
	           url : 'getSlots',
	           dataType: 'json',
	           data: "labId="+ $("#idLabs").val() + "&date="+ $("#idAppointmentDate").val() + "&homeCollection=true",
	           success : function(slots) {
	        	   var i = 0;
	        	   var appendString = "<option value='select'>Please select timing</option>";
	        	   for(i = 0;i<slots.length;i++) {
	        		   appendString = appendString + "<option value='" + slots[i].id +"'>&nbsp;&nbsp;" + slots[i].startTime + " - " + slots[i].endTime + "</option>"
	        	   }
	        	   $("#idAppTime").html(appendString);
	           },
	           error: function(e){
	           	alert("Error: " + e);
	       	}
	       }); 
	}
	
	function getLabs(homeCollection) {
		$('#select2-idLabs-container').html("Please select lab");
		if($("#idTest").val() == null || $("#idLocation").val() == null) {
			return;
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
	        		   appendString = appendString + "<option value='" + labs[i].id +"'>&nbsp;&nbsp;" + labs[i].name +" | Fees Rs. " + labs[i].price +"</option>"
	        	   }
	        	   $("#idLabs").html(appendString);
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
		        	   $("#dbdate").val(appendString);
		           },
		           error: function(e){
		           	alert("Error: " + e);
		       	}
		       }); 
		 
	 }

</script>

<script src="<c:url value="/resources/js/external/package-slider/jquery.flexisel.js"/>"></script>
<script type="text/javascript">

$(window).load(function() {

    $("#flexiselDemo3").flexisel({
        visibleItems: 5,
        animationSpeed: 1000,
        autoPlay: true,
        autoPlaySpeed: 3000,            
        pauseOnHover: true,
        enableResponsiveBreakpoints: true,
        responsiveBreakpoints: { 
            portrait: { 
                changePoint:480,
                visibleItems: 1
            }, 
            landscape: { 
                changePoint:640,
                visibleItems: 2
            },
            tablet: { 
                changePoint:768,
                visibleItems: 3
            }
        }
    });

    $("#flexiselDemo4").flexisel({
        clone:false
    });
    
});
</script>

<!-- Package slider script end-->


        <div class="classSliderHolder">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xl-6 hidden-sm hidden-xs classNoLPadding">
                      <div class="classHAbtTextWrapper">                         
                        <div class="classOSCFont classFrontText">
                          <!-- Your Convenience, Our Priority...<br/> -->
                          <div class="text-left"><img src="<c:url value="/resources/images/steps/3-steps.png"/>" width="95%" class="classStepImg" /></div>
                            <div class="classBColor">Request Sample Collection Now&nbsp;&nbsp;&nbsp;<span class="hvr-buzz-out"><i class="fa fa-hand-o-right "></i></span></div>
                        </div>
                       
                      </div>                     
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xl-6 classNoPadding">
                        <!-- Form Div Start-->
                        <div class="auth">
                            <div id="big-form" class="well auth-box">
                            
                                <fieldset>

                                  <!-- Form Name -->
                                  <legend><i class="fa fa-calendar"></i> Request Collection</legend>
                                  <!-- Select Basic -->
                                    <div class="form-group">
                                      <!-- <label class=" control-label" for="selectbasic">Test</label> -->
                                      <div class="ui-widget">
                                        <select id="idTest" name="test" class="form-control selectpicker js-tests" multiple="multiple">
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
                                      <div class="" id="idTestErr"></div>
                                    </div>

                                    <div class="form-group">
                                      <!-- <label class=" control-label" for="selectbasic">Your Location</label> -->
                                        <div class="ui-widget">
                                            <select id="idLocation" name="location" class="form-control locations" onchange="getLabs('Y')">
                                              <option value="">Select your location</option>
                                              <c:forEach items="${locations}" var="loc">
                                              	 <option value="${loc.id}">&nbsp;&nbsp;${loc.name}</option>
                                              </c:forEach>
                                            </select>
                                        </div>
                                      <div class="" id="idLocationErr"></div>
                                    </div>

                                    <div class="form-group">
                                      <!-- <label class=" control-label" for="selectbasic">Your Location</label> -->
                                      <div class="ui-widget">
                                        <select id="idLabs" name="labs" class="form-control labs" onchange="getDates()" >
                                          <option value='select' disabled>Please select lab</option>
                                        </select>
                                      </div>
                                      <div class="" id="idLocationErr"></div>
                                    </div>
									<form method='post' id="on_form_appointment" action="login" autocomplete="off">
                                  <div class="row">
                                        <div class="form-group col-md-6">
                                            <label class=" control-label" for="appointmentDate">Appointment Date</label>  
                                            <div class="">
                                              <input id="idAppointmentDate" name="appointmentDate" placeholder="yyyy-mm-dd" class="form-control input-md slots datepicker-app" type="text" onchange="getSlots()">
                                              <input type="hidden" name="dbdate" id="dbdate" value="">
                                            </div>
                                            <div class="" id="idAppDateErr"></div>
                                        </div> 
                                        <div class="form-group col-md-6">
                                          <label class=" control-label" for="appointmentTime">Appointment Time</label>
                                          <div id="slots" class="ui-widget">
                                            <select id="idAppTime" name="slot.id" class="form-control js-event-log js-slots" onchange="setData()">
                                              <option value='select' disabled selected>Select time slot</option>
                                            </select>
                                            <!--<input id="idAppTime" name="appointmentTime" placeholder="" class="form-control input-md" type="text" value="Between 7:00 am to 12:00pm" readonly/>-->
                                          </div>
                                        </div>
                                        
                                    </div>
                                                                  
                                 
                                  <div class="form-group">
                                    <div class="">
                                    	<c:if test="${user.firstName == null }">
                                       		<a href="#idLoginModal" data-toggle="modal" data-keyboard="false" data-target="#idLoginModal">
                                       		<input type="submit" id="idBookAppointment" name="bookAppointment" value="Book Appointment" class="classAptBtn btn btn-success"/>
                                       		</a>
                                       </c:if>
                                       <c:if test="${user.firstName != null }">
                                       		<a href="">
                                       		<input type="submit" id="idBookAppointment" name="bookAppointment" value="Book Appointment" class="classAptBtn btn btn-success"/>
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
              </div>
            </div>



            
            <div class="classHomeText">
              <div class="container">
                <div class="row">
                  <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
                    <p>
                      Healthcare is one of the most important aspects of one's being. Good health is not just a blessing from the physical point of view, but also promotes an elevated state of mind! Keeping this in mind, we at HealthPlease, provide quality pathology services at affordable rates, that too right from the comfort of your own home!
                    </p>
                    <p>
                      Yes, you read it correctly. Our experienced technicians arrive at your doorstep to collect sample for various path lab tests at your preferred date and time, so that you do not have to undergo the hassle of visiting the laboratory for getting tested, or even for getting your reports back! After your tests, you can simply log-in to your HealthPlease account and view your reports, or even check for the same on your email account. However, if requested, we will also be happy to personally deliver your reports! 
                    </p>
                    <div class="row">
                      <div class="col-sm-12 col-xs-12 col-md-12 col-lg-12 col-xl-12 classLeft">
                                <div class=" text-center"><strong class="classSFont classDB">To make things even simpler, HealthPlease offers you some tremendous facilities such as </strong></div>
                        <div class="row">  
                          <div class="col-sm-12 col-xs-12 col-md-6 col-lg-6 col-xl-6 r-classRight">
                            <p>
                              <ul class="classHomeList">                
                              
                                  <li><i class="fa fa-balance-scale"></i> &nbsp;&nbsp;Comparing Different Lab Prices</li>
                                <li><i class="fa fa-credit-card"></i> &nbsp;&nbsp;Paying Online</li>
                              <li><i class="fa fa-folder-open"></i> &nbsp;&nbsp;Preserving Past Reports </li>
                            </ul>

                            </p>                         
                          </div>  
                          <div class="col-sm-12 col-xs-12 col-md-6 col-lg-6 col-xl-6 r-classRight">
                              <p>
                                  <!-- <strong class="classSFont">In addition, we also strive to soon introduce some outstanding services, such as </strong> -->
                                <ul class="classHomeList">
                                  <li><i class="fa fa-calendar"></i> &nbsp;&nbsp;Booking an Appointment for Sample Collection</li>              
                              <li><i class="fa fa-download"></i> &nbsp;&nbsp;Viewing and Downloading Test Reports Online</li>
                                <li><i class="fa fa-comment"></i> &nbsp;&nbsp;Live Chat for Instant Support</li>
                              </ul>

                              </p>
                            </div>
                        </div>
                      </div>
                    </div>
              </div>
            </div>

            </div>
        </div>

<%@include file="forms/request_checkup.jsp" %>

<%@include file="user_footer.jsp" %>

<!-- Forget modal form code end-->
<!-- Share This Button Code Start -->
<!--<script>var sharebutton_is_horizontal = true; document.write('<script src="//cdn.script.to/share.js"></scr' + 'ipt>'); document.write("<div style='display: none'>");</script><a href="http://sharebutton.org/">social sharing buttons</a><script>document.write("</div>");</script>-->
<!-- Share This Button Code End -->
</body>

</html>