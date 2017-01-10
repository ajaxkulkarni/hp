<%@page import="com.rns.healthplease.web.util.Constants"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
          <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
          <meta name="viewport" content="width=device-width, initial-scale=1">
          <title>Book Pathology or Diagnostics test and get amazing Cashbacks & Discounts and Deals | HealthPlease.in</title>
          <meta name="description" content="Enjoy Exciting Cashback Offers, Deals and Discounts on your Pathology or Diagnostics tests booked through HealthPlease.in">
           <link rel="icon" type="image/png" sizes="32x32" href="<c:url value="/resources/images/favicon/favicon-32x32.png"/>">
			<link rel="icon" type="image/png" sizes="96x96" href="<c:url value="/resources/images/favicon/favicon-96x96.png"/>">
			<link rel="icon" type="image/png" sizes="16x16" href="<c:url value="/resources/images/favicon/favicon-16x16.png"/>">
          	<link href="<c:url value="/resources/css/mui.css" />" rel="stylesheet" ></link>
          	<link href="<c:url value="/resources/css/mui.min.css" />" rel="stylesheet" ></link>
          	<link href="<c:url value="/resources/js/mui.js" />" rel="javascript" ></link>
</head>
<body style="background-color:">
<style type="text/css">
/*@import url(http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300,300italic,700);*/
@import url(https://fonts.googleapis.com/css?family=Open+Sans);
@import url(https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,800,700);
.classOSCFont{
}

.classPoint{

	float: left;
    width: 100%;
    margin-left: 0;
    padding-left:0; 
    list-style: none;
    
}
.classPoint li{
	margin-left: 0;
	padding-left: 0;
	margin-bottom: 0px;
	float: left;
}
.classInnerPoint li{
    font-family:calibri;
    font-size:20px;
    font-weight:900;
	background: #006daa;
    padding:5px 10px;
    border: 1px solid rgba(255, 255, 255, 0.15);
    box-shadow: -28px 0 0 #14A7DF;
    margin-bottom: 0px;
    margin-left: -15px;
    float: left;
    width: 100%;
    clear: both;
    font-weight: 100;
}
.classPtSpan{
 
	font-size: 50px;
	text-transform: uppercase;
	font-weight: 1000;
}
.classCTA{
	    margin: 30px auto;
    display: inline-block;
    border: 1px solid #fff;
    color: #fff;
    text-decoration: none;
    padding: 15px 30px;
    display: inline-block;
}
.classCTSSubmit{
	background: #04568E;
    color: #fff;
    border: 1px solid #fff;
}
.classtext{
	font-size: 16px;
	line-height: 25px;
}
.class10TVH{
	margin-top: 10VH;
}
.classWColor{
	color: #fff !important;
}
	.loadDiv{
	position: fixed;
	width: 100%;
	height: 100vh;
	background-color: #FFF;
	overflow: x-hidden;
	z-index: 999;
}

	.loadDiv .classLDiv{
	max-width: 100%;
	max-height: 100vh;
	width:100%;
	text-align: center;
	height: 100vh;
	position: relative;
	margin:10vh auto;
}
	
.classLPageFormHolder{
	border-color: #14A7DF;
	    margin-top: 11vh;
    box-shadow: 0 0 25px rgba(0, 0, 0, 0.26);
    position:
    width: 360px;
}
.modal-header{
	    background-color: #FFF;
    color: #00538B;
    text-align: center;
}
.modal-body{
	background: #04568E;
	color: #fff;
}
.modal-footer{
	    background: #fff;
    border-bottom: 2px solid #00528B;
}
 body{
	position: relative;
	background-color: #555;
	    background-size: cover;
	     background-repeat: no-repeat;
    background-attachment: fixed;
    background-position: 0 -100px;
    font-family: sans-serif;
        font-size: 18px;
    font-weight: 400;
    color: #fff;
    /*text-shadow: 0 1px 1px rgba(0, 0, 0, 0.25)*/
}


</style>

<%@include file="user_header.jsp" %>
<div class="container">
	 <div class="row" >
		 <div class="col-md-12 col-sm-12" style="color:#222;font-family:calibri;padding-left:50px"><div style="border-bottom:0.5px solid red"><h1>Health Please Anniversary Offer - Get Upto 10% Cashback!!</h1></div></div> 
	</div>
	<div id="msg" class="">
    	<c:if test="${result != null && result != 'OK' }">
			<div class="alert alert-danger">${result}</div>
		</c:if>
			<c:if test="${result != null && result == 'OK' }"> 
			<div class="alert alert-success">Thank you for recommending your employer for Health Please's Corporate Health packages.
						Our Health Please Convenience team will get in touch with the concerned person shortly.</div>
			 </c:if> 
    </div>
	<div class="row" style="margin:25px;border:">
	<div class="col-md-12 col-sm-12 col-xs-12" style="border:">
	  <ul class="classPoint">
								
								
								<li class="classW12">
					
									 <ol class="classInnerPoint">
										<li style="color:#fff;margin-bottom:25px;margin-top:25px">Get Upto 10% paytm cashback on Booking Home as well as Lab appointments through HealthPlease.in and paying through Paytm payment gateway.
											No Maximum limit to cashback.
											No Limit on the number of times it can be applied.
											Applicable for new as well as old users.
											</li>
										<li style="color:#fff;margin-bottom:25px">10% Cashback is applicable on the below Labs
											PrimeX Health Pathology, Dhanori
											Care First Diagnostics, Baner
											Dhanwantari Path Lab, Vishrantwadi,
											Ankur Diagnostics centre, Kharadi
											</li>				
										<li style="color:#fff;margin-bottom:25px">5% Cashback is applicable on below Labs
										N M Medical, Kalyaninagar,
										N M Medical, Shivajinagar
										DTH Labs, Pimple Saudagar Dr. Agarwal's Pathology, Vimannagar
										</li>
										<li style="color:#fff;margin-bottom:25px">
											Cashback will be credited within 48 Business hours after the customer undergoes all the Tests.
											Offer applicable on the Health Please Website
											Offer Valid till 31st January 2017
											Health Please has the right to discontinue this offer without prior notification.All disputes are subject to Pune Jurisdiction Only.</li>
									</ol>
								</li>
								
								
								

	</div>

    </div>
    </div>
    </div>

 <%@include file="user_footer.jsp" %>  
 
 <script type="text/javascript">
 function onSubmit() {
	 if(validateContact())
		 {
		 return true;
		 }
	 return false;
 }
 
 $("#name").keypress(function (e) {	    
	    var regex = new RegExp("^[a-zA-Z]+$");
	    var key = e.charCode||e.keyCode;
	    
	    var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
	    if (regex.test(str)) {
	    	
	        return true;
	    }
	    else if(key == 8||key == 46|| key == 9||key==37||key==39||key==32||key==190)
	    	return true;
	  
	    else
	    {
	    
	    e.preventDefault();
	    //alert('Please Enter Alphabate');
	    return false;
	    }
	});
 $("#companyName").keypress(function (e) {	    
	    var regex = new RegExp("^[a-zA-Z]+$");
	    var key = e.charCode||e.keyCode;
	    
	    var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
	    if (regex.test(str)) {
	    	
	        return true;
	    }
	    else if(key == 8||key == 46|| key == 9||key==37||key==39||key==32||key==190)
	    	return true;
	  
	    else
	    {
	    
	    e.preventDefault();
	    //alert('Please Enter Alphabate');
	    return false;
	    }
	});
/*  $("#company").keypress(function (e) {	    
	    var regex = new RegExp("^[a-zA-Z0-9]+$");
	    var key = e.charCode||e.keyCode;
	    
	    var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
	    if (regex.test(str)) {
	    	
	        return true;
	    }
	    else if(key == 8||key == 46|| key == 9||key==37||key==39||key==32||key==190)
	    	return true;
	  
	    else
	    {
	    
	    e.preventDefault();
	    //alert('Please Enter Alphabate');
	    return false;
	    }
	}); */
 $("#hr").keypress(function (e) {	    
	    var regex = new RegExp("^[a-zA-Z]+$");
	    var key = e.charCode||e.keyCode;
	    
	    var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
	    if (regex.test(str)) {
	    	
	        return true;
	    }
	    else if(key == 8||key == 46|| key == 9||key==37||key==39||key==32||key==190)
	    	return true;
	  
	    else
	    {
	    
	    e.preventDefault();
	    //alert('Please Enter Alphabate');
	    return false;
	    }
	});
 function validateContact(){
		var no = document.getElementById("contact").value;
		if(isNaN(no))
		{
			document.getElementById("idAppPContactErr").innerHTML="Contact must be a number";
			return false
		}
		if(no[0] ==="0" )
		{
			document.getElementById("idAppPContactErr").innerHTML= "enter valid Phone no.";
			return false;	
		}
		if(no.length!= 10)
		{
			document.getElementById("idAppPContactErr").innerHTML= "enter valid Phone no.";
			return false;	
		}
		document.getElementById("idAppPContactErr").innerHTML= "";
		return true;
	}
 </script> 
   </body>

</html>