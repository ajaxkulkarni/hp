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
          <title>Corporate Requests | HealthPlease.in</title>
<link href="<c:url value="/resources/css/tab.css" />" rel="stylesheet" ></link>

</head>

<body>
<%@include file="user_header.jsp" %>

<ul class="nav nav-tabs">
			    <li class="active"><a data-toggle="tab" href="#request">Corporate Requests</a></li>
			    <li><a data-toggle="tab" href="#appoint">Corporate Appointments</a></li>
			  </ul>
			  
	 <div class="tab-content">
	 	
			    <div id="request" class="tab-pane fade in active" >
				<div class="container">
						<div class="tablespace"  style="background-color:#fff;margin-top:5%;">
						<table id="categories_table" class="table table-bordered table-responsive paginate">
					                    <tbody>
					                    <tr class="page_header">
					                    	<th>#</th>
					                    	<th>Name</th>
					                    	<th>Email</th>
					                    	<th>Corporate</th>
					                    	<th>Lab</th>
					                    	<th>Mobile No.</th>
					                    	<th colspan="2" align="center">Actions</th>
					                    </tr>                
					             		  
					                    	<td>123</td>
					                    	<td>Name</td>
					                    	<td>Email</td>
					                    	<td>Corporate</td>
					                    	<td>Lab</td>
					                    	<td>Mobile No.</td>
					                    	<td colspan="2" align="center">Actions</td>
					                    </tr>      
					                </tbody>
					      </table>
					      <ul class="pagination" id="pagination_list">
						</ul>
					   </div>
					</div>	
					
				</div>
	<!-- /////////////////////////////// -->			
				
		 <div id="appoint" class="tab-pane fade">
		 <div class="container" >
		 <div class="row" >
		 <div class="col-md-3 offset"  ></div>
		 <div class="col-md-6 " style="background-color:#fff;margin-top:2%">
		 		<h2>Corporate Appointments</h2>
			   <form role="form" action="<%=Constants.CORPORATE_REQUEST_POST_URL %>" method="post">
			  <div class="form-group">
			   <label for="sel1"style="margin-top:5%">Select Corporate:</label>
			  <select class="form-control" id="sel1" name="companyName">
			    <option>Elcerx Services Ltd</option>
			  </select>
			  </div>
			   <div class="form-group">
			  <div class="form-group">
			   <label for="sel1"style="margin-top:">Preferred Lab:</label>
			  <select class="form-control" id="lab" name="labName">
			  
			  </select>
			  </div>
			   <div class="form-group">
			    <label for="name">Patient Name:</label>
			    <input type="text" class="form-control" id="name" name="name">
			  </div>
			  
			  <div class="form-group">
			    <label for="email">Company Email:</label>
			    <input type="email" class="form-control" id="email" name="email">
			  </div>
			  <div class="form-group">
			    <label for="pwd">Mobile No.:</label>
			    <input type="number" class="form-control" id="mobile" name="phone">
			  </div>
			     <div class="form-group">
			    <label for="name">Employee's Name:</label>
			    <input type="text" class="form-control" id="empname" name="name">
			  </div>
			   <div class="form-group">
			    <label for="age">Age:</label>
			    <input type="number" class="form-control" id="age" name="age" style="width:50px">
			  </div>
			
			    <div class="form-group">
			   <label for="sel1"style="margin-top:5%">Location:</label>
			  <select class="form-control" id="location" name="location"> 	
			 </select>
			  </div>
			   <div class="form-group">
				<input id="id_report_checkbox" name="printRequired" class="" style="width: 20px; height: 20px;" value="Y" type="checkbox"> 
				Need printed report
			</div>
			  <input type="hidden" name="testName" id="package_name">
			  <button type="submit" class="btn btn-default"style="margin-top:5%">Submit</button>
			</form>   
			      	
			</div>      			 		
    		</div>
    	</div>
        </div>
   		
				
				
	<!-- //////////////////// -->			
				
	</div>

<%@include file="user_footer.jsp" %>
<script src="<c:url value="/resources/js/myPagination.js"/>"></script> 


<script>

$(document).ready(function(){
	paginateTable(20,0);
}); 
</script>

</body>