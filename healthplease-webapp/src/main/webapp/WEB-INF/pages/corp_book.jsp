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
          <title>Corporate Partners | HealthPlease.in</title>
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
#corp_form{
      	-webkit-box-shadow: 2px 10px 10px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
        -moz-box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
        box-shadow: 4 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12); 
        border:none;
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
.partButton{
color:#03A9F4;
height:50px;
width:250px;
background-color:#fff;
border:none;
box-shadow:0px 2px 5px #999;

}
.partButton:hover{
background-color:#fff;
box-shadow:1px 5px 5px #999;
}
.classMainContainer{
	height: 100VH;
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
	.classLoaderLogo{
		width: 100%;
    margin-top: -80px;
    margin-bottom: 60px;
    z-index: 0;
    position: relative;
	}
	.classLoaderImg{

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
		 <div class="col-md-6 col-sm-6" style="color:#222;font-family:calibri;padding-left:50px"><div style="border-bottom:0.5px solid red"><h1>Corporate Partner</h1></div></div> 
		  <div class="col-md-4 col-md-offset-2 col-sm-4 col-sm-offset-2" style="border:">
		 	   <!-- <button class="btn btn-primary" type="submit" >Book Corporate Package</button> -->
		 	   <a href="Corporate" style="height:50px;margin-top:15px" class="btn btn-large btn-primary partButton"><h4 class="" >Book Corporate Package</h4></a>
		  </div>
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
	<div class="row" style="margin:25px">
	<div class="col-md-8 col-sm-6 col-xs-12" style="border:">
	<h3 class="" style="color:#222;font-family:calibri;font-size:28px">We at Heath Please, believe in bringing convenient Healthcare so you never have to
choose between Health and Work. </h3>
	  <ul class="classPoint">
								
								
								<li class="classW12">
					
									 <ol class="classInnerPoint">
										<li style="color:#fff;margin-bottom:25px;margin-top:25px">Access to specially designed Preventive Healthcare Packages for Corporates
employees and their family members</li>
										<li style="color:#fff;margin-bottom:25px">Intuitive website with all the details of tests and packages available at your fingertips.</li>				
										<li style="color:#fff;margin-bottom:25px">Avail discounts of upto 46% or Rs.6500 on Pathology & Diagnostic Test Packages from trusted Labs in your neighborhood. </li>
										<li style="color:#fff;margin-bottom:25px">Pathology Samples may be collected from your office at time of your convenience.</li>
									</ol>
								</li>
								
								
								<h3 class="" style="color:#222;font-family:calibri;font-size:28px">Simply provide us the details of the concerned person in your organization and Health
Please's team will get in touch with him/her. </h3>

	</div>
	<div class="col-md-4 col-sm-6 col-xs-12" style="border:">
         <form action="<%=Constants.REQUEST_CORPORATE_PARTNER_POST_URL%>" method="post">   
         <div class="panel panel-default" id="corp_form"> 
            <div class="panel-heading" style="height:50px;background-color:#a4dbf4">
                <h2 class="text-center panel-title" style="padding-top:2%;font-size:20px">Become Our Corporate Partner</h2></div>
                 <div class="classGoldenDivider"></div>
            <div class="panel-body" style="background-color:#fff">
                <div class="row">
                    <div class="col-lg-10 col-lg-push-1 col-md-10 col-md-push-1 col-sm-10 col-sm-push-1 col-xs-12" style="border: ">
                            <label for="name">Name of Requester</label>
                            <input class="form-control" name="name" id="name" type="text" required ="required" placeholder="Name" >
                             <label style="margin-top:10px">Contact No.</label>
                            <input class="form-control" name="phone" id="contact" required ="required" type="text" placeholder="Requestor's Mobile" pattern="[0-9]{10}">
                            <div id="idAppPContactErr"></div>
                            <label for="name" style="margin-top:10px">Company Name</label>
                            <input class="form-control" name="companyName" id="company" type="text" required ="required" placeholder="Company">
                            <label for="name" style="margin-top:10px">Name of HR/Admin</label>
                            <input class="form-control" name="adminName" id="hr" type="text" required ="required" placeholder="HR/Admin" >
                            <label style="margin-top:10px">Email of HR/Admin</label>
                            <input class="form-control" name="email" id="email" type="email" required ="required" placeholder="Email">
                            
                            <label style="margin-top:10px">Corporate's Location</label>
                             <input class="form-control" name="location" id="location" type="text" placeholder="Location" required ="required">
                           
                        
                    </div>
                </div>
        
            </div>
                  <div class="classGoldenDivider"></div>  
            <div class="panel-footer">
            <div class="row">
            <div class="col-xs-6">
                <button class="btn btn-primary" type="submit" style="margin-left:20%;height:35px;width:105px">Request</button>
            </div>
             <div class="col-xs-6">
                <button class="btn btn-primary" type="reset" style="margin-left:10%;height:35px;width:105px">Cancel</button>
            </div>
            </div>
        </div>
        </form>
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