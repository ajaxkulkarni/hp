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
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <link href="<c:url value="/resources/css/external/select2/select2.min.css"/>" rel="stylesheet" ></link>
    
    <title>Corporate Appointments | HealthPlease.in</title>
 <style type="text/css">
 input[type=number]::-webkit-outer-spin-button,
input[type=number]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}

input[type=number] {-moz-appearance: textfield;}
}
 </style>
</head>

<body>
<script type="text/javascript">
/* <script src="<c:url value="/resources/js/external/select2/select2.min.js"/>"> */

</script>


<%@include file="user_header.jsp" %>
<div class="classTopHeading">
        <div class="container">
            <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Welcome <span class="nameHolder">Admin</span></h1>
            </div>
        </div>
            <!-- /.col-lg-12 -->
        </div>
    </div>
   <div class="container" id="addUser" name="addUser" >
  <div class="row"> 
    <%@include file="admin_header.jsp" %> 

<div class="col-md-9 col-xl-9">
<ul class="nav nav-tabs">
			    <li class="active"><a data-toggle="tab" href="#request">Corporate Requests</a></li>
			    <li><a data-toggle="tab" href="#appoint">Corporate Appointments</a></li>
			    <li><a data-toggle="tab" href="#partner">Partner Requests</a></li>
			  </ul>
			  
	 <div class="tab-content">
	 	
			    <div id="request" class="tab-pane fade in active" >
				<div class="container">
				<div class="row">
				<div class="col-md-10 col-xl-10">
						<div class="tablespace"  style="background-color:#fff;margin-top:5%;height:500px">
						<table id="categories_table" class="table table-bordered table-responsive paginate">
					                    <tbody>
					                    <tr class="page_header">
					                    	<th>#</th>
					                    	<th>Name</th>
					                    	<th>Email</th>
					                    	<th>Corporate</th>
					                    	<th>Package Requested</th>
					                    	<th>Lab</th>
					                    	<th>Mobile No.</th>
					                    	<th colspan="2" align="center">Actions</th>
					                    </tr>                
					             		 <c:forEach items="${requestForms}" var="req" varStatus="i">
					             		 <tr>
					                    	<td>${i.index + 1}</td>
					                    	<td>${req.name}</td>
					                    	<td>${req.email}</td>
					                    	<td>${req.companyName}</td>
					                    	<td>${req.testName}</td>
					                    	<td>${req.labName}</td>
					                    	<td>${req.phone}</td>
					                    	<td colspan="2" align="center">Actions</td>
					                    </tr>   
					                    </c:forEach>   
					                </tbody>
					      </table>
					     
					   </div>
					    <ul class="pagination" id="pagination_list">
						</ul>
					</div>	</div></div>
					
				</div>
	<!-- /////////////////////////////// -->			
				
	<div id="appoint" class="tab-pane fade">
		 <div class="container" >
		 <div class="row" >
		 <div class="col-md-1 offset"  ></div>
		 <div class="col-md-6 " style="background-color:#fff;margin-top:2%">
		 		<h2>Corporate Appointments</h2>
		 		
			   <form role="form" action="<%=Constants.ADMIN_CORPORATE_BOOK_APPOINTMENT_POST_URL %>" method="post">
			  <div class="form-group">		  
			   <label for="sel1"style="margin-top:5%">Select Corporate:</label>
			  <select class="form-control" id="sel1">
			    <option>Elcerx Services Ltd</option>
			  </select>
			  </div>
			  
			   <div class="form-group">
			  <label for="test" >Test:</label></br>
			  <select id="idTest" name="testIds" style="width:100%" class="form-control selectpicker js-tests" multiple="multiple" onchange="getLabs()">
			
              	<c:forEach items="${tests}" var="test">
                	<option value="${test.id}">&nbsp;&nbsp;${test.name}</option>
               	</c:forEach>
              </select>
              </div>
			  
			  <div class="form-group">
			   <label for="sel1"style="margin-top:">Preferred Lab:</label></br>
			  <select class="form-control"  style="width:100%"id="idLabs" name="lab.id" onchange="getDates()">
			  
			  </select>
			  </div>
			  
			  <div class="form-group">
			  <label class=" control-label" for="appointmentDate">Appointment Date</label>  
              <div class="">
                  <input id="idAppointmentDate" style="width:100%"name="appDate" placeholder="yyyy-mm-dd" class="form-control input-md datepicker-app" type="text" onchange="getSlots()" >
              	<input type="hidden" name="dbdate" id="dbdate" value="">
              	</div>
               </div>
               
               <div class="form-group">
               		<label class=" control-label" for="appointmentTime">Appointment Time</label>
                    <div id="slots" class="ui-widget">
                    <select id="idAppTime" style="width:100%" name="slot.id" class="form-control js-event-log js-slots">
                    	<option value='select' disabled selected>Select time slot</option>
                        </select>
	                </div>
                </div>
               
			   <div class="form-group">
			    <label for="name">Name:</label>
			    <input type="text" class="form-control" required="required" id="name" name="user.firstName">
			  </div>
			  
			  <div class="form-group">
			    <label for="email">Company Email:</label>
			    <input type="email" class="form-control" required="required" id="email" name="user.email">
			  </div>
			  <div class="form-group">
			    <label for="pwd">Mobile No.:</label>
			    <input type="text" class="form-control" required="required" id="mobile" name="user.phone" onfocusout="validateMobile()">
			  </div>
			  <div class="" id="mobileError"></div>
			   <!-- <div class="form-group">
			    <label for="name">Employee's Name:</label>
			    <input type="text" class="form-control" id="empname" name="name">
			  </div> -->
			   <div class="form-group">
			    <label for="age">Age:</label>
			    <input type="text" class="form-control" id="age" name="user.age" style="width:100%"; onfocusout="validateAge()">
			  </div>
			  <div class="" id="ageError"></div>
			    <div class="form-group">
			   <label for="sel1"style="margin-top:1%">Location:</label>
			  	<input type="text" class="form-control" id="area" required="required" name="address.area">
			  </div>
			   <div class="form-group">
				<input id="id_report_checkbox" name="printRequired" class="" style="width: 20px; height: 20px;" value="Y" type="checkbox"> 
				Need printed report
			</div>
			  <button type="submit" class="btn btn-default"style="margin-top:2%;margin-bottom:5%">Submit</button>
			</form>   
			      	
			</div>      			 		
    		</div>
    	</div>
        </div>
   		
				
				
	<!-- //////////////////// -->	
	
	    <div id="partner" class="tab-pane fade" >
				<div class="container">
				<div class="row">
				<div class="col-md-10 col-xl-10">
						<div class="tablespace"  style="background-color:#fff;margin-top:5%;height:500px">
						<table id="categories_table" class="table table-bordered table-responsive paginate">
					                    <tbody>
					                    <tr class="page_header">
					                    	<th>#</th>
					                    	<th>Name</th>
					                    	<th>Company</th>
					                    	<th>HR/Admin</th>
					                    	<th>Contact</th>
					                    	<th>HR/Admin Email</th>
					                    	<th>Location</th>
					                    	<th colspan="2" align="center">Actions</th>
					                    </tr>                
					             		 <c:forEach items="${partnerForms}" var="req" varStatus="i">
					             		 <tr>
					                    	<td>${i.index + 1}</td>
					                    	<td>${req.name}</td>
					                    	<td>${req.companyName}</td>
					                    	<td>${req.adminName}</td>
					                    	<td>${req.phone}</td>
					                    	<td>${req.email}</td>
					                    	<td>${req.location}</td>
					                    	<td colspan="2" align="center">Actions</td>
					                    </tr>   
					                    </c:forEach>   
					                </tbody>
					      </table>
					     
					   </div>
					    <ul class="pagination" id="pagination_list">
						</ul>
					</div>	</div></div>
					
				</div>
	
		<!-- //////////////////// -->		
				
	</div>
</div>
</div>
</div>
<%@include file="user_footer.jsp" %>
<script src="<c:url value="/resources/js/myPagination.js"/>"></script> 


<script>

$(document).ready(function(){
	paginateTable(20,0);
	
	$( "#idAppointmentDate").datepicker({
	        	changeMonth: true,
	        	minDate: 0,
	        	maxDate:"+2M",
	        	dateFormat:"yy-mm-dd",
	        	beforeShowDay: function(date) {
	        		return [checkIfDateAvailable(jQuery.datepicker.formatDate('yy-mm-dd', date))];
	}});
	     
}); 

function getDates() {
	if($("#idTest").val() == null || $("#idLabs").val() == null) {
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
function validateMobile(){

	var x = document.getElementById("mobile").value;
	if(isNaN(x)){
		document.getElementById("mobileError").innerHTML="enter a valid mobile no."
			document.getElementById("mobile").focus();
		return false;
	}
	else if(x.length != 10)
		{
		document.getElementById("mobileError").innerHTML="enter a valid mobile no."
		document.getElementById("mobile").focus();
		return false;
		}
	else{
		document.getElementById("mobileError").innerHTML=""
		return true;
		}
}
function validateAge(){

	var x = document.getElementById("age").value;
	if(isNaN(x)){
		document.getElementById("ageError").innerHTML="Age must be a no."
			document.getElementById("age").focus();
		return false;
	}
	else if(x < 0)
		{
		document.getElementById("ageError").innerHTML="Age must be positive"
		document.getElementById("age").focus();
		return false;
		}
	else{
		document.getElementById("ageError").innerHTML=""
		return true;
		}
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

function getLabs() {
	$('#idLabs').html("Please select lab");
	if($("#idTest").val() == null) {
		return;
	}
	$.ajax({
       	type : "POST",
           url : 'adminGetLabs',
           dataType: 'json',
           data: "testIds="+ $("#idTest").val(),
           success : function(labs) {
        	   var i = 0;
        	   var appendString = "<option value='select'>Please select lab</option>";
        	   for(i = 0;i<labs.length;i++) {
        		   var area = "";
        		   if(labs[i].area != null) {
        			   area = " , " + labs[i].area.name;
        		   }
        		   appendString = appendString + "<option value='" + labs[i].id +"'>&nbsp;&nbsp;" + labs[i].name + area  + " | Fees Rs. " + labs[i].price +"</option>"
        	   }
        	   $("#idLabs").html(appendString);
           },
           error: function(e){
           	alert("Error: " + e);
       	}
       });  
}


function getSlots() {
	$('#idAppTime').html("Please select timing");
	if($("#idLabs").val() == null || $("#idAppointmentDate").val() == null){
		return;
	}
	$.ajax({
       	type : "POST",
           url : 'getSlots',
           dataType: 'json',
           data: "labId="+ $("#idLabs").val() + "&date="+ $("#idAppointmentDate").val() + "&homeCollection=false",
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

</script>

</body>