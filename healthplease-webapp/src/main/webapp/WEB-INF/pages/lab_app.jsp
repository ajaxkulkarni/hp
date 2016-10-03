<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html lang="en">
<head>
<link rel="icon" type="image/png" sizes="32x32" href="<c:url value="/resources/images/favicon/favicon-32x32.png"/>">
<link rel="icon" type="image/png" sizes="96x96" href="<c:url value="/resources/images/favicon/favicon-96x96.png"/>">
<link rel="icon" type="image/png" sizes="16x16" href="<c:url value="/resources/images/favicon/favicon-16x16.png"/>">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title> Laboratory Information Management System (LIMS) on Cloud | HealthPlease.in</title> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<meta name="keywords" content="LMS, LIS, EMR, LIMS, Medical Software, Pathology Lab Software">
<meta name="description" content="Pathology & Diagnostic LMS to Manage Appointment, Create Test Report, Maintain EMR, Integrate with Lab Instruments & access through App Interface.">
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script> <!-- load jquery via CDN -->
<script src="bootstrap/js/jquery-1.11.2.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="js/jquery-ui.js"></script>
         <!-- Bootstrap Core CSS -->
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="css/jquery-ui.css" rel="stylesheet">
</head>
<body>
<style type="text/css">
/*@import url(http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300,300italic,700);*/
@import url(https://fonts.googleapis.com/css?family=Open+Sans);
@import url(https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,800,700);
        @import 'https://fonts.googleapis.com/css?family=Roboto:300,400,500,700';
.classOSCFont{
  font-family: 'Open Sans', sans-serif;
  font-family: 'Open Sans', sans-serif;
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
	margin-bottom: 20px;
	float: left;
}
.classInnerPoint li{
/*	    background: #414243;*/
    background: #006DAA;
    padding:5px 10px;
    border: 1px solid rgba(255, 255, 255, 0.15);
    box-shadow: -28px 0 0 #14A7DF;
    margin-bottom: 3px;
    margin-left: -15px;
    float: left;
    width: 100%;
    clear: both;
    font-size: 19px;
    color:#fff;
  /*   color: rgba(255, 255, 255, 0.87); */
         font-family: 'Roboto', sans-serif;
    font-weight: 300;
}
.classPtSpan{
	font-size: 18px;
	text-transform: uppercase;
	font-weight: 400;
    font-family: 'Roboto', sans-serif;
    color: rgba(0, 0, 0, 0.87);
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
.classMainContainer{
/*	height: 100VH;*/

    padding: 16px;
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
	/*
Float Form Controls code start
*/

    
    
.form-control{
	color: #fff;
	letter-spacing: 0px;
	word-spacing: 0px;
	font-size: 16px;
}

.float-label-control { position: relative; margin-bottom: 1.5em; }
    .float-label-control ::-webkit-input-placeholder { color: #ddd; }
    .float-label-control :-moz-placeholder { color: #ddd; }
    .float-label-control ::-moz-placeholder { color: #ddd; }
    .float-label-control :-ms-input-placeholder { color: #ddd; }
    .float-label-control input:-webkit-autofill,
    .float-label-control textarea:-webkit-autofill { background-color: transparent !important; -webkit-box-shadow: 0 0 0px 1000px #04568E inset !important; -moz-box-shadow: 0 0 0px 1000px #04568E inset !important; box-shadow: 0 0 0px 1000px #04568E inset !important; }
    input:-webkit-autofill {
    	-webkit-box-shadow: 0 0 0px 1000px #04568E inset !important;
    	-webkit-text-fill-color: #fff !important;
	}
    .float-label-control input, .float-label-control textarea, .float-label-control label { font-size: 16px; box-shadow: none; -webkit-box-shadow: none; }
        .float-label-control input:focus,
        .float-label-control textarea:focus { box-shadow: none; -webkit-box-shadow: none; border-bottom-width: 2px; padding-bottom: 0; }
        .float-label-control textarea:focus { padding-bottom: 4px; }
    .float-label-control input, .float-label-control textarea { display: block; width: 100%; padding: 0.1em 0em 1px 0em; border: none; border-radius: 0px; border-bottom: 1px solid #aaa; outline: none; margin: 0px; background: none; }
    .float-label-control textarea { padding: 0.1em 0em 5px 0em; }
    .float-label-control label { position: absolute; font-weight: normal; top: -1.0em; left: 0.08em; color: #ddd; z-index: -1; font-size: 0.85em; -moz-animation: float-labels 300ms none ease-out; -webkit-animation: float-labels 300ms none ease-out; -o-animation: float-labels 300ms none ease-out; -ms-animation: float-labels 300ms none ease-out; -khtml-animation: float-labels 300ms none ease-out; animation: float-labels 300ms none ease-out; /* There is a bug sometimes pausing the animation. This avoids that.*/ animation-play-state: running !important; -webkit-animation-play-state: running !important; }
    .float-label-control input.empty + label,
    .float-label-control textarea.empty + label { top: 0.1em; font-size: 1.5em; animation: none; -webkit-animation: none; }
    .float-label-control input:not(.empty) + label,
    .float-label-control textarea:not(.empty) + label { z-index: 1; }
    .float-label-control input:not(.empty):focus + label,
    .float-label-control textarea:not(.empty):focus + label { color: #ddd; }
    .float-label-control.label-bottom label { -moz-animation: float-labels-bottom 300ms none ease-out; -webkit-animation: float-labels-bottom 300ms none ease-out; -o-animation: float-labels-bottom 300ms none ease-out; -ms-animation: float-labels-bottom 300ms none ease-out; -khtml-animation: float-labels-bottom 300ms none ease-out; animation: float-labels-bottom 300ms none ease-out; }
    .float-label-control.label-bottom input:not(.empty) + label,
    .float-label-control.label-bottom textarea:not(.empty) + label { top: 3em; }


@keyframes float-labels {
    0% { opacity: 1; color: #aaa; top: 0.1em; font-size: 1.5em; }
    20% { font-size: 1.5em; opacity: 0; }
    30% { top: 0.1em; }
    50% { opacity: 0; font-size: 0.85em; }
    100% { top: -1em; opacity: 1; }
}

@-webkit-keyframes float-labels {
    0% { opacity: 1; color: #aaa; top: 0.1em; font-size: 1.5em; }
    20% { font-size: 1.5em; opacity: 0; }
    30% { top: 0.1em; }
    50% { opacity: 0; font-size: 0.85em; }
    100% { top: -1em; opacity: 1; }
}

@keyframes float-labels-bottom {
    0% { opacity: 1; color: #aaa; top: 0.1em; font-size: 1.5em; }
    20% { font-size: 1.5em; opacity: 0; }
    30% { top: 0.1em; }
    50% { opacity: 0; font-size: 0.85em; }
    100% { top: 3em; opacity: 1; }
}

@-webkit-keyframes float-labels-bottom {
    0% { opacity: 1; color: #aaa; top: 0.1em; font-size: 1.5em; }
    20% { font-size: 1.5em; opacity: 0; }
    30% { top: 0.1em; }
    50% { opacity: 0; font-size: 0.85em; }
    100% { top: 3em; opacity: 1; }
}


/* Float Form Controls Code end*/
.classLPageFormHolder{
	border-color: #14A7DF;
	    margin-top:32px;
    box-shadow: 0 5px 10px 5px rgba(0, 0, 0, 0.26);
    position:
    width: 360px;
    border-radius: 10px;
}
.modal-header{
	    background-color: #FFF;
    color: #00538B;
    text-align: center;
       border-radius: 10px;
}
.modal-body{
	background: #04568E;
	color: #fff;
}
.modal-footer{
	    background: #fff;
    border-bottom: 2px solid #00528B;
       border-radius: 10px;
}
body{
	position: relative;
	background-color: #555;
	    background-size: cover;
	     background-repeat: no-repeat;
    background-attachment: fixed;
    background-position: 0 -100px;
    font-family: 'Open Sans', sans-serif;
        font-size: 18px;
    letter-spacing: 0px;
    font-weight: 400;
    color: #fff;
    /*text-shadow: 0 1px 1px rgba(0, 0, 0, 0.25)*/
}
.classColorBg{
	background: #555;
	position: fixed;
	bottom: 0;
	top: 0;
	right: 0;
	left: 0;
}
.classHeader{
	    font-size: 40px;
    font-weight: 500;
    margin: 0;
    letter-spacing: 0px;
    color: rgba(0, 0, 0, 0.87);
}
.classW12{
	width: 95%;
}
.classCTAHolder{
	position: fixed;
	padding: 5px 0;
	width: 100%;
	background: #fff;
	box-shadow: 0 0 2px #000;
	z-index: 9;
}

.classMColor2{
	color: #00538B;
}
.classTopLine{
	    font-size: 20px;
    font-weight: 500;
    text-transform: uppercase;
}

.classCapitalize 
{
    text-transform:capitalize;
}
@media screen and (max-width: 800px) {
	body{background:#555;}
	.classLPageFormHolder{
		margin-top: 30px;
		position: relative !important;
		width: 100% !important;
	}
	.class10TVH{
		margin-top: 95px;
	}
	.classMainContainer{
		background-color: none;
		background: none;
	}
	.classPoint li{
		display: block;
		width: 100%;
	}
	.classHeader{
		font-size: 24px;
		text-transform: uppercase;
	}
	.classInnerPoint li{
		font-size: 14px;
		margin-left: -30px;
		box-shadow: -10px 0 0 #14A7DF;
		font-weight: normal;
	}
	.classPtSpan{
		font-weight: 300;
	}
	.classTopLine{
		font-size: 16px;
	}
}
</style>



<style>
       @import 'https://fonts.googleapis.com/css?family=Roboto:300,400,500,700';
    
    #tp_line{
        font-family: 'Roboto', sans-serif;
        text-transform: uppercase;
        font-size: 18px;
        text-align: center;
    }
        #classHeader1{
            color: rgba(0, 0, 0, 0.87);
        text-transform: uppercase;
        font-size: 24px;
        font-family: 'Roboto', sans-serif;
        border-bottom:1px solid rgba(199, 148, 55, 0.87);
        font-weight: 400;
            margin-top: 30px;
            font-weight: 300;
    }
    
         .first_letter1{
        font-size: 32px;
    }
    
    .class_para1{
    font-size: 18px;
	font-weight: 400;
    font-family: 'Roboto', sans-serif;
    color: rgba(0, 0, 0, 0.87);
    }
    
    
.lab_app_footer_btn {
    background-color: #03a9f4;
    border-radius: 2px;
    box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
    color: #fff;
    transition: all 0.5s ease 0s;
    display: block;
        margin: auto;
        font-size: 16px;
        padding: 8px;
                font-family: 'Roboto', sans-serif;
}
.lab_app_footer_btn:hover {
    background-color: #0288d1;
    box-shadow: 0 2px 3px 0 rgba(0, 0, 0, 0.16), 0 2px 5px 0 rgba(0, 0, 0, 0.12);
    color: #fff;
    transition: all 0.5s ease 0s;
}
    
    #frm_label{
        font-family: 'Roboto', sans-serif;
        color: rgba(0, 0, 0, 0.87);
        font-weight: 400;
        font-size: 16px;
        margin: 8px auto;
    }
    </style>


        <style>
              @import 'https://fonts.googleapis.com/css?family=Roboto:300,400,500,700';
        #corp_form{
      	-webkit-box-shadow: 2px 10px 10px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
        -moz-box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
        box-shadow: 0px 5px 5px 5px rgba(0, 0, 0, 0.16); 
       /*  border:1px solid black; */
    border-radius: 10px;
}
            
              #corp_form_head_div{
        background-color: #a4dbf4;
        border-bottom: 2px solid rgba(199, 148, 55, 0.87);
        border-top-left-radius: 10px;
         border-top-right-radius: 10px;
    }
            
               #corp_form_heading{
        margin: 8px auto;
        font-size: 16px;
        text-transform: uppercase;
        color: rgba(255, 255, 255, 0.87);
         font-family: 'Roboto', sans-serif;
        font-weight: 300;
        text-align: center;
    }
            
              .first_letter{
        font-size: 20px;
        font-family: 'Roboto', sans-serif;
        font-weight: 400;
            
    }
            
              .corp_form_label{
        color: rgba(0, 0, 0, 0.87);  
        padding: 8px 0px;
        font-size: 16px;
        font-family: 'Roboto', sans-serif;
        font-weight: 400;
    }
             .form-control{
         font-family: 'Roboto', sans-serif;
        font-size: 16px;
        font-weight: 300;
                 color: rgba(0, 0, 0, 0.76);
    }
            
                #corp_form_footer_div{
        border-bottom-left-radius: 10px;
         border-bottom-right-radius: 10px;
    }
    
    .corp_footer_btn {
    background-color: #03a9f4;
    border-radius: 2px;
    box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
    color: #fff;
    transition: all 0.5s ease 0s;
    display: block;
        margin:4px  auto;
        font-size: 16px;
        padding: 8px 16px;
                font-family: 'Roboto', sans-serif;
        width: 100px;
}
.corp_footer_btn:hover {
    background-color: #0288d1;
    box-shadow: 0 2px 3px 0 rgba(0, 0, 0, 0.16), 0 2px 5px 0 rgba(0, 0, 0, 0.12);
    color: #fff;
    transition: all 0.5s ease 0s;
}  
</style>
<%@include file="user_header.jsp" %>

		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 classMColor2 classTopLine"style="background-color:#14A7DF;">
            <h4 id="tp_line">To request a demo or free 1 month trial, please enter your details in the below form. <i class="fa fa-hand-o-down" aria-hidden="true"></i></h4>
		</div>
		
		<div class="container">
		<div class="classMainContainer">
		<div id="msg" class="" style="margin-top:35px">
    	<c:if test="${result != null && result != 'OK' }">
			<div class="alert alert-danger">${result}</div>
		</c:if>
			<c:if test="${result != null && result == 'OK' }"> 
			<div class="alert alert-success">Thank you for choosing healthplease.
						Our Health Please Convenience team will get in touch with the concerned person shortly.</div>
			 </c:if> 
         </div>
			<div class="row">
                <div class="col-xs-12">
                  <label class="" id="classHeader1"><span class="first_letter1">P</span>athology & <span class="first_letter1">D</span>iagnostics <span class="first_letter1">L</span>ab management software on <span class="first_letter1">C</span>loud</label>
							<br/>
                </div>
							<div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 col-xl-8 classWColor">
                              
							<h3 class="" style="color:#000">
								<p>HealthPlease.in is proud to introduce a Cloud Based App for </br>Labs that helps them manage their In Centre and Home Visit</br> appointments, Test Reporting and Finances more efficiently</br> and conveniently.</p>
							</h3>
							<ul class="classPoint">
								<li class="classW12">
									<span class="classPtSpan"><i class="fa fa-circle" aria-hidden="true"></i> Online Presence</span>
									<ol class="classInnerPoint">
										<li>Get Appointments through www.HealthPlease.in website and Health Please mobile App.</li>
									</ol>
								</li>
								<li class="classW12">
									<span class="classPtSpan"><i class="fa fa-calendar-check-o" aria-hidden="true"></i> Track Appointments</span>
 									<ol class="classInnerPoint">
										<li>Easy User Interface to Track and Manage your In centre and Home visits appointments </li>
										<li>Get instant information of Today's, Pending, Completed, Cancelled and Total Appointments</li>
										<li>Make any appointment slot active or inactive as per availability of Lab Technician</li>
									</ol>
								</li>
								<li class="classW12">
									<span class="classPtSpan"><i class="fa fa-bar-chart" aria-hidden="true"></i> Statistics & Financials</span>
									 <ol class="classInnerPoint">
										<li>Bar graph to indicate Daily, Weekly, Monthly & Yearly trends.</li>
										<li>Pie Chart - To study comparison between
											<ol class="classInnerPoint">
												<li>Pending & Completed Tests.</li>
												<li>Packages vs Individual test vs Radiology Test.</li>
												<li> Online Payment vs Cash on Collection.</li>
											</ol>
										</li>
										<li>Custom Pie Chart & Bar graph.</li>
										<li>Daily, Weekly, Monthly and FY reports in excel format.</li>
									</ol>
								</li>
								<li class="classW12">
									<span class="classPtSpan"><i class="fa fa-flask" aria-hidden="true"></i> Test Values</span>
									 <ol class="classInnerPoint">
										<li>Connect your Lab machines to our Software and get test parameters automatically</li>
										<li>Else enter test values directly into the software</li>
									 </ol>
								</li>
								<li class="classW12">
								 <span class="classPtSpan"><i class="fa fa-files-o" aria-hidden="true"></i> Test Report & Invoices</span>
								 <ol class="classInnerPoint">
								<li>Ready to send Test reports with Inbuilt Header & Footer for Labs</li>
								<li>Provision to email reports directly to Patient in just one click</li>
								<li>Lab specific invoices to be generated with Header and footer</li>
								 </ol>
								</li>
								<li class="classW12">
								<span class="classPtSpan"><i class="fa fa-android" aria-hidden="true"></i> App  Interface</span>
								 <ol class="classInnerPoint">
								<li>Access, Track and manage all Lab activities through Mobile App.</li>
								 </ol>
								</li>
								<li class="classW12">
								 <span class="classPtSpan"><i class="fa fa-users" aria-hidden="true"></i> User Database</span>
								 <ol class="classInnerPoint">
								<li>Anytime access to historic Patient's details & their reports.</li>
								</ol>
								</li>
								</ul>


						</div>
					
						
						
						
	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 col-xl-4">
			<div class="classLPageFormHolder">
	        <form name="regForm" id="idRegForm" method="POST" action="<%=Constants.REQUEST_LAB_PARTNER_POST_URL %>">
		       
		        <div class="panel panel-default" id="corp_form">
		       <div class="panel-heading" style="height:50px;background-color:#a4dbf4">
                <h2 class="text-center panel-title" style="padding-top:2%;font-size:20px">Demo Or Free 1 Month Trial</h2></div>
                
                
               <div class="classGoldenDivider"></div>
		       <div class="panel-body" style="background-color:#fff">
                 <div class="row">
                    <div class="col-lg-10 col-lg-push-1 col-md-10 col-md-push-1 col-sm-10 col-sm-push-1 col-xs-12" style="border: ">  
		       
		        
		        	
	                
	                    <label for="name">Name</label>
	                    <input type="text" style="color:#000"id="idName" name="name" class="classCapitalize form-control" placeholder="Name" required />
	                    <label for="lName"style="margin-top:10px">Lab Name</label>
	                    <input type="text" style="color:#000"id="idLName" name="labName" class="classCapitalize form-control" placeholder="Lab Name" required />
	               
	                    <label for="userEmail"style="margin-top:10px">Email</label>
	                    <input type="email" style="color:#000"id="idEmail" name="email" class="form-control" placeholder="Email" required />
	               
	                    <label for="userMobile"style="margin-top:10px">Mobile No</label>
	                    <input type="tel" id="idMobile" style="color:#000"name="phone" onkeyup="check(); return false;"  class="form-control" placeholder="Mobile No" required />
	               
	               
	        	</div>
	        	 </div>
	        	</div>
            
            <div class="classGoldenDivider"></div>  
		              <div class="panel-footer" id="corp_form_footer_div">
            <div class="row" style="padding-left:25px">
                 <div class="col-md-12 col-xs-12">
                     <label class="pull-left" id="frm_label">All fields are mandatory</label>
                </div>
            <div class="col-md-6 col-xs-12">
                    <button type="submit" class="btn corp_footer_btn" id="idSubmit">Submit</button>
                </div>
                <div class="col-md-6 col-xs-12">
                    <button type="reset" class="btn corp_footer_btn">Cancel</button>
                </div>
                 	<div class="classMsg" id="idMsg"></div>
            </div>
                
        </div>
                </div>
	        </form>
		</div>
	</div>
						
			</div>
		
		   </div>
		   </div>

		<%@include file="user_footer.jsp" %>
</body>
</html>