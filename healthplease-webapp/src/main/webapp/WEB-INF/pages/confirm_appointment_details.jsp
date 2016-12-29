<%@page import="com.rns.healthplease.web.util.Constants"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
          <title>Book Diagnostic & Pathology Test like Thyroid, Sugar, Urine, Cholesterol, ECG and X-Ray. Pay for them Online. Sample Collected at home or in lab. EMR Storage Available.</title>
           <link rel="icon" type="image/png" sizes="32x32" href="<c:url value="/resources/images/favicon/favicon-32x32.png"/>">
<link rel="icon" type="image/png" sizes="96x96" href="<c:url value="/resources/images/favicon/favicon-96x96.png"/>">
<link rel="icon" type="image/png" sizes="16x16" href="<c:url value="/resources/images/favicon/favicon-16x16.png"/>">
    <meta name="keywords" content="Book Online Path Test, Book online diagnostic test, Blood Sugar test">
    <meta name="description" content="Book your online Pathology Lab test and test packages and have sample picked from home. Online Payment option and save reports for future reference.">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="icon" type="image/png" sizes="32x32" href="images/favicon/favicon-32x32.png">
	<link rel="icon" type="image/png" sizes="96x96" href="images/favicon/favicon-96x96.png">
	<link rel="icon" type="image/png" sizes="16x16" href="images/favicon/favicon-16x16.png">
    <!-- Custom Fonts -->
    <!-- <link href="bootstrap/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="css/dialog.css" rel="stylesheet">
   
   Adde by vikas for validation error custom messages on form 31-may-2015
    <link href="css/internal/form-validation.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
	
      <script src="bootstrap/js/jquery-1.11.2.min.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script src="js/jquery-ui.js"></script>

        Steps Plugin CSS
       <link href="css/smart_wizard.css" rel="stylesheet" type="text/css">
       <script type="text/javascript" src="js/jquery.smartWizard.js"></script>
   
 Bootstrap Core CSS
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/jquery-ui.css" rel="stylesheet">

    Code Added by vikas on 23-May-2015
    Used to display combobox values runtime
    <link href="css/external/select2/select2.min.css" rel="stylesheet" ></link>
    <script src="js/external/select2/select2.min.js"></script> -->

<!--Google Analytics Tracking Code Start-->
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-66916464-1', 'auto');
  ga('send', 'pageview');

</script>
<!--Google Analytics Tracking Code End-->


<script type="text/javascript">

 
$(function(){
    $('.classSmoothScroll').click(function() {
    if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'')
        && location.hostname == this.hostname) {
            var $target = $(this.hash);        
            $target = $target.length && $target || $('[name=' + this.hash.slice(1) +']');
            if ($target.length) {
              var targetOffset = $target.offset().top - $(".classFixedHeader").outerHeight(true);
                // var targetOffset = $target.offset().top;
                $('html,body').animate({scrollTop: targetOffset}, 1000);
                return false;
            }
        }
    });
});

function doScroll(){
    if (window.name) window.scrollTo(0, window.name);
}

</script>

    <!-- Code Additon ends here by vikas on 23-May-2015 -->
     <link href="css/style.css?ver=5" rel="stylesheet"></link>
     <!-- Timeline CSS -->
    
</head>

<body>

<!--Start of Tawk.to Script-->
<script type="text/javascript">
var $_Tawk_API={},$_Tawk_LoadStart=new Date();
(function(){
var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
s1.async=true;
s1.src='https://embed.tawk.to/567db03243462c597a64a31f/default';
s1.charset='UTF-8';
s1.setAttribute('crossorigin','*');
s0.parentNode.insertBefore(s1,s0);
})();
</script>
<!--End of Tawk.to Script-->
    <div id="wrapper">
    	<%@include file="user_header.jsp" %>
        <div style="background:#A4DBF4;">
        </div>
    
        <div class="classGoldenDivider"></div><!-- Google Code for Appointment Conversion Conversion Page -->
<script type="text/javascript">
/* <![CDATA[ */
//var google_conversion_id = 937994185;
//var google_conversion_language = "en";
//var google_conversion_format = "3";
//var google_conversion_color = "ffffff";
//var google_conversion_label = "dEQCCKL2_2AQyc-ivwM";
//var google_conversion_value = 150.00;
//var google_conversion_currency = "INR";
//var google_remarketing_only = false;
/* ]]> */
</script>
<!--<script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js">
</script>-->
<noscript>
<div style="display:inline;">
<!--<img height="1" width="1" style="border-style:none;" alt="" src="//www.googleadservices.com/pagead/conversion/937994185/?value=150.00&amp;currency_code=INR&amp;label=dEQCCKL2_2AQyc-ivwM&amp;guid=ON&amp;script=0"/>-->
</div>
</noscript>
<style>
.logo_box {
   // background: #85B213 none repeat scroll 0% 0%;
  //  border-bottom: 1px solid #CECECE !important;
  //  width: 214px;
  //  height: 47px;
    /*float: left;*/
}
.logo_box a {
    float: left;
    background: transparent url("images/hdr_ftr_sprite.png") no-repeat scroll 0px -124px;
    width: 149px;
    height: 33px;
    margin: 6px 0px 0px 20px;
    text-decoration: none;
    text-indent: -99999px;
}
.img-logo {
  //  background-position: -77px -43px;
    height: 30px;
    margin: 16px 0;
    width: 90px;
}
.img {
    background: rgba(0, 0, 0, 0) url("images/paytm.png") no-repeat scroll -77px -43px;
}
</style>
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
<!-- Vertical tab code end-->
       <div class="classTopHeading" style="margin-top:15px;">
        <div class="container">
           	<c:if test="${result != null && result != 'OK' }">
            <div class="row">
                <div class="col-md-12 alert alert-danger" style="margin-left: 10px;">
                    <p>Oops! It seems there was a problem in processing your Payment against appointment.</p><br/> 
                    <p>If the amount has deducted from your account/card, please contact us at <a href="mailto:care@healthplease.in">care@healthplease.in</a> and we will take care of the issue.</p>
                </div>
                <!-- <div class="col-md-12 alert alert-info" style="margin-left: 10px;">
                    <p>Please choose other option of payment or try one more time</p>
                </div> -->
            </div>  
            </c:if>
                <!--<div class="alert alert-success"><strong>!Your Appointment is Booked with us.</strong></div>
                <div class="alert alert-info"><strong>!Confirmation Mail will send you shortly.</strong></div>-->
                <div class="row">
                    <div class="well col-xs-12 col-sm-12 col-md-7 col-lg-7 col-xl-7">
                        <div class="row">
                            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 col-xl-6">
                                <address>
                                    <strong>${appointment.user.firstName} ${appointment.user.lastName}</strong>
                                    <c:if test="${appointment.type == 'Home' }">
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9 col-xl-9">
                                            ${appointment.address.street}  , ${appointment.address.area},<br/> 
                                            <c:if test="${appointment.address.landmark != null && fn:length(appointment.address.landmark) > 0}">
                                            	${appointment.address.landmark},
                                            </c:if>  
                                            ${appointment.address.zipCode}                                       
                                        </div>
                                    </div>
                                    </c:if>
                                    <abbr title="Phone">C:</abbr> ${appointment.user.phone}      
                                    <p> ${appointment.user.email}</p>
                                    </address>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6 text-right">
<!--                                <p>
                                    <span><span style="color:#aaa;">Appointment Id #:</span> 442</span>
                                </p>-->
                                <p>
                                	<span><span style="color:#aaa;">Appointment Id # : ${appointment.id}</span><br/>
                                    <span><span style="color:#aaa;">Date : </span><fmt:formatDate pattern="yyyy-MM-dd" value="${appointment.date}"/></span><br/>
                                    <span><span style="color:#aaa;">Time : </span>
                                       ${appointment.slot.startTime} - ${appointment.slot.endTime}                                   
                                    </span><br/>
                                    <span><span style="color:#aaa;">Type :</span> ${appointment.type}<br/>
                                    
                                </p>
                                
                            </div>
                        </div>
                        <div class="row">
                            <div class="text-center">
                                <h2>Confirm Details</h2>
                            </div>
                            </span>
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>
                                            Test 
                                            &nbsp;[Lab: ${appointment.lab.name}]
                                        </th>
                                        <!-- <th>#</th>
                                        <th class="text-center">Price</th> -->
                                        <th class="text-center">Total</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${appointment.tests}" var="test">
                                                                        <tr>
                                          
                                        <td class="col-md-1">1</td>
                                        <td class="col-md-9"><em>${test.name}</em></h4></td>
                                        <td class="col-md-2 text-center"><i class="fa fa-inr"></i> ${test.price}</td>
                                       
                                    </tr>
                                    </c:forEach>                               
                                    <tr>
                                        <td></td>
                                        <td class="text-right">
                                        	<p>
                                                <strong>Discount: </strong>
                                            </p>
                                            <p>
                                                <strong>Subtotal: </strong>
                                            </p>
                                            <p>
                                                <strong>Home Visit Charge: </strong>
                                            </p>
                                        </td>
                                        <td class="text-center">
                                        	<p>
                                                <strong><i class="fa fa-inr"></i> ${appointment.lab.discount} </strong>
                                            </p>
                                            <p>
                                                <strong><i class="fa fa-inr"></i> ${appointment.lab.testPrice}</strong>
                                            </p>
                                            <p>
                                                <strong><i class="fa fa-inr"></i> 
                                                	<c:if test="${appointment.lab.pickUpCharge == null }">
                                                		0
                                                	</c:if>
                                                	<c:if test="${appointment.lab.pickUpCharge != null }">
                                                		${appointment.lab.pickUpCharge}
                                                	</c:if>
                                                </strong>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="background-color:#eee;"></td>
                                        <td class="text-right" style="background-color:#eee;"><h4><strong>Total: </strong></h4></td>
                                        <td class="text-center text-danger" style="background-color:#ddd;"><h4><strong><i class="fa fa-inr"></i> ${appointment.lab.price}</strong></h4></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <form action="<%=Constants.PAY_U_URL %>" method="post" name="payuForm" id="payuForm">
                        <input type="hidden" name="firstname" value="${payUDetails.name}" />
						<input type="hidden" name="surl" value="${payUDetails.successUrl}" />
						<input type="hidden" name="phone" value="${payUDetails.phone}" />
						<input type="hidden" name="key" value="${payUDetails.merchantKey}" />
						<input type="hidden" name="hash" value = "${payUDetails.hashKey}" />
						<input type="hidden" name="furl" value="${payUDetails.failureUrl}" />
						<input type="hidden" name="txnid" value="${payUDetails.id}" />
						<input type="hidden" name="productinfo" value="${payUDetails.productInfo}" />
						<input type="hidden" name="amount" value="${payUDetails.amount}" />
						<input type="hidden" name="email" value="${payUDetails.email}" />
						<input type="hidden" name="drop_category" value="COD,CASH,EMI" />
                        <input type="hidden" name="service_provider" value="payu_paisa" size="64" />
                    </form>
                   	<form action="<%=Constants.PAY_TM_URL%>" method="POST" name="paytmForm" id="paytmForm">
                        <input type="hidden" id="REQUEST_TYPE" name="REQUEST_TYPE" value="${payTm.requestType}">
                        <input type="hidden" id="MID" name="MID" value="${payTm.mid}">
                        <input type="hidden" id="ORDER_ID" name="ORDER_ID" value="${payTm.orderId}">
                        <input type="hidden" id="CUST_ID"  name="CUST_ID" value="${payTm.customerId}">
                        <input type="hidden" id="TXN_AMOUNT" name="TXN_AMOUNT" value="${payTm.transactionAmount}">
                        <input type="hidden" id="CHANNEL_ID"  name="CHANNEL_ID"  value="${payTm.channelId}">
                        <input type="hidden" id="INDUSTRY_TYPE_ID"  name="INDUSTRY_TYPE_ID"  value="${payTm.industryTypeId}">
                        <input type="hidden" id="WEBSITE" name="WEBSITE" value="${payTm.website}">
                        <input type="hidden" id="CHECKSUMHASH" name="CHECKSUMHASH" value="${payTm.checkSum}">
                        <input type="hidden" id="MOBILE_NO" name="MOBILE_NO" value="${payTm.mobileNo}">
                        <input type="hidden" id="EMAIL" name="EMAIL" value="${payTm.email}">
                        <input type="hidden" name="CALLBACK_URL" id="CALLBACK_URL" value="${payTm.callbackUrl}"/>
                    </form>
                    <div class=" col-xs-12 col-sm-12 col-md-5 col-lg-5 col-xl-5">
                    	<c:if test="${result != 'OK' }">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 bhoechie-tab-container">
                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 bhoechie-tab-menu">
                                  <div class="list-group">
                                    <a href="#" class="list-group-item active text-center">
                                      <h1 style="margin-top:0px;"><i class="fa fa-money"></i></h1>Cash Payment
                                    </a>
                                    <a href="#" class="list-group-item text-center">
                                      <h1 style="margin-top:0px;"><i class="fa fa-credit-card"></i></h1>Online Payment
                                    </a>
                                  </div>
                                </div>
                                <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8 bhoechie-tab">
                                    <!-- flight section -->
                                    <div class="bhoechie-tab-content active">
                                        <center>
                                            <br/>
                                          <strong style="margin-top: 0;">Pay Cash On Sample Collection</strong><br/><br/>
                                            <a href="<%=Constants.CONFIRM_APPOINTMENT_GET_URL%>" >
                                            <button type="button" class="btn btn-labeled btn-success"  style="padding:10px 65px;">
                                                Book Now
                                            </button></a>

                                        </center>
                                    </div>
                                    <!-- train section -->
                                    <div class="bhoechie-tab-content" >
                                        <div class="classPaymentOptionHolder">
                                          <input type="radio" name="payment" group="online_pay" class="classBigCheckBox" value="payu">
                                          <img src="<c:url value="/resources/images/payu-logo.png"/>" class="classPaymentOptionLogo" style="" />
                                          <!-- <div class="logo_box clearfix" style="display: inline-block;"><span class="left_tabs_icon left"></span><a href="javascript:void(0);">Payumoney</a></div> -->
                                            
<!--                                            <button type="submit" class="btn btn-labeled btn-success" onclick="" form="payuForm" style="padding:10px 65px;">
                                                Pay Now
                                            </button>-->
                                        </div>
                                        <div class="classPaymentOptionHolder" style="margin-bottom:15px;">
                                          <input type="radio" name="payment" group="online_pay" class="classBigCheckBox" value="paytm">
                                            <img src="<c:url value="/resources/images/paytm-logo.png"/>" class="classPaymentOptionLogo" />
                                          <!-- <div class="img-logo img clearfix" style="display: inline-block;"></div> -->
                                        </div>
                                            <br/><br/>
                                            <button type="button" class="btn btn-labeled btn-success" id="make_payment" name="make_payment" style="padding:10px 65px;">
                                                Pay Now
                                            </button>
                                    </div>
                        
                                </div>
                            </div>
                      </div>
					</c:if>

                        <div class="row">
                        	<c:if test="${result == 'OK' }">
                            	<div class="alert alert-success margin-top10"><strong>Your Appointment is pending approval and you will be intimated once it's confirmed. Thank You!</strong></div>
                            </c:if>
                            <div class="col-md-12 alert alert-info" style="margin-left: 10px;margin-top:50px;">
                                At Healthplease your convenience is our priority. We will not only make sure that you get the services right but we will provide them with great comfort.<br/>
                                <br/>
                                We wish you a happy time here at Healthplease! In case you need help feel free to write us at <a href="mailto:care@healthplease.in" target="_blank">care@healthplease.in</a> or <a href="javascript:void(0);">Request a call back.</a><br/> We will be glad to help you.
                            </div>
                        </div>
                        
                    </div>
                </div>

                

            </div>
                
    </div>
       <%@include file="forms/ask_query.jsp" %>
       
        <!-- /#page-wrapper -->
        <script type="text/javascript">
            $(document).ready(function(){
                $('#make_payment').on("click", function(){
                    var paymentType = $('input[name="payment"]:checked').val();
                    switch( paymentType ){
                        case 'paytm':
                                submitPayTmForm();
                            break;
                        case 'payu':
                                submitPayuForm();
                            break;
                    } 
                    
                });
                $('#idSupportSubmit').on("click", function(){

                    if( false == $('#request_from_index').valid()) return;

                    $("#idSupportSubmit").html("<img src='images/loader.gif'  width='15px'/>&nbspSending...");
                        $.ajax({
                                        type: "POST",
                                        url : "adminController.php?action=requestcheckup&is_query=1",
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
            });

        </script>
                    
<script>
    var hash = 'f0c246a56b097f0e0a2cd10c05576b870fb06eb0e540327e2e8b89df55828a1a1452bfa60433122357a73c96129db1c67b61a29ed67263ad59063323293a086a';
    function submitPayuForm() {
      if(hash == '') {
        return;
      }
      var payuForm = document.forms.payuForm;
      payuForm.submit();
    }
    
    function submitPayTmForm() {
      var paytmForm = document.forms.paytmForm;
      paytmForm.submit();
    }
    
</script>


</div>


<%@include file="user_footer.jsp" %>
	
</body>

</html>