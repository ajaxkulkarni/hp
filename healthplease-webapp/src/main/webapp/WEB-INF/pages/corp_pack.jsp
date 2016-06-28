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
position:absolute;
top:80%;
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
height:220px
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

<div class="container" style="margin-bottom:2%;background-color:#eee">
	<div class="row">
		<div class="col-sm-4" style="border:none">
			<div class="card">
				<div class="cardheader">
			          <h2>Basic Package</h2>
			    </div>
			    
			    <div class="cardbody">
			          <p>Upto 45% off, Starting Rs.700</p>
			    </div>
			    
			    <div class="cardfooter">
			    	<button type="button" class="btn btn-primary ">Select</button>
			    </div>
						
			</div>
		</div>
	   <div class="col-sm-4" style="border:none;">
		<div class="card">
				<div class="cardheader">
			          <h2>Basic Package + Diagnostic Test</h2>
			    </div>
			    
			    <div class="cardbody">
			          <p>Upto 42% off, Starting Rs.1900</p>
			    </div>
				 <div class="cardfooter">
			    	<button type="button" class="btn btn-primary ">Select</button>
			    </div>		
			</div>
		</div>
		
		<div class="col-sm-4" style="border:none;">
		<div class="card">
				<div class="cardheader">
			          <h2>Package1</h2>
			    </div>
			    
			    <div class="cardbody">
			          <p>Upto 37% off, Starting Rs.1200</p>
			    </div>
				  <div class="cardfooter">
			    	<button type="button" class="btn btn-primary ">Select</button>
			    </div>		
			</div>
		
	</div>	</div>
	
	<div class="row">
		
	    <div class="col-sm-4" style="border:none">
	    <div class="card">
				<div class="cardheader">
			          <h2>Package1 + Diagnostics Tests</h2>
			    </div>
			    
			    <div class="cardbody">
			          <p>Upto 26% off, Starting Rs.2800</p>
			    </div>
				  <div class="cardfooter">
			    	<button type="button" class="btn btn-primary ">Select</button>
			    </div>		
			</div>
		</div>
		<div class="col-sm-4" style="border:none">
		<div class="card">
				<div class="cardheader">
			          <h2>Package2</h2>
			    </div>
			    
			    <div class="cardbody">
			          <p>Upto 37% off, Starting Rs. 3000</p>
			    </div>
				  <div class="cardfooter">
			    	<button type="button" class="btn btn-primary ">Select</button>
			    </div>		
			</div>
		</div>
	    <div class="col-sm-4" style="border:none">
	    <div class="card">
				<div class="cardheader">
			          <h2>Package2 + Diagnostics Tests</h2>
			    </div>
			    
			    <div class="cardbody">
			          <p>Upto 24% off, Starting Rs.6000</p>
			    </div>
				  <div class="cardfooter">
			    	<button type="button" class="btn btn-primary ">Select</button>
			    </div>		
			</div>
		</div>
		
	</div>
	
	<div class="row">
		<div class="col-sm-4" style="border:none"></div>
		<div class="col-sm-4" style="border:none">
		<div class="card">
				<div class="cardheader">
			          <h2>Package 3 + Diagnostics Tests</h2>
			    </div>
			    
			    <div class="cardbody">
			          <p>Male - Upto 46% off, Starting Rs.7000</br>
                             Female - Upto 46% off, Starting Rs.7500</p>
			    </div>
				  <div class="cardfooter">
			    	<button type="button" class="btn btn-primary ">Select</button>
			    </div>		
			</div>
		</div>
			<div class="col-sm-4" style="border:none"></div>
	</div>
</div>

<%@include file="user_footer.jsp" %>
</body>

</html>