<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
	    <title>Pathology Lab Management Software on Cloud | HealthPlease.in</title>
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
	    <meta name="keywords" content="Cloud Based Diagnostic Lab Management Software ">
    <meta name="description" content="HealthPlease.inâs Cloud Based Lab Management software helps conveniently track Appointments, Create and Send Test Reports and manage Finances.">
	    <link rel="icon" type="image/png" sizes="32x32" href="images/favicon/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="96x96" href="images/favicon/favicon-96x96.png">
<link rel="icon" type="image/png" sizes="16x16" href="images/favicon/favicon-16x16.png">
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
    font-size: 16px;
    color: rgba(255, 255, 255, 0.87);
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


<script type="text/javascript">
	$(document).ready(function(){
		$('#loadDiv').delay(3000).fadeOut(400);
	});
	
</script>
<script type="text/javascript">
    $(document).ready(function(){
	    $('#idRegForm').submit(function(ev){
	    	var frm = $(this);	    	
	          $("#idSubmit").val("Sending..")
	          $("#idSubmit").html("<i class='fa fa-spinner fa-spin' aria-hidden='true' ></i> Sending....");
	    	  $.ajax({
	            type: frm.attr('method'),
	            url: frm.attr('action'),
	            data: frm.serialize(),
	            success: function (data) {
	                $("#idSubmit").html("<i class='fa fa-spinner fa-spin' aria-hidden='true' ></i> Sending....");
	                //alert("Thank You!"); 
	                console.log(data);
	            	$(".modal-body").html("<span class='classAfterFormSubmit'>"+data+"</span>");
	            	$(".modal-footer").hide();
	            }
	        });
	    	  $("#idSubmit").val("Submit")
	    	  $("#idSubmit").html("Submit");
	        // stop the form from submitting the normal way and refreshing the page        
	        ev.preventDefault();
	    });
	});
</script>
		<script type="text/javascript">
			/* Float Label Pattern Plugin for Bootstrap 3.1.0 by Travis Wilson
**************************************************/

(function ($) {
    $.fn.floatLabels = function (options) {

        // Settings
        var self = this;
        var settings = $.extend({}, options);


        // Event Handlers
        function registerEventHandlers() {
            self.on('input keyup change', 'input, textarea', function () {
                actions.swapLabels(this);
            });
        }


        // Actions
        var actions = {
            initialize: function() {
                self.each(function () {
                    var $this = $(this);
                    var $label = $this.children('label');
                    var $field = $this.find('input,textarea').first();

                    if ($this.children().first().is('label')) {
                        $this.children().first().remove();
                        $this.append($label);
                    }

                    var placeholderText = ($field.attr('placeholder') && $field.attr('placeholder') != $label.text()) ? $field.attr('placeholder') : $label.text();

                    $label.data('placeholder-text', placeholderText);
                    $label.data('original-text', $label.text());

                    if ($field.val() == '') {
                        $field.addClass('empty')
                    }
                });
            },
            swapLabels: function (field) {
                var $field = $(field);
                var $label = $(field).siblings('label').first();
                var isEmpty = Boolean($field.val());

                if (isEmpty) {
                    $field.removeClass('empty');
                    $label.text($label.data('original-text'));
                }
                else {
                    $field.addClass('empty');
                    $label.text($label.data('placeholder-text'));
                }
            }
        }


        // Initialization
        function init() {
            registerEventHandlers();

            actions.initialize();
            self.each(function () {
                actions.swapLabels($(this).find('input,textarea').first());
            });
        }
        init();


        return this;
    };

    $(function () {
        $('.float-label-control').floatLabels();
    });
})(jQuery);
		</script>

<script type="text/javascript">
$(".bg").interactive_bg({
   strength: 25,
   scale: 1.05,
   animationSpeed: "100ms",
   contain: true,
   wrapContent: false
 });
</script>


<script type="text/javascript">
$('#classCallCTA').click(function() {
     $('#idName').focus();
});
      </script>

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
        color: rgba(0, 0, 0, 0.87);  
        font-family: 'Roboto', sans-serif;
        margin: 16px auto;
        font-weight: 400;
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



<%@include file="user_header.jsp" %>

		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 classMColor2 classTopLine"style="background-color:#14A7DF;">
            <h4 id="tp_line">To request a demo or free 1 month trial, please enter your details in the below form. <i class="fa fa-hand-o-down" aria-hidden="true"></i></h4>
		</div>
		
		<div class="container">
		<div class="classMainContainer">
		<div id="msg" class="">
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
                              
							<p class="class_para1">
								HealthPlease.in is proud to introduce a Cloud Based App for Labs that helps them manage their In Centre and Home Visit appointments, Test Reporting and Finances more efficiently and conveniently.
							</p>
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
		        <div class="modal-header classMBg2" >
		          <h4 class="classFTitle">Demo or Free 1 month trial</h4>
		        </div>
		        <div class="modal-body" style="color:#fff">
		        	
	                <div class="form-group float-label-control"style="color:#fff">
	                    <label for="name">Name</label>
	                    <input type="text" style="color:#fff"id="idName" name="name" class="classCapitalize form-control" placeholder="Name" required />
	                </div>
	                <div class="form-group float-label-control">
	                    <label for="lName">Lab Name</label>
	                    <input type="text" style="color:#fff"id="idLName" name="labName" class="classCapitalize form-control" placeholder="Lab Name" required />
	                </div>
	                <div class="form-group float-label-control">
	                    <label for="userEmail">Email</label>
	                    <input type="email" style="color:#fff"id="idEmail" name="email" class="form-control" placeholder="Email" required />
	                </div>
	                <!-- <input type="hidden" name="sEmail" id="idSEmail" value="userEmail" style="display:none;"/> -->
	                <div class="form-group float-label-control">
	                    <label for="userMobile">Mobile No</label>
	                    <input type="tel" id="idMobile" style="color:#fff"name="phone" onkeyup="check(); return false;"  class="form-control" placeholder="Mobile No" required />
	                </div>
	                <!-- <input type="hidden" name="sMobile" style="color:#fff"id="idSMobile" value="userMobile" style="display:none;"/> -->
	        	</div>
		        <div class="modal-footer">
		        	<label class="pull-left" id="frm_label">All fields are mandatory</label>
<!--		          <button type="submit"  class="btn btn-default classMBg2 classCTSSubmit " >Submit</button>-->
                                       <button type="submit" id="idSubmit" class="btn lab_app_footer_btn">Submit</button>
		          	<div class="classMsg" id="idMsg"></div>
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