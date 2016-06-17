<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>




<html lang="en">
<head>
	
    <title>About Us</title>

<!-- Latest compiled and minified CSS -->
   <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
	<link href='https://fonts.googleapis.com/css?family=Roboto:400,300,700,500' rel='stylesheet' type='text/css'>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <!--    Star rating css-->
    <link rel="stylesheet" href="<c:url value = "/resources/css/star-rating.min.css"/>" media="all" rel="stylesheet" type="text/css" />
    
    <!-- drawer css -->
    <link rel="stylesheet" href="<c:url value = "/resources/dist/css/drawer.min.css"/>">
    
    <!--    Custom css-->
    <link rel="stylesheet" href="<c:url value = "/resources/css/style.css"/>">
    

	<!-- Start WOWSlider.com HEAD section --> <!-- add to the <head> of your page -->
	<link rel="stylesheet" type="text/css" href="<c:url value = "/resources/engine0/style.css"/>" />
	<!--script type="text/javascript" src="engine0/jquery.js"></script-->
	<!-- End WOWSlider.com HEAD section --></head>


    <link rel="stylesheet" type="text/css" href="css/internal/angular.css">        
    <link rel="stylesheet" type="text/css" href="css/external/file_input/fileinput.css">        


<!-- Google Code for Appointment Conversion Conversion Page -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 937994185;
var google_conversion_language = "en";
var google_conversion_format = "3";
var google_conversion_color = "ffffff";
var google_conversion_label = "dEQCCKL2_2AQyc-ivwM";
var google_conversion_value = 150.00;
var google_conversion_currency = "INR";
var google_remarketing_only = false;
/* ]]> */
</script>
<script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="//www.googleadservices.com/pagead/conversion/937994185/?value=150.00&amp;currency_code=INR&amp;label=dEQCCKL2_2AQyc-ivwM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>

<!-- Vertical tab code start-->
<script type="text/javascript">
$(document).ready(function() {
    $("div.bhoechie-tab-menu>div.list-group>a").click(function(e) {
        e.preventDefault();
        $(this).siblings('a.active').removeClass("active");
        $(this).addClass("active");
        var index = $(this).index();
        $("div.bhoechie-tab>div.bhoechie-tab-content").removeClass("active");
        $("div.bhoechie-tab>div.bhoechie-tab-content").eq(index).addClass("active");
    });
});
</script>
<!-- Vertical tab code end
       <div class="classTopHeading" style="margin-top:15px;">
        <div class="container">-->
<!-- http://localhost:8080/healthplease-hp3/confirmAppointment.html?testName=95&locName=8&appDate=04/01/2016&appTime=2&dbdate=2016-01-04&lab=1# -->
<!-- http://localhost:8080/healthplease-hp3/confirm-appointment-details.html?appid=139 -->
            
                <!--<div class="alert alert-success"><strong>!Your Appointment is Booked with us.</strong></div>
                <div class="alert alert-info"><strong>!Confirmation Mail will send you shortly.</strong></div>-->
                </head>
<body>

 <div id="wrapper">
        <div style="background:#A4DBF4;">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 col-xs-12 col-md-12 col-lg-12 col-xl-12">
                        <!-- Navigation -->
                        <nav class="navbar navbar-default navbar-static-top classCustomNavBar" role="navigation" style="margin-bottom: 0">
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                                    <span class="sr-only">Toggle navigation</span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                                <a class="navbar-brand" href="http://www.healthplease.in/"><img src="<c:url value="/resources/images/LOGO-2.png"/>" class="classLogoImg"/></a>
                            </div>
                                                        <!-- /.navbar-header -->
                            <div class="collapse navbar-collapse" id="example-navbar-collapse">
                                <ul class="nav navbar-top-links navbar-right">
                                    <li class="dropdown">
                                        <a class="dropdown-toggle"  href=>
                                            <i class="fa fa-home fa-fw"></i> Home
                                        </a>                    <!-- /.dropdown-messages -->
                                    </li>
                                    <li class="dropdown">
                                        <a class="dropdown-toggle"  href="about.html">
                                            <i class="fa fa-life-ring fa-fw"></i> About Us
                                        </a>                    <!-- /.dropdown-messages -->
                                    </li>
                                    <li class="dropdown">
                                        <a class="dropdown-toggle"  href="support.html">
                                            <i class="fa fa-cogs fa-fw"></i> Support
                                        </a>                    <!-- /.dropdown-messages -->
                                    </li>
                                    <li class="dropdown">
                                        <a class="dropdown-toggle"  href="pricing.html">
                                           <i class="fa fa-inr fa-fw"></i> Pricing
                                        </a>                    <!-- /.dropdown-messages -->
                                    </li>
                                    <li class="dropdown">
                                        <a class="dropdown-toggle"  href="faqs.html">
                                           <i class="fa fa-question fa-fw"></i> FAQs
                                        </a>                    <!-- /.dropdown-messages -->
                                    </li>
                                                                        <!-- /.dropdown -->
                                    
                                    <!-- /.dropdown -->
                                    
                                        <li> <a  href="sign-up.html" ><i class="fa fa-user fa-fw"></i> Sign Up </a> </li>                                        
                                     <li class="dropdown">
                                                                               
                                            <a  href="#idLoginModal" class="dropdown-toggle" data-toggle="modal"  data-keyboard="false" data-backdrop="false" data-target="#idLoginModal" ><i class="fa fa-sign-in fa-fw"></i> Login </a>
                                                                                
                                        
                                        <!-- /.dropdown-user -->
                                    </li>
                                     
                                    <!-- /.dropdown -->
                                </ul>
                            </div>
                            <!-- /.navbar-top-links -->

                            
                            <!-- /.navbar-static-side -->
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    
        <div class="classGoldenDivider"></div>
<br/>
 <div class="classTopHeading" style="margin-top:15px;">
        <div class="container">
				<div class="row">
                    <div class="well col-xs-12 col-sm-12 col-md-7 col-lg-7 col-xl-7">
                        <div class="row">
                            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 col-xl-6">
                                <address>
                       
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9 col-xl-9">
                                 
                                        </div>
                                    </div>
                                    <abbr title="Phone">C:</abbr> 
                                </address>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6 text-right">
                                <p>
                                    <span><span style="color:#aaa;">Appointment Id #:</span> ></span>
                                </p>
                                <p>
                                    <span><span style="color:#aaa;">Date: </span></span><br/>
                                    <span><span style="color:#aaa;">Time: </span>
                                
                                    </span>
                                </p>
                                
                            </div>
                        </div>
                        <div class="row">
                            <div class="text-center">
                                <h1>Receipt</h1>
                            </div>
                            </span>
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>
                                            Test 
                                            &nbsp;[Lab:]
                                        </th>
                                        <!-- <th>#</th>
                                        <th class="text-center">Price</th> -->
                                        <th class="text-center">Total</th>
                                    </tr>
                                </thead>
                                <tbody>
               
                                    <tr>
                                          
                                        <td class="col-md-1"></td>
                                        <td class="col-md-9"><em></em></h4></td>
                                        <td class="col-md-2 text-center"><i class="fa fa-inr"></i></td>
                                       
                                    </tr>
                   
                                     <tr>
                                        <td></td>
                                        <td class="text-right">
                                            <p>
                                                <strong>Subtotal: </strong>
                                            </p>
                                            <p>
                                                <strong>Home Visit Charge: </strong>
                                            </p>
                                        </td>
                                        <td class="text-center">
                                            <p>
                                                <strong><i class="fa fa-inr"></i></strong>
                                            </p>
                                            <p>
                                                <strong><i class="fa fa-inr"></i></strong>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="background-color:#eee;"></td>
                                        <td class="text-right" style="background-color:#eee;"><h4><strong>Total: </strong></h4></td>
                                        <td class="text-center text-danger" style="background-color:#ddd;"><h4><strong><i class="fa fa-inr"></i> </strong></h4></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
           
                    <div class=" col-xs-12 col-sm-12 col-md-5 col-lg-5 col-xl-5">

                        <div class="row">
                            <div class="alert alert-success " style="margin-left: 10px;"><strong>Congratulations, Your Appointment is booked! Our convenience team will reach on the requested date.</strong></div>
                            <div class="col-md-12 alert alert-info " style="margin-left: 10px;margin-top:100px;">
                                At Healthplease your convenience is our priority. We will not only make sure that you get the services right but we will provide them with great comfort.<br/>
                                <br/>
                                We wish you a happy time here at Healthplease! In case you need help feel free to write us at <a href="mailto:help@healthplease.in">help@healthplease.in</a> or <a href="javascript:void(0);">Request a call back.</a><br/> We will be glad to help you.
                            </div>
                        </div>

                    </div>
                </div>

                

            </div>
                
    </div>
        <div id="page-wrappera" class="container">
            
            <!-- /.row -->
            <div class="row">
                <div class=" col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
                    <div class="classHighLightBox">
                        
                    </div>
                </div>
            </div>
              <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 col-xl-4">
                    <h3 class="page-header classHeaderText">We Are In Support</h3>
                    <div class="classSFormHolder">
                        <img src="images/1.jpg" width="100%"/>
                        <div class="classSupportForm">
                            <div class="classLabDetailWrapper">
                                <div class="classLabName"> Dhanwantary Path Lab </div>
                                <div class="classLabDetails">
                                    Dr. S.S Jagalpure  M.D. (Path) <br/>
                                    Geeta Complex Kasturaba Hgs Soc, Shop no-3, Behind Jakat Naka, Vishrantwadi Pune - 411015                               
                                </div>
                            </div>             

                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 col-xl-4">
                    <h3 class="page-header classHeaderText">Importance Of Check Ups</h3>
                    <a href="#"><img src="images/2.jpg" width="100%"/></a>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 col-xl-4">
                    <h3 class="page-header classHeaderText">Ask your Query</h3>
                    
                    <div class="classSFormHolder">
                        <img src="images/3.jpg" width="100%"/>
                        <div class="classSupportForm">
                            <form id="request_from_index" class="classSupportPanal" action="" method="GET">
                              
                              <div class="form-group"> 
                               <div class="input-group">           
                                    <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                    <input type="text" class="form-control" id="name" name="name" placeholder="Full name*" required minlength="3">
                                    <label for="name" style="float: right; margin-top: 3px; margin-right: -10px;"></label>
                               </div> 
                              </div>

                              <div class="form-group"> 
                               <div class="input-group">           
                                    <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                                       <input type="email" class="form-control" id="email" name="email" placeholder="Your Email*" required>           
                                       <label for="email" style="float: right; margin-top: 3px; margin-right: -10px;"></label>
                               </div> 
                              </div>

                              <div class="form-group"> 
                               <div class="input-group">           
                                    <span class="input-group-addon"><i class="fa fa-phone"></i></span>
                                       <input type="text" class="form-control numeric" id="contact" name="contact" placeholder="Your Contact no.*" minlength=10 maxlength=10 required>           
                                       <label for="contact" style="float: right; margin-top: 3px; margin-right: -10px;"></label>
                               </div> 
                              </div>

                              <div class="form-group"> 
                               <div class="input-group">           
                                    <span class="input-group-addon"><i class="fa fa-pagelines"></i></span>
                                       <input type="text" class="form-control numeric" id="age" name="age" placeholder="Your Age*" minlength="2" required>           
                                       <label for="age" style="float: right; margin-top: 3px; margin-right: -10px;"></label>
                               </div> 
                              </div>

                              <div class="form-group"> 
                               <div class="input-group">           
                                    <span class="input-group-addon"><i class="fa fa-info "></i></span>
                                       <textarea class="form-control" id="query" name="query" placeholder="Your Health Issues" style="height: 100px;" required></textarea>
                                       <label for="query" style="float: right; margin-top: 3px; margin-l: -10px;"></label>
                               </div> 
                              </div>
                              <div class="row">
                                 <div class="col-lg-4 pull-right" >
                                    <button type="button" style="margin-left:-15px;" class="classBtnSubmit btn btn-info margin-top-10" id="idSupportSubmit">Send</button>
                                 </div>
                              </div>  

                            </form>
                       </div>
                    </div>

                </div>
                <!-- /.col-lg-12 -->
            </div>
        </div><br/><br/>
            <!-- /.row -->
        <!-- </div>
        
        </div>
        <!-- /#page-wrapper -->
        <script type="text/javascript">
            $( document ).ready( function(){
                 //Load Page which is user selcted
                var page = getUrlVars()["pay"];
                //  alert(page);
                LoadPageContent(page);
            });
                                
            $('#idSupportSubmit').on("click", function(){

                if( false == $('#request_from_index').valid()) return;

                $("#idSupportSubmit").html("<img src='images/loader.gif'  width='15px'/>&nbspSending...");
                    $.ajax({
                                    type: "POST",
                                    url : "adminController.html?action=requestcheckup&is_query=1",
                                    data: $('#request_from_index').serializeArray(),//only input
                                    success: function(response){
                                    var obj = $.parseJSON( response );
                                            if ( 1 == obj.status ){
                                                    alert( obj.msg );
                                                    $("#idSupportSubmit").html("Send");
                                                    $('#request_from_index').trigger("reset");
                                                    //$('#upload_error').show();
                                                    //$('#upload_error').html('<div class="alert alert-success"><a href="#" class="close" data-dismiss="alert">&times;</a>' + obj.msg + '</div>');
                                            } else {
                                            alert( obj.msg );
                                                    //$('#upload_error').html('<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a>' + obj.msg + '</div>');
                                            }

                                    }
                });
            });
            
function LoadPageContent( page )
{
    switch ( page ){
        case'cod':
                window.history.pushState("string", "Title", "thanks-appointment-done-new.html");
            break;
    }
}
// Read a page's GET URL variables and return them as an associative array.
function getUrlVars()
{
    var vars = [], hash;
    var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
    for(var i = 0; i < hashes.length; i++)
    {
        hash = hashes[i].split('=');
        vars.push(hash[0]);
        vars[hash[0]] = hash[1];
    }
    return vars;
}
        </script>
		
		<div class="classFooterWrapper">
<div class="container">
 <footer>
	<div id="idWelcomeMsg" class="modal fade" data-backdrop="static" style="width:60%;margin:auto;">
		<div class="modal-dialog" style="width:100%;">
			<div class="modal-content">
					<button type="button" class=" classWelcomeCloseButton close" data-dismiss="modal" aria-hidden="true">&times;</button>
				
	          <div class="modal-body" id="welcomeMessage">
	            <a href="http://www.healthplease.in"><img src="images/healthplease-welcome.jpg" width="100%" /></a>
	            </div>
	        </div>
	    </div>
	</div>
<div id="call_back_modal" class="modal fade" data-backdrop="static">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
<h4 class="modal-title classMIHeaderWrapper classMBg classWColor" >Please provide us with the below details to reach our convenience team</h4>
				</div>

	          <div class="modal-body" id="file_upload_form">
	                <div id="upload_error"></div>
	                <form id="upload_form" class="classMIBodyWrapper" action="adminController.html">
	                        <div class="form-group">
							<label for="call_back_name" class="classGColor">Name</label>
							<div  class="input-group"> <div class="input-group-addon"><i class="fa fa-user"></i></div><input type="text" class="form-control" id="call_back_name" name="name" placeholder="Name"></div>
							</div>
							<div class="form-group">
							<label for="call_back_number" class="classGColor">Contact No.</label>
							<div  class="input-group"> <div class="input-group-addon">+91</div><input type="text" name="number" class="form-control numeric" id="call_back_number" placeholder="Contact No"></div>
							</div>
                                                        <div class="form-group">
							<label for="call_back_email" class="classGColor">Email.</label>
							<div  class="input-group"> <div class="input-group-addon"><i class="fa fa-envelope"></i></div><input type="text" name="email" id="call_back_email" class="form-control" placeholder="Email" required></div>
							</div>    
						<button type="button" id="request_form" class="btn btn-primary">Submit</button>
	                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	                </form>

	            </div>
	        </div>
	    </div>
	</div>	
                        <!--Modal ends here-->
    <div class="row">
    	<div class="col-sm-12 col-lg-5 col-md-5">
			<div class="fb-page" data-href="https://www.facebook.com/pages/Health-Please/1614865218755696" data-width="400" data-height="100" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true" data-show-posts="true"><div class="fb-xfbml-parse-ignore"><blockquote cite="https://www.facebook.com/pages/Health-Please/1614865218755696"><a href="https://www.facebook.com/pages/Health-Please/1614865218755696">Health Please</a></blockquote></div></div>	
	    </div>
		
        <div class="col-sm-12 col-lg-7 col-md-7 classFooterContactWrapper">
            <h3>Contact:</h3>
                  <p>
            	We wish you a happy time here at Health Please! <br/>
				You can <a id="callback" name="callback" href="javascript:void(0);" style="color:#46b8da;"><strong>Request a call back</strong></a> or call us on <a href="tel:7620012092" style="color:#46b8da;">+91 7620012092</a> if you wish to talk to us.<br/>
				You can also write to us at <a style="color:#46b8da;" href="Mailto:help@healthplease.in">help@healthplease.in</a> <br/>
				We will be glad to help you.<br/>
<!-- We wish you a happy time here at Health Please! <br/>In case you need help feel free to write to us at <a href="mailto:help@healthplease.in" target="_blank" style="color:#46b8da;text-decoration:none;"><strong>help@healthplease.in</strong></a> or
<a id="callback" name="callback" href="javascript:void(0);" style="color:#46b8da;"><strong>Request a call back.</strong></a> <br/>We will be glad to help you. -->
</p>
		</div>
		<div class="col-sm-12 col-lg-12 col-md-12 text-right classFooterSMIcon" style="margin-top: -35px;">
        	<span>Follow Us</span>&nbsp;:&nbsp;&nbsp;
			<a href="https://twitter.com/HealthPleaseOff" id="gh" target="_blank" title="Twitter">
				<span class="fa-stack fa-lg">
				  <i class="fa fa-twitter fa-stack-1x classMColor"></i>
				</span>
			</a>&nbsp;&nbsp;
			<a href="https://www.facebook.com/pages/Health-Please/1614865218755696" id="gh" target="_blank" title="Facebook">
				<span class="fa-stack fa-lg">
				  <i class="fa fa-facebook fa-stack-1x  classMColor"></i>
				</span>
			</a>
			
		</div>
	</div>

<div class="row">
		<div class="col-md-12 col-lg-12 col-sm-12">
			<ul class="nav navbar-left">
                <li class="dropdown">
                    <a class="dropdown-toggle"  href="http://www.healthplease.in">
                        <i class="fa fa-home fa-fw"></i> Home
                    </a>                    <!-- /.dropdown-messages -->
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle"  href="about.html">
                        <i class="fa fa-life-ring fa-fw"></i> About Us
                    </a>                    <!-- /.dropdown-messages -->
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle"  href="support.html">
                        <i class="fa fa-cogs fa-fw"></i> Support
                    </a>                    <!-- /.dropdown-messages -->
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle"  href="pricing.html">
                       <i class="fa fa-road fa-inr"></i> Pricing
                    </a>                    <!-- /.dropdown-messages -->
                </li> 
                <li class="dropdown">
                    <a class="dropdown-toggle"  href="faqs.html">
                       <i class="fa fa-question fa-fw"></i> FAQs
                    </a>                    <!-- /.dropdown-messages -->
                </li> 
            </ul>

		</div>
	</div>

  </footer>    
</div>
</div> 

<div class="classPowerBy">
	<div class="container">
		<div class="row">
	    	<div class="col-sm-12 col-lg-6 col-md-6">
			<a href="privacy-policy.html">Privacy Policy</a>&nbsp;|&nbsp;
			<a href="terms-and-conditions.html">Terms and Conditions</a>&nbsp;|&nbsp;
			<a href="disclaimer.html">Disclaimer</a>&nbsp;
	    	</div>
	    	<div class="col-sm-12 col-lg-6 col-md-6 text-right">
	    		Proudly Powered by <a href="http://www.healthplease.in" target="_blank">HealthPlease.in</a>
	    	</div>
	    </div>
	</div>
</div>



<div id="fb-root"></div>
</body>
</html>
