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

</div></div>

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
						      </h4>
						    </div>
						    <div id="collapse1" class="panel-collapse collapse">
						      <ul class="list-group">
						        <li class="list-group-item">One</li>
						        <li class="list-group-item">Two</li>
						        <li class="list-group-item">Three</li>
						      </ul>
						      <div class="panel-footer">Footer</div>
						    </div>
						  </div>
						</div>
			    </div>
			    
			    <div class="cardfooter">
			    	 <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">select</button>
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
						      </h4>
						    </div>
						    <div id="collapse2" class="panel-collapse collapse">
						      <ul class="list-group">
						        <li class="list-group-item">One</li>
						        <li class="list-group-item">Two</li>
						        <li class="list-group-item">Three</li>
						      </ul>
						      <div class="panel-footer">Footer</div>
						    </div>
						  </div>
						</div>
			    </div>
				 <div class="cardfooter">
			     <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">select</button>
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
						      </h4>
						    </div>
						    <div id="collapse3" class="panel-collapse collapse">
						      <ul class="list-group">
						        <li class="list-group-item">One</li>
						        <li class="list-group-item">Two</li>
						        <li class="list-group-item">Three</li>
						      </ul>
						      <div class="panel-footer">Footer</div>
						    </div>
						  </div>
						</div>
			    </div>
				  <div class="cardfooter">
			  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">select</button>
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
							      </h4>
							    </div>
							    <div id="collapse4" class="panel-collapse collapse">
							      <ul class="list-group">
							        <li class="list-group-item">One</li>
							        <li class="list-group-item">Two</li>
							        <li class="list-group-item">Three</li>
							      </ul>
							      <div class="panel-footer">Footer</div>
							    </div>
							  </div>
							</div>
			    </div>
				  <div class="cardfooter">
			  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">select</button>
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
						      </h4>
						    </div>
						    <div id="collapse5" class="panel-collapse collapse">
						      <ul class="list-group">
						        <li class="list-group-item">One</li>
						        <li class="list-group-item">Two</li>
						        <li class="list-group-item">Three</li>
						      </ul>
						      <div class="panel-footer">Footer</div>
						    </div>
						  </div>
						</div>
			    </div>
				  <div class="cardfooter">
			     <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">select</button>
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
					      </h4>
					    </div>
					    <div id="collapse6" class="panel-collapse collapse">
					      <ul class="list-group">
					        <li class="list-group-item">One</li>
					        <li class="list-group-item">Two</li>
					        <li class="list-group-item">Three</li>
					      </ul>
					      <div class="panel-footer">Footer</div>
					    </div>
					  </div>
					</div>
			    </div>
				  <div class="cardfooter">
			   <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">select</button>
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
							      </h4>
							    </div>
							    <div id="collapse7" class="panel-collapse collapse">
							      <ul class="list-group">
							        <li class="list-group-item">One</li>
							        <li class="list-group-item">Two</li>
							        <li class="list-group-item">Three</li>
							      </ul>
							      <div class="panel-footer">Footer</div>
							    </div>
							  </div>
							</div>
			       </div>
				  <div class="cardfooter">
			    	 <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">select</button>
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
          <h4 class="modal-title">Corporate Package XYZ</h4>
        </div>
        <div class="modal-body">
        
        	<form role="form">
			  <div class="form-group">
			   <label for="sel1"style="margin-top:5%">Select Corporate:</label>
			  <select class="form-control" id="sel1">
			    <option>Corporate</option>
			    <option>Corporate</option>
			    
			  </select>
			  </div>
			   <div class="form-group">
			    <label for="name">Name:</label>
			    <input type="text" class="form-control" id="name">
			  </div>
			  <div class="form-group">
			    <label for="email">Company Email:</label>
			    <input type="email" class="form-control" id="email">
			  </div>
			  <div class="form-group">
			    <label for="pwd">Mobile No.:</label>
			    <input type="number" class="form-control" id="mobile">
			  </div>
			  <button type="submit" class="btn btn-default"style="margin-top:5%">Submit</button>
			</form>
          
        </div>
        
      </div></div></div>
<%@include file="user_footer.jsp" %>
</body>

</html>