<%@page import="com.rns.healthplease.web.util.Constants"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">

<head>
<link rel="icon" type="image/png" sizes="32x32" href="<c:url value="/resources/images/favicon/favicon-32x32.png"/>">
<link rel="icon" type="image/png" sizes="96x96" href="<c:url value="/resources/images/favicon/favicon-96x96.png"/>">
<link rel="icon" type="image/png" sizes="16x16" href="<c:url value="/resources/images/favicon/favicon-16x16.png"/>">
    <meta charset="utf-8">
          <title>Book online Pathology & Diagnostic Tests in Pune | HealthPlease.in</title>
    <meta name="keywords" content="Book Online Path Test, Book online diagnostic test, Blood Sugar test">
    <meta name="description" content="Book your online Pathology Lab test and test packages and have sample picked from home. Online Payment option and save reports for future reference.">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>

<body>
  
<%@include file="user_header.jsp" %>
  
<div>
    <div id="myModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="modal_head"></h4>
                </div>
                <div class="modal-body" id="modal_body">
                                   </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                   
                </div>
            </div>
        </div>
    </div>
</div>
 <style>
 #collap_img2{
		cursor:pointer;
 }
#collap_img3{
		cursor:pointer;
 }
 </style>
<script type="text/javascript">

	function hideAll() {
		$("#homeApp").hide();
		$("#labApp").hide();
		$("#docApp").hide();
		$("#appChoice").show();
	}
	
	function showHomeApp() {
		$("#homeApp").show();
		$("#appChoice").hide();
	}
	
	function hideHomeApp() {
		$("#homeApp").hide();
		$("#appChoice").show();
	}
	
	function showLabApp() {
		$("#labApp").show();
		$("#appChoice").hide();
	}
	
	function hideLabApp() {
		$("#labApp").hide();
		$("#appChoice").show();
	}
	
	function showDocApp() {
		$("#docApp").show();
		$("#appChoice").hide();
	}
	
	function hideDocApp() {
		$("#docApp").hide();
		$("#appChoice").show();
	}

    $(document).ready(function(){

		hideAll();
      /*
      Reset Location on update in test
      */
        


         /* On key press remove error alert */
    $("#username").keypress(function(){
      $("#idUsernameErr").html("");
    });
    $("#password").keypress(function(){
      $("#idPasswordErr").html("");
    });
    }); 

 function generateDate( date ) {
            var tempDate = date.split( '/' );
            return tempDate[2] + '-' + tempDate[0] + '-' + tempDate[1];
 }

 
	 
 function submitForm() {
	 $("#login_form").submit();
 }
	 
       
</script>


<script src="<c:url value="/resources/js/external/package-slider/jquery.flexisel.js"/>"></script>
<script type="text/javascript">

$(window).load(function() {

    $("#flexiselDemo3").flexisel({
        visibleItems: 5,
        animationSpeed: 1000,
        autoPlay: true,
        autoPlaySpeed: 3000,            
        pauseOnHover: true,
        enableResponsiveBreakpoints: true,
        responsiveBreakpoints: { 
            portrait: { 
                changePoint:480,
                visibleItems: 1
            }, 
            landscape: { 
                changePoint:640,
                visibleItems: 2
            },
            tablet: { 
                changePoint:768,
                visibleItems: 3
            }
        }
    });

    $("#flexiselDemo4").flexisel({
        clone:false
    });
    
});
</script>

<!-- Package slider script end-->


        <div class="classSliderHolder" style="padding-top:50px">
            <div class="container">
			<div class="row" id="appChoice">
				<div class="collap_img_div">
					<div class="col-sm-2"></div>
					<div class="col-sm-4">
						<div class="card1" style="border-right: 0.5px solid black">
							<img class="img-responsive"  
								style="height: 60%; width: 60%; margin-left: 20%"
								src="<c:url value="/resources/images/home_lab.png"/>"
								id="collap_img2" onclick="showLabApp()">
							<h3 style="margin-left:70px">In Lab Appointment</h3>
						</div>
					</div>

					<div class="col-sm-4">
						<div class="card1">
							<img class="img-responsive"
								style="height: 60%; width: 60%; margin-left: 20%"
								src="<c:url value="/resources/images/home_home.png"/>"
								id="collap_img3" onclick="showHomeApp()">
							<h3 style="margin-left:90px">
								Home Collection
							</h3>
						</div>
					</div>
					<div class="col-sm-2"></div>
				</div>
			</div>	
			
			
			<%@include file="forms/home_app_form.jsp" %>
				
				<!-- Lab Appointment -->
			<%@include file="forms/lab_app_form.jsp" %>
			
			<%@include file="forms/doc_app_form.jsp" %>
			
				
			</div>
		</div>



            
            <div class="classHomeText">
              <div class="container">
                <div class="row">
                  <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
                    <p>
                      Healthcare is one of the most important aspects of one's being. Good health is not just a blessing from the physical point of view, but also promotes an elevated state of mind! Keeping this in mind, we at HealthPlease, provide quality pathology services at affordable rates, that too right from the comfort of your own home!
                    </p>
                    <p>
                      Yes, you read it correctly. Our experienced technicians arrive at your doorstep to collect sample for various path lab tests at your preferred date and time, so that you do not have to undergo the hassle of visiting the laboratory for getting tested, or even for getting your reports back! After your tests, you can simply log-in to your HealthPlease account and view your reports, or even check for the same on your email account. However, if requested, we will also be happy to personally deliver your reports! 
                    </p>
                    <div class="row">
                      <div class="col-sm-12 col-xs-12 col-md-12 col-lg-12 col-xl-12 classLeft">
                                <div class=" text-center"><strong class="classSFont classDB">To make things even simpler, HealthPlease offers you some tremendous facilities such as </strong></div>
                        <div class="row">  
                          <div class="col-sm-12 col-xs-12 col-md-6 col-lg-6 col-xl-6 r-classRight">
                            <p>
                              <ul class="classHomeList">                
                              
                                  <li><i class="fa fa-balance-scale"></i> &nbsp;&nbsp;Comparing Different Lab Prices</li>
                                <li><i class="fa fa-credit-card"></i> &nbsp;&nbsp;Paying Online</li>
                              <li><i class="fa fa-folder-open"></i> &nbsp;&nbsp;Preserving Past Reports </li>
                            </ul>

                            </p>                         
                          </div>  
                          <div class="col-sm-12 col-xs-12 col-md-6 col-lg-6 col-xl-6 r-classRight">
                              <p>
                                  <!-- <strong class="classSFont">In addition, we also strive to soon introduce some outstanding services, such as </strong> -->
                                <ul class="classHomeList">
                                  <li><i class="fa fa-calendar"></i> &nbsp;&nbsp;Booking an Appointment for Sample Collection</li>              
                              <li><i class="fa fa-download"></i> &nbsp;&nbsp;Viewing and Downloading Test Reports Online</li>
                                <li><i class="fa fa-comment"></i> &nbsp;&nbsp;Live Chat for Instant Support</li>
                              </ul>

                              </p>
                            </div>
                        </div>
                      </div>
                    </div>
              </div>
            </div>

            </div>
        </div>

<%@include file="forms/request_checkup.jsp" %>

<%@include file="user_footer.jsp" %>

<!-- Forget modal form code end-->
<!-- Share This Button Code Start -->
<!--<script>var sharebutton_is_horizontal = true; document.write('<script src="//cdn.script.to/share.js"></scr' + 'ipt>'); document.write("<div style='display: none'>");</script><a href="http://sharebutton.org/">social sharing buttons</a><script>document.write("</div>");</script>-->
<!-- Share This Button Code End -->
</body>

</html>