<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html lang="en">
<head>
	
    <title>Sign Up to Store Medical Records and easy Lab bookings | HealthPlease.in</title>
     <link rel="icon" type="image/png" sizes="32x32" href="<c:url value="/resources/images/favicon/favicon-32x32.png"/>">
<link rel="icon" type="image/png" sizes="96x96" href="<c:url value="/resources/images/favicon/favicon-96x96.png"/>">
<link rel="icon" type="image/png" sizes="16x16" href="<c:url value="/resources/images/favicon/favicon-16x16.png"/>">
	 <meta name="keywords" content="HealthPlease Sign Up, EMR">
    <meta name="description" content="Sign Up to Book Medical Laboratory Appointments and Store your reports as Electronic Medical Records (EMR) for futrue reference in Pune ">
	<script src="http://cdn.jsdelivr.net/jquery.validation/1.15.0/jquery.validate.min.js"></script>
	
	</head>

<body>
  <div id="wrapper">
  
  	<%@include file="user_header.jsp" %>
    <!-- Signup form modal code start -->
    <div class="container" id="addUser" name="addUser">

      <div class="modala-header">
            <h1 class="modal-title text-left" id="exampleModalLabel">Sign up</h1>
      </div>
      <br/>
      <c:if test="${result != null && result != 'OK' }">
  	  	<div class="alert alert-danger">
  			${result}
  	  	</div>
  	  </c:if>
  	   <c:if test="${result == 'OK' }">
  	  	<div class="alert alert-success">
  			We have sent you an activation mail on your email. Please click on the activation link in that mail to activate your account.
  	  	</div>
  	  </c:if>
      <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 col-xl-4 control pull-right">
          <div id="msg"></div>
          <div class="classSignupText">
            <h2>
              Why Sign Up?
            </h2>
            <div class="stepwizard">
              <div class="stepwizard-row">
                  <div class="stepwizard-step pull-left">
                      <button type="button" class="btn btn-primary btn-square pull-left" disabled="disabled">1</button>
                      <p><span class="classSText text-left"> No need to type your address and contact details every time.</span><p>
                  </div>
              </div>
              <div class="stepwizard-row">   
                  <div class="stepwizard-step pull-left">
                      <button type="button" class="btn btn-primary btn-square pull-left" disabled="disabled">2</button>
                      <p><span class="classSText text-left"> Free Online storage of Lab reports in your Health Please account.</span></p>
                  </div>
              </div>
              <div class="stepwizard-row">   
                  <div class="stepwizard-step pull-left">
                      <button type="button" class="btn btn-primary btn-square pull-left" disabled="disabled">3</button>
                    <p><span class="classSText text-left"> Be the first one to receive latest offers from us.</span></p>
                  </div>
              </div>
            </div>
          </div>
          <div class="modal-footer">
            <div class="form-group">
              <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 control"> 
                      Already have an account
                  <a class="btn btn-info btn-xs loginid" id="" href="#"  data-keyboard="false" data-backdrop="false">
                  <!-- <a class="btn btn-info btn-xs" id="loginid" href="#idLoginModal" data-toggle="modal" data-keyboard="false" data-target="#idLoginModal"> -->
                      Login
                  </a>
                 
              </div>
            </div>    
          </div>
        </div>
        <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 col-xl-8 control" style="box-shadow:1px 0px 0 #19A8DF;">  
          <div class="row">
            <%@include file="forms/sign_up.jsp" %>
          </div>
            <%-- <div class=""id="idLoaderDiv" style="display:none;" >
                <img src="<c:url value="/resources/images/loader.gif"/>" id="idLoaderGif" class="classLoaderImg">
            </div> --%>
          </div>
        </div>

      </div>
    </div>
<!-- SignUp modal form code end-->

<script type="text/javascript">
 function generateDate( date ) {
            var tempDate = date.split( '/' );
            return tempDate[2] + '-' + tempDate[0] + '-' + tempDate[1];
          }
          
          /*
           * Only calculate for this page
           */
               $('#dob').change(function(){
                   var tempAge = $(this).val();
                   var dob = new Date( tempAge );
                   var today = new Date();
                   var age = Math.floor(( today-dob ) / (365.25 * 24 * 60 * 60 * 1000));
                   $('#signupage').val(parseInt(age));
                   $( "#dob" ).datepicker( "option", "dateFormat", "dd-mm-yy" );

              }); 


</script>

<%@include file = "user_footer.jsp" %>

</body>
</html>