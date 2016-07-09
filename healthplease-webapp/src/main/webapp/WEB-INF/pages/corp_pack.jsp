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
box-shadow: 0px 2px 5px grey;
padding:1%;
text-align:centre;
border-radius:5px;

}


</style>
</head>

<body>
<%@include file="user_header.jsp" %>
<div class ="container" >
<div class="row">
	<div class="col-sm-12">
		<div class ="card" style="height:100px">
		<div class="cardheader">
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
			<div class="alert alert-success">Your request has been submitted successfully and you will receive a call from healthplease team shortly.</div>
		</c:if>
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
			          <p>Upto 45% off, Starting Rs.700</p>
			           <div class="panel-group">
						  <div class="panel panel-default">
						    <div class="panel-heading">
						      <h4 class="panel-title">
						        <a data-toggle="collapse" href="#collapse1">Tests</a>
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
							
								  <li class="list-group-item">Tests for Kidney</li>
								  <li class="list-group-item">Creatinine</li>
								  <li class="list-group-item">Urine Routine</li>
						      </ul>
						   
						    </div>
						  </div>
						</div>
			    </div>
			    
			    <div class="cardfooter">
			    	 <button type="button" class="btn btn-primary" onclick="loadModal('Basic Package')">select</button>
			    </div>
						
			</div>
		</div>
	   <div class="col-sm-6" style="border:none;">
		<div class="card">
				<div class="cardheader">
			          <h2>Basic Package + Diagnostic Test</h2>
			    </div>
			    
			    <div class="cardbody">
			          <p>Upto 42% off, Starting Rs.1900</p>
			           <div class="panel-group">
						  <div class="panel panel-default">
						    <div class="panel-heading">
						      <h4 class="panel-title">
						        <a data-toggle="collapse" href="#collapse2">Tests</a>
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
			     <button type="button" class="btn btn-primary" onclick="loadModal('Basic Package + Diagnostic test')">select</button>
			    </div>		
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-6" style="border:none;">
		<div class="card">
				<div class="cardheader">
			          <h2>Package1</h2>
			    </div>
			    
			    <div class="cardbody">
			          <p>Upto 37% off, Starting Rs.1200</p>
			            <div class="panel-group">
						  <div class="panel panel-default">
						    <div class="panel-heading">
						      <h4 class="panel-title">
						        <a data-toggle="collapse" href="#collapse3">Tests</a>
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
			  <button type="button" class="btn btn-primary" onclick="loadModal('Package1')">select</button>
			    </div>		
			</div>
		
	</div>	
	
	    <div class="col-sm-6" style="border:none">
	    <div class="card">
				<div class="cardheader">
			          <h2>Package1 + Diagnostics Tests</h2>
			    </div>
			    
			    <div class="cardbody">
			          <p>Upto 26% off, Starting Rs.2800</p>
			            <div class="panel-group">
							  <div class="panel panel-default">
							    <div class="panel-heading">
							      <h4 class="panel-title">
							        <a data-toggle="collapse" href="#collapse4">Tests</a>
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
			  <button type="button" class="btn btn-primary" onclick="loadModal('Package1 + Diagnostic tests')">select</button>
			    </div>		
			</div>
		</div>
		</div>
		
		<div class="row">
		<div class="col-sm-6" style="border:none">
		<div class="card">
				<div class="cardheader">
			          <h2>Package2</h2>
			    </div>
			    
			    <div class="cardbody">
			          <p>Upto 37% off, Starting Rs. 3000</p>
			          <div class="panel-group">
						  <div class="panel panel-default">
						    <div class="panel-heading">
						      <h4 class="panel-title">
						        <a data-toggle="collapse" href="#collapse5">Tests</a>
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
			     <button type="button" class="btn btn-primary" onclick="loadModal('Package2')">select</button>
			    </div>		
			</div>
		</div>
	    <div class="col-sm-6" style="border:none">
	    <div class="card">
				<div class="cardheader">
			          <h2>Package2 + Diagnostics Tests</h2>
			    </div>
			    
			    <div class="cardbody">
			          <p>Upto 24% off, Starting Rs.6000</p>
			            <div class="panel-group">
					  <div class="panel panel-default">
					    <div class="panel-heading">
					      <h4 class="panel-title">
					        <a data-toggle="collapse" href="#collapse6">Lists</a>
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
			   <button type="button" class="btn btn-primary" onclick="loadModal('Package2 + Diagnostic tests')">select</button>
			    </div>		
			</div>
		</div>
		
	</div></div>
	
	<div class="row">
		<div class="col-sm-3" style="border:none"></div>
		<div class="col-sm-6" style="border:none">
		<div class="card">
				<div class="cardheader">
			          <h2>Package 3 + Diagnostics Tests</h2>
			    </div>
			    
			    <div class="cardbody">
			          <p>Male - Upto 46% off, Starting Rs.7000</br>
                             Female - Upto 46% off, Starting Rs.7500</p>
                             <div class="panel-group">
							  <div class="panel panel-default">
							    <div class="panel-heading">
							      <h4 class="panel-title">
							        <a data-toggle="collapse" href="#collapse7">Tests</a>
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
			    	 <button type="button" class="btn btn-primary" onclick="loadModal('Package3 + DIagnostic tests')">select</button>
			    </div>		
			</div>
		</div>
			<div class="col-sm-4" style="border:none"></div>
	</div>
</div>
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
			  <select class="form-control" id="sel1">
			    <option>Corporate</option>
			    <option>Corporate</option>
			    
			  </select>
			  </div>
			   <div class="form-group">
			  <div class="form-group">
			   <label for="sel1"style="margin-top:5%">Preferred Lab:</label>
			  <select class="form-control" id="sel1" name="labName">
			  	<c:forEach items="${labs}" var="lab">
			  		 <option>${lab.name}</option>
			  	</c:forEach>
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
<%@include file="user_footer.jsp" %>

<script type="text/javascript">

function loadModal(packageName) {
	
	$("#package_name").val(packageName);
	$("#modal_title").text(packageName);
	$("#myModal").modal('show');
	
}

</script>

</body>

</html>