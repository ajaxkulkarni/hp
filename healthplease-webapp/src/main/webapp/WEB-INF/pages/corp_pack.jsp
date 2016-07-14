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
          <title>Corporate Plans | HealthPlease.in</title>
<style>
.cardheader{
position:relative;
text-align:center;
left:0px;
top:0px;
background-color:

}
.cardbody{
text-align:left;
margin:10%;
}
.cardfooter{
position:relative;

bottom:0%;
left:10%;
}
.card{
margin:2%;
background-color:#fff;
box-shadow: 0px 1px 5px grey;
padding:1%;
text-align:centre;
border-radius:2px;

}


</style>
</head>

<body>
<%@include file="user_header.jsp" %>
<div class ="container" >
<div class="row">
	<div class="col-sm-12">
		<div class ="card1" style="height:100px">
		<div class="cardheader1">
		<h1>Corporate Packages</h1>
		</div>
		</div>
	</div>
</div>
<div id="msg" class="container">
    	<c:if test="${result != null && result != 'OK' }">
			<div class="alert alert-danger">${result}</div>
		</c:if>
		<c:if test="${result != null && result == 'OK' }">
			<div class="alert alert-success">Thank you for requesting a Corporate Package. Our Health Please Convenience team will get in touch with you shortly and confirm the booking.</c:if>
    </div>
</div>

<div class="container" style="margin-bottom:2%;background-color:#fff">
	<div class="row">
		<div class="col-sm-6" style="border:none">
			<div class="card">
				<div class="cardheader">
			          <h2>Basic Package</h2>
			    </div>
			    
			    <div class="cardbody">

			          <h4>Upto 45% off</h4>
			           <div class="panel-group">
						  <div class="panel panel-default">
						    <div class="panel-heading">
						      <h4 class="panel-title">
						        <a data-toggle="collapse" href="#collapse1">View Tests</a>
						      </h3>
						    </div>
						    <div id="collapse1" class="panel-collapse collapse">
						      <ul class="list-group">
						     
						       	  <li class="list-group-item"><h3>Pathology Tests</h3></li>
								  <li class="list-group-item">Complete Blood Count</li>
								  <li class="list-group-item">Blood Sugar Random</li>
								
								  <li class="list-group-item"><h3>Tests for Liver</h3> </li>
								  <li class="list-group-item">SGOT</li>
								  <li class="list-group-item">SGPT</li>
						
								  <li class="list-group-item"><h3>Test for Heart</h3></li>
								  <li class="list-group-item">Total Cholesterol </li>
							

								  <li class="list-group-item"><h3>Tests for Kidney</h3></li>

							  <li class="list-group-item">Creatinine</li>
								  <li class="list-group-item">Urine Routine</li>
						      </ul>
						   
						    </div>
						  </div>
						</div>
			    </div>
			    
			    <div class="cardfooter">
			    	 <button type="button" class="btn btn-primary" onclick="loadModal('Basic Package')">Select</button>
			    </div>
						
			</div>
		</div>
	   <div class="col-sm-6" style="border:none;">
		<div class="card">
				<div class="cardheader">
			          <h2>Basic Package + Diagnostic Test</h2>
			    </div>
			    
			    <div class="cardbody">

			          <h4>Upto 42% off</h4>
		           <div class="panel-group">
						  <div class="panel panel-default">
						    <div class="panel-heading">
						      <h4 class="panel-title">
						        <a data-toggle="collapse" href="#collapse2">View Tests</a>
						      </h3>
						    </div>
						    <div id="collapse2" class="panel-collapse collapse">
						      <ul class="list-group">
						        
						  <li class="list-group-item"><h3>Pathology Tests</h3></li>
				<li class="list-group-item">Complete Blood Count</li>
				<li class="list-group-item">Blood Sugar Random</li>
								
				<li class="list-group-item"><h3>Tests for Liver</h3> </li>
				<li class="list-group-item">SGOT</li>
				<li class="list-group-item">SGPT</li>
								
					<li class="list-group-item"><h3>Test for Heart</h3></li>
					<li class="list-group-item">Total Cholesterol</li> 
								
					<li class="list-group-item"><h3>Tests for Kidney</h3></li>
					<li class="list-group-item">Creatinine</li>
					<li class="list-group-item">Urine Routine</li>
								
					<li class="list-group-item"><h3>Diagnostics Test</h3></li>
					<li class="list-group-item">E.C.G(12 Lead)</li>
								
					<li class="list-group-item"><h3>Consultations</h3></li>
					<li class="list-group-item">Physician Consultation</li>
					<li class="list-group-item">Dental Checkup</li>
					<li class="list-group-item">Eye Check up</li>
						      </ul>
						    
						    </div>
						  </div>
						</div>
			    </div>
				 <div class="cardfooter">
			     <button type="button" class="btn btn-primary" onclick="loadModal('Basic Package + Diagnostic test')">Select</button>
			    </div>		
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-6" style="border:none;">
		<div class="card">
				<div class="cardheader">
			          <h2>Package 1</h2>
			    </div>
			    
			    <div class="cardbody">

			          <h4>Upto 37% off</h4>

			            <div class="panel-group">
						  <div class="panel panel-default">
						    <div class="panel-heading">
						      <h4 class="panel-title">
						        <a data-toggle="collapse" href="#collapse3">View Tests</a>
						      </h3>
						    </div>
						    <div id="collapse3" class="panel-collapse collapse">
						      <ul class="list-group">
								<li class="list-group-item"><h3>Pathology Tests</h3></li>
								<li class="list-group-item">Complete Blood Count</li>
								<li class="list-group-item">Blood Sugar Random</li>
								<li class="list-group-item">HbA1c</li>
								
								<li class="list-group-item"><h3>Tests for Liver </h3></li>
								<li class="list-group-item">SGOT</li>
								<li class="list-group-item">SGPT</li>
								
								<li class="list-group-item"><h3>Test for Heart</h3></li>
								<li class="list-group-item">Lipid Profile</li>
								
								<li class="list-group-item"><h3>Tests for Kidney</h3></li>
								<li class="list-group-item">Creatinine</li>
								<li class="list-group-item">Urea</li>
								<li class="list-group-item">Urine Routine</li>
								
								<li class="list-group-item"><h3>Consultations</h3></li>
								<li class="list-group-item">Physician Consultation / Pathologist Consultation</li>
						      </ul>
						    
						    </div>
						  </div>
						</div>
			    </div>
				  <div class="cardfooter">
			  <button type="button" class="btn btn-primary" onclick="loadModal('Package 1')">Select</button>
			    </div>		
			</div>
		
	</div>	
	
	    <div class="col-sm-6" style="border:none">
	    <div class="card">
				<div class="cardheader">
			          <h2>Package 1 + Diagnostics Tests</h2>
			    </div>
			    
			    <div class="cardbody">

			          <h4>Upto 26% off</h4>

			            <div class="panel-group">
							  <div class="panel panel-default">
							    <div class="panel-heading">
							      <h4 class="panel-title">
							        <a data-toggle="collapse" href="#collapse4">View Tests</a>
							      </h3>
							    </div>
							    <div id="collapse4" class="panel-collapse collapse">
							      <ul class="list-group">
								<li class="list-group-item"><h3>Pathology Tests</h3></li>
								<li class="list-group-item">Complete Blood Count</li>
								<li class="list-group-item">Blood Sugar Random</li>
								<li class="list-group-item">HbA1c</li>
								
								<li class="list-group-item"><h3>Tests for Liver</h3></li> 
								<li class="list-group-item">SGOT</li>
								<li class="list-group-item">SGPT</li>
								
								<li class="list-group-item"><h3>Test for Heart</h3></li>
								<li class="list-group-item">Lipid Profile</li>
								
								<li class="list-group-item"><h3>Tests for Kidney</h3></li>
								<li class="list-group-item">Creatinine</li>
								<li class="list-group-item">Urea</li>
								<li class="list-group-item">Urine Routine</li>
								
								<li class="list-group-item"><h3>Diagnostics Test</h3></li>
								<li class="list-group-item">E.C.G(12 Lead)</li>
								<li class="list-group-item">X-Ray Chest</li>
								
								<li class="list-group-item"><h3>Consultations</h3></li>
								<li class="list-group-item">Physician Consultation / Pathologist Consultation</li>
								<li class="list-group-item">Dental Checkup</li>
								<li class="list-group-item">Eye Check up</li>					      </ul>
							     
							    </div>
							  </div>
							</div>
			    </div>
				  <div class="cardfooter">
			  <button type="button" class="btn btn-primary" onclick="loadModal('Package 1 + Diagnostic tests')">Select</button>
			    </div>		
			</div>
		</div>
		</div>
		
		<div class="row">
		<div class="col-sm-6" style="border:none">
		<div class="card">
				<div class="cardheader">
			          <h2>Package 2</h2>
			    </div>
			    
			    <div class="cardbody">

			          <h4>Upto 37% off</h4>

			          <div class="panel-group">
						  <div class="panel panel-default">
						    <div class="panel-heading">
						      <h4 class="panel-title">
						        <a data-toggle="collapse" href="#collapse5">View Tests</a>
						      </h3>
						    </div>
						    <div id="collapse5" class="panel-collapse collapse">
						      <ul class="list-group">
							<li class="list-group-item"><h3>Pathology Tests</h3></li>
							<li class="list-group-item">Complete Blood Count</li>
							<li class="list-group-item">Blood Sugar Fasting+Post Prandial</li>
							<li class="list-group-item">HbA1c</li>
							
							<li class="list-group-item"><h3>Liver Profile</h3></li>
							<li class="list-group-item">SGOT</li>
							<li class="list-group-item">SGPT</li>
							<li class="list-group-item">Proteins</li>
							
							<li class="list-group-item"><h3>Test for Heart</h3></li>
							<li class="list-group-item">Lipid Profile</li>
							
							<li class="list-group-item"><h3>Tests for Kidney Disease</h3></li>
							<li class="list-group-item">Creatinine</li>
							<li class="list-group-item">Urea</li>
							<li class="list-group-item">Urine Routine</li>
							
							<li class="list-group-item"><h3>Test for Thyroid</h3></li>
							<li class="list-group-item">T3+T4+TSH</li>
							
							<li class="list-group-item"><h3>Vitamin Profile Test</h3></li>
							<li class="list-group-item">Vitamin d3 + Vitamin B12</li>
							
							<li class="list-group-item"><h3>Consultations</h3></li>
							<li class="list-group-item">Physician Consultation / Pathologist Consultation</li>
													      </ul>
						      
						    </div>
						  </div>
						</div>
			    </div>
				  <div class="cardfooter">
			     <button type="button" class="btn btn-primary" onclick="loadModal('Package 2')">Select</button>
			    </div>		
			</div>
		</div>
	    <div class="col-sm-6" style="border:none">
	    <div class="card">
				<div class="cardheader">
			          <h2>Package 2 + Diagnostics Tests</h2>
			    </div>
			    
			    <div class="cardbody">

			          <h4>Upto 24% off</h4>

			            <div class="panel-group">
					  <div class="panel panel-default">
					    <div class="panel-heading">
					      <h4 class="panel-title">
					        <a data-toggle="collapse" href="#collapse6">View Tests</a>
					      </h3>
					    </div>
					    <div id="collapse6" class="panel-collapse collapse">
					      <ul class="list-group">
							<li class="list-group-item"><h3>Pathology Tests</h3></li>
							<li class="list-group-item">Complete Blood Count</li>
							<li class="list-group-item">Blood Sugar Fasting+Post Prandial</li>
							<li class="list-group-item">HbA1c</li>
							
							<li class="list-group-item"><h3>Liver Profile</h3></li>
							<li class="list-group-item">SGOT</li>
							<li class="list-group-item">SGPT</li>
							<li class="list-group-item">Proteins</li>
							
							<li class="list-group-item"><h3>Test for Heart</h3></li>
							<li class="list-group-item">Lipid Profile</li>
							
							<li class="list-group-item"><h3>Tests for Kidney Disease</h3></li>
							<li class="list-group-item">Creatinine</li>
							<li class="list-group-item">Urea</li>
							<li class="list-group-item">Urine Routine</li>
							
							<li class="list-group-item"><h3>Test for Thyroid</h3></li>
							<li class="list-group-item">T3+T4+TSH</li>
							
							<li class="list-group-item"><h3>Vitamin Profile Test</h3></li>
							<li class="list-group-item">Vitamin d3 + Vitamin B12</li>
							
							<li class="list-group-item"><h3>Diagnostics Test</h3></li>
							<li class="list-group-item">2D Echo OR Stress Test</li>
							<li class="list-group-item">ECG 12 Leads</li>
							<li class="list-group-item">Chest X-ray</li>
							
							<li class="list-group-item"><h3>Consultations</h3></li>
							<li class="list-group-item">Physician Consultation / Pathologist Consultation</li>
							<li class="list-group-item">Dental Checkup</li>
							<li class="list-group-item">Eye Checkup	</li>			    
							  </ul>
					 
					    </div>
					  </div>
					</div>
			    </div>
				  <div class="cardfooter">
			   <button type="button" class="btn btn-primary" onclick="loadModal('Package 2 + Diagnostic tests')">Select</button>
			    </div>		
			</div>
		</div>
		
	</div>
	</div>
	
	<div class="row">
		<div class="col-sm-3" style="border:none"></div>
		<div class="col-sm-6" style="border:none">
		<div class="card">
				<div class="cardheader">
			          <h2>Package 3 + Diagnostics Tests</h2>
			    </div>
			    
			    <div class="cardbody">

			          <h4>Male - Upto 46% off </br>
                             Female - Upto 46% off </h4>

			     
                  <div class="panel-group">
							  <div class="panel panel-default">
							    <div class="panel-heading">
							      <h4 class="panel-title">
							        <a data-toggle="collapse" href="#collapse7">View Tests</a>
							      </h3>
							    </div>
							    <div id="collapse7" class="panel-collapse collapse">
							      <ul class="list-group">
								<li class="list-group-item"><h3>Pathology Tests</h3></li>
								<li class="list-group-item">Complete Blood Count</li>
								<li class="list-group-item">Blood Sugar Fasting+Post Prandial</li>
								<li class="list-group-item">HbA1c</li>
								
								<li class="list-group-item"><h3>Liver Profile</h3></li>
								<li class="list-group-item">SGOT</li>
								<li class="list-group-item">SGPT</li>
								<li class="list-group-item">Proteins</li>
								
								<li class="list-group-item"><h3>Test for Heart</h3></li>
								<li class="list-group-item">Lipid Profile</li>
								
								<li class="list-group-item"><h3>Tests for Kidney Disease</h3></li>
								<li class="list-group-item">Creatinine</li>
								<li class="list-group-item">Urea</li>
								<li class="list-group-item">Urine Routine</li>
								
								<li class="list-group-item"><h3>Test for Thyroid</h3></li>
								<li class="list-group-item">T3+T4+TSH</li>
								
								<li class="list-group-item"><h3>Vitamin Profile Test</h3></li>
								<li class="list-group-item">Vitamin D3 + Vitamin B12</li>
								
								<li class="list-group-item"><h3>Cancer Risk Marker</h3></li>
								<li class="list-group-item">Prostate Specific Antigen / Pap Smear</li>
								
								<li class="list-group-item"><h3>Diagnostics Test</h3></li>
								<li class="list-group-item">ECG 12 Leads</li>
								<li class="list-group-item">Sonography of abdomen & pelvis</li>
								<li class="list-group-item">Chest X-ray</li>
								<li class="list-group-item">Stress Test (Treadmill test) OR 2D ECHO</li>
								
								<li class="list-group-item"><h3>Consultations</h3></li>
								<li class="list-group-item">Physician Consultation / Pathologist Consultation</li>
								<li class="list-group-item">Dental Checkup</li>
								<li class="list-group-item">Eye Checkup</li>
								<li class="list-group-item">Diet Consultation</li>
								<li class="list-group-item">Gynaecological Examination</li>
								<li class="list-group-item">Pap Smear</li>
							      </ul>
							    
							    </div>
							  </div>
							</div>
			       </div>
				  <div class="cardfooter">
			    	 <button type="button" class="btn btn-primary" onclick="loadModal('Package 3 + DIagnostic tests')">Select</button>
			    </div>		
			</div>
		</div>
			<div class="col-sm-4" style="border:none"></div>
	</div>
<%@include file="user_footer.jsp" %>
   <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" id="modal_title"></h3>
        </div>
        <div class="modal-body">
        
        	<form role="form" action="<%=Constants.CORPORATE_REQUEST_POST_URL %>" method="post">
			  <div class="form-group">
			   <label for="sel1"style="margin-top:5%">Select Corporate:</label>
			  <select class="form-control" id="sel1" name="companyName">
			    <option>Elcerx Services Ltd</option>
			  </select>
			  </div>
			   <div class="form-group">
			  <div class="form-group">
			   <label for="sel1"style="margin-top:5%">Preferred Lab:</label>
			  <select class="form-control" id="sel1" name="labName">
			  	<c:forEach items="${labs}" var="lab">
			  		 <option>${lab.name}, ${lab.area.name}</option>
			  	</c:forEach>
			  	<!-- <option value="">N M Medical, Shivaji Nagar</option>
				<option value="">N M Medical, Kalyani Nagar</option>
				<option value="">CareFirst Diagnostics, Baner Road</option>
				<option value="">HealthBerries, Baner Road</option>
				<option value="">PrimeX Health, Dhanori Road</option> -->
			  </select>
			  </div>
			   <div class="form-group">
			    <label for="name">Name:</label>
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
			  <input type="hidden" name="testName" id="package_name">
			  <button type="submit" class="btn btn-default"style="margin-top:5%">Submit</button>
			</form>
          
        </div>
        
      </div></div></div>


<script type="text/javascript">

function loadModal(packageName) {
	
	$("#package_name").val(packageName);
	$("#modal_title").text(packageName);
	$("#myModal").modal('show');
	
}

</script>

</body>

</html>