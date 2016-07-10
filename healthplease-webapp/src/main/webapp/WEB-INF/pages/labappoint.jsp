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
<link href="<c:url value="/resources/css/tab.css" />" rel="stylesheet" ></link>

    <title>HealthPlease - Lab Dashboard</title>

</html>

<body>
    <%@include file="lab_header.jsp" %>
    
    <div id="wrapper">
    
    <div id="page-wrapper">
    <div class="row" style="border">
    <div class ="col-sm-6 col-md-6 col-lg-6 col-xs-12"style="border">
    	
			    	 <h2>Book Appointments</h2>
			  <ul class="nav nav-tabs">
			    <li class="active"><a data-toggle="tab" href="#collect">Request Collection</a></li>
			    <li><a data-toggle="tab" href="#appoint">Lab Appointment</a></li>
			    
			  </ul>
			
			  <div class="tab-content">
			    <div id="collect" class="tab-pane fade in active">
			      
			      		<form id="labAppform" action="<%=Constants.BOOK_APPOINTMENT_LAB_POST_URL%>" method="post" onsubmit="return onSubmit()">
        <div class="row" style="border:">
            <div class="col-sm-12 col-xs-12 col-md-12 col-lg-12 col-xl-12 classControlWrapper" style="border:">
             <input type="hidden" name="lab.id" id="idLabs" value="${user.lab.id}"> 
             <input type="hidden" id="homeCollection" value="Y"> 
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
                <input id="idAppointmentPName" pattern="[A-Za-z]{3}" name="user.firstName" placeholder="Name" title="Enter a valid Name" class="form-control input-md" type="text" required="required">      
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
                <input id="idAppointmentPAge" align="left" name="user.age" placeholder="Age" class="form-control input-md" type="text" required="required">      
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
                <input id="idAppointmentPLandmark" name="address.landmark" placeholder="Landmark" class="form-control input-md"  type="text" required="required"/>      
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
            <div class="col-sm-12 col-xs-12 col-md-6 col-lg-6 col-xl-6 classControlWrapper">
				<input id="id_report_checkbox" name="printRequired" class="" style="width: 20px; height: 20px;" value="Y" type="checkbox"> 
				Need printed report
			</div>
			</div>
          </div>

          <div class="col-sm-12 col-xs-12 col-md-6 col-lg-6 col-xl-6 classControlWrapper pull-right" style="width:100%">
              <button id="idAppointmentBook" name="appointmentPBook" class="form-control input-md classSubmit" type="submit">SUBMIT</button>      
          </div>  
        </div>
</form>    
			     
			     
			     
			     
			     
			    </div>
			    <div id="appoint" class="tab-pane fade">
			      
			      			 		<form id="labAppform" action="<%=Constants.BOOK_APPOINTMENT_LAB_POST_URL%>" method="post" onsubmit="return onSubmit()">
        <div class="row" style="border:">
            <div class="col-sm-12 col-xs-12 col-md-12 col-lg-12 col-xl-12 classControlWrapper" style="border:">
             <input type="hidden" name="lab.id" id="idLabs" value="${user.lab.id}"> 
             <input type="hidden" id="homeCollection" value="Y"> 
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
                <input id="idAppointmentPName" pattern="[A-Za-z]{3}" name="user.firstName" placeholder="Name" title="Enter a valid Name" class="form-control input-md" type="text" required="required">      
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
                <input id="idAppointmentPAge" align="left" name="user.age" placeholder="Age" class="form-control input-md" type="text" required="required">      
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
			      
			    </div>
			   
			  </div>
    
    
    
    </div>
   
    </div>
    
    </div>
     <div class ="col-sm-6 col-md-6 col-lg-6 col-xs-12"style="border">
    
    		
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
    
    
    
    </div></div></div>
    <%@include file="lab_footer.jsp" %>
</body>		