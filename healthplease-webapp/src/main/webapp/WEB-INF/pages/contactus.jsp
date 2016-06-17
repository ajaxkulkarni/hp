
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html lang="en">
<head>
	

    <title>Contact US</title>

	
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

        <div class="classTopHeading">
        <div class="container">
            <div class="row">
            <div class="col-lg-12">
                <h1 class="">Contact Us</h1>
            </div>
        </div>
            <!-- /.col-lg-12 -->
        </div>
    </div>
        <div id="page-wrappera" class="container">
            
            <!-- /.row -->
                <div class="row">
                    <div class=" col-xs-12 col-sm-12 col-md-8 col-lg-8 col-xl-8">
                        <div class="classHighLightBox classOSCFont ">
                           <!-- Have Any Questions?? <br/>Feel free to contact us on our customer support number <br/><i class="fa fa-mobile"></i> <a href="tel:+91 8600080252">+91 8600080252</a> or mail us at <i class="fa fa-envelope-o"></i><a href="Milto:help@healthplease.in"> help@healthplease.in</a> <br/>We will be glad to help you. -->
                            Have Any Questions?? <br/><a id="callback" name="callback" href="javascript:void(0);">Request a call back</a> or mail us at <i class="fa fa-envelope-o"></i>&nbsp; <a href="Mailto:help@healthplease.in">help@healthplease.in</a><br/>We will be glad to help you. 
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 col-xl-4" style="margin-top: -60px;">
                    <h3 class="page-header classHeaderText">Ask your Query</h3>
                    
                     <div class="classSFormHolder">
                        <img src="images/2.jpg" width="100%"/>
                        <div class="classSupportForm">
                            <form id="idSupportPanal" class="classSupportPanal" action="" method="GET">
                              
                              <div class="form-group"> 
                               <div class="input-group">           
                                    <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                       <input type="text" class="form-control" id="idQName" name="userq[name]" placeholder="Full name*" required>           
                               </div> 
                              </div>

                              <div class="form-group"> 
                               <div class="input-group">           
                                    <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                                       <input type="email" class="form-control" id="idQEmail" name="userq[email]" placeholder="Your Email*" required>           
                               </div> 
                              </div>

                              <div class="form-group"> 
                               <div class="input-group">           
                                    <span class="input-group-addon"><i class="fa fa-phone"></i></span>
                                       <input type="contact" class="form-control" id="idQContact" name="userq[contact]" placeholder="Your Contact no.*" required>           
                               </div> 
                              </div>

                              <div class="form-group"> 
                               <div class="input-group">           
                                    <span class="input-group-addon"><i class="fa fa-pagelines"></i></span>
                                       <input type="age" class="form-control" id="idQContact" name="userq[age]" placeholder="Your Age*" required>           
                               </div> 
                              </div>

                              <div class="form-group"> 
                               <div class="input-group">           
                                    <span class="input-group-addon"><i class="fa fa-info "></i></span>
                                       <textarea class="form-control" id="idQuery" name="userq[query]" placeholder="Your Query" style="height: 100px;" required></textarea>
                               </div> 
                              </div>
                              <div class="row">
                                            
                                 <div class="col-lg-4 pull-right">
                                    <button type="button" class="classBtnSubmit btn btn-info" id="idSupportSubmit">Send</button>
                                 </div>
                              </div>

                              <div class="row">
                                <div class="col-sm-12 col-md-12 col-lg-12" id="idRequestResponce">

                                </div>
                              </div>  

                            </form>
                        </div>
                    </div>
                </div>
                </div>
              <div class="row">
                
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
                    <h3 class="page-header classHeaderText">We bring Convenience to you!</h3>
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d242118.06894793978!2d73.86296739999999!3d18.524616450000003!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bc2bf2e67461101%3A0x828d43bf9d9ee343!2sPune%2C+Maharashtra!5e0!3m2!1sen!2sin!4v1430582809404" width="100%" height="360" frameborder="0" style="border:0"></iframe>
                </div>
                
                <!-- /.col-lg-12 -->
            </div>
        </div>
            <!-- /.row -->
        <!-- </div>
        
        </div>
        <!-- /#page-wrapper -->
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
                        <!--Welcome Modal ends here-->





	  <!-- Modal Strts-->
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
		
<script type="text/javascript">
 $( 'document' ).ready( function(){
    $("#idSupportSubmit").on( "click", function() { 
          var form = $("#idSupportPanal");
              $.ajax({
                  type:"POST",
                  url:form.attr("action"),
                  data:"action=process_request",
                  data:form.serialize(),
                  success: function(response){
                      if( response == 1){
                          $('#idRequestResponce').html("<div class='alert alert-danger'><strong>Thank You!</strong> Your message request sent successfully!</div>");
                          $('#idRequestResponce').show();
                          form.reset();
                          //window.location.href = window.location.href;
                      } else {
                           $('#idRequestResponce').html( "<div class='alert alert-info'><strong>Try Again!</strong></div>");
                      }
                  }
             });

            }); 
      });

</script> 
</body>

</html>